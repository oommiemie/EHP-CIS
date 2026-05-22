import { useEffect, useMemo, useRef, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  Search,
  IdCard,
  Phone,
  CalendarClock,
  CalendarRange,
  ChevronRight,
  ChevronLeft,
  ChevronDown,
  UserPlus,
  UserSearch,
  ScanLine,
  X,
  Trash2,
  BookUser,
} from 'lucide-react'
import { Badge } from '@/components/ui/Badge'
import { Avatar } from '@/components/ui/Avatar'
import { useToast } from '@/components/ui/Toast'
import { usePatients, removePatient } from '@/data/patientStore'
import { calculateAge, formatThaiDate, cn } from '@/lib/utils'
import type { Patient } from '@/types'

const datePresets = [
  { value: 'today', label: 'วันนี้' },
  { value: '7d', label: '7 วันล่าสุด' },
  { value: '30d', label: '30 วันล่าสุด' },
  { value: 'all', label: 'ทุกช่วงเวลา' },
]

/* eased fade — blends the hero image bottom into the panel (matches Dashboard) */
const HERO_FADE =
  'linear-gradient(to bottom, #000 0%, #000 48%, rgba(0,0,0,0.985) 55%, rgba(0,0,0,0.95) 62%, rgba(0,0,0,0.88) 68%, rgba(0,0,0,0.76) 74%, rgba(0,0,0,0.6) 80%, rgba(0,0,0,0.42) 86%, rgba(0,0,0,0.24) 91%, rgba(0,0,0,0.1) 96%, rgba(0,0,0,0) 100%)'

function toDateStr(d: Date): string {
  const y = d.getFullYear()
  const m = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  return `${y}-${m}-${day}`
}

export default function PatientRegistry() {
  const navigate = useNavigate()
  const toast = useToast()
  const allPatients = usePatients()
  const [query, setQuery] = useState('')
  const [showResults, setShowResults] = useState(false)
  const [dateFrom, setDateFrom] = useState(() => toDateStr(new Date()))
  const [dateTo, setDateTo] = useState(() => toDateStr(new Date()))
  const [datePreset, setDatePreset] = useState('today')

  /* quick-select matches — query only, ignores the date filter so any
     patient can be looked up straight from the search box */
  const matches = useMemo(() => {
    const q = query.trim().toLowerCase()
    if (!q) return []
    return allPatients.filter(
      (p) =>
        p.hn.toLowerCase().includes(q) ||
        p.cid.includes(q) ||
        `${p.prefix}${p.firstName}${p.lastName}`.toLowerCase().includes(q) ||
        (p.phone || '').toLowerCase().includes(q)
    )
  }, [query, allPatients])

  function handleDateChange(nextFrom: string, nextTo: string, nextPreset: string) {
    setDateFrom(nextFrom)
    setDateTo(nextTo)
    setDatePreset(nextPreset)
  }

  function handleDelete(p: Patient) {
    if (
      !window.confirm(
        `ต้องการลบผู้ป่วย ${p.prefix}${p.firstName} ${p.lastName} (HN ${p.hn}) ออกจากทะเบียนใช่หรือไม่?`
      )
    )
      return
    removePatient(p.hn)
    toast.remove(
      'ลบผู้ป่วยสำเร็จ',
      `ลบ ${p.firstName} ${p.lastName} ออกจากทะเบียนแล้ว`
    )
  }

  const results = useMemo(() => {
    const q = query.trim().toLowerCase()
    return allPatients.filter((p) => {
      const visitDate = p.lastVisit ? p.lastVisit.slice(0, 10) : ''
      if (dateFrom && (!visitDate || visitDate < dateFrom)) return false
      if (dateTo && (!visitDate || visitDate > dateTo)) return false
      if (!q) return true
      return (
        p.hn.includes(q) ||
        p.cid.includes(q) ||
        `${p.prefix}${p.firstName}${p.lastName}`.toLowerCase().includes(q) ||
        (p.phone || '').toLowerCase().includes(q)
      )
    })
  }, [query, dateFrom, dateTo, allPatients])

  return (
    <div className="flex flex-col gap-4">
      {/* ── Top block: hero + overlapping search bar ──────── */}
      <div className="shrink-0">
        {/* Hero — full-bleed, same treatment as หน้าภาพรวม */}
        <section className="relative -mx-4 -mt-4 overflow-hidden rounded-t-[32px] px-7 pb-6 pt-7 sm:px-9 lg:h-[216px]">
          {/* background layers — faded into the panel at the bottom */}
          <div
            className="pointer-events-none absolute inset-0"
            style={{ maskImage: HERO_FADE, WebkitMaskImage: HERO_FADE }}
          >
            <img
              src={`${import.meta.env.BASE_URL}section-bg1.png`}
              alt=""
              aria-hidden="true"
              className="absolute inset-0 h-full w-full scale-[1.06] object-cover blur-[2px]"
              style={{ objectPosition: '50% 38%' }}
            />
            <div
              className="absolute inset-0"
              style={{
                background:
                  'linear-gradient(100deg, rgba(9,13,38,0.8) 0%, rgba(9,13,38,0.75) 14%, rgba(9,13,38,0.66) 28%, rgba(9,13,38,0.54) 42%, rgba(9,13,38,0.4) 56%, rgba(9,13,38,0.26) 70%, rgba(9,13,38,0.13) 83%, rgba(9,13,38,0) 96%)',
              }}
            />
            <div className="absolute inset-x-0 top-0 h-20 bg-gradient-to-b from-white/15 to-white/0" />
          </div>

          {/* content */}
          <div className="relative flex h-full flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div className="flex flex-col gap-3">
              <p className="text-[12px] font-medium uppercase tracking-wide text-white/65 [text-shadow:0_1px_6px_rgba(6,10,34,0.6)]">
                OPD Registry
              </p>
              <h1 className="text-[21px] font-bold leading-tight tracking-tight text-white [text-shadow:0_2px_12px_rgba(6,10,34,0.6)] sm:text-[24px] xl:text-[28px]">
                ทะเบียนผู้ป่วย
              </h1>
              <p className="text-[13px] font-medium text-white/85 [text-shadow:0_1px_8px_rgba(6,10,34,0.6)] sm:text-[13.5px]">
                ค้นหาและจัดการข้อมูลผู้ป่วยทั้งหมดในระบบ ·
                มีผู้ป่วยทั้งหมด {allPatients.length} ราย
              </p>
            </div>

            {/* CTAs */}
            <div className="flex shrink-0 flex-wrap items-center gap-2.5">
              <button
                type="button"
                className="group relative inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/55 bg-white/30 px-5 text-[14.5px] font-semibold text-ink-900 shadow-[0_10px_28px_-8px_rgba(6,10,34,0.5),inset_0_1px_0_0_rgba(255,255,255,0.75)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:bg-white/45 active:scale-[0.97] focus-visible:ring-2 focus-visible:ring-brand-500/50"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/55 to-white/0" />
                <ScanLine className="relative h-[18px] w-[18px] text-brand-600" />
                <span className="relative">สแกนบัตรประชาชน</span>
              </button>
              <button
                type="button"
                onClick={() => navigate('/patient/new')}
                className="group relative inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/35 bg-gradient-to-br from-pink-600/90 to-orange-500/90 px-5 text-[14.5px] font-semibold text-white shadow-[0_12px_30px_-8px_rgba(236,72,153,0.6),inset_0_1px_0_0_rgba(255,255,255,0.5)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:from-pink-600 hover:to-orange-500 active:scale-[0.97] focus-visible:ring-2 focus-visible:ring-white/80"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/30 to-white/0" />
                <UserPlus className="relative h-[17px] w-[17px]" />
                <span className="relative">ลงทะเบียนผู้ป่วยใหม่</span>
              </button>
            </div>
          </div>
        </section>

        {/* Search bar — overlapping the hero (replaces the KPI cards) */}
        <div className="relative z-10 mt-4 px-1 pt-3 lg:-mt-[72px] xl:px-0">
          <div className="relative flex flex-col gap-1.5 rounded-[28px] bg-white p-2 shadow-[0_20px_44px_-18px_rgba(28,38,92,0.45)] ring-1 ring-ink-900/[0.06] sm:flex-row sm:items-center sm:rounded-full">
            {/* search field — integrated, with a brand icon chip */}
            <div className="group flex h-11 min-w-0 flex-1 items-center gap-2 rounded-full px-1.5 transition-colors duration-200 hover:bg-ink-900/[0.04] focus-within:bg-ink-900/[0.04]">
              <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-brand-500/14 to-violet-500/14 text-brand-600 transition-all duration-200 group-hover:from-brand-500/30 group-hover:to-violet-500/30 group-focus-within:from-brand-500 group-focus-within:to-violet-500 group-focus-within:text-white">
                <Search className="h-[17px] w-[17px]" />
              </span>
              <input
                value={query}
                onChange={(e) => {
                  setQuery(e.target.value)
                  setShowResults(e.target.value.trim().length > 0)
                }}
                onFocus={() => setShowResults(query.trim().length > 0)}
                onBlur={() =>
                  window.setTimeout(() => setShowResults(false), 150)
                }
                placeholder="ค้นหา — HN, ชื่อ-นามสกุล, เลขบัตรประชาชน, เบอร์โทร…"
                className="min-w-0 flex-1 bg-transparent text-[14px] text-ink-900 placeholder-ink-400 outline-none"
              />
              {query && (
                <button
                  onClick={() => {
                    setQuery('')
                    setShowResults(false)
                  }}
                  className="mr-1 flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-ink-400 transition hover:bg-ink-900/[0.06] hover:text-ink-700"
                  aria-label="ล้าง"
                >
                  <X className="h-4 w-4" />
                </button>
              )}
            </div>
            {/* divider */}
            <span className="mx-1 hidden h-7 w-px shrink-0 bg-ink-900/[0.08] sm:block" />
            <DateRangeFilter
              from={dateFrom}
              to={dateTo}
              preset={datePreset}
              onChange={handleDateChange}
            />

            {/* quick-select patient dropdown — liquid-glass, like the
               notification panel on หน้าภาพรวม */}
            {showResults && query.trim() && (
              <div className="liquid-glass absolute left-0 right-0 top-full z-30 mt-2 overflow-hidden rounded-[22px] border border-white/60 bg-white/65 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.95),inset_0_0_0_1px_rgba(255,255,255,0.16),0_26px_58px_-16px_rgba(18,26,78,0.55)]">
                {/* specular highlights — light catching the glass */}
                <span
                  aria-hidden
                  className="pointer-events-none absolute inset-x-0 top-0 h-1/3 bg-gradient-to-b from-white/55 via-white/[0.12] to-transparent"
                />
                <span
                  aria-hidden
                  className="pointer-events-none absolute -left-8 -top-10 h-32 w-32 rounded-full bg-white/40 blur-2xl"
                />
                {/* content above the glass layers */}
                <div className="relative">
                  {matches.length > 0 ? (
                    <>
                      <div className="flex items-center gap-1.5 border-b border-ink-900/[0.07] px-4 py-2.5 text-[11px] font-semibold uppercase tracking-wide text-ink-400">
                        <UserSearch className="h-3.5 w-3.5" />
                        ผลการค้นหา {matches.length} รายการ
                      </div>
                      <div className="max-h-[320px] overflow-y-auto p-1.5">
                        {matches.map((p) => (
                          <button
                            key={p.hn}
                            type="button"
                            onMouseDown={(e) => e.preventDefault()}
                            onClick={() => navigate(`/patient/${p.hn}`)}
                            className="group/row flex w-full items-center gap-3 rounded-[16px] py-2 pl-3 pr-2.5 text-left transition-all duration-200 ease-[cubic-bezier(0.22,1,0.36,1)] hover:bg-brand-500/[0.09]"
                          >
                            <span className="shrink-0 transition-transform duration-200 ease-[cubic-bezier(0.22,1.4,0.5,1)] group-hover/row:scale-110">
                              <Avatar
                                name={`${p.firstName} ${p.lastName}`}
                                src={p.photo}
                                size="md"
                              />
                            </span>
                            <div className="min-w-0 flex-1">
                              <div className="truncate text-[13px] font-semibold text-ink-900 transition-colors duration-200 group-hover/row:text-brand-700">
                                {p.prefix} {p.firstName} {p.lastName}
                              </div>
                              <div className="mt-0.5 flex items-center gap-1.5 text-[11px] text-ink-500">
                                <span className="rounded-md bg-brand-500/12 px-1.5 py-px font-semibold text-brand-600 transition-colors duration-200 group-hover/row:bg-brand-500 group-hover/row:text-white">
                                  HN {p.hn}
                                </span>
                                <span className="truncate">
                                  {calculateAge(p.birthdate)} ·{' '}
                                  {p.gender === 'male' ? 'ชาย' : 'หญิง'}
                                </span>
                              </div>
                            </div>
                            <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-ink-900/[0.04] text-ink-400 transition-all duration-200 group-hover/row:translate-x-0.5 group-hover/row:bg-brand-500 group-hover/row:text-white">
                              <ChevronRight className="h-4 w-4" />
                            </span>
                          </button>
                        ))}
                      </div>
                    </>
                  ) : (
                    <div className="flex items-center gap-2.5 px-4 py-6 text-[13px] text-ink-500">
                      <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-ink-900/[0.05] text-ink-400">
                        <UserSearch className="h-[18px] w-[18px]" />
                      </span>
                      ไม่พบผู้ป่วยที่ตรงกับ “{query.trim()}”
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* ── Count ─────────────────────────────────────────── */}
      <div className="px-1 text-[13px] text-ink-500">
        แสดง{' '}
        <span className="font-semibold text-ink-800">{results.length}</span> จาก{' '}
        {allPatients.length} รายการในทะเบียน
      </div>

      {/* ── Results ───────────────────────────────────────── */}
      {results.length === 0 ? (
        <EmptyState onCreate={() => navigate('/patient/new')} />
      ) : (
        <div className="stagger-children grid grid-cols-1 gap-3 md:grid-cols-2 xl:grid-cols-3">
          {results.map((p) => (
            <PatientCard
              key={p.hn}
              patient={p}
              onOpen={() => navigate(`/patient/${p.hn}`)}
              onDelete={() => handleDelete(p)}
            />
          ))}
        </div>
      )}
    </div>
  )
}

/* ── Patient card ───────────────────────────────────────── */
function PatientCard({
  patient,
  onOpen,
  onDelete,
}: {
  patient: Patient
  onOpen: () => void
  onDelete: () => void
}) {
  const fullName = `${patient.prefix} ${patient.firstName} ${patient.lastName}`
  return (
    <div className="group relative">
      <button
        type="button"
        onClick={onDelete}
        aria-label="ลบผู้ป่วย"
        className="absolute right-3 top-3 z-10 flex h-8 w-8 items-center justify-center rounded-full bg-white/95 text-ink-400 opacity-0 shadow-[0_6px_16px_-6px_rgba(28,38,92,0.4)] ring-1 ring-ink-900/[0.06] backdrop-blur transition-all duration-200 hover:bg-rose-500 hover:text-white hover:ring-rose-500 group-hover:opacity-100"
      >
        <Trash2 className="h-4 w-4" />
      </button>
      <button
        onClick={onOpen}
        className="relative flex h-full w-full flex-col overflow-hidden rounded-[24px] bg-white text-left shadow-[0_6px_16px_-8px_rgba(28,38,92,0.22)] ring-1 ring-ink-900/[0.05] transition-all duration-300 hover:-translate-y-1.5 hover:shadow-[0_26px_46px_-16px_rgba(28,38,92,0.42)] hover:ring-brand-400/45 focus-ring"
      >
      {/* soft gradient accent at the top */}
      <div
        aria-hidden
        className="pointer-events-none absolute inset-x-0 top-0 h-[92px] bg-gradient-to-b from-brand-500/[0.08] via-violet-500/[0.04] to-transparent"
      />

      {/* identity */}
      <div className="relative flex items-center gap-3.5 p-4">
        <Avatar name={fullName} src={patient.photo} size="lg" />
        <div className="min-w-0 flex-1">
          <div className="truncate text-[15.5px] font-bold tracking-tight text-ink-900">
            {fullName}
          </div>
          <div className="mt-1 inline-flex items-center gap-1 rounded-md bg-brand-500/[0.09] px-1.5 py-0.5 text-[11px] font-semibold text-brand-700">
            <IdCard className="h-3 w-3" />
            HN {patient.hn}
          </div>
          <div className="mt-1.5 text-[12px] text-ink-400">
            {calculateAge(patient.birthdate)} ·{' '}
            {patient.gender === 'male' ? 'ชาย' : 'หญิง'}
            {patient.bloodGroup &&
              ` · กรุ๊ป ${patient.bloodGroup}${patient.rh || ''}`}
          </div>
        </div>
        <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-ink-900/[0.04] text-ink-400 transition-all duration-200 group-hover:bg-gradient-to-br group-hover:from-brand-500 group-hover:to-violet-500 group-hover:text-white">
          <ChevronRight className="h-4 w-4 transition-transform duration-200 group-hover:translate-x-0.5" />
        </span>
      </div>

      {/* badges */}
      <div className="relative flex flex-wrap items-center gap-1.5 px-4 pb-3.5">
        <Badge tone="brand" variant="soft">
          {patient.insurance?.split('(')[0].trim()}
        </Badge>
        {patient.tags?.map((t) => (
          <Badge key={t} tone="violet" variant="soft">
            {t}
          </Badge>
        ))}
      </div>

      {/* footer */}
      <div className="relative mt-auto flex items-center justify-between border-t border-ink-900/[0.06] bg-ink-900/[0.02] px-4 py-2.5 text-[12px] text-ink-500">
        <span className="inline-flex items-center gap-1.5">
          <Phone className="h-3.5 w-3.5 text-ink-400" />
          {patient.phone || '-'}
        </span>
        <span className="inline-flex items-center gap-1.5">
          <CalendarClock className="h-3.5 w-3.5 text-ink-400" />
          ล่าสุด {patient.lastVisit ? formatThaiDate(patient.lastVisit) : '-'}
        </span>
      </div>
      </button>
    </div>
  )
}

const WEEKDAYS = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส']
const MONTHS = [
  'มกราคม',
  'กุมภาพันธ์',
  'มีนาคม',
  'เมษายน',
  'พฤษภาคม',
  'มิถุนายน',
  'กรกฎาคม',
  'สิงหาคม',
  'กันยายน',
  'ตุลาคม',
  'พฤศจิกายน',
  'ธันวาคม',
]

function buildCalendar(viewMonth: Date): Date[] {
  const first = new Date(viewMonth.getFullYear(), viewMonth.getMonth(), 1)
  const gridStart = new Date(
    first.getFullYear(),
    first.getMonth(),
    1 - first.getDay()
  )
  return Array.from(
    { length: 42 },
    (_, i) =>
      new Date(
        gridStart.getFullYear(),
        gridStart.getMonth(),
        gridStart.getDate() + i
      )
  )
}

function DateRangeFilter({
  from,
  to,
  preset,
  onChange,
}: {
  from: string
  to: string
  preset: string
  onChange: (from: string, to: string, preset: string) => void
}) {
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)
  const [viewMonth, setViewMonth] = useState(() => {
    const base = from ? new Date(from) : new Date()
    return new Date(base.getFullYear(), base.getMonth(), 1)
  })

  useEffect(() => {
    if (!open) return
    function onDown(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false)
    }
    window.addEventListener('mousedown', onDown)
    return () => window.removeEventListener('mousedown', onDown)
  }, [open])

  useEffect(() => {
    if (!open) return
    const base = from ? new Date(from) : new Date()
    setViewMonth(new Date(base.getFullYear(), base.getMonth(), 1))
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [open])

  const todayStr = toDateStr(new Date())

  const label =
    !from && !to
      ? 'ทุกช่วงเวลา'
      : from && to
        ? from === to
          ? formatThaiDate(from)
          : `${formatThaiDate(from)} – ${formatThaiDate(to)}`
        : from
          ? `ตั้งแต่ ${formatThaiDate(from)}`
          : `ถึง ${formatThaiDate(to)}`

  function applyPreset(p: string) {
    const today = new Date()
    if (p === '7d') {
      const s = new Date()
      s.setDate(s.getDate() - 6)
      onChange(toDateStr(s), toDateStr(today), '7d')
    } else if (p === '30d') {
      const s = new Date()
      s.setDate(s.getDate() - 29)
      onChange(toDateStr(s), toDateStr(today), '30d')
    } else if (p === 'all') {
      onChange('', '', 'all')
    } else {
      onChange(toDateStr(today), toDateStr(today), 'today')
    }
    setOpen(false)
  }

  function handleDay(ds: string) {
    if (!from || (from && to)) {
      onChange(ds, '', 'custom')
    } else if (ds < from) {
      onChange(ds, from, 'custom')
      setOpen(false)
    } else {
      onChange(from, ds, 'custom')
      setOpen(false)
    }
  }

  const days = buildCalendar(viewMonth)

  return (
    <div className="relative shrink-0" ref={ref}>
      <button
        onClick={() => setOpen((o) => !o)}
        className={cn(
          'group flex h-11 w-full items-center gap-2 rounded-full px-4 text-[13.5px] font-medium transition-colors duration-200 sm:w-auto',
          open
            ? 'bg-ink-900/[0.06] text-ink-900'
            : 'text-ink-700 hover:bg-ink-900/[0.055]'
        )}
      >
        <CalendarRange className="h-4 w-4 shrink-0 text-brand-500 transition-transform duration-200 group-hover:scale-110" />
        <span className="font-medium text-ink-700">{label}</span>
        <ChevronDown
          className={cn(
            'h-4 w-4 shrink-0 text-ink-400 transition-transform',
            open && 'rotate-180'
          )}
        />
      </button>

      {open && (
        <div className="liquid-glass absolute right-0 top-[calc(100%+16px)] z-30 w-[306px] origin-top-right overflow-hidden rounded-3xl border border-white/60 bg-white/65 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.95),inset_0_0_0_1px_rgba(255,255,255,0.16),0_24px_56px_-16px_rgba(18,26,78,0.55)] animate-pop-in">
          <span
            aria-hidden
            className="pointer-events-none absolute inset-x-0 top-0 h-1/3 bg-gradient-to-b from-white/55 via-white/[0.12] to-transparent"
          />
          <span
            aria-hidden
            className="pointer-events-none absolute -left-8 -top-10 h-32 w-32 rounded-full bg-white/40 blur-2xl"
          />
          <div className="relative p-3">
          {/* Quick presets */}
          <div className="flex flex-wrap gap-1.5">
            {datePresets.map((dp) => (
              <button
                key={dp.value}
                onClick={() => applyPreset(dp.value)}
                className={cn(
                  'chip transition',
                  preset === dp.value
                    ? 'bg-gradient-to-r from-brand-500 to-violet-500 text-white'
                    : 'glass-dim text-ink-600 hover:bg-ink-900/10'
                )}
              >
                {dp.label}
              </button>
            ))}
          </div>

          <div className="my-3 h-px bg-ink-900/10" />

          {/* Month navigation */}
          <div className="flex items-center justify-between">
            <button
              onClick={() =>
                setViewMonth((m) => new Date(m.getFullYear(), m.getMonth() - 1, 1))
              }
              className="inline-flex h-8 w-8 items-center justify-center rounded-xl text-ink-500 transition hover:bg-ink-900/5"
              aria-label="เดือนก่อนหน้า"
            >
              <ChevronLeft className="h-4 w-4" />
            </button>
            <span className="text-sm font-semibold text-ink-800">
              {MONTHS[viewMonth.getMonth()]} {viewMonth.getFullYear() + 543}
            </span>
            <button
              onClick={() =>
                setViewMonth((m) => new Date(m.getFullYear(), m.getMonth() + 1, 1))
              }
              className="inline-flex h-8 w-8 items-center justify-center rounded-xl text-ink-500 transition hover:bg-ink-900/5"
              aria-label="เดือนถัดไป"
            >
              <ChevronRight className="h-4 w-4" />
            </button>
          </div>

          {/* Weekday header */}
          <div className="mt-2 grid grid-cols-7">
            {WEEKDAYS.map((w) => (
              <div
                key={w}
                className="py-1 text-center text-[11px] font-medium text-ink-400"
              >
                {w}
              </div>
            ))}
          </div>

          {/* Day grid */}
          <div className="grid grid-cols-7">
            {days.map((d) => {
              const ds = toDateStr(d)
              const inMonth = d.getMonth() === viewMonth.getMonth()
              const isFrom = !!from && ds === from
              const isTo = !!to && ds === to
              const isEndpoint = isFrom || isTo
              const inRange = !!from && !!to && ds > from && ds < to
              const isToday = ds === todayStr
              const hasRange = !!from && !!to && from !== to
              return (
                <button
                  key={ds}
                  onClick={() => handleDay(ds)}
                  className={cn(
                    'relative h-9 text-[13px] font-medium transition',
                    inRange && 'bg-brand-500/15 text-ink-800',
                    isEndpoint &&
                      'bg-gradient-to-br from-brand-500 to-violet-500 text-white',
                    isEndpoint &&
                      (hasRange
                        ? isFrom
                          ? 'rounded-l-xl'
                          : 'rounded-r-xl'
                        : 'rounded-xl'),
                    !isEndpoint && !inRange && 'rounded-xl hover:bg-ink-900/5',
                    !isEndpoint &&
                      !inRange &&
                      (inMonth ? 'text-ink-700' : 'text-ink-300')
                  )}
                >
                  {d.getDate()}
                  {isToday && !isEndpoint && (
                    <span className="absolute bottom-1 left-1/2 h-1 w-1 -translate-x-1/2 rounded-full bg-brand-500" />
                  )}
                </button>
              )
            })}
          </div>

          <p className="mt-2.5 text-center text-[11px] text-ink-400">
            แตะวันเริ่มต้นและวันสิ้นสุดบนปฏิทินเพื่อเลือกช่วง
          </p>
          </div>
        </div>
      )}
    </div>
  )
}

/* ── Empty state ────────────────────────────────────────── */
function EmptyState({ onCreate }: { onCreate: () => void }) {
  return (
    <div className="flex flex-col items-center justify-center rounded-[24px] bg-white py-16 text-center shadow-[0_4px_8px_rgba(0,0,0,0.06)] ring-1 ring-ink-900/[0.04]">
      <div className="flex h-16 w-16 items-center justify-center rounded-3xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15">
        <BookUser className="h-7 w-7 text-brand-500" />
      </div>
      <h3 className="mt-4 text-lg font-semibold text-ink-900">
        ไม่พบผู้ป่วยในทะเบียน
      </h3>
      <p className="mt-1 max-w-sm text-sm text-ink-500">
        ลองปรับคำค้นหรือตัวกรอง หรือถ้ายังไม่มีในระบบ
        สามารถลงทะเบียนผู้ป่วยใหม่ได้ทันที
      </p>
      <button
        type="button"
        onClick={onCreate}
        className="group relative mt-5 inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/35 bg-gradient-to-br from-pink-600/90 to-orange-500/90 px-5 text-[14px] font-semibold text-white shadow-[0_12px_26px_-10px_rgba(236,72,153,0.55),inset_0_1px_0_0_rgba(255,255,255,0.5)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:from-pink-600 hover:to-orange-500 active:scale-[0.97] focus-visible:ring-2 focus-visible:ring-pink-500/45"
      >
        <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/30 to-white/0" />
        <UserPlus className="relative h-[17px] w-[17px]" />
        <span className="relative">ลงทะเบียนผู้ป่วยใหม่</span>
      </button>
    </div>
  )
}
