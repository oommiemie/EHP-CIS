/**
 * ทะเบียนผู้มารับบริการ
 * อ้างอิงโครงสร้างข้อมูลจาก PatientVisitListFrameUnit.dfm
 *  - ส่วนหัว/Toolbar : UniPanel1  (ส่งตรวจ · ค้นหา HN · Refresh · Excel · Task)
 *  - ตัวกรอง         : UniPanel2  (ช่วงวันที่ · แผนก · แพทย์ · สาขา · ห้อง · ย้อนหลัง)
 *  - ตาราง           : UniDBGrid1 (44 คอลัมน์ จาก VisitListCDS)
 */
import { useEffect, useMemo, useRef, useState, type ReactNode } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  Search,
  X,
  UserSearch,
  Stethoscope,
  RefreshCw,
  FileSpreadsheet,
  ChevronLeft,
  ChevronRight,
  ChevronDown,
  Columns3,
  ShieldCheck,
  History,
  Building2,
} from 'lucide-react'
import { Avatar } from '@/components/ui/Avatar'
import { useToast } from '@/components/ui/Toast'
import {
  visitRegistry,
  hospitalName,
  type VisitRegistryRow,
} from '@/data/visitRegistry'
import { cn, formatThaiDate } from '@/lib/utils'

/* eased fade — blends the hero image bottom into the panel */
const HERO_FADE =
  'linear-gradient(to bottom, #000 0%, #000 48%, rgba(0,0,0,0.985) 55%, rgba(0,0,0,0.95) 62%, rgba(0,0,0,0.88) 68%, rgba(0,0,0,0.76) 74%, rgba(0,0,0,0.6) 80%, rgba(0,0,0,0.42) 86%, rgba(0,0,0,0.24) 91%, rgba(0,0,0,0.1) 96%, rgba(0,0,0,0) 100%)'

/* ── สถานะภาพ (ost_name) — ใช้สรุปคิวบนแบนเนอร์ ── */
const OST = {
  รอตรวจ: { dot: 'bg-amber-500', chip: 'bg-amber-500/12 text-amber-700' },
  กำลังตรวจ: { dot: 'bg-brand-500', chip: 'bg-brand-500/12 text-brand-700' },
  ตรวจเสร็จ: { dot: 'bg-emerald-500', chip: 'bg-emerald-500/12 text-emerald-700' },
} as const
type OstKey = keyof typeof OST

/* ── ความเร่งด่วน (pt_priority_name) ── */
function priorityChip(v: string): string {
  if (v === 'ฉุกเฉินวิกฤติ') return 'bg-rose-500/14 text-rose-700'
  if (v === 'ฉุกเฉิน') return 'bg-orange-500/14 text-orange-700'
  if (v === 'เร่งด่วน') return 'bg-amber-500/14 text-amber-700'
  return 'bg-ink-900/[0.06] text-ink-600'
}

/* ── การตรวจสอบสิทธิ (pttype_check_status_name) ── */
function checkChip(v: string): string {
  if (v === 'ตรวจสอบผ่าน') return 'bg-emerald-500/12 text-emerald-700'
  if (v === 'รอตรวจสอบ') return 'bg-amber-500/12 text-amber-700'
  if (v === 'สิทธิไม่ตรง') return 'bg-rose-500/12 text-rose-700'
  return 'bg-ink-900/[0.06] text-ink-500'
}

function Pill({ text, className }: { text: string; className: string }) {
  return (
    <span
      className={cn(
        'inline-flex items-center rounded-full px-2 py-0.5 text-[11.5px] font-semibold',
        className
      )}
    >
      {text}
    </span>
  )
}

/* ── นิยามคอลัมน์ — เรียงตาม UniDBGrid1.Columns ใน DFM ── */
interface Column {
  key: string
  label: string
  width: number
  align?: 'center' | 'right'
  group: string
  render: (r: VisitRegistryRow, index: number) => ReactNode
}

const dash = (v: string) => (v && v !== '' ? v : '-')
const money = (n: number) => (n > 0 ? n.toLocaleString('th-TH') : '-')

const COLUMNS: Column[] = [
  // ── ผู้รับบริการ ──
  { key: 'rowNo', label: 'ลำดับ', width: 56, align: 'center', group: 'ผู้รับบริการ', render: (_r, i) => i + 1 },
  { key: 'hospitalDepartmentName', label: 'สาขาที่ส่งตรวจ', width: 158, group: 'ผู้รับบริการ', render: (r) => r.hospitalDepartmentName },
  { key: 'vstdate', label: 'วันที่', width: 104, align: 'center', group: 'ผู้รับบริการ', render: (r) => formatThaiDate(r.vstdate) },
  { key: 'vsttime', label: 'เวลา', width: 64, align: 'center', group: 'ผู้รับบริการ', render: (r) => <span className="tabular-nums">{r.vsttime}</span> },
  {
    key: 'oqueue', label: 'Queue', width: 78, align: 'center', group: 'ผู้รับบริการ',
    render: (r) => (
      <span className="inline-flex items-center rounded-md bg-gradient-to-br from-brand-500 to-violet-500 px-2 py-0.5 text-[11.5px] font-bold text-white">
        {r.oqueue}
      </span>
    ),
  },
  { key: 'cid', label: 'CID', width: 138, align: 'center', group: 'ผู้รับบริการ', render: (r) => <span className="tabular-nums">{r.cid}</span> },
  { key: 'hn', label: 'HN', width: 104, align: 'center', group: 'ผู้รับบริการ', render: (r) => <span className="font-semibold tabular-nums text-brand-600">{r.hn}</span> },
  {
    key: 'ptname', label: 'ชื่อผู้รับบริการ', width: 232, group: 'ผู้รับบริการ',
    render: (r) => (
      <div className="flex items-center gap-2">
        <Avatar name={r.ptname} src={r.photo} size="sm" />
        <span className="whitespace-nowrap font-medium text-ink-900">{r.ptname}</span>
      </div>
    ),
  },
  { key: 'ageY', label: 'อายุ (ปี)', width: 66, align: 'center', group: 'ผู้รับบริการ', render: (r) => r.ageY },
  { key: 'ageM', label: 'อายุ (เดือน)', width: 80, align: 'center', group: 'ผู้รับบริการ', render: (r) => r.ageM },
  { key: 'ageD', label: 'อายุ (วัน)', width: 70, align: 'center', group: 'ผู้รับบริการ', render: (r) => r.ageD },

  // ── การมารับบริการ ──
  { key: 'visitTypeName', label: 'เวลาทำการ', width: 120, group: 'การมารับบริการ', render: (r) => r.visitTypeName },
  { key: 'ovstistName', label: 'ประเภทการมา', width: 116, group: 'การมารับบริการ', render: (r) => r.ovstistName },
  { key: 'ptPriorityName', label: 'ความเร่งด่วน', width: 124, group: 'การมารับบริการ', render: (r) => <Pill text={r.ptPriorityName} className={priorityChip(r.ptPriorityName)} /> },
  { key: 'ptWalkName', label: 'ประเภท', width: 100, group: 'การมารับบริการ', render: (r) => r.ptWalkName },
  { key: 'ptSubtypeName', label: 'ประเภทคนไข้', width: 116, group: 'การมารับบริการ', render: (r) => r.ptSubtypeName },
  {
    key: 'ostName', label: 'สถานะภาพ', width: 110, group: 'การมารับบริการ',
    render: (r) => {
      const o = OST[r.ostName as OstKey]
      return o ? <Pill text={r.ostName} className={o.chip} /> : r.ostName
    },
  },
  { key: 'cc', label: 'อาการสำคัญ', width: 220, group: 'การมารับบริการ', render: (r) => <span className="line-clamp-1">{r.cc}</span> },
  { key: 'doctorListText', label: 'แพทย์ผู้ตรวจ', width: 160, group: 'การมารับบริการ', render: (r) => r.doctorListText },
  { key: 'countInDay', label: 'มาครั้งที่ (ในวัน)', width: 110, align: 'center', group: 'การมารับบริการ', render: (r) => r.countInDay },
  { key: 'countInMonth', label: 'มาครั้งที่ (ในเดือน)', width: 118, align: 'center', group: 'การมารับบริการ', render: (r) => r.countInMonth },
  { key: 'countInYear', label: 'มาครั้งที่ (ในปี)', width: 106, align: 'center', group: 'การมารับบริการ', render: (r) => r.countInYear },

  // ── สิทธิการรักษา ──
  { key: 'pttypeCheckStatusName', label: 'การตรวจสอบสิทธิ', width: 138, group: 'สิทธิการรักษา', render: (r) => <Pill text={r.pttypeCheckStatusName} className={checkChip(r.pttypeCheckStatusName)} /> },
  { key: 'pttypeName', label: 'สิทธิการรักษา', width: 230, group: 'สิทธิการรักษา', render: (r) => r.pttypeName },
  { key: 'pttypeno', label: 'เลขที่สิทธิ', width: 138, group: 'สิทธิการรักษา', render: (r) => <span className="tabular-nums">{r.pttypeno}</span> },
  { key: 'authCode', label: 'Auth code (สปสช.)', width: 144, group: 'สิทธิการรักษา', render: (r) => <span className="tabular-nums">{dash(r.authCode)}</span> },
  { key: 'nhsoFeeScheduleListText', label: 'NHSO Fee Schedule', width: 200, group: 'สิทธิการรักษา', render: (r) => dash(r.nhsoFeeScheduleListText) },

  // ── การวินิจฉัย ──
  { key: 'pdx', label: 'Primary Dx.', width: 96, group: 'การวินิจฉัย', render: (r) => <span className="font-semibold text-ink-800">{r.pdx}</span> },
  { key: 'pdxName', label: 'ผลการวินิจฉัย', width: 216, group: 'การวินิจฉัย', render: (r) => <span className="line-clamp-1">{r.pdxName}</span> },
  { key: 'dxTextList', label: 'Diag Text', width: 200, group: 'การวินิจฉัย', render: (r) => <span className="line-clamp-1">{r.dxTextList}</span> },

  // ── แผนก / จุดบริการ ──
  { key: 'registerDepartmentName', label: 'ส่งตรวจที่ห้อง', width: 168, group: 'แผนก / จุดบริการ', render: (r) => r.registerDepartmentName },
  { key: 'spcltyName', label: 'แผนก', width: 138, group: 'แผนก / จุดบริการ', render: (r) => r.spcltyName },
  { key: 'subSpcltyName', label: 'สาขา', width: 138, group: 'แผนก / จุดบริการ', render: (r) => r.subSpcltyName },
  { key: 'departmentName', label: 'จุดรับบริการปัจจุบัน', width: 172, group: 'แผนก / จุดบริการ', render: (r) => r.departmentName },
  { key: 'mainDepartmentName', label: 'จุดรับบริการแรก', width: 144, group: 'แผนก / จุดบริการ', render: (r) => r.mainDepartmentName },
  { key: 'staffName', label: 'เจ้าหน้าที่ส่งตรวจ', width: 160, group: 'แผนก / จุดบริการ', render: (r) => r.staffName },
  { key: 'an', label: 'AN (Admit)', width: 104, group: 'แผนก / จุดบริการ', render: (r) => <span className="tabular-nums">{dash(r.an)}</span> },

  // ── สัญญาณชีพ ──
  { key: 'bps', label: 'BPs', width: 60, align: 'center', group: 'สัญญาณชีพ', render: (r) => r.bps },
  { key: 'bpd', label: 'BPd', width: 60, align: 'center', group: 'สัญญาณชีพ', render: (r) => r.bpd },
  { key: 'temperature', label: 'อุณหภูมิ', width: 78, align: 'center', group: 'สัญญาณชีพ', render: (r) => r.temperature.toFixed(1) },
  { key: 'bw', label: 'น้ำหนัก', width: 78, align: 'center', group: 'สัญญาณชีพ', render: (r) => r.bw },

  // ── การเงิน ──
  { key: 'income', label: 'ค่าใช้จ่ายทั้งหมด', width: 122, align: 'right', group: 'การเงิน', render: (r) => <span className="tabular-nums">{money(r.income)}</span> },
  { key: 'paidMoney', label: 'ต้องชำระเงิน', width: 110, align: 'right', group: 'การเงิน', render: (r) => <span className="tabular-nums">{money(r.paidMoney)}</span> },
  { key: 'rcptMoney', label: 'ออกใบเสร็จรับเงิน', width: 128, align: 'right', group: 'การเงิน', render: (r) => <span className="tabular-nums">{money(r.rcptMoney)}</span> },
]

const COLUMN_GROUPS = [
  'ผู้รับบริการ',
  'การมารับบริการ',
  'สิทธิการรักษา',
  'การวินิจฉัย',
  'แผนก / จุดบริการ',
  'สัญญาณชีพ',
  'การเงิน',
]

function addDays(iso: string, days: number): string {
  const d = new Date(iso)
  d.setDate(d.getDate() + days)
  return d.toISOString().slice(0, 10)
}

function uniqueSorted(values: string[]): string[] {
  return [...new Set(values.filter(Boolean))].sort((a, b) =>
    a.localeCompare(b, 'th')
  )
}

export default function VisitList() {
  const navigate = useNavigate()
  const toast = useToast()

  /* ค่าตั้งต้นช่วงวันที่ = วันล่าสุดในทะเบียน (DFM ตั้งต้นเป็นวันนี้) */
  const latestDate = useMemo(
    () => visitRegistry.reduce((m, r) => (r.vstdate > m ? r.vstdate : m), visitRegistry[0].vstdate),
    []
  )

  // ── UniPanel2 — ตัวกรอง ──
  const [dateFrom, setDateFrom] = useState(latestDate)
  const [dateTo, setDateTo] = useState(latestDate)
  const [spclty, setSpclty] = useState('') // แผนก
  const [doctor, setDoctor] = useState('') // แพทย์
  const [subSpclty, setSubSpclty] = useState('') // สาขา
  const [room, setRoom] = useState('') // ห้อง (register_department)
  const [showLastHour, setShowLastHour] = useState(true) // แสดงข้อมูลย้อนหลัง
  const [hours, setHours] = useState(3) // ชั่วโมง
  const [query, setQuery] = useState('') // HNSearchEdit

  // ── ตัวเลือกคอลัมน์ (column picker) ──
  const [hidden, setHidden] = useState<Set<string>>(new Set())
  const [colMenuOpen, setColMenuOpen] = useState(false)
  const [taskOpen, setTaskOpen] = useState(false)
  const colMenuRef = useRef<HTMLDivElement>(null)
  const taskRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    function onDown(e: MouseEvent) {
      if (colMenuRef.current && !colMenuRef.current.contains(e.target as Node))
        setColMenuOpen(false)
      if (taskRef.current && !taskRef.current.contains(e.target as Node))
        setTaskOpen(false)
    }
    window.addEventListener('mousedown', onDown)
    return () => window.removeEventListener('mousedown', onDown)
  }, [])

  /* ตัวเลือก dropdown — ดึงจากข้อมูลจริง */
  const spcltyOptions = useMemo(() => uniqueSorted(visitRegistry.map((r) => r.spcltyName)), [])
  const doctorOptions = useMemo(() => uniqueSorted(visitRegistry.map((r) => r.doctorListText)), [])
  const subSpcltyOptions = useMemo(() => uniqueSorted(visitRegistry.map((r) => r.subSpcltyName)), [])
  const roomOptions = useMemo(() => uniqueSorted(visitRegistry.map((r) => r.registerDepartmentName)), [])

  /* สรุปสถานะภาพ (ทั้งทะเบียน) */
  const ostCounts = useMemo(() => {
    const c: Record<OstKey, number> = { รอตรวจ: 0, กำลังตรวจ: 0, ตรวจเสร็จ: 0 }
    visitRegistry.forEach((r) => {
      if (r.ostName in c) c[r.ostName as OstKey] += 1
    })
    return c
  }, [])

  /* แถวที่ผ่านตัวกรอง */
  const rows = useMemo(() => {
    const q = query.trim().toLowerCase()
    return visitRegistry.filter((r) => {
      if (r.vstdate < dateFrom || r.vstdate > dateTo) return false
      if (spclty && r.spcltyName !== spclty) return false
      if (doctor && r.doctorListText !== doctor) return false
      if (subSpclty && r.subSpcltyName !== subSpclty) return false
      if (room && r.registerDepartmentName !== room) return false
      if (!q) return true
      return (
        r.hn.toLowerCase().includes(q) ||
        r.cid.includes(q) ||
        r.ptname.toLowerCase().includes(q) ||
        r.oqueue.toLowerCase().includes(q)
      )
    })
  }, [dateFrom, dateTo, spclty, doctor, subSpclty, room, query])

  const visibleColumns = COLUMNS.filter((c) => !hidden.has(c.key))

  function toggleColumn(key: string) {
    setHidden((prev) => {
      const next = new Set(prev)
      if (next.has(key)) next.delete(key)
      else next.add(key)
      return next
    })
  }

  function toggleGroup(group: string, show: boolean) {
    setHidden((prev) => {
      const next = new Set(prev)
      COLUMNS.filter((c) => c.group === group).forEach((c) => {
        if (show) next.delete(c.key)
        else next.add(c.key)
      })
      return next
    })
  }

  function resetFilters() {
    setDateFrom(latestDate)
    setDateTo(latestDate)
    setSpclty('')
    setDoctor('')
    setSubSpclty('')
    setRoom('')
    setQuery('')
    toast.success('รีเฟรชข้อมูล', 'โหลดทะเบียนผู้มารับบริการใหม่แล้ว')
  }

  return (
    <div className="flex flex-col gap-4">
      {/* ── แบนเนอร์ (UniPanel1) ── */}
      <div className="shrink-0">
        <section className="relative -mx-4 -mt-4 overflow-hidden rounded-t-[32px] px-7 pb-6 pt-7 sm:px-9 lg:h-[216px]">
          <div
            className="pointer-events-none absolute inset-0"
            style={{ maskImage: HERO_FADE, WebkitMaskImage: HERO_FADE }}
          >
            <img
              src={`${import.meta.env.BASE_URL}section-bg1.png`}
              alt=""
              aria-hidden="true"
              className="absolute inset-0 h-full w-full scale-[1.06] object-cover blur-[2px]"
              style={{ objectPosition: '50% 42%' }}
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

          <div className="relative flex h-full flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
            <div className="flex flex-col gap-3">
              <p className="text-[12px] font-medium uppercase tracking-wide text-white/65 [text-shadow:0_1px_6px_rgba(6,10,34,0.6)]">
                OPD Registry
              </p>
              <h1 className="text-[21px] font-bold leading-tight tracking-tight text-white [text-shadow:0_2px_12px_rgba(6,10,34,0.6)] sm:text-[24px] xl:text-[28px]">
                รายชื่อผู้ป่วยที่มารับบริการในแผนก OPD
              </h1>
              <p className="flex items-center gap-1.5 text-[13px] font-medium text-white/85 [text-shadow:0_1px_8px_rgba(6,10,34,0.6)]">
                <Building2 className="h-3.5 w-3.5" />
                {hospitalName}
              </p>
            </div>

            {/* สรุปสถานะภาพ + ปุ่มส่งตรวจ */}
            <div className="flex shrink-0 flex-col items-start gap-2.5 lg:items-end">
              <div className="flex flex-wrap items-center gap-2.5">
                {(Object.keys(OST) as OstKey[]).map((s) => (
                  <div
                    key={s}
                    className="liquid-glass-button flex h-11 items-center gap-2.5 rounded-full border border-white/45 bg-white/25 px-4 shadow-[0_10px_28px_-10px_rgba(6,10,34,0.5),inset_0_1px_0_0_rgba(255,255,255,0.6)]"
                  >
                    <span className={cn('h-2 w-2 rounded-full', OST[s].dot)} />
                    <span className="text-[13px] font-medium text-white/85">{s}</span>
                    <span className="text-[15px] font-bold tabular-nums text-white">
                      {ostCounts[s]}
                    </span>
                  </div>
                ))}
              </div>
              <button
                type="button"
                onClick={() => navigate('/visit')}
                className="group relative inline-flex h-11 items-center gap-2 overflow-hidden rounded-full border border-white/35 bg-gradient-to-br from-brand-600/95 to-violet-600/95 px-5 text-[14px] font-semibold text-white shadow-[0_12px_30px_-8px_rgba(58,100,255,0.6),inset_0_1px_0_0_rgba(255,255,255,0.5)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:from-brand-500 hover:to-violet-500 active:scale-[0.97] focus-visible:ring-2 focus-visible:ring-white/80"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/30 to-white/0" />
                <Stethoscope className="relative h-[17px] w-[17px]" />
                <span className="relative">ส่งตรวจผู้ป่วย</span>
              </button>
            </div>
          </div>
        </section>

        {/* ── ตัวกรอง (UniPanel2) — การ์ดแก้วซ้อนแบนเนอร์ ── */}
        <div className="relative z-10 mt-4 px-1 pt-3 lg:-mt-[60px] xl:px-0">
          <div className="rounded-[24px] bg-white p-3.5 shadow-[0_20px_44px_-18px_rgba(28,38,92,0.45)] ring-1 ring-ink-900/[0.06]">
            <div className="flex flex-wrap items-end gap-x-5 gap-y-3">
              {/* ช่วงวันที่ */}
              <Field label="ช่วงวันที่">
                <div className="flex items-center gap-1.5">
                  <StepButton
                    aria-label="ย้อนหลัง 1 วัน"
                    onClick={() => {
                      setDateFrom((d) => addDays(d, -1))
                      setDateTo((d) => addDays(d, -1))
                    }}
                  >
                    <ChevronLeft className="h-4 w-4" />
                  </StepButton>
                  <DateInput value={dateFrom} onChange={setDateFrom} />
                  <span className="text-[12px] text-ink-400">ถึง</span>
                  <DateInput value={dateTo} onChange={setDateTo} />
                  <StepButton
                    aria-label="ถัดไป 1 วัน"
                    onClick={() => {
                      setDateFrom((d) => addDays(d, 1))
                      setDateTo((d) => addDays(d, 1))
                    }}
                  >
                    <ChevronRight className="h-4 w-4" />
                  </StepButton>
                </div>
              </Field>

              {/* แผนก */}
              <Field label="แผนก">
                <SelectInput value={spclty} onChange={setSpclty} placeholder="ทุกแผนก" options={spcltyOptions} />
              </Field>

              {/* แพทย์ */}
              <Field label="แพทย์">
                <SelectInput value={doctor} onChange={setDoctor} placeholder="ทุกท่าน" options={doctorOptions} wide />
              </Field>

              {/* สาขา */}
              <Field label="สาขา">
                <SelectInput value={subSpclty} onChange={setSubSpclty} placeholder="ทุกสาขา" options={subSpcltyOptions} />
              </Field>

              {/* ห้อง */}
              <Field label="ห้อง">
                <SelectInput value={room} onChange={setRoom} placeholder="ทุกห้อง" options={roomOptions} />
              </Field>

              {/* แสดงข้อมูลย้อนหลัง N ชั่วโมง */}
              <Field label="แสดงข้อมูลย้อนหลัง">
                <div className="flex items-center gap-2">
                  <button
                    type="button"
                    role="switch"
                    aria-checked={showLastHour}
                    onClick={() => setShowLastHour((v) => !v)}
                    className={cn(
                      'relative h-6 w-11 shrink-0 rounded-full transition-colors duration-200',
                      showLastHour
                        ? 'bg-gradient-to-r from-brand-500 to-violet-500'
                        : 'bg-ink-900/15'
                    )}
                  >
                    <span
                      className={cn(
                        'absolute top-0.5 h-5 w-5 rounded-full bg-white shadow transition-transform duration-200',
                        showLastHour ? 'translate-x-[22px]' : 'translate-x-0.5'
                      )}
                    />
                  </button>
                  <input
                    type="number"
                    min={1}
                    max={24}
                    value={hours}
                    disabled={!showLastHour}
                    onChange={(e) => setHours(Math.max(1, Math.min(24, Number(e.target.value) || 1)))}
                    className="h-9 w-14 rounded-xl bg-ink-900/[0.04] text-center text-[13px] font-semibold text-ink-800 outline-none ring-1 ring-inset ring-ink-900/[0.08] focus:ring-2 focus:ring-brand-500/45 disabled:opacity-40"
                  />
                  <span className="text-[12.5px] text-ink-500">ชั่วโมง</span>
                </div>
              </Field>
            </div>

            {/* แถวค้นหา HN + เครื่องมือ */}
            <div className="mt-3 flex flex-col gap-2 border-t border-ink-900/[0.07] pt-3 lg:flex-row lg:items-center">
              {/* HNSearchEdit + HNSearchButton */}
              <div className="group flex h-10 min-w-0 flex-1 items-center gap-2 rounded-full bg-ink-900/[0.04] px-1.5 ring-1 ring-inset ring-ink-900/[0.06] transition-colors focus-within:bg-white focus-within:ring-brand-500/40">
                <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-brand-500/14 to-violet-500/14 text-brand-600 group-focus-within:from-brand-500 group-focus-within:to-violet-500 group-focus-within:text-white">
                  <Search className="h-[15px] w-[15px]" />
                </span>
                <input
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="ค้นหา — HN, ชื่อ-สกุล, เลขบัตรประชาชน, หมายเลขคิว…"
                  className="min-w-0 flex-1 bg-transparent text-[13.5px] text-ink-900 placeholder-ink-400 outline-none"
                />
                {query && (
                  <button
                    type="button"
                    onClick={() => setQuery('')}
                    aria-label="ล้าง"
                    className="mr-1 flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-ink-400 transition hover:bg-ink-900/[0.06] hover:text-ink-700"
                  >
                    <X className="h-3.5 w-3.5" />
                  </button>
                )}
              </div>

              {/* Refresh */}
              <ToolButton onClick={resetFilters} icon={RefreshCw} label="Refresh" />

              {/* Excel */}
              <ToolButton
                onClick={() => toast.success('ส่งออก Excel', `เตรียมไฟล์ ${rows.length} รายการเรียบร้อย`)}
                icon={FileSpreadsheet}
                label="Excel"
              />

              {/* Task menu — ตรวจสอบรหัส Auth Code */}
              <div className="relative" ref={taskRef}>
                <button
                  type="button"
                  onClick={() => setTaskOpen((o) => !o)}
                  className="flex h-10 items-center gap-1.5 rounded-full bg-ink-900/[0.05] px-3.5 text-[13px] font-semibold text-ink-700 ring-1 ring-inset ring-ink-900/[0.06] transition hover:bg-ink-900/10"
                >
                  <ShieldCheck className="h-4 w-4 text-brand-600" />
                  Task
                  <ChevronDown className={cn('h-3.5 w-3.5 text-ink-400 transition-transform', taskOpen && 'rotate-180')} />
                </button>
                {taskOpen && (
                  <div className="liquid-glass absolute right-0 top-[calc(100%+8px)] z-30 w-[232px] overflow-hidden rounded-2xl border border-white/60 bg-white/85 p-1.5 shadow-[0_24px_56px_-16px_rgba(18,26,78,0.55)]">
                    <button
                      type="button"
                      onClick={() => {
                        setTaskOpen(false)
                        toast.success('ตรวจสอบรหัส Auth Code', `ส่งตรวจสอบ ${rows.length} รายการกับ สปสช.`)
                      }}
                      className="flex w-full items-center gap-2 rounded-xl px-2.5 py-2 text-left text-[13px] font-medium text-ink-700 transition hover:bg-brand-500/[0.08]"
                    >
                      <ShieldCheck className="h-4 w-4 text-brand-600" />
                      ตรวจสอบรหัส Auth Code
                    </button>
                  </div>
                )}
              </div>

              {/* Column picker */}
              <div className="relative" ref={colMenuRef}>
                <button
                  type="button"
                  onClick={() => setColMenuOpen((o) => !o)}
                  className="flex h-10 items-center gap-1.5 rounded-full bg-ink-900/[0.05] px-3.5 text-[13px] font-semibold text-ink-700 ring-1 ring-inset ring-ink-900/[0.06] transition hover:bg-ink-900/10"
                >
                  <Columns3 className="h-4 w-4 text-brand-600" />
                  คอลัมน์
                  <span className="rounded-full bg-ink-900/[0.06] px-1.5 text-[11px] font-bold tabular-nums text-ink-500">
                    {visibleColumns.length}/{COLUMNS.length}
                  </span>
                </button>
                {colMenuOpen && (
                  <div className="liquid-glass absolute right-0 top-[calc(100%+8px)] z-30 max-h-[420px] w-[280px] overflow-y-auto rounded-2xl border border-white/60 bg-white/90 p-2 shadow-[0_24px_56px_-16px_rgba(18,26,78,0.55)]">
                    {COLUMN_GROUPS.map((group) => {
                      const cols = COLUMNS.filter((c) => c.group === group)
                      const allShown = cols.every((c) => !hidden.has(c.key))
                      return (
                        <div key={group} className="mb-1.5 last:mb-0">
                          <button
                            type="button"
                            onClick={() => toggleGroup(group, !allShown)}
                            className="flex w-full items-center justify-between rounded-lg px-2 py-1.5 text-left text-[11px] font-bold uppercase tracking-wide text-ink-400 transition hover:bg-ink-900/[0.04]"
                          >
                            {group}
                            <span className="text-[10.5px] font-semibold text-brand-600">
                              {allShown ? 'ซ่อนทั้งหมด' : 'แสดงทั้งหมด'}
                            </span>
                          </button>
                          {cols.map((c) => {
                            const shown = !hidden.has(c.key)
                            return (
                              <label
                                key={c.key}
                                className="flex cursor-pointer items-center gap-2 rounded-lg px-2 py-1.5 text-[12.5px] text-ink-700 transition hover:bg-brand-500/[0.07]"
                              >
                                <input
                                  type="checkbox"
                                  checked={shown}
                                  onChange={() => toggleColumn(c.key)}
                                  className="h-3.5 w-3.5 shrink-0 accent-brand-600"
                                />
                                {c.label}
                              </label>
                            )
                          })}
                        </div>
                      )
                    })}
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* ── จำนวนผลลัพธ์ ── */}
      <div className="flex items-center justify-between px-1 text-[13px] text-ink-500">
        <span>
          แสดง <span className="font-semibold text-ink-800">{rows.length}</span> จาก{' '}
          {visitRegistry.length} รายการในทะเบียน
        </span>
        {showLastHour && (
          <span className="inline-flex items-center gap-1.5 text-[12px] text-ink-400">
            <History className="h-3.5 w-3.5" />
            แสดงข้อมูลย้อนหลัง {hours} ชั่วโมง
          </span>
        )}
      </div>

      {/* ── ตาราง (UniDBGrid1) ── */}
      <div className="overflow-hidden rounded-[20px] bg-white shadow-[0_6px_16px_-10px_rgba(28,38,92,0.25)] ring-1 ring-ink-900/[0.05]">
        {rows.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-16 text-center">
            <div className="flex h-16 w-16 items-center justify-center rounded-3xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15">
              <UserSearch className="h-7 w-7 text-brand-500" />
            </div>
            <h3 className="mt-4 text-lg font-semibold text-ink-900">ไม่พบรายการที่ค้นหา</h3>
            <p className="mt-1 max-w-sm text-sm text-ink-500">
              ลองปรับช่วงวันที่ ตัวกรอง หรือคำค้นหา
            </p>
          </div>
        ) : (
          <div className="max-h-[600px] overflow-auto">
            <table className="border-collapse text-left text-[12.5px] text-ink-700">
              <thead>
                <tr className="bg-ink-900/[0.03]">
                  {visibleColumns.map((c) => {
                    const sticky = c.key === 'rowNo'
                    return (
                      <th
                        key={c.key}
                        style={{ minWidth: c.width, width: c.width }}
                        className={cn(
                          'whitespace-nowrap border-b border-ink-900/[0.08] px-3 py-2.5 text-[11px] font-bold uppercase tracking-wide text-ink-500',
                          c.align === 'center' && 'text-center',
                          c.align === 'right' && 'text-right',
                          'sticky top-0',
                          sticky ? 'left-0 z-30 bg-[#f1f1f4]' : 'z-20 bg-[#f1f1f4]'
                        )}
                      >
                        {c.label}
                      </th>
                    )
                  })}
                </tr>
              </thead>
              <tbody>
                {rows.map((r, i) => (
                  <tr
                    key={r.vn}
                    onClick={() => navigate(`/patient/${r.hn}`)}
                    className="group cursor-pointer border-b border-ink-900/[0.05] last:border-0 hover:bg-brand-500/[0.05]"
                  >
                    {visibleColumns.map((c) => {
                      const sticky = c.key === 'rowNo'
                      return (
                        <td
                          key={c.key}
                          style={{ minWidth: c.width, width: c.width }}
                          className={cn(
                            'whitespace-nowrap px-3 py-2',
                            c.align === 'center' && 'text-center',
                            c.align === 'right' && 'text-right tabular-nums',
                            sticky &&
                              'sticky left-0 z-10 bg-white text-ink-400 group-hover:bg-[#f4f6ff]'
                          )}
                        >
                          {c.render(r, i)}
                        </td>
                      )
                    })}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}

/* ───────────────── ส่วนประกอบย่อย ───────────────── */

function Field({ label, children }: { label: string; children: ReactNode }) {
  return (
    <div className="flex flex-col gap-1">
      <span className="text-[11px] font-semibold uppercase tracking-wide text-ink-400">
        {label}
      </span>
      {children}
    </div>
  )
}

function DateInput({
  value,
  onChange,
}: {
  value: string
  onChange: (v: string) => void
}) {
  return (
    <input
      type="date"
      value={value}
      onChange={(e) => onChange(e.target.value)}
      className="h-9 rounded-xl bg-ink-900/[0.04] px-2.5 text-[13px] font-medium text-ink-800 outline-none ring-1 ring-inset ring-ink-900/[0.08] transition focus:bg-white focus:ring-2 focus:ring-brand-500/45"
    />
  )
}

function SelectInput({
  value,
  onChange,
  placeholder,
  options,
  wide,
}: {
  value: string
  onChange: (v: string) => void
  placeholder: string
  options: string[]
  wide?: boolean
}) {
  return (
    <div className="relative">
      <select
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className={cn(
          'h-9 appearance-none rounded-xl bg-ink-900/[0.04] pl-2.5 pr-8 text-[13px] font-medium text-ink-800 outline-none ring-1 ring-inset ring-ink-900/[0.08] transition focus:bg-white focus:ring-2 focus:ring-brand-500/45',
          wide ? 'w-[224px]' : 'w-[176px]'
        )}
      >
        <option value="">{placeholder}</option>
        {options.map((o) => (
          <option key={o} value={o}>
            {o}
          </option>
        ))}
      </select>
      <ChevronDown className="pointer-events-none absolute right-2.5 top-1/2 h-4 w-4 -translate-y-1/2 text-ink-400" />
    </div>
  )
}

function StepButton({
  children,
  onClick,
  'aria-label': ariaLabel,
}: {
  children: ReactNode
  onClick: () => void
  'aria-label': string
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={ariaLabel}
      className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-ink-900/[0.04] text-ink-500 ring-1 ring-inset ring-ink-900/[0.08] transition hover:bg-brand-500/10 hover:text-brand-600 active:scale-95"
    >
      {children}
    </button>
  )
}

function ToolButton({
  onClick,
  icon: Icon,
  label,
}: {
  onClick: () => void
  icon: React.ComponentType<{ className?: string }>
  label: string
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="flex h-10 shrink-0 items-center gap-1.5 rounded-full bg-ink-900/[0.05] px-3.5 text-[13px] font-semibold text-ink-700 ring-1 ring-inset ring-ink-900/[0.06] transition hover:bg-ink-900/10 active:scale-[0.97]"
    >
      <Icon className="h-4 w-4 text-brand-600" />
      {label}
    </button>
  )
}
