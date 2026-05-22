import { useEffect, useRef, useState, type ReactNode } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  Search,
  Save,
  X,
  Stethoscope,
  ShieldCheck,
  Printer,
  Lock,
  Clock,
  AlertTriangle,
  IdCard,
  Phone,
  Droplet,
  User,
  UserPlus,
  Check,
  FileText,
  ClipboardList,
  ScanLine,
  UserSearch,
  ChevronRight,
  ChevronDown,
  Trash2,
  type LucideIcon,
} from 'lucide-react'
import { Card } from '@/components/ui/Card'
import { Button } from '@/components/ui/Button'
import { Input, Textarea } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { Avatar } from '@/components/ui/Avatar'
import { DatePicker } from '@/components/ui/DateTimePicker'
import { getPatientProfile } from '@/data/patientProfiles'
import { usePatients, getPatient } from '@/data/patientStore'
import { useToast } from '@/components/ui/Toast'
import { calculateAge, cn } from '@/lib/utils'

/* ───────────────────────── option lists ───────────────────────── */

const opt = (arr: string[]) => arr.map((v) => ({ value: v, label: v }))

const O = {
  department: opt([
    'OPD ทั่วไป',
    'อายุรกรรม',
    'ศัลยกรรม',
    'กุมารเวชกรรม',
    'สูติ-นรีเวชกรรม',
    'ออร์โธปิดิกส์',
    'ทันตกรรม',
    'ห้องฉุกเฉิน',
  ]),
  branch: opt(['สำนักงานใหญ่ (แม่ข่าย)', 'หน่วยบริการปฐมภูมิ']),
  patientType: opt([
    'ผู้ป่วยนอก (OPD)',
    'ผู้ป่วยใน (IPD)',
    'ผู้ป่วยฉุกเฉิน (ER)',
    'งานส่งเสริมสุขภาพ',
  ]),
  visitType: opt([
    'มาเอง (Walk-in)',
    'มาตามนัด',
    'รับส่งต่อจากที่อื่น (Refer in)',
    'อุบัติเหตุ-ฉุกเฉิน',
  ]),
  urgency: opt(['ปกติ', 'เร่งด่วน', 'ฉุกเฉิน', 'วิกฤต']),
  condition: opt(['เดินได้', 'นั่งรถเข็น', 'นอนเปล', 'อุ้ม / หาม']),
  room: opt([
    'ห้องตรวจ 1 — OPD ทั่วไป',
    'ห้องตรวจ 2 — อายุรกรรม',
    'ห้องตรวจ 3 — กุมารเวชกรรม',
    'ห้องคัดกรอง',
    'ห้องฉุกเฉิน',
    'ห้องทันตกรรม',
  ]),
  workHours: opt(['ในเวลาราชการ', 'นอกเวลาราชการ']),
  patientCategory: opt(['คนไข้ทั่วไป', 'คนไข้นัดหมาย', 'คนไข้ฉุกเฉิน', 'คนไข้ส่งต่อ']),
  right: opt([
    'ชำระเงินเอง',
    'หลักประกันสุขภาพถ้วนหน้า (บัตรทอง)',
    'ประกันสังคม',
    'ข้าราชการ / รัฐวิสาหกิจ (เบิกจ่ายตรง)',
    'ประกันสุขภาพแรงงานต่างด้าว',
    'พ.ร.บ. ผู้ประสบภัยจากรถ',
  ]),
  rightCheck: opt([
    'ยังไม่ตรวจสอบ',
    'ตรวจสอบแล้ว — ใช้สิทธิได้',
    'ตรวจสอบแล้ว — สิทธิไม่ตรงหน่วยบริการ',
    'สิทธิหมดอายุ',
  ]),
}

const SYMPTOM_CHIPS = [
  'ปวดศีรษะ',
  'มีไข้',
  'ไอ เจ็บคอ',
  'ปวดท้อง',
  'ความดันโลหิตสูง',
  'ตรวจติดตามตามนัด',
]

/* eased fade — blends the hero image bottom into the panel */
const HERO_FADE =
  'linear-gradient(to bottom, #000 0%, #000 48%, rgba(0,0,0,0.985) 55%, rgba(0,0,0,0.95) 62%, rgba(0,0,0,0.88) 68%, rgba(0,0,0,0.76) 74%, rgba(0,0,0,0.6) 80%, rgba(0,0,0,0.42) 86%, rgba(0,0,0,0.24) 91%, rgba(0,0,0,0.1) 96%, rgba(0,0,0,0) 100%)'

/* photo-card backdrop — colour fallback under the bg image (เหมือนหน้าเวชระเบียน) */
const PHOTO_BG =
  'radial-gradient(circle at 18% 20%, rgba(167,139,250,0.95) 0%, rgba(167,139,250,0) 55%),' +
  'radial-gradient(circle at 86% 16%, rgba(96,165,250,0.95) 0%, rgba(96,165,250,0) 55%),' +
  'radial-gradient(circle at 72% 96%, rgba(56,189,248,0.9) 0%, rgba(56,189,248,0) 58%),' +
  'linear-gradient(135deg, #7c83f6 0%, #8b5cf6 100%)'

/* ───────────────────────── helpers ───────────────────────── */

const pad = (n: number) => String(n).padStart(2, '0')
function todayISO() {
  const d = new Date()
  return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`
}
/** real-time clock string HH:MM */
function fmtClock(d: Date) {
  return `${pad(d.getHours())}:${pad(d.getMinutes())}`
}

type VisitForm = Record<string, string>

function buildForm(hn: string): VisitForm {
  const p = getPatient(hn)
  const prof = getPatientProfile(hn)
  const r = prof?.rights[0]
  return {
    department: 'OPD ทั่วไป',
    branch: 'สำนักงานใหญ่ (แม่ข่าย)',
    patientType: 'ผู้ป่วยนอก (OPD)',
    visitType: 'มาเอง (Walk-in)',
    urgency: 'ปกติ',
    condition: 'เดินได้',
    room: 'ห้องตรวจ 1 — OPD ทั่วไป',
    workHours: 'ในเวลาราชการ',
    patientCategory: 'คนไข้ทั่วไป',
    reason: '',
    rightName: r?.name ?? '',
    rightNo: r?.no ?? '',
    rightCheck: 'ยังไม่ตรวจสอบ',
    rightBegin: r?.begin ?? '',
    rightExpire: r?.expire ?? '',
    authCode: '',
    mainHospital: p?.hospitalMain ?? '',
    subHospital: p?.hospitalSub ?? '',
  }
}

type Flags = Record<string, boolean>

/* card with a titled header + divider — เหมือน Panel หน้าเวชระเบียน */
function Panel({
  title,
  desc,
  icon: Icon,
  children,
  className,
}: {
  title: string
  desc?: string
  icon?: LucideIcon
  children: ReactNode
  className?: string
}) {
  return (
    <Card padding="none" className={className}>
      <div className="flex items-center gap-3 px-5 pb-3 pt-4">
        {Icon && (
          <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-600">
            <Icon className="h-[18px] w-[18px]" />
          </span>
        )}
        <div className="min-w-0 flex-1">
          <h2 className="text-[15.5px] font-semibold tracking-tight text-ink-900">
            {title}
          </h2>
          {desc && <p className="mt-0.5 text-[12px] text-ink-500">{desc}</p>}
        </div>
      </div>
      <div className="h-px bg-ink-900/[0.07]" />
      <div className="p-5">{children}</div>
    </Card>
  )
}

/* ───────────────────────── page ───────────────────────── */

export default function PatientVisit() {
  const navigate = useNavigate()
  const toast = useToast()
  const allPatients = usePatients()
  const [selectedHn, setSelectedHn] = useState<string | null>(null)
  const [hnQuery, setHnQuery] = useState('')
  const [showResults, setShowResults] = useState(false)
  const [visitDate, setVisitDate] = useState(todayISO)
  const [tab, setTab] = useState<'rights' | 'print' | 'task'>('rights')
  const [form, setForm] = useState<VisitForm | null>(null)
  const [flags, setFlags] = useState<Flags>({})
  const [done, setDone] = useState(false)

  const set = (k: string, v: string) =>
    setForm((f) => (f ? { ...f, [k]: v } : f))
  const toggle = (k: string) => setFlags((f) => ({ ...f, [k]: !f[k] }))
  const bindSel = (k: string) => ({
    value: form?.[k] ?? '',
    onChange: (e: { target: { value: string } }) => set(k, e.target.value),
  })

  /** patients matching the current query — drives the search dropdown */
  const matches = (() => {
    const q = hnQuery.trim().toLowerCase()
    if (!q) return []
    return allPatients.filter(
      (p) =>
        p.hn.toLowerCase().includes(q) ||
        `${p.prefix}${p.firstName}${p.lastName}`.toLowerCase().includes(q)
    )
  })()

  /** load a patient into the page */
  function selectPatient(hn: string) {
    setSelectedHn(hn)
    setHnQuery(hn)
    setForm(buildForm(hn))
    setShowResults(false)
  }

  /** run the search — pick an exact / single hit, otherwise show the list */
  function runSearch() {
    const q = hnQuery.trim().toLowerCase()
    if (!q) return
    const exact = allPatients.find((p) => p.hn.toLowerCase() === q)
    if (exact) return selectPatient(exact.hn)
    if (matches.length === 1) return selectPatient(matches[0].hn)
    setShowResults(true)
  }

  if (done) {
    return (
      <VisitSuccess
        onNew={() => {
          setDone(false)
          if (selectedHn) setForm(buildForm(selectedHn))
        }}
        onQueue={() => navigate('/visit-list')}
      />
    )
  }

  return (
    <div className="flex h-[calc(100vh-66px)] flex-col gap-4">
      {/* ── Top block: hero + overlapping search ── */}
      <div className="shrink-0">
        {/* Hero — full-bleed, same treatment as หน้าทะเบียนผู้ป่วย */}
        <section className="relative -mx-4 -mt-4 overflow-hidden rounded-t-[32px] px-7 pb-6 pt-7 sm:px-9 lg:h-[216px]">
          <div
            className="pointer-events-none absolute inset-0"
            style={{ maskImage: HERO_FADE, WebkitMaskImage: HERO_FADE }}
          >
            <img
              src={`${import.meta.env.BASE_URL}hero2.png`}
              alt=""
              aria-hidden="true"
              className="absolute inset-0 h-full w-full scale-[1.06] object-cover blur-[2px]"
              style={{ objectPosition: '50% 85%' }}
            />
            <div
              className="absolute inset-0"
              style={{
                background:
                  'linear-gradient(100deg, rgba(9,13,38,0.82) 0%, rgba(9,13,38,0.74) 16%, rgba(9,13,38,0.6) 34%, rgba(9,13,38,0.42) 54%, rgba(9,13,38,0.24) 74%, rgba(9,13,38,0.05) 94%, rgba(9,13,38,0) 100%)',
              }}
            />
            <div className="absolute inset-x-0 top-0 h-20 bg-gradient-to-b from-white/15 to-white/0" />
          </div>

          <div className="relative flex h-full flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div className="flex flex-col gap-3">
              <p className="text-[12px] font-medium uppercase tracking-wide text-white/65 [text-shadow:0_1px_6px_rgba(6,10,34,0.6)]">
                OPD Registry
              </p>
              <h1 className="text-[21px] font-bold leading-tight tracking-tight text-white [text-shadow:0_2px_12px_rgba(6,10,34,0.6)] sm:text-[24px] xl:text-[28px]">
                ส่งตรวจผู้ป่วย
              </h1>
              <p className="text-[13px] font-medium text-white/85 [text-shadow:0_1px_8px_rgba(6,10,34,0.6)] sm:text-[13.5px]">
                บันทึกการส่งตรวจ ออกคิว และตรวจสอบสิทธิการรักษา
              </p>
            </div>
            <div className="flex shrink-0 flex-wrap items-center gap-2.5">
              <button
                type="button"
                onClick={() => {
                  const first = allPatients[0]
                  if (!first) return
                  selectPatient(first.hn)
                  toast.success(
                    'อ่านบัตรประชาชนสำเร็จ',
                    'ดึงข้อมูลผู้ป่วยจากบัตรเรียบร้อยแล้ว'
                  )
                }}
                className="group relative inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/55 bg-white/30 px-5 text-[14.5px] font-semibold text-ink-900 shadow-[0_10px_28px_-8px_rgba(6,10,34,0.5),inset_0_1px_0_0_rgba(255,255,255,0.75)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:bg-white/45 active:scale-[0.97]"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/55 to-white/0" />
                <ScanLine className="relative h-[17px] w-[17px] text-brand-600" />
                <span className="relative">สแกนบัตรประชาชน</span>
              </button>
              <button
                type="button"
                onClick={() => navigate('/patient/new')}
                className="group relative inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/35 bg-gradient-to-r from-rose-500/95 to-orange-500/95 px-5 text-[14.5px] font-semibold text-white shadow-[0_12px_30px_-8px_rgba(244,63,94,0.6),inset_0_1px_0_0_rgba(255,255,255,0.5)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:from-rose-500 hover:to-orange-500 active:scale-[0.97]"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/30 to-white/0" />
                <UserPlus className="relative h-[17px] w-[17px]" />
                <span className="relative">ลงทะเบียนผู้ป่วยใหม่</span>
              </button>
            </div>
          </div>
        </section>

        {/* HN search — overlapping the hero */}
        <div className="relative z-10 mt-4 px-1 pt-3 lg:-mt-[72px] xl:px-0">
          <div className="relative flex flex-col gap-1.5 rounded-[28px] bg-white p-2 shadow-[0_20px_44px_-18px_rgba(28,38,92,0.45)] ring-1 ring-ink-900/[0.06] sm:flex-row sm:items-center sm:rounded-full">
            {/* search field — integrated brand icon chip (เหมือนหน้าทะเบียนผู้ป่วย) */}
            <div className="group flex h-11 min-w-0 flex-1 items-center gap-2 rounded-full px-1.5 transition-colors duration-200 hover:bg-ink-900/[0.04] focus-within:bg-ink-900/[0.04]">
              <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-brand-500/14 to-violet-500/14 text-brand-600 transition-all duration-200 group-hover:from-brand-500/30 group-hover:to-violet-500/30 group-focus-within:from-brand-500 group-focus-within:to-violet-500 group-focus-within:text-white">
                <Search className="h-[17px] w-[17px]" />
              </span>
              <input
                value={hnQuery}
                onChange={(e) => {
                  setHnQuery(e.target.value)
                  setShowResults(e.target.value.trim().length > 0)
                }}
                onFocus={() => setShowResults(hnQuery.trim().length > 0)}
                onBlur={() =>
                  window.setTimeout(() => setShowResults(false), 150)
                }
                onKeyDown={(e) => e.key === 'Enter' && runSearch()}
                placeholder="ค้นหาผู้ป่วย — HN หรือชื่อ-นามสกุล…"
                className="min-w-0 flex-1 bg-transparent text-[14px] text-ink-900 placeholder-ink-400 outline-none"
              />
              {hnQuery && (
                <button
                  type="button"
                  onClick={() => {
                    setHnQuery('')
                    setShowResults(false)
                  }}
                  className="mr-1 flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-ink-400 transition hover:bg-ink-900/[0.06] hover:text-ink-700"
                  aria-label="ล้าง"
                >
                  <X className="h-4 w-4" />
                </button>
              )}
                {showResults && (
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
                                onClick={() => selectPatient(p.hn)}
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
                          ไม่พบผู้ป่วยที่ตรงกับ “{hnQuery.trim()}”
                        </div>
                      )}
                    </div>
                  </div>
                )}
            </div>

            {/* divider */}
            <span className="mx-1 hidden h-7 w-px shrink-0 bg-ink-900/[0.08] sm:block" />

            {/* visit date · clock (with time settings) */}
            <div className="flex shrink-0 flex-wrap items-center gap-1 px-1 sm:flex-nowrap sm:px-0">
              <DatePicker
                value={visitDate}
                onChange={setVisitDate}
                variant="ghost"
              />
              <span className="mx-0.5 hidden h-7 w-px bg-ink-900/[0.08] sm:block" />
              <VisitClock />
            </div>
          </div>
        </div>
      </div>

      {/* ── main: 3-column workspace ── */}
      {!selectedHn ? (
        <EmptyState />
      ) : (
        <div className="flex min-h-0 flex-1 flex-col gap-4 xl:flex-row">
        {/* ── left — patient info (คอลัมน์คงที่ กว้างเท่าหน้าเวชระเบียน) ── */}
        <div className="xl:min-h-0 xl:w-[230px] xl:shrink-0 xl:overflow-y-auto xl:pb-2">
          <PatientInfoCard hn={selectedHn} />
        </div>

        {/* ── center + right — เลื่อนพร้อมกันในกล่องเดียว (เหมือนหน้าเวชระเบียน) ── */}
        <div className="min-w-0 xl:min-h-0 xl:flex-1 xl:overflow-y-auto xl:pb-2">
        <div className="space-y-4">
        {/* แถวบน: อาการสำคัญ + ปุ่ม/แท็บ */}
        <div className="grid grid-cols-1 items-start gap-4 xl:grid-cols-[minmax(0,1fr)_350px]">
          {/* center — อาการสำคัญ / การส่งต่อ */}
          <Panel
            title="อาการสำคัญ / การส่งต่อ"
            desc="ข้อมูลการมารับบริการและการส่งต่อห้องตรวจ"
            icon={Stethoscope}
          >
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <Select label="แผนก" options={O.department} {...bindSel('department')} />
              <Select label="สาขา" options={O.branch} {...bindSel('branch')} />
              <Select
                label="ประเภทผู้ป่วย"
                options={O.patientType}
                {...bindSel('patientType')}
              />
              <Select
                label="ประเภทการมา"
                options={O.visitType}
                {...bindSel('visitType')}
              />
              <Select
                label="ความเร่งด่วน"
                options={O.urgency}
                {...bindSel('urgency')}
              />
              <Select label="สภาพผู้ป่วย" options={O.condition} {...bindSel('condition')} />
              <Select
                label="ส่งต่อไปที่ห้อง"
                options={O.room}
                {...bindSel('room')}
                className="sm:col-span-2"
              />
              <Select
                label="เวลาทำการ"
                options={O.workHours}
                {...bindSel('workHours')}
              />
              <Select
                label="ประเภทคนไข้"
                options={O.patientCategory}
                {...bindSel('patientCategory')}
              />
            </div>

            <div className="mt-4">
              <Textarea
                label="อาการสำคัญ / สาเหตุที่มา (Chief Complaint)"
                placeholder="เช่น ปวดศีรษะ เวียนศีรษะ มา 2 วัน…"
                rows={3}
                {...bindSel('reason')}
              />
              <div className="mt-2 flex flex-wrap gap-1.5">
                {SYMPTOM_CHIPS.map((s) => (
                  <button
                    key={s}
                    type="button"
                    onClick={() => set('reason', s)}
                    className="chip glass-dim text-ink-600 transition hover:bg-brand-500/10 hover:text-brand-700"
                  >
                    {s}
                  </button>
                ))}
              </div>
            </div>

            <div className="mt-4 flex flex-wrap gap-x-5 gap-y-2.5 border-t border-ink-900/[0.06] pt-4">
              <CheckRow
                checked={!!flags.offSite}
                onChange={() => toggle('offSite')}
                label="ให้บริการนอกสถานที่"
              />
              <CheckRow
                checked={!!flags.qsSlot}
                onChange={() => toggle('qsSlot')}
                label="ออกคิวคัดกรอง (qs-slot)"
              />
              <CheckRow
                checked={!!flags.mophRefer}
                onChange={() => toggle('mophRefer')}
                label="MOPH Refer"
              />
            </div>
          </Panel>

          {/* right — actions + tabs + auth code history */}
          <div className="flex flex-col gap-4">
          {/* action buttons — บันทึกบน · ยกเลิกล่าง */}
          <Card padding="sm">
            <div className="space-y-2">
              <Button
                variant="primary"
                className="w-full"
                leftIcon={<Save className="h-4 w-4" />}
                onClick={() => {
                  toast.success(
                    'บันทึกการส่งตรวจสำเร็จ',
                    'ระบบออกคิว A-032 ให้ผู้ป่วยเรียบร้อยแล้ว'
                  )
                  setDone(true)
                }}
              >
                บันทึกส่งตรวจ
              </Button>
              <Button
                variant="secondary"
                className="w-full"
                leftIcon={<X className="h-4 w-4" />}
                onClick={() => {
                  setSelectedHn(null)
                  setHnQuery('')
                  setForm(null)
                  setFlags({})
                  setShowResults(false)
                  setTab('rights')
                  toast.info(
                    'ล้างหน้าส่งตรวจแล้ว',
                    'พร้อมค้นหาผู้ป่วยรายใหม่'
                  )
                }}
              >
                ยกเลิก
              </Button>
            </div>
          </Card>
          {/* tabbed: สิทธิ / พิมพ์เอกสาร / Task */}
          <Card padding="none" className="p-5">
            <div className="mb-4 flex gap-1 rounded-full bg-violet-500/10 p-1">
              {(
                [
                  { id: 'rights', label: 'สิทธิ', icon: ShieldCheck },
                  { id: 'print', label: 'พิมพ์', icon: Printer },
                  { id: 'task', label: 'Task', icon: ClipboardList },
                ] as const
              ).map((t) => {
                const on = tab === t.id
                return (
                  <button
                    key={t.id}
                    onClick={() => setTab(t.id)}
                    className={cn(
                      'inline-flex h-9 flex-1 items-center justify-center gap-1.5 rounded-full text-[13px] font-medium transition-all duration-200 active:scale-[0.97]',
                      on
                        ? 'bg-gradient-to-br from-brand-500 to-violet-500 text-white shadow-glow'
                        : 'text-ink-500 hover:text-ink-800'
                    )}
                  >
                    <t.icon className="h-4 w-4" />
                    {t.label}
                  </button>
                )
              })}
            </div>

            {tab === 'rights' ? (
              <div className="animate-page-in">
                <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
                  <Select
                    label="สิทธิการรักษา"
                    options={O.right}
                    {...bindSel('rightName')}
                  />
                  <Input
                    label="เลขที่สิทธิ"
                    placeholder="เลขที่สิทธิ"
                    {...bindSel('rightNo')}
                  />
                  <Select
                    label="สถานะการตรวจสอบสิทธิ"
                    options={O.rightCheck}
                    {...bindSel('rightCheck')}
                  />
                  <div>
                    <label className="mb-1.5 block text-[12px] font-medium text-ink-500">
                      วันเริ่มใช้สิทธิ
                    </label>
                    <DatePicker
                      value={form?.rightBegin ?? ''}
                      onChange={(v) => set('rightBegin', v)}
                    />
                  </div>
                  <div>
                    <label className="mb-1.5 block text-[12px] font-medium text-ink-500">
                      วันหมดอายุ
                    </label>
                    <DatePicker
                      value={form?.rightExpire ?? ''}
                      onChange={(v) => set('rightExpire', v)}
                    />
                  </div>
                  <Input
                    label="Auth Code"
                    placeholder="รหัสอนุมัติ"
                    {...bindSel('authCode')}
                  />
                  <Input
                    label="สถานพยาบาลหลัก"
                    placeholder="สถานพยาบาลหลัก"
                    {...bindSel('mainHospital')}
                  />
                  <Input
                    label="สถานพยาบาลรอง"
                    placeholder="สถานพยาบาลรอง"
                    {...bindSel('subHospital')}
                  />
                </div>
                <div className="mt-4 flex flex-col gap-2 border-t border-ink-900/[0.06] pt-4">
                  <Button
                    variant="secondary"
                    size="sm"
                    className="w-full border-0 bg-brand-500/10 text-brand-700 shadow-none hover:bg-brand-500/20"
                    leftIcon={
                      <img
                        src={`${import.meta.env.BASE_URL}nhso-logo.png`}
                        alt="สปสช."
                        className="h-[18px] w-[18px] object-contain"
                      />
                    }
                  >
                    ตรวจสอบสิทธิ สปสช.
                  </Button>
                  <Button
                    variant="secondary"
                    size="sm"
                    className="w-full border-0 bg-ink-900/[0.05] text-ink-700 shadow-none hover:bg-ink-900/10"
                    leftIcon={<FileText className="h-3.5 w-3.5" />}
                  >
                    ขอ Auth Code
                  </Button>
                  <Button
                    variant="secondary"
                    size="sm"
                    className="w-full border-0 bg-ink-900/[0.05] text-ink-700 shadow-none hover:bg-ink-900/10"
                    leftIcon={<ClipboardList className="h-3.5 w-3.5" />}
                  >
                    ประวัติการขอสิทธิ
                  </Button>
                </div>
              </div>
            ) : tab === 'print' ? (
              <div className="animate-page-in">
                <p className="mb-3 text-[13px] text-ink-500">
                  เลือกเอกสารที่ต้องการพิมพ์เมื่อบันทึกการส่งตรวจ
                </p>
                <div className="space-y-2">
                  {[
                    { key: 'printRx', label: 'พิมพ์ใบสั่งยา' },
                    { key: 'printSlip', label: 'พิมพ์ใบนำทาง (VN Slip)' },
                    { key: 'printOther', label: 'พิมพ์เอกสารอื่นๆ' },
                  ].map((d) => (
                    <label
                      key={d.key}
                      className="flex cursor-pointer items-center gap-3 rounded-2xl glass-tight px-4 py-3"
                    >
                      <CheckRow
                        checked={!!flags[d.key]}
                        onChange={() => toggle(d.key)}
                        label={d.label}
                      />
                    </label>
                  ))}
                </div>
                <div className="mt-4 border-t border-ink-900/[0.06] pt-4">
                  <Button
                    variant="secondary"
                    size="sm"
                    className="w-full"
                    leftIcon={<Printer className="h-3.5 w-3.5" />}
                  >
                    พิมพ์เอกสาร
                  </Button>
                </div>
              </div>
            ) : (
              <div className="animate-page-in">
                <p className="mb-3 text-[13px] text-ink-500">
                  จัดการรายการส่งตรวจของผู้ป่วยรายนี้
                </p>
                <div className="flex items-start gap-2.5 rounded-2xl border border-rose-500/15 bg-rose-500/[0.05] p-3.5">
                  <AlertTriangle className="mt-0.5 h-4 w-4 shrink-0 text-rose-500" />
                  <p className="text-[12.5px] leading-relaxed text-ink-600">
                    การลบจะนำรายการส่งตรวจนี้ออกจากคิวการตรวจ
                    และไม่สามารถกู้คืนได้
                  </p>
                </div>
                <div className="mt-3">
                  <Button
                    variant="danger"
                    size="sm"
                    className="w-full"
                    leftIcon={<Trash2 className="h-3.5 w-3.5" />}
                    onClick={() => {
                      toast.remove(
                        'ลบการส่งตรวจแล้ว',
                        'นำรายการออกจากคิวการตรวจเรียบร้อย'
                      )
                      setSelectedHn(null)
                      setHnQuery('')
                    }}
                  >
                    ลบการส่งตรวจ
                  </Button>
                </div>
              </div>
            )}
          </Card>
          </div>
        </div>

        {/* full-width: ประวัติการขอ Auth Code (ตารางยาว — แสดงเต็มความกว้าง) */}
        <Panel
          title="ประวัติการขอ Auth Code"
          desc="รายการขอใช้สิทธิและพิสูจน์ตัวตนภายในวัน"
          icon={FileText}
        >
            <div className="overflow-x-auto rounded-xl border border-ink-900/[0.07]">
              <table className="w-full text-left">
                <thead>
                  <tr className="bg-ink-900/[0.03] text-[11.5px] font-semibold text-ink-500">
                    <th className="w-10 px-3 py-2.5">#</th>
                    <th className="whitespace-nowrap px-3 py-2.5">Claim Date</th>
                    <th className="whitespace-nowrap px-3 py-2.5">Hospital</th>
                    <th className="whitespace-nowrap px-3 py-2.5">Claim Code</th>
                    <th className="whitespace-nowrap px-3 py-2.5">Service Code</th>
                    <th className="whitespace-nowrap px-3 py-2.5">
                      Service Name
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td
                      colSpan={6}
                      className="px-3 py-10 text-center text-[12.5px] text-ink-400"
                    >
                      ยังไม่มีประวัติการขอ Auth Code ในวันนี้
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </Panel>
          </div>
        </div>
        </div>
      )}
    </div>
  )
}

/* ───────────────── visit clock + time settings ─────────────────
   เวลานับจริงตามเครื่อง แก้เองไม่ได้ — กดที่เวลาเพื่อเปิด dropdown
   ตั้งค่า แล้วเปิด "ล็อกเวลา" เพื่อหยุดเวลาไว้ที่ปัจจุบัน */

function VisitClock() {
  const [open, setOpen] = useState(false)
  const [clock, setClock] = useState(() => new Date())
  const [lockedAt, setLockedAt] = useState<Date | null>(null)
  const ref = useRef<HTMLDivElement>(null)
  const locked = lockedAt !== null

  // tick every second unless the time is locked
  useEffect(() => {
    if (locked) return
    const id = window.setInterval(() => setClock(new Date()), 1000)
    return () => window.clearInterval(id)
  }, [locked])

  // close the settings dropdown on an outside click
  useEffect(() => {
    if (!open) return
    const onDown = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false)
    }
    document.addEventListener('mousedown', onDown)
    return () => document.removeEventListener('mousedown', onDown)
  }, [open])

  const shown = locked && lockedAt ? fmtClock(lockedAt) : fmtClock(clock)

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        className={cn(
          'flex h-11 items-center gap-2 rounded-full px-4 text-[13.5px] font-medium transition-colors duration-200',
          open ? 'bg-ink-900/[0.06]' : 'hover:bg-ink-900/[0.055]'
        )}
      >
        <Clock
          className={cn(
            'h-4 w-4 shrink-0 transition-colors duration-200',
            locked ? 'text-amber-500' : 'text-brand-500'
          )}
        />
        <span className="tabular-nums text-ink-700">{shown} น.</span>
        <ChevronDown
          className={cn(
            'h-4 w-4 shrink-0 text-ink-400 transition-transform duration-200',
            open && 'rotate-180'
          )}
        />
      </button>

      {open && (
        <div className="liquid-glass absolute right-0 top-[calc(100%+16px)] z-50 w-[256px] animate-pop-in overflow-hidden rounded-2xl border border-white/60 bg-white/65 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.95),inset_0_0_0_1px_rgba(255,255,255,0.16),0_24px_56px_-16px_rgba(18,26,78,0.55)]">
          <span
            aria-hidden
            className="pointer-events-none absolute inset-x-0 top-0 h-1/3 bg-gradient-to-b from-white/55 via-white/[0.12] to-transparent"
          />
          <span
            aria-hidden
            className="pointer-events-none absolute -left-8 -top-10 h-32 w-32 rounded-full bg-white/40 blur-2xl"
          />
          <div className="relative p-2.5">
            <div className="px-2 pb-1.5 pt-1 text-[11px] font-semibold uppercase tracking-wide text-ink-400">
              ตั้งค่าเวลา
            </div>
            <button
              type="button"
              onClick={() => setLockedAt((p) => (p ? null : new Date()))}
              className="flex w-full items-center gap-3 rounded-xl p-2 text-left transition-colors hover:bg-ink-900/[0.04]"
            >
              <span
                className={cn(
                  'flex h-9 w-9 shrink-0 items-center justify-center rounded-full transition-colors',
                  locked
                    ? 'bg-amber-500/15 text-amber-600'
                    : 'bg-brand-500/12 text-brand-600'
                )}
              >
                <Lock className="h-[18px] w-[18px]" />
              </span>
              <span className="min-w-0 flex-1">
                <span className="block text-[13px] font-semibold text-ink-900">
                  ล็อกเวลา
                </span>
                <span className="block text-[11px] leading-snug text-ink-500">
                  {locked
                    ? 'เวลาถูกหยุดไว้ — กดเพื่อนับต่อ'
                    : 'หยุดเวลาไว้ ไม่ให้นับต่อ'}
                </span>
              </span>
              {/* toggle switch */}
              <span
                className={cn(
                  'relative h-5 w-9 shrink-0 rounded-full transition-colors duration-200',
                  locked ? 'bg-amber-500' : 'bg-ink-900/15'
                )}
              >
                <span
                  className={cn(
                    'absolute top-0.5 h-4 w-4 rounded-full bg-white shadow-[0_1px_3px_rgba(0,0,0,0.3)] transition-all duration-200',
                    locked ? 'left-[18px]' : 'left-0.5'
                  )}
                />
              </span>
            </button>
          </div>
        </div>
      )}
    </div>
  )
}

/* ───────────────── empty state ───────────────── */

function EmptyState() {
  return (
    <Card className="flex flex-col items-center justify-center gap-3 py-16 text-center">
      <div className="flex h-16 w-16 items-center justify-center rounded-3xl bg-gradient-to-br from-brand-500/12 to-violet-500/12 text-brand-500">
        <UserSearch className="h-7 w-7" />
      </div>
      <h3 className="text-[15px] font-semibold text-ink-900">
        ยังไม่ได้เลือกผู้ป่วย
      </h3>
      <p className="max-w-sm text-[13px] leading-relaxed text-ink-500">
        ค้นหาด้วย HN หรือชื่อผู้ป่วยแล้วเลือกจากรายการ หรือกด “สแกนบัตรประชาชน”
        เพื่อเริ่มบันทึกการส่งตรวจ
      </p>
    </Card>
  )
}

/* ───────────────── patient info card (Figma 425:2574) ───────────────── */

function PatientInfoCard({ hn }: { hn: string }) {
  const patient = getPatient(hn)
  const profile = getPatientProfile(hn)
  if (!patient) return null
  const name = `${patient.prefix} ${patient.firstName} ${patient.lastName}`
  const allergyNames = (profile?.drugAllergies ?? [])
    .map((a) => a.data.drug)
    .filter(Boolean)

  return (
    <Card padding="none" className="flex flex-col gap-2.5 overflow-hidden">
      {/* ── header — avatar + name + HN on the photo-card background ── */}
      <div className="relative flex flex-col items-center justify-center gap-2 overflow-hidden p-4">
        <div
          aria-hidden
          className="pointer-events-none absolute inset-0"
          style={{ background: PHOTO_BG }}
        />
        <img
          src={`${import.meta.env.BASE_URL}photo-card-bg.jpg`}
          alt=""
          aria-hidden
          className="pointer-events-none absolute inset-0 h-full w-full scale-110 object-cover blur-[5px]"
        />
        <div
          aria-hidden
          className="pointer-events-none absolute inset-0 bg-gradient-to-b from-violet-600/10 via-transparent to-brand-700/25"
        />
        {/* avatar */}
        <div className="relative h-[120px] w-[120px] shrink-0 overflow-hidden rounded-full ring-[3px] ring-white shadow-[0_10px_24px_-8px_rgba(28,38,92,0.45)]">
          {patient.photo ? (
            <img
              src={patient.photo}
              alt={name}
              className="h-full w-full object-cover"
            />
          ) : (
            <div className="flex h-full w-full items-center justify-center bg-gradient-to-br from-brand-500 to-violet-500 text-white">
              <User className="h-12 w-12" strokeWidth={1.8} />
            </div>
          )}
        </div>
        {/* name */}
        <p className="relative text-center text-[16px] font-bold leading-snug text-white [text-shadow:0_1px_8px_rgba(6,10,34,0.5)]">
          {name}
        </p>
        {/* HN badge */}
        <div className="relative inline-flex items-center rounded-full bg-white/65 px-2.5 py-1.5 shadow-[0_4px_8px_rgba(0,0,0,0.12)] backdrop-blur-sm">
          <span className="text-[12px] font-medium text-ink-900">
            HN {patient.hn}
          </span>
        </div>
      </div>

      {/* ── detail rows ── */}
      <div className="flex flex-col gap-2 px-1.5">
        <InfoRow icon={IdCard} label="เลขบัตร" value={patient.cid || '—'} />
        <InfoRow
          icon={User}
          label="อายุ"
          value={calculateAge(patient.birthdate)}
        />
        <InfoRow
          icon={Droplet}
          label="หมู่เลือด"
          value={
            patient.bloodGroup
              ? `${patient.bloodGroup}${patient.rh ?? ''}`
              : '—'
          }
        />
        <InfoRow icon={Phone} label="โทรศัพท์" value={patient.phone || '—'} />
      </div>

      {/* divider */}
      <div className="mx-4 h-px bg-ink-900/[0.08]" />

      {/* ── แพ้ยา / ต้องระวัง ── */}
      <div className="flex flex-col gap-2 px-4 pb-4">
        <div className="flex items-center gap-1.5">
          <AlertTriangle className="h-4 w-4 text-rose-500" />
          <span className="text-[13px] text-[#314158]">แพ้ยา / ต้องระวัง</span>
        </div>
        {allergyNames.length > 0 ? (
          <div className="flex flex-wrap gap-2">
            {allergyNames.map((a) => (
              <span
                key={a}
                className="inline-flex items-center rounded-full bg-rose-500/10 px-2.5 py-1 text-[12.5px] font-medium text-rose-500"
              >
                {a}
              </span>
            ))}
          </div>
        ) : (
          <span className="inline-flex w-fit items-center rounded-full bg-emerald-500/10 px-2.5 py-1 text-[12.5px] font-medium text-emerald-600">
            ไม่พบประวัติแพ้ยา
          </span>
        )}
      </div>
    </Card>
  )
}

function InfoRow({
  icon: Icon,
  label,
  value,
}: {
  icon: LucideIcon
  label: string
  value: string
}) {
  return (
    <div className="flex items-center justify-between gap-2 rounded-full px-2.5 py-2">
      <div className="flex shrink-0 items-center gap-1.5">
        <Icon className="h-4 w-4 shrink-0 text-[#314158]" />
        <span className="text-[13px] text-[#314158]">{label}</span>
      </div>
      <span className="min-w-0 truncate text-right text-[13px] font-semibold text-ink-900">
        {value}
      </span>
    </div>
  )
}

/* ───────────────── checkbox ───────────────── */

function CheckRow({
  checked,
  onChange,
  label,
  icon: Icon,
}: {
  checked: boolean
  onChange: () => void
  label: string
  icon?: LucideIcon
}) {
  return (
    <button
      type="button"
      role="checkbox"
      aria-checked={checked}
      onClick={onChange}
      className="group inline-flex items-center gap-2 text-left transition-transform active:scale-[0.97]"
    >
      <span
        className={cn(
          'flex h-[18px] w-[18px] shrink-0 items-center justify-center rounded-[6px] border transition-all duration-200',
          checked
            ? 'border-transparent bg-gradient-to-br from-brand-500 to-violet-500 text-white shadow-[0_3px_8px_-3px_rgba(58,100,255,0.6)]'
            : 'border-ink-900/20 bg-white/70 group-hover:border-brand-400/70'
        )}
      >
        {checked && <Check className="h-2.5 w-2.5" strokeWidth={4} />}
      </span>
      <span className="inline-flex items-center gap-1 text-[13px] font-medium text-ink-600">
        {Icon && <Icon className="h-3.5 w-3.5 text-ink-400" />}
        {label}
      </span>
    </button>
  )
}

/* ───────────────── success ───────────────── */

function VisitSuccess({
  onNew,
  onQueue,
}: {
  onNew: () => void
  onQueue: () => void
}) {
  return (
    <div className="flex min-h-[60vh] items-center justify-center">
      <Card className="max-w-md text-center" padding="lg">
        <div className="mx-auto flex h-20 w-20 items-center justify-center rounded-3xl bg-gradient-to-br from-emerald-500 to-teal-500 text-white shadow-glow">
          <Check className="h-10 w-10" />
        </div>
        <h2 className="mt-5 text-xl font-semibold text-ink-900">
          บันทึกการส่งตรวจสำเร็จ
        </h2>
        <p className="mt-1.5 text-sm text-ink-500">
          ระบบออกคิวให้ผู้ป่วยเรียบร้อยแล้ว — หมายเลขคิว{' '}
          <span className="font-semibold text-brand-600">A-032</span>
        </p>
        <div className="mt-6 flex justify-center gap-2">
          <Button
            variant="secondary"
            leftIcon={<Printer className="h-4 w-4" />}
          >
            พิมพ์ใบนำทาง
          </Button>
          <Button
            variant="secondary"
            leftIcon={<ClipboardList className="h-4 w-4" />}
            onClick={onQueue}
          >
            ดูคิวการตรวจ
          </Button>
          <Button variant="primary" onClick={onNew}>
            ส่งตรวจรายถัดไป
          </Button>
        </div>
      </Card>
    </div>
  )
}
