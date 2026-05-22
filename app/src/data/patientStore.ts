/**
 * Persistent patient store — localStorage-backed, reactive.
 *
 * Holds the patient registry plus each patient's OPD record (form + flags).
 * Components subscribe via `usePatients()`; mutations persist to localStorage
 * and notify every subscriber so the UI stays in sync.
 */
import { useSyncExternalStore } from 'react'
import { patients as seedPatients } from './mockData'
import type { Patient } from '@/types'

type Flags = Record<string, boolean>
type FormData = Record<string, string>
export interface StoredProfile {
  form: FormData
  flags: Flags
}

const PATIENTS_KEY = 'opd.patients.v1'
const PROFILES_KEY = 'opd.profiles.v1'

function readJSON<T>(key: string, fallback: T): T {
  try {
    const raw = localStorage.getItem(key)
    if (raw) return JSON.parse(raw) as T
  } catch {
    /* ignore corrupt storage */
  }
  return fallback
}

let patientsCache: Patient[] = readJSON<Patient[]>(PATIENTS_KEY, seedPatients)
let profilesCache: Record<string, StoredProfile> = readJSON(PROFILES_KEY, {})

const listeners = new Set<() => void>()
function emit() {
  listeners.forEach((l) => l())
}
function subscribe(l: () => void) {
  listeners.add(l)
  return () => {
    listeners.delete(l)
  }
}

function persistPatients() {
  try {
    localStorage.setItem(PATIENTS_KEY, JSON.stringify(patientsCache))
  } catch {
    /* storage full / unavailable — keep working in-memory */
  }
  emit()
}
function persistProfiles() {
  try {
    localStorage.setItem(PROFILES_KEY, JSON.stringify(profilesCache))
  } catch {
    /* ignore */
  }
}

/* ───────────────────────── patients ───────────────────────── */

/** Reactive list of every patient in the registry. */
export function usePatients(): Patient[] {
  return useSyncExternalStore(
    subscribe,
    () => patientsCache,
    () => patientsCache
  )
}

export function getAllPatients(): Patient[] {
  return patientsCache
}

export function getPatient(hn: string): Patient | undefined {
  return patientsCache.find((p) => p.hn === hn)
}

/** Next running HN — one past the highest numeric HN on file. */
export function nextHN(): string {
  const max = patientsCache.reduce(
    (m, p) => Math.max(m, Number(p.hn) || 0),
    0
  )
  return String(max + 1)
}

export function addPatient(p: Patient): void {
  patientsCache = [p, ...patientsCache.filter((x) => x.hn !== p.hn)]
  persistPatients()
}

export function updatePatient(hn: string, patch: Partial<Patient>): void {
  let changed = false
  patientsCache = patientsCache.map((p) => {
    if (p.hn !== hn) return p
    changed = true
    return { ...p, ...patch }
  })
  if (changed) persistPatients()
}

export function removePatient(hn: string): void {
  patientsCache = patientsCache.filter((p) => p.hn !== hn)
  if (profilesCache[hn]) {
    const next = { ...profilesCache }
    delete next[hn]
    profilesCache = next
    persistProfiles()
  }
  persistPatients()
}

/* ───────────── per-patient OPD record (form + flags) ───────────── */

export function getStoredProfile(hn: string): StoredProfile | undefined {
  return profilesCache[hn]
}

export function saveProfile(hn: string, form: FormData, flags: Flags): void {
  profilesCache = { ...profilesCache, [hn]: { form, flags } }
  persistProfiles()
}
