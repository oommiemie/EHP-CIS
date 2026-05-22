import {
  createContext,
  useContext,
  useEffect,
  useLayoutEffect,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import { useNavigate, useLocation, useParams } from 'react-router-dom'
import { useToast } from '@/components/ui/Toast'
import {
  User,
  ShieldCheck,
  Pill,
  Stethoscope,
  HeartPulse,
  Apple,
  Star,
  Lock,
  CalendarDays,
  StickyNote,
  Printer,
  ClipboardList,
  History,
  Users,
  Building2,
  IdCard,
  Globe,
  Baby,
  Heart,
  Phone,
  Cross,
  Languages,
  MapPin,
  Info,
  Camera,
  Webcam,
  Fingerprint,
  CreditCard,
  CalendarCheck,
  ChevronLeft,
  ChevronDown,
  Search,
  Plus,
  Trash2,
  Pencil,
  Wrench,
  UserRound,
  Save,
  X,
  Check,
  Minus,
  type LucideIcon,
} from 'lucide-react'
import { Card } from '@/components/ui/Card'
import { Button } from '@/components/ui/Button'
import { Modal } from '@/components/ui/Modal'
import { DatePicker, TimePicker } from '@/components/ui/DateTimePicker'
import { patients } from '@/data/mockData'
import { getPatientProfile } from '@/data/patientProfiles'
import {
  usePatients,
  getStoredProfile,
  saveProfile,
  addPatient,
  updatePatient,
  nextHN,
} from '@/data/patientStore'
import type { Patient } from '@/types'
import { cn } from '@/lib/utils'

/* ───────────────────────── tab definitions ───────────────────────── */

interface TopTab {
  value: string
  label: string
  icon: LucideIcon
}

const topTabs: TopTab[] = [
  { value: 'general', label: 'ข้อมูลทั่วไป', icon: User },
  { value: 'rights', label: 'สิทธิการรักษา', icon: ShieldCheck },
  { value: 'drug-allergy', label: 'แพ้ยา', icon: Pill },
  { value: 'chronic', label: 'โรคประจำตัว', icon: HeartPulse },
  { value: 'food-allergy', label: 'แพ้อาหาร', icon: Apple },
  { value: 'special', label: 'สถานะพิเศษ', icon: Star },
  { value: 'confidential', label: 'ข้อมูลปกปิด', icon: Lock },
  { value: 'appointment', label: 'นัดหมาย', icon: CalendarDays },
  { value: 'note', label: 'Note', icon: StickyNote },
  { value: 'print', label: 'พิมพ์เอกสาร', icon: Printer },
  { value: 'eprescription', label: 'ePrescription', icon: ClipboardList },
  { value: 'audit', label: 'Audit', icon: History },
  { value: 'caregiver', label: 'ผู้ดูแล', icon: Users },
]

/* sections shown in the left rail — drive the middle column */
interface Section {
  value: string
  label: string
  icon: LucideIcon
  desc: string
}

const railSections: Section[] = [
  { value: 'general', label: 'ข้อมูลทั่วไป', icon: User, desc: 'ข้อมูลพื้นฐานที่ใช้ระบุตัวตนผู้ป่วย' },
  { value: 'relatives', label: 'ข้อมูลญาติ', icon: Users, desc: 'บิดา มารดา คู่สมรส และผู้ติดต่อ' },
  { value: 'social', label: 'ข้อมูลทางสังคม', icon: Building2, desc: 'สถานะในครอบครัวและสังคม' },
  { value: 'persontype', label: 'ประเภทบุคคล', icon: IdCard, desc: 'ประเภทบุคคลและสังกัด' },
  { value: 'alien', label: 'บุคคลต่างด้าว', icon: Globe, desc: 'ข้อมูลสำหรับบุคคลต่างด้าว' },
  { value: 'birth', label: 'ข้อมูลการเกิด', icon: Baby, desc: 'รายละเอียดการเกิดของผู้ป่วย' },
  { value: 'death', label: 'การเสียชีวิต', icon: Cross, desc: 'ข้อมูลการเสียชีวิต' },
  { value: 'english', label: 'ชื่อภาษาอังกฤษ', icon: Languages, desc: 'ชื่อและที่อยู่ภาษาอังกฤษ' },
]

/* ───────────────────────── option lists ───────────────────────── */

const opt = (arr: string[]) => arr.map((v) => ({ value: v, label: v }))
const pick = (arr: string[]) => [{ value: '', label: '— เลือก —' }, ...opt(arr)]

const O = {
  prefix: pick(['นาย', 'นาง', 'นางสาว', 'เด็กชาย', 'เด็กหญิง']),
  gender: pick(['ชาย', 'หญิง']),
  blood: pick(['A', 'B', 'AB', 'O']),
  rh: pick(['Rh+', 'Rh-']),
  religion: pick(['พุทธ', 'อิสลาม', 'คริสต์', 'ฮินดู', 'ซิกข์', 'ไม่นับถือศาสนา', 'อื่นๆ']),
  marital: pick(['โสด', 'สมรส', 'หม้าย', 'หย่าร้าง', 'แยกกันอยู่', 'สมณะ']),
  race: pick(['ไทย', 'ลาว', 'กัมพูชา', 'เมียนมา', 'มาเลเซีย', 'จีน', 'เวียดนาม', 'อื่นๆ']),
  relation: pick(['บิดา', 'มารดา', 'บุตร/ธิดา', 'คู่สมรส', 'พี่/น้อง', 'ญาติ', 'เพื่อน', 'อื่นๆ']),
  province: pick([
    'กาฬสินธุ์', 'ขอนแก่น', 'มหาสารคาม', 'ร้อยเอ็ด', 'อุดรธานี',
    'กรุงเทพมหานคร', 'สมุทรปราการ', 'นครราชสีมา', 'เชียงใหม่',
  ]),
  district: pick([
    'เมืองกาฬสินธุ์', 'ยางตลาด', 'กมลาไสย', 'สหัสขันธ์', 'สมเด็จ',
    'เขตบางรัก', 'เขตวัฒนา', 'เขตวังทองหลาง', 'บางพลี',
    'เมืองนครราชสีมา', 'สันทราย',
  ]),
  subdistrict: pick([
    'ห้วยโพธิ์', 'กาฬสินธุ์', 'เหนือ', 'หลุบ', 'ลำพาน',
    'สีลม', 'คลองตันเหนือ', 'คลองเจ้าคุณสิงห์', 'บางพลีใหญ่',
    'ในเมือง', 'สันทรายหลวง',
  ]),
  country: pick(['ไทย', 'ลาว', 'กัมพูชา', 'เมียนมา', 'มาเลเซีย']),
  language: pick(['ไทย', 'อังกฤษ', 'ลาว', 'เขมร', 'จีน', 'มลายู']),
  skin: pick(['ขาว', 'ผิวสองสี', 'คล้ำ', 'ดำแดง']),
  education: pick([
    'ไม่ได้เรียน',
    'ประถมศึกษา',
    'มัธยมศึกษา',
    'ปวช./ปวส.',
    'ปริญญาตรี',
    'สูงกว่าปริญญาตรี',
  ]),
  familyStatus: pick(['หัวหน้าครอบครัว', 'คู่สมรส', 'บุตร', 'ญาติ', 'ผู้อาศัย']),
  personStatus: pick(['มีชีวิต', 'เสียชีวิต', 'ย้ายที่อยู่', 'สาบสูญ']),
  personType: pick([
    'ประชาชนทั่วไป',
    'ข้าราชการ',
    'พนักงานรัฐวิสาหกิจ',
    'พระภิกษุ/สามเณร',
    'บุคคลต่างด้าว',
  ]),
  community: pick(['ไม่มี', 'อสม.', 'ผู้นำชุมชน', 'กรรมการหมู่บ้าน']),
  alien: pick(['ไม่ใช่', 'แรงงานต่างด้าว', 'ผู้ลี้ภัย', 'นักท่องเที่ยว']),
  deathPlace: pick(['โรงพยาบาล', 'บ้าน', 'ระหว่างนำส่ง', 'สถานที่อื่น']),
  deathSource: pick(['ใบมรณบัตร', 'ญาติแจ้ง', 'เจ้าหน้าที่']),
}

type Bind = { value: string; onChange: (e: { target: { value: string } }) => void }
type BindFn = (name: string) => Bind
type Flags = Record<string, boolean>
type ToggleFn = (name: string) => void

/* ─────────────── per-section edit mode (general tab) ───────────────
   On the patient-view page each section is locked until its แก้ไข
   button is pressed; ReadOnlyContext disables the field components. */

const ReadOnlyContext = createContext(false)
const useReadOnly = () => useContext(ReadOnlyContext)

interface EditEnv {
  /** new-record page → everything is editable, no edit toggle */
  isNew: boolean
  form: Record<string, string>
  flags: Flags
  setForm: (v: Record<string, string>) => void
  setFlags: (v: Flags) => void
}
const EditEnvContext = createContext<EditEnv | null>(null)

/* ───────────────────── field kit — label on top ───────────────────── */

function Row({
  label,
  children,
  className,
  required,
}: {
  label: string
  children: ReactNode
  className?: string
  required?: boolean
}) {
  const ro = useReadOnly()
  return (
    <div className={cn('w-full', className)}>
      <label className="mb-1.5 block text-[12px] font-medium text-ink-500">
        {label}
        {required && !ro && <span className="ml-0.5 text-rose-500">*</span>}
      </label>
      {children}
    </div>
  )
}

/* read-only value — shown as plain text (no border / no background) */
function ReadValue({
  value,
  multiline,
}: {
  value: string
  multiline?: boolean
}) {
  return (
    <div
      className={cn(
        'flex min-h-[36px] text-[13px] font-semibold text-ink-900',
        multiline ? 'items-start whitespace-pre-wrap py-1.5' : 'items-center'
      )}
    >
      {value || <span className="font-normal text-ink-300">—</span>}
    </div>
  )
}

function CText({
  label,
  bind,
  placeholder,
  type,
  right,
  className,
  required,
}: {
  label: string
  bind: Bind
  placeholder?: string
  type?: string
  right?: ReactNode
  className?: string
  required?: boolean
}) {
  const ro = useReadOnly()
  if (ro) {
    return (
      <Row label={label} className={className} required={required}>
        <ReadValue value={bind.value} />
      </Row>
    )
  }
  return (
    <Row label={label} className={className} required={required}>
      <div
        className={cn(
          'flex h-9 items-center gap-1.5 rounded-full glass-tight pl-4 transition-colors duration-200 focus-within:border-brand-500',
          right ? 'pr-1' : 'pr-4'
        )}
      >
        <input
          type={type}
          placeholder={placeholder}
          value={bind.value}
          onChange={bind.onChange}
          className="min-w-0 flex-1 bg-transparent text-[13px] text-ink-900 placeholder-ink-400 outline-none"
        />
        {right}
      </div>
    </Row>
  )
}

function CSelect({
  label,
  bind,
  options,
  className,
  required,
}: {
  label: string
  bind: Bind
  options: { value: string; label: string }[]
  className?: string
  required?: boolean
}) {
  const ro = useReadOnly()
  if (ro) {
    return (
      <Row label={label} className={className} required={required}>
        <ReadValue value={bind.value} />
      </Row>
    )
  }
  return (
    <Row label={label} className={className} required={required}>
      <div className="relative flex h-9 items-center rounded-full glass-tight transition-colors duration-200 focus-within:border-brand-500">
        <select
          value={bind.value}
          onChange={bind.onChange}
          className="w-full cursor-pointer appearance-none bg-transparent px-4 pr-9 text-[13px] text-ink-900 outline-none"
        >
          {options.map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </select>
        <ChevronDown className="pointer-events-none absolute right-3 h-4 w-4 text-ink-400" />
      </div>
    </Row>
  )
}

function CArea({
  label,
  bind,
  placeholder,
  rows = 2,
  className,
  required,
}: {
  label: string
  bind: Bind
  placeholder?: string
  rows?: number
  className?: string
  required?: boolean
}) {
  const ro = useReadOnly()
  if (ro) {
    return (
      <Row label={label} className={className} required={required}>
        <ReadValue value={bind.value} multiline />
      </Row>
    )
  }
  return (
    <Row label={label} className={className} required={required}>
      <textarea
        rows={rows}
        placeholder={placeholder}
        value={bind.value}
        onChange={bind.onChange}
        className="block w-full resize-none rounded-2xl glass-tight px-4 py-3 text-[13px] text-ink-900 placeholder-ink-400 outline-none transition-colors duration-200 focus:border-brand-500"
      />
    </Row>
  )
}

function CDate({
  label,
  bind,
  className,
  required,
}: {
  label: string
  bind: Bind
  className?: string
  required?: boolean
}) {
  const ro = useReadOnly()
  if (ro) {
    return (
      <Row label={label} className={className} required={required}>
        <ReadValue value={bind.value ? fmtThaiDate(bind.value) : ''} />
      </Row>
    )
  }
  return (
    <Row label={label} className={className} required={required}>
      <DatePicker
        value={bind.value}
        onChange={(v) => bind.onChange({ target: { value: v } })}
      />
    </Row>
  )
}

function CTime({
  label,
  bind,
  className,
  required,
}: {
  label: string
  bind: Bind
  className?: string
  required?: boolean
}) {
  const ro = useReadOnly()
  if (ro) {
    return (
      <Row label={label} className={className} required={required}>
        <ReadValue value={bind.value ? `${bind.value} น.` : ''} />
      </Row>
    )
  }
  return (
    <Row label={label} className={className} required={required}>
      <TimePicker
        value={bind.value}
        onChange={(v) => bind.onChange({ target: { value: v } })}
      />
    </Row>
  )
}

function CheckField({
  checked,
  onChange,
  label,
}: {
  checked: boolean
  onChange: () => void
  label: string
}) {
  const ro = useReadOnly()
  if (ro) {
    return (
      <div className="inline-flex items-center gap-1.5">
        {checked ? (
          <Check className="h-4 w-4 text-brand-600" strokeWidth={3} />
        ) : (
          <Minus className="h-4 w-4 text-ink-300" />
        )}
        <span className="text-[12.5px] font-medium text-ink-600">{label}</span>
      </div>
    )
  }
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
      <span className="text-[12.5px] font-medium text-ink-600">{label}</span>
    </button>
  )
}

function MiniButton({ icon: Icon, label }: { icon: LucideIcon; label: string }) {
  return (
    <button
      type="button"
      className="inline-flex h-7 shrink-0 items-center gap-1 rounded-full bg-brand-500/10 px-2.5 text-[11.5px] font-semibold text-brand-600 transition-all hover:bg-brand-500/20 active:scale-95"
    >
      <Icon className="h-3.5 w-3.5" />
      {label}
    </button>
  )
}

/* card with a titled header + divider */
function Panel({
  title,
  desc,
  icon: Icon,
  action,
  children,
  className,
}: {
  title: string
  desc?: string
  icon?: LucideIcon
  action?: ReactNode
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
        {action}
      </div>
      <div className="h-px bg-ink-900/[0.07]" />
      <div className="p-5">{children}</div>
    </Card>
  )
}

/* small pill button in a panel header — same height as the ย้อนกลับ button */
function PanelActionBtn({
  onClick,
  icon: Icon,
  label,
  primary,
}: {
  onClick: () => void
  icon: LucideIcon
  label: string
  primary?: boolean
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={cn(
        'inline-flex h-8 shrink-0 items-center gap-1 rounded-full px-3 pr-3.5 text-[12px] font-medium transition-all duration-200 active:scale-[0.96]',
        primary
          ? 'bg-gradient-to-br from-brand-500 to-violet-500 text-white shadow-[0_6px_14px_-6px_rgba(58,100,255,0.7)] hover:brightness-110'
          : 'glass-tight text-ink-600 hover:bg-white hover:text-brand-600 hover:shadow-glow'
      )}
    >
      <Icon className="h-3.5 w-3.5" />
      {label}
    </button>
  )
}

/* a Panel whose fields are locked until its แก้ไข button is pressed.
   On the new-record page it stays fully editable with no toggle. */
function EditablePanel({
  title,
  desc,
  icon,
  children,
  className,
}: {
  title: string
  desc?: string
  icon?: LucideIcon
  children: ReactNode
  className?: string
}) {
  const env = useContext(EditEnvContext)
  const toast = useToast()
  const [editing, setEditing] = useState(false)
  const snap = useRef<{ form: Record<string, string>; flags: Flags } | null>(
    null
  )

  if (!env) return null
  const readOnly = !env.isNew && !editing

  const start = () => {
    snap.current = { form: { ...env.form }, flags: { ...env.flags } }
    setEditing(true)
  }
  const cancel = () => {
    if (snap.current) {
      env.setForm(snap.current.form)
      env.setFlags(snap.current.flags)
    }
    setEditing(false)
  }
  const save = () => {
    setEditing(false)
    toast.success('บันทึกสำเร็จ', `อัปเดต${title}เรียบร้อยแล้ว`)
  }

  const action = env.isNew ? null : editing ? (
    <div className="flex gap-1.5">
      <PanelActionBtn onClick={cancel} icon={X} label="ยกเลิก" />
      <PanelActionBtn onClick={save} icon={Check} label="บันทึก" primary />
    </div>
  ) : (
    <PanelActionBtn onClick={start} icon={Pencil} label="แก้ไข" />
  )

  return (
    <Panel
      title={title}
      desc={desc}
      icon={icon}
      action={action}
      className={className}
    >
      <ReadOnlyContext.Provider value={readOnly}>
        {children}
      </ReadOnlyContext.Provider>
    </Panel>
  )
}

function ComingSoon({ label }: { label: string }) {
  return (
    <Card className="flex flex-col items-center justify-center py-20 text-center">
      <div className="flex h-[60px] w-[60px] items-center justify-center rounded-[20px] bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-500">
        <Wrench className="h-6 w-6" />
      </div>
      <h3 className="mt-3 text-base font-semibold tracking-tight text-ink-900">
        {label}
      </h3>
      <p className="mt-1 max-w-sm text-[13px] text-ink-500">
        ส่วนนี้กำลังพัฒนา — โครงแท็บถูกเตรียมไว้แล้ว และจะเปิดให้ใช้งานเร็วๆ นี้
      </p>
    </Card>
  )
}

/* ───────────────────────── page ───────────────────────── */

/* รูปสำรอง — ใช้เมื่อผู้ป่วยยังไม่มีรูปในระบบ */
const PATIENT_PHOTO = 'https://randomuser.me/api/portraits/men/41.jpg'

export default function PatientOPDCard() {
  const navigate = useNavigate()
  const toast = useToast()
  const { pathname } = useLocation()
  const { hn } = useParams()
  // /patient/new → blank form for a new record; /patient/:hn → existing record
  const isNew = pathname.endsWith('/new')
  // HN ถัดไป — running number ต่อจากผู้ป่วยล่าสุดในระบบ
  const newHN = useMemo(() => nextHN(), [])
  // load the selected patient's OPD profile (fall back to the first patient)
  const profile = useMemo(
    () => (isNew ? undefined : getPatientProfile(hn ?? patients[0].hn)),
    [isNew, hn]
  )
  const [topTab, setTopTab] = useState('general')
  const [section, setSection] = useState('general')
  const [form, setForm] = useState<Record<string, string>>(() => {
    if (isNew) return { hn: newHN }
    const stored = hn ? getStoredProfile(hn) : undefined
    return stored?.form ?? profile?.form ?? { hn: hn ?? '' }
  })
  const [flags, setFlags] = useState<Flags>(() => {
    if (isNew) return {}
    const stored = hn ? getStoredProfile(hn) : undefined
    return stored?.flags ?? profile?.flags ?? {}
  })
  const tabRefs = useRef<(HTMLButtonElement | null)[]>([])
  const [ind, setInd] = useState<{ left: number; width: number } | null>(null)

  // slide the active-tab indicator + scroll the active tab into view
  useLayoutEffect(() => {
    const idx = topTabs.findIndex((t) => t.value === topTab)
    const el = tabRefs.current[idx]
    if (!el) return
    setInd({ left: el.offsetLeft, width: el.offsetWidth })
    el.scrollIntoView({ inline: 'nearest', block: 'nearest', behavior: 'smooth' })
  }, [topTab])

  const set = (name: string, value: string) =>
    setForm((f) => ({ ...f, [name]: value }))
  const toggle: ToggleFn = (name) =>
    setFlags((f) => ({ ...f, [name]: !f[name] }))
  const bind: BindFn = (name) => ({
    value: form[name] ?? '',
    onChange: (e) => set(name, e.target.value),
  })

  // persist edits of an existing record back to the store (localStorage)
  useEffect(() => {
    if (isNew || !hn) return
    saveProfile(hn, form, flags)
    const patch: Partial<Patient> = {}
    if (form.prefix) patch.prefix = form.prefix
    if (form.firstName) patch.firstName = form.firstName
    if (form.lastName) patch.lastName = form.lastName
    if (form.cid) patch.cid = form.cid
    if (form.phoneMobile) patch.phone = form.phoneMobile
    if (Object.keys(patch).length) updatePatient(hn, patch)
  }, [isNew, hn, form, flags])

  // build + store a brand-new patient record from the form
  function saveNewPatient() {
    const created: Patient = {
      hn: form.hn || newHN,
      cid: form.cid || '',
      prefix: form.prefix || 'นาย',
      firstName: form.firstName || 'ผู้ป่วยใหม่',
      lastName: form.lastName || '',
      gender: form.gender === 'หญิง' ? 'female' : 'male',
      birthdate: form.birthdate || '2000-01-01',
      phone: form.phoneMobile || form.phoneHome || undefined,
      insurance: form.insurance || undefined,
      lastVisit: new Date().toISOString(),
      totalVisits: 0,
      status: 'active',
    }
    addPatient(created)
    saveProfile(created.hn, form, flags)
  }

  const activeTab = topTabs.find((t) => t.value === topTab)!

  return (
    <div className="flex h-[calc(100vh-66px)] flex-col gap-3">
      {/* ── header ── */}
      <header className="flex shrink-0 flex-wrap items-center justify-between gap-3">
        <div>
          <button
            onClick={() => navigate('/registry')}
            className="inline-flex h-8 items-center gap-1 rounded-full glass-tight px-3 pr-3.5 text-[12px] font-medium text-ink-600 transition-all duration-200 hover:bg-white hover:text-brand-600 hover:shadow-glow active:scale-[0.96]"
          >
            <ChevronLeft className="h-3.5 w-3.5" />
            ย้อนกลับ
          </button>
          <h1 className="mt-2 pb-0.5 text-[22px] font-bold leading-[1.5] tracking-tight text-ink-900">
            {isNew ? (
              <>
                เปิด
                <span className="text-gradient inline-block pb-1 align-baseline">
                  เวชระเบียนใหม่
                </span>
              </>
            ) : (
              <>
                เวชระเบียน
                <span className="text-gradient inline-block pb-1 align-baseline">
                  ผู้ป่วยนอก
                </span>
              </>
            )}
          </h1>
          <p className="mt-1 text-[12.5px] text-ink-500">
            {isNew || !profile ? (
              'กรอกข้อมูลผู้ป่วยเพื่อสร้างเวชระเบียนใหม่'
            ) : (
              <>
                <span className="font-semibold text-ink-700">
                  {profile.patient.prefix} {profile.patient.firstName}{' '}
                  {profile.patient.lastName}
                </span>
                <span className="mx-1.5 text-ink-300">·</span>
                HN {profile.patient.hn}
              </>
            )}
          </p>
        </div>
        <div className="flex gap-2">
          {isNew ? (
            <>
              <Button
                variant="secondary"
                size="sm"
                leftIcon={<X className="h-3.5 w-3.5" />}
                onClick={() => navigate('/registry')}
              >
                ยกเลิก
              </Button>
              <Button
                variant="secondary"
                size="sm"
                leftIcon={<Save className="h-3.5 w-3.5" />}
                onClick={() => {
                  saveNewPatient()
                  toast.add(
                    'บันทึกเวชระเบียนสำเร็จ',
                    'สร้างเวชระเบียนผู้ป่วยใหม่เรียบร้อยแล้ว'
                  )
                  navigate('/registry')
                }}
              >
                บันทึก
              </Button>
              <Button
                variant="primary"
                size="sm"
                leftIcon={<Stethoscope className="h-3.5 w-3.5" />}
                onClick={() => {
                  saveNewPatient()
                  toast.add(
                    'บันทึกและเปิด Visit สำเร็จ',
                    'สร้างเวชระเบียนและเปิดการส่งตรวจให้ผู้ป่วยแล้ว'
                  )
                  navigate('/visit')
                }}
              >
                บันทึกและเปิด Visit
              </Button>
            </>
          ) : (
            <Button
              variant="primary"
              size="sm"
              leftIcon={<Stethoscope className="h-3.5 w-3.5" />}
              onClick={() => navigate('/visit')}
            >
              เปิด Visit
            </Button>
          )}
        </div>
      </header>

      {/* ── sticky top tab strip — single scrollable row, sliding indicator ── */}
      <div className="liquid-glass-button flex shrink-0 gap-1 overflow-x-auto rounded-full border border-white/60 bg-white/60 p-1.5 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.9),0_14px_32px_-14px_rgba(28,38,92,0.36)]">
        {/* sliding active indicator */}
        {ind && (
          <span
            className="pointer-events-none absolute left-0 top-1.5 h-8 rounded-full bg-gradient-to-br from-brand-500 to-violet-500 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.3)] transition-[transform,width] duration-300 ease-[cubic-bezier(0.34,1.2,0.64,1)]"
            style={{ transform: `translateX(${ind.left}px)`, width: ind.width }}
          />
        )}
        {topTabs.map((t, i) => {
          const active = t.value === topTab
          const Icon = t.icon
          return (
            <button
              key={t.value}
              ref={(el) => {
                tabRefs.current[i] = el
              }}
              onClick={() => setTopTab(t.value)}
              className={cn(
                'relative z-10 inline-flex h-8 shrink-0 items-center gap-1.5 rounded-full px-3.5 text-[12px] font-medium transition-colors duration-200 active:scale-[0.96]',
                active ? 'text-white' : 'text-ink-500 hover:text-ink-800'
              )}
            >
              <Icon className="h-[14px] w-[14px]" />
              {t.label}
            </button>
          )
        })}
      </div>

      {/* ── tab content (the only scrollable region) ── */}
      <div
        key={topTab}
        className="min-h-0 flex-1 overflow-y-auto pb-2 animate-page-in xl:overflow-hidden xl:pb-0"
      >
        {topTab === 'general' ? (
          <GeneralTab
            bind={bind}
            flags={flags}
            toggle={toggle}
            form={form}
            setForm={setForm}
            setFlags={setFlags}
            section={section}
            setSection={setSection}
            isNew={isNew}
            photo={profile?.patient.photo}
          />
        ) : topTab === 'rights' ? (
          <RightsTab seed={isNew || !profile ? [] : profile.rights} />
        ) : topTab === 'drug-allergy' ? (
          <DrugAllergyTab
            seed={isNew || !profile ? [] : profile.drugAllergies}
          />
        ) : LIST_TABS[topTab] ? (
          <ListTab
            key={topTab}
            {...LIST_TABS[topTab]}
            seed={isNew || !profile ? undefined : profile.lists[topTab]}
          />
        ) : (
          <ComingSoon label={activeTab.label} />
        )}
      </div>
    </div>
  )
}

/* ───────────────── general tab — 3-column layout ───────────────── */

interface GeneralTabProps {
  bind: BindFn
  flags: Flags
  toggle: ToggleFn
  form: Record<string, string>
  setForm: (v: Record<string, string>) => void
  setFlags: (v: Flags) => void
  section: string
  setSection: (v: string) => void
  isNew: boolean
  photo?: string
}

const PHOTO_BG =
  'radial-gradient(circle at 18% 20%, rgba(167,139,250,0.95) 0%, rgba(167,139,250,0) 55%),' +
  'radial-gradient(circle at 86% 16%, rgba(96,165,250,0.95) 0%, rgba(96,165,250,0) 55%),' +
  'radial-gradient(circle at 72% 96%, rgba(56,189,248,0.9) 0%, rgba(56,189,248,0) 58%),' +
  'linear-gradient(135deg, #7c83f6 0%, #8b5cf6 100%)'

function GeneralTab({
  bind,
  flags,
  toggle,
  form,
  setForm,
  setFlags,
  section,
  setSection,
  isNew,
  photo,
}: GeneralTabProps) {
  const [mediaTab, setMediaTab] = useState<'photo' | 'fingerprint'>('photo')
  const editEnv: EditEnv = { isNew, form, flags, setForm, setFlags }
  const sec = railSections.find((s) => s.value === section)!
  return (
    <div className="flex flex-col gap-4 xl:h-full xl:flex-row">
      {/* ════════ LEFT — photo + rail (fixed, does not scroll) ════════ */}
      <Card
        padding="none"
        className="overflow-hidden xl:flex xl:w-[230px] xl:shrink-0 xl:flex-col"
      >
        {/* photo / fingerprint */}
        <div
          className="relative shrink-0 overflow-hidden"
          style={{ background: PHOTO_BG }}
        >
          <img
            src={`${import.meta.env.BASE_URL}photo-card-bg.jpg`}
            alt=""
            className="pointer-events-none absolute inset-0 h-full w-full scale-110 object-cover blur-[5px]"
          />
          <div className="pointer-events-none absolute inset-0 bg-gradient-to-b from-violet-600/10 via-transparent to-brand-700/25" />
          <div className="relative flex flex-col items-center gap-4 p-4">
          <div className="relative flex h-[132px] w-[132px] items-center justify-center rounded-full bg-white/95 shadow-[0_10px_28px_-10px_rgba(28,38,92,0.5)] ring-4 ring-white/40">
            {mediaTab === 'photo' ? (
              isNew ? (
                <UserRound className="h-16 w-16 text-ink-300" strokeWidth={1.5} />
              ) : (
                <img
                  src={photo ?? PATIENT_PHOTO}
                  alt="รูปผู้ป่วย"
                  className="h-full w-full rounded-full object-cover"
                />
              )
            ) : (
              <Fingerprint className="h-16 w-16 text-ink-300" strokeWidth={1.5} />
            )}
            <span className="absolute bottom-1 right-1 flex h-8 w-8 items-center justify-center rounded-full bg-gradient-to-br from-brand-500 to-violet-500 text-white shadow-[0_4px_10px_-3px_rgba(58,100,255,0.7)]">
              {mediaTab === 'photo' ? (
                <Camera className="h-4 w-4" />
              ) : (
                <Fingerprint className="h-4 w-4" />
              )}
            </span>
          </div>

          {/* segmented toggle — sliding indicator */}
          <div className="relative flex w-full rounded-full bg-white/45 p-1 shadow-[0_4px_10px_-3px_rgba(0,0,0,0.18)] backdrop-blur-md">
            {/* sliding active pill */}
            <span
              className="pointer-events-none absolute bottom-1 left-1 top-1 rounded-full bg-gradient-to-br from-brand-500 to-violet-500 shadow-[0_4px_10px_-3px_rgba(58,100,255,0.6)] transition-transform duration-300 ease-[cubic-bezier(0.34,1.2,0.64,1)]"
              style={{
                width: 'calc((100% - 0.5rem) / 2)',
                transform:
                  mediaTab === 'fingerprint'
                    ? 'translateX(100%)'
                    : 'translateX(0)',
              }}
            />
            {([
              { id: 'photo', label: 'ภาพ', icon: Camera },
              { id: 'fingerprint', label: 'ลายนิ้วมือ', icon: Webcam },
            ] as const).map((m) => {
              const on = mediaTab === m.id
              return (
                <button
                  key={m.id}
                  onClick={() => setMediaTab(m.id)}
                  className={cn(
                    'relative z-10 flex flex-1 items-center justify-center gap-1.5 rounded-full py-2 text-[12.5px] font-medium transition-colors duration-200 active:scale-[0.97]',
                    on ? 'text-white' : 'text-ink-700 hover:text-ink-900'
                  )}
                >
                  <m.icon className="h-3.5 w-3.5" />
                  {m.label}
                </button>
              )
            })}
          </div>
          </div>
        </div>

        {/* section rail — scrolls inside the card only if the list overflows */}
        <nav className="space-y-1 p-2.5 xl:min-h-0 xl:flex-1 xl:overflow-y-auto">
          {railSections.map((s) => {
            const active = s.value === section
            const Icon = s.icon
            return (
              <button
                key={s.value}
                onClick={() => setSection(s.value)}
                className={cn(
                  'group flex w-full items-center gap-2.5 rounded-full p-1.5 text-left transition-all duration-200 active:scale-[0.97]',
                  active
                    ? 'animate-nav-pop bg-gradient-to-r from-brand-500/15 to-violet-500/15'
                    : 'hover:bg-brand-500/5'
                )}
              >
                <span
                  className={cn(
                    'relative flex h-8 w-8 shrink-0 items-center justify-center rounded-full transition-all duration-200',
                    active
                      ? 'bg-gradient-to-br from-brand-500 to-violet-500 text-white shadow-[0_5px_12px_-4px_rgba(58,100,255,0.75)]'
                      : 'bg-white/70 text-ink-500 group-hover:text-ink-700'
                  )}
                >
                  <Icon className="h-4 w-4" />
                </span>
                <span
                  className={cn(
                    'relative truncate text-[13px]',
                    active
                      ? 'font-semibold text-ink-900'
                      : 'font-medium text-ink-600'
                  )}
                >
                  {s.label}
                </span>
              </button>
            )
          })}
        </nav>
      </Card>

      {/* ════════ CONTENT — selected section (the scrollable region) ════════ */}
      <EditEnvContext.Provider value={editEnv}>
        <div
          key={section}
          className="animate-page-in xl:min-h-0 xl:flex-1 xl:overflow-y-auto xl:pb-2"
        >
          {section === 'general' ? (
            <div className="space-y-4">
              {/* top row: general info + right column */}
              <div className="grid grid-cols-1 items-start gap-4 xl:grid-cols-[minmax(0,1fr)_350px]">
                <EditablePanel
                  title="ข้อมูลทั่วไป"
                  desc="ข้อมูลพื้นฐานที่ใช้ระบุตัวตนผู้ป่วย"
                  icon={User}
                >
                  <SectionContent
                    section="general"
                    bind={bind}
                    flags={flags}
                    toggle={toggle}
                  />
                </EditablePanel>
                <div className="space-y-4">
                  {/* quick-action button card */}
                  <Card padding="sm">
                    <div className="space-y-2">
                      <Button
                        variant="accent"
                        className="w-full"
                        leftIcon={<CreditCard className="h-4 w-4" />}
                      >
                        อ่านบัตรประชาชน
                      </Button>
                      <Button
                        variant="primary"
                        className="w-full"
                        leftIcon={<CalendarCheck className="h-4 w-4" />}
                      >
                        จองนัด Online
                      </Button>
                    </div>
                  </Card>
                  <EditablePanel
                    title="ที่อยู่ปัจจุบัน"
                    desc="ที่อยู่ที่ติดต่อได้จริงในปัจจุบัน"
                    icon={MapPin}
                  >
                    <AddressForm bind={bind} flags={flags} toggle={toggle} />
                  </EditablePanel>
                </div>
              </div>
              {/* full-width: other info */}
              <EditablePanel
                title="ข้อมูลอื่นๆ"
                desc="ข้อมูลติดต่อและรายละเอียดเพิ่มเติม"
                icon={Info}
              >
                <OtherForm bind={bind} flags={flags} toggle={toggle} />
              </EditablePanel>
            </div>
          ) : section === 'relatives' ? (
            <RelativesPanels bind={bind} />
          ) : (
            <EditablePanel title={sec.label} desc={sec.desc} icon={sec.icon}>
              <SectionContent
                section={section}
                bind={bind}
                flags={flags}
                toggle={toggle}
              />
            </EditablePanel>
          )}
        </div>
      </EditEnvContext.Provider>
    </div>
  )
}

/* ───────────────────────── middle section forms ───────────────────────── */

const GRID3 = 'grid grid-cols-1 gap-x-4 gap-y-4 sm:grid-cols-2 lg:grid-cols-3'
const GRID2 = 'grid grid-cols-1 gap-x-4 gap-y-4 sm:grid-cols-2'

/* ข้อมูลญาติ — 4 flat sections in a 2×2 grid (Figma 218:1532) */
function RelativesPanels({ bind }: { bind: BindFn }) {
  const relatives = [
    { key: 'father', label: 'บิดา', icon: User, desc: 'ข้อมูลพื้นฐานของบิดาผู้ป่วย' },
    { key: 'mother', label: 'มารดา', icon: UserRound, desc: 'ข้อมูลพื้นฐานของมารดาผู้ป่วย' },
    { key: 'spouse', label: 'คู่สมรส', icon: Heart, desc: 'ข้อมูลพื้นฐานของคู่สมรสผู้ป่วย' },
    { key: 'contact', label: 'ผู้ติดต่อ', icon: Phone, desc: 'บุคคลที่ติดต่อได้กรณีฉุกเฉิน' },
  ]
  return (
    <div className="grid grid-cols-1 gap-4 lg:grid-cols-2">
      {relatives.map((r) => (
        <EditablePanel key={r.key} title={r.label} desc={r.desc} icon={r.icon}>
          <div className="grid grid-cols-2 gap-x-4 gap-y-4">
            <CText label="ชื่อ" placeholder="ชื่อจริง" bind={bind(`${r.key}FirstName`)} />
            <CText label="นามสกุล" placeholder="นามสกุล" bind={bind(`${r.key}LastName`)} />
            {r.key === 'contact' ? (
              <CSelect
                label="ความสัมพันธ์"
                options={O.relation}
                bind={bind('contactRelation')}
              />
            ) : (
              <CText
                label="เลขบัตรประชาชน"
                placeholder="เลขบัตร"
                bind={bind(`${r.key}Cid`)}
              />
            )}
            <CText
              label="เบอร์โทรศัพท์"
              placeholder="08x-xxx-xxxx"
              bind={bind(`${r.key}Phone`)}
            />
          </div>
        </EditablePanel>
      ))}
    </div>
  )
}

function SectionContent({
  section,
  bind,
  flags,
  toggle,
}: {
  section: string
  bind: BindFn
  flags: Flags
  toggle: ToggleFn
}) {
  if (section === 'general') {
    return (
      <div className={GRID3}>
        {/* HN — แยกแถวบนสุด เต็มความกว้าง */}
        <CText
          className="sm:col-span-2 lg:col-span-3"
          label="HN (เลขประจำตัวผู้ป่วย)"
          placeholder="HN"
          bind={bind('hn')}
        />
        <CSelect label="คำนำหน้า" options={O.prefix} bind={bind('prefix')} required />
        <CText label="ชื่อ" placeholder="ชื่อจริง" bind={bind('firstName')} required />
        <CText label="นามสกุล" placeholder="นามสกุล" bind={bind('lastName')} required />
        <CText
          className="sm:col-span-2"
          label="เลขบัตรประชาชน"
          placeholder="0-0000-00000-00-0"
          bind={bind('cid')}
          right={<MiniButton icon={Search} label="ตรวจสอบ" />}
          required
        />
        <CSelect label="เพศ" options={O.gender} bind={bind('gender')} required />
        <CDate label="วันเกิด" bind={bind('birthdate')} required />
        <CTime label="เวลาเกิด" bind={bind('birthtime')} />
        <div className="flex items-end pb-3">
          <CheckField
            checked={!!flags.birthUncertain}
            onChange={() => toggle('birthUncertain')}
            label="ไม่แน่ใจวันเกิด"
          />
        </div>
        <CSelect label="เชื้อชาติ" options={O.race} bind={bind('race')} />
        <CSelect label="สัญชาติ" options={O.race} bind={bind('nationality')} />
        <CSelect label="ศาสนา" options={O.religion} bind={bind('religion')} />
        <CSelect label="หมู่เลือด" options={O.blood} bind={bind('blood')} />
        <CSelect label="Rh" options={O.rh} bind={bind('rh')} />
        <CText label="อาชีพ" placeholder="อาชีพ" bind={bind('occupation')} />
        <CSelect label="สถานภาพสมรส" options={O.marital} bind={bind('marital')} />
        <CText label="จำนวนพี่น้อง" type="number" placeholder="0" bind={bind('siblings')} />
        <CText label="บุตรคนที่" type="number" placeholder="0" bind={bind('childOrder')} />
        <CText
          className="sm:col-span-2 lg:col-span-3"
          label="การแพ้ยา"
          placeholder="ระบุประวัติการแพ้ยา"
          bind={bind('drugAllergy')}
          right={<MiniButton icon={Plus} label="เพิ่ม" />}
        />
        <CText
          className="sm:col-span-2"
          label="ผู้แจ้ง"
          placeholder="ชื่อผู้แจ้งข้อมูล"
          bind={bind('informer')}
        />
        <CSelect
          label="ความสัมพันธ์"
          options={O.relation}
          bind={bind('informerRelation')}
        />
      </div>
    )
  }

  if (section === 'social') {
    return (
      <div className={GRID2}>
        <CSelect label="สถานะในครอบครัว" options={O.familyStatus} bind={bind('familyStatus')} />
        <CSelect label="สถานะบุคคล" options={O.personStatus} bind={bind('personStatus')} />
        <CSelect label="การศึกษา" options={O.education} bind={bind('education')} />
        <CSelect label="ชนิดบุคคลต่างด้าว" options={O.alien} bind={bind('alienKindSocial')} />
        <CSelect label="ตำแหน่งในชุมชน" options={O.community} bind={bind('communityRole')} />
        <div className="flex items-end pb-3">
          <CheckField
            checked={!!flags.inResponsibleAreaSocial}
            onChange={() => toggle('inResponsibleAreaSocial')}
            label="อยู่ในเขตรับผิดชอบ"
          />
        </div>
      </div>
    )
  }

  if (section === 'persontype') {
    return (
      <div className={GRID2}>
        <CSelect label="ประเภทบุคคล" options={O.personType} bind={bind('personType')} />
        <CText label="เลขที่ข้าราชการ" placeholder="เลขที่" bind={bind('govNo')} />
        <CText label="สังกัดหลัก" placeholder="สังกัดหลัก" bind={bind('affiliationMain')} />
        <CText label="สังกัดรอง" placeholder="สังกัดรอง" bind={bind('affiliationSub')} />
      </div>
    )
  }

  if (section === 'alien') {
    return (
      <div className={GRID2}>
        <CSelect label="ชนิดบุคคลต่างด้าว" options={O.alien} bind={bind('alienKind')} />
        <CText label="เลขที่หนังสือเดินทาง" placeholder="Passport No." bind={bind('alienPassport')} />
        <CText label="ประเทศต้นทาง" placeholder="ประเทศ" bind={bind('alienCountry')} />
        <CText label="เลขที่ใบอนุญาตทำงาน" placeholder="Work permit" bind={bind('alienWorkPermit')} />
        <CDate label="วันที่อนุญาตเข้าประเทศ" bind={bind('alienEntryDate')} />
        <CDate label="วันที่หมดอายุ" bind={bind('alienExpireDate')} />
      </div>
    )
  }

  if (section === 'birth') {
    return (
      <div className={GRID2}>
        <CText label="สถานที่เกิด" placeholder="โรงพยาบาล / สถานที่" bind={bind('birthPlace')} />
        <CText label="น้ำหนักแรกเกิด (กรัม)" type="number" placeholder="0" bind={bind('birthWeight')} />
        <CText label="เลขที่สูติบัตร" placeholder="เลขที่" bind={bind('birthCertNo')} />
        <CText label="ชื่อแพทย์ผู้ทำคลอด" placeholder="ชื่อแพทย์" bind={bind('birthDoctor')} />
        <CText label="ลำดับการเกิด (ครรภ์ที่)" type="number" placeholder="0" bind={bind('birthGravida')} />
        <CText label="อายุครรภ์ (สัปดาห์)" type="number" placeholder="0" bind={bind('birthGestation')} />
      </div>
    )
  }

  if (section === 'death') {
    return (
      <div className="space-y-4">
        <div className={GRID2}>
          <CDate label="วันที่เสียชีวิต" bind={bind('deathDate')} />
          <CTime label="เวลาเสียชีวิต" bind={bind('deathTime')} />
          <CSelect label="สถานที่เสียชีวิต" options={O.deathPlace} bind={bind('deathPlace')} />
          <CSelect label="แหล่งข้อมูล" options={O.deathSource} bind={bind('deathSource')} />
          <CText label="เลขที่ใบมรณบัตร" placeholder="เลขที่" bind={bind('deathCertNo')} />
          <div className="flex items-end pb-3">
            <CheckField
              checked={!!flags.deathUnknown}
              onChange={() => toggle('deathUnknown')}
              label="ไม่ทราบรายละเอียด"
            />
          </div>
          <CText
            className="sm:col-span-2"
            label="สาเหตุการตาย (ICD-10)"
            placeholder="ระบุรหัส ICD-10"
            bind={bind('deathIcd10')}
            right={<MiniButton icon={Search} label="ค้นหา" />}
          />
        </div>
        <CArea
          label="สาเหตุหลักการเสียชีวิต / รายละเอียด"
          rows={3}
          placeholder="ระบุรายละเอียดสาเหตุการเสียชีวิต"
          bind={bind('deathCause')}
        />
      </div>
    )
  }

  // english
  return (
    <div className="space-y-4">
      <div className={GRID3}>
        <CText label="Prefix" placeholder="Mr. / Mrs. / Ms." bind={bind('enPrefix')} />
        <CText label="First Name" placeholder="First name" bind={bind('enFirstName')} />
        <CText label="Middle Name" placeholder="Middle name" bind={bind('enMiddleName')} />
        <CText
          className="sm:col-span-2 lg:col-span-3"
          label="Last Name"
          placeholder="Last name"
          bind={bind('enLastName')}
        />
      </div>
      <CArea
        label="Address"
        rows={3}
        placeholder="Full address in English"
        bind={bind('enAddress')}
      />
    </div>
  )
}

/* ───────────────────────── right-column forms ───────────────────────── */

function AddressForm({
  bind,
  flags,
  toggle,
}: {
  bind: BindFn
  flags: Flags
  toggle: ToggleFn
}) {
  return (
    <div className="space-y-4">
      <div className="grid grid-cols-2 gap-x-3 gap-y-4">
        <CText label="บ้านเลขที่" placeholder="เลขที่" bind={bind('houseNo')} />
        <CText label="หมู่" placeholder="หมู่ที่" bind={bind('moo')} />
        <CText label="ถนน" placeholder="ถนน" bind={bind('road')} />
        <CText label="ซอย" placeholder="ซอย" bind={bind('soi')} />
        <CSelect label="ตำบล" options={O.subdistrict} bind={bind('subdistrict')} />
        <CSelect label="อำเภอ" options={O.district} bind={bind('district')} />
        <CSelect label="จังหวัด" options={O.province} bind={bind('province')} />
        <CText label="รหัสไปรษณีย์" placeholder="00000" bind={bind('zipcode')} />
        <CSelect
          className="col-span-2"
          label="ประเทศ"
          options={O.country}
          bind={bind('country')}
        />
      </div>
      <div className="flex flex-wrap items-center justify-between gap-3 border-t border-ink-900/8 pt-4">
        <Button
          size="sm"
          variant="secondary"
          leftIcon={<MapPin className="h-3.5 w-3.5" />}
        >
          ใช้ที่อยู่ตามทะเบียนบ้าน
        </Button>
        <CheckField
          checked={!!flags.fileDestroyed}
          onChange={() => toggle('fileDestroyed')}
          label="แฟ้มถูกทำลาย"
        />
      </div>
    </div>
  )
}

function OtherForm({
  bind,
  flags,
  toggle,
}: {
  bind: BindFn
  flags: Flags
  toggle: ToggleFn
}) {
  return (
    <div className="space-y-4">
      <div className="flex flex-wrap gap-x-8 gap-y-2.5 rounded-xl glass-dim p-3">
        <CheckField
          checked={!!flags.inResponsibleArea}
          onChange={() => toggle('inResponsibleArea')}
          label="อยู่ในเขตความรับผิดชอบ"
        />
        <CheckField
          checked={!!flags.consentGiven}
          onChange={() => toggle('consentGiven')}
          label="ผู้ป่วยยินยอมเปิดเผยข้อมูล"
        />
      </div>
      <div className="grid grid-cols-1 gap-x-4 gap-y-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
        <CText label="โทรศัพท์บ้าน" placeholder="0-0000-0000" bind={bind('phoneHome')} />
        <CText label="มือถือ" placeholder="08x-xxx-xxxx" bind={bind('phoneMobile')} />
        <CText
          label="เบอร์โทรศัพท์ที่ทำงาน"
          placeholder="0-0000-0000"
          bind={bind('phoneWork')}
        />
        <CText
          label="E-mail"
          type="email"
          placeholder="name@email.com"
          bind={bind('email')}
        />
        <CText label="เลขที่ Passport" placeholder="Passport" bind={bind('passport')} />
        <CText label="เลขที่อ้างอิง" placeholder="Reference" bind={bind('refNo')} />
        <CSelect label="ภาษาหลัก" options={O.language} bind={bind('language')} />
        <CSelect label="สีผิว" options={O.skin} bind={bind('skin')} />
        <CText label="ชื่อเล่น" placeholder="ชื่อเล่น" bind={bind('nickname')} />
        <CText label="ที่ทำงาน" placeholder="สถานที่ทำงาน" bind={bind('workplace')} />
      </div>
    </div>
  )
}

/* ───────────────────── สิทธิการรักษา (Delphi: OPDCard Pttype) ───────────────────── */

interface RightEntry {
  id: number
  code: string
  name: string
  no: string
  begin: string
  expire: string
}

/* แต่ละสิทธิมีรหัสประจำ — เลือกชื่อสิทธิแล้วเติมรหัสให้อัตโนมัติ */
const RIGHTS = [
  { code: '01', name: 'ชำระเงินเอง' },
  { code: '10', name: 'หลักประกันสุขภาพถ้วนหน้า (บัตรทอง)' },
  { code: '20', name: 'ประกันสังคม' },
  { code: '30', name: 'ข้าราชการ / รัฐวิสาหกิจ (เบิกจ่ายตรง)' },
  { code: '40', name: 'ประกันสุขภาพแรงงานต่างด้าว' },
  { code: '50', name: 'พ.ร.บ. ผู้ประสบภัยจากรถ' },
  { code: '60', name: 'ชำระโดยต้นสังกัด' },
  { code: '99', name: 'สิทธิว่าง' },
]

const RIGHTS_OPTIONS = [
  { value: '', label: '— เลือก —' },
  ...RIGHTS.map((r) => ({ value: r.name, label: r.name })),
]

const TH_MON_ABBR = [
  'ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.',
  'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.',
]

function fmtThaiDate(v: string) {
  if (!v) return '—'
  const d = new Date(`${v}T00:00:00`)
  return `${d.getDate()} ${TH_MON_ABBR[d.getMonth()]} ${d.getFullYear() + 543}`
}

function RightsTab({ seed }: { seed: RightEntry[] }) {
  const [list, setList] = useState<RightEntry[]>(seed)
  const [draft, setDraft] = useState<Record<string, string>>({})
  const [open, setOpen] = useState(false)
  const [editId, setEditId] = useState<number | null>(null)
  const toast = useToast()
  const today = new Date().toISOString().slice(0, 10)

  const dbind = (name: string): Bind => ({
    value: draft[name] ?? '',
    onChange: (e) => setDraft((d) => ({ ...d, [name]: e.target.value })),
  })

  const openAdd = () => {
    setEditId(null)
    setDraft({})
    setOpen(true)
  }

  const openEdit = (r: RightEntry) => {
    setEditId(r.id)
    setDraft({
      code: r.code,
      name: r.name,
      no: r.no,
      begin: r.begin,
      expire: r.expire,
    })
    setOpen(true)
  }

  const save = () => {
    if (!draft.name) {
      toast.warning('กรอกข้อมูลไม่ครบ', 'กรุณาระบุชื่อสิทธิการรักษา')
      return
    }
    const entry = {
      code: draft.code ?? '',
      name: draft.name ?? '',
      no: draft.no ?? '',
      begin: draft.begin ?? '',
      expire: draft.expire ?? '',
    }
    if (editId != null) {
      setList((l) => l.map((x) => (x.id === editId ? { ...x, ...entry } : x)))
      toast.edit('แก้ไขสิทธิสำเร็จ', 'อัปเดตข้อมูลสิทธิการรักษาแล้ว')
    } else {
      setList((l) => [...l, { id: Date.now(), ...entry }])
      toast.add('เพิ่มสิทธิสำเร็จ', 'บันทึกสิทธิการรักษาใหม่แล้ว')
    }
    setOpen(false)
  }

  return (
    <div className="space-y-4 xl:h-full xl:overflow-y-auto xl:pb-2">
      <Panel
        title="รายการสิทธิการรักษา"
        desc={`ผู้ป่วยมีสิทธิการรักษาทั้งหมด ${list.length} รายการ`}
        icon={ShieldCheck}
        action={
          <Button
            variant="accent"
            size="sm"
            leftIcon={<Plus className="h-3.5 w-3.5" />}
            onClick={openAdd}
          >
            เพิ่มสิทธิ
          </Button>
        }
      >
        {list.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-12 text-center">
            <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-500">
              <ShieldCheck className="h-6 w-6" />
            </div>
            <p className="mt-3 max-w-xs text-[13px] text-ink-500">
              ยังไม่มีรายการสิทธิการรักษา — กดปุ่ม “เพิ่มสิทธิ” เพื่อเพิ่มรายการ
            </p>
          </div>
        ) : (
          <div className="overflow-hidden rounded-xl border border-ink-900/[0.07]">
            <table className="w-full text-left">
              <thead>
                <tr className="bg-ink-900/[0.03] text-[11.5px] font-semibold text-ink-500">
                  <th className="px-3 py-2.5">ชื่อสิทธิการรักษา</th>
                  <th className="px-3 py-2.5">เลขที่สิทธิ</th>
                  <th className="px-3 py-2.5">วันเริ่มใช้</th>
                  <th className="px-3 py-2.5">วันหมดอายุ</th>
                  <th className="px-3 py-2.5">สถานะ</th>
                  <th className="w-[88px] px-3 py-2.5" />
                </tr>
              </thead>
              <tbody>
                {list.map((r) => {
                  const expired = !!r.expire && r.expire < today
                  return (
                    <tr
                      key={r.id}
                      className="border-t border-ink-900/[0.06] text-[12.5px] text-ink-800"
                    >
                      <td className="px-3 py-2.5 font-medium">{r.name}</td>
                      <td className="px-3 py-2.5">{r.no || '—'}</td>
                      <td className="px-3 py-2.5">{fmtThaiDate(r.begin)}</td>
                      <td className="px-3 py-2.5">{fmtThaiDate(r.expire)}</td>
                      <td className="px-3 py-2.5">
                        <span
                          className={cn(
                            'inline-flex rounded-full px-2 py-0.5 text-[11px] font-semibold',
                            expired
                              ? 'bg-rose-500/15 text-rose-700'
                              : 'bg-emerald-500/15 text-emerald-700'
                          )}
                        >
                          {expired ? 'หมดอายุ' : 'ใช้งานได้'}
                        </span>
                      </td>
                      <td className="px-3 py-2.5">
                        <div className="flex items-center justify-end gap-1">
                          <button
                            type="button"
                            onClick={() => openEdit(r)}
                            className="inline-flex h-7 w-7 items-center justify-center rounded-lg text-ink-400 transition-colors hover:bg-brand-500/10 hover:text-brand-600"
                          >
                            <Pencil className="h-3.5 w-3.5" />
                          </button>
                          <button
                            type="button"
                            onClick={() => {
                              setList((l) => l.filter((x) => x.id !== r.id))
                              toast.remove(
                                'ลบสิทธิสำเร็จ',
                                'ลบสิทธิการรักษาออกจากรายการแล้ว'
                              )
                            }}
                            className="inline-flex h-7 w-7 items-center justify-center rounded-lg text-ink-400 transition-colors hover:bg-rose-500/10 hover:text-rose-600"
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </Panel>

      {/* add-entitlement popup */}
      <Modal
        open={open}
        onClose={() => setOpen(false)}
        title={editId == null ? 'เพิ่มสิทธิการรักษา' : 'แก้ไขสิทธิการรักษา'}
        description="กรอกข้อมูลสิทธิการรักษาของผู้ป่วย"
        icon={ShieldCheck}
        size="lg"
        footer={
          <>
            <Button
              variant="secondary"
              size="sm"
              className="mr-auto border-0 bg-brand-500/10 text-brand-700 shadow-none hover:bg-brand-500/20"
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
            <Button variant="ghost" size="sm" onClick={() => setOpen(false)}>
              ยกเลิก
            </Button>
            <Button
              variant="primary"
              size="sm"
              leftIcon={<Save className="h-3.5 w-3.5" />}
              onClick={save}
            >
              บันทึก
            </Button>
          </>
        }
      >
        <div className="grid grid-cols-1 gap-x-4 gap-y-4 sm:grid-cols-2">
          <CText label="รหัสสิทธิ" placeholder="รหัสสิทธิ" bind={dbind('code')} />
          <CText
            label="เลขที่สิทธิ"
            placeholder="เลขที่บัตร / เลขที่สิทธิ"
            bind={dbind('no')}
          />
          <CSelect
            className="sm:col-span-2"
            label="ชื่อสิทธิ"
            options={RIGHTS_OPTIONS}
            required
            bind={{
              value: draft.name ?? '',
              onChange: (e) => {
                const name = e.target.value
                const found = RIGHTS.find((r) => r.name === name)
                setDraft((d) => ({ ...d, name, code: found?.code ?? '' }))
              },
            }}
          />
          <CDate label="วันเริ่มใช้" bind={dbind('begin')} />
          <CDate label="วันหมดอายุ" bind={dbind('expire')} />
        </div>
      </Modal>
    </div>
  )
}

/* ───────────────────── แพ้ยา (Delphi: OPDAllergy) ───────────────────── */

interface AllergyEntry {
  id: number
  data: Record<string, string>
  flags: Record<string, boolean>
}

const ALG = {
  type: pick([
    'แพ้ยา',
    'อาการไม่พึงประสงค์จากยา (ADR)',
    'แพ้สารทึบรังสี',
    'แพ้วัคซีน',
    'อื่นๆ',
  ]),
  seriousness: pick([
    'ไม่ร้ายแรง',
    'ร้ายแรง — ต้องรักษา',
    'ร้ายแรง — ต้องนอนโรงพยาบาล',
    'อันตรายถึงชีวิต',
    'เสียชีวิต',
  ]),
  relation: pick([
    'ใช่แน่นอน (Certain)',
    'น่าจะใช่ (Probable)',
    'อาจจะใช่ (Possible)',
    'ไม่น่าใช่ (Unlikely)',
    'ประเมินไม่ได้',
  ]),
  result: pick([
    'หายเป็นปกติ',
    'หายโดยมีร่องรอย',
    'อาการดีขึ้น',
    'ยังไม่หาย',
    'เสียชีวิต',
    'ไม่ทราบผล',
  ]),
  mechanism: pick([
    'ภูมิแพ้ (Allergy)',
    'พิษจากยา (Toxic)',
    'ผลข้างเคียง (Side effect)',
    'ปฏิกิริยาระหว่างยา',
    'ไม่ทราบ',
  ]),
  alert: pick(['เตือนเมื่อสั่งใช้', 'เตือนและต้องยืนยัน', 'ห้ามสั่งจ่าย', 'ไม่เตือน']),
  dept: pick([
    'อายุรกรรม',
    'ศัลยกรรม',
    'กุมารเวชกรรม',
    'สูติ-นรีเวชกรรม',
    'ห้องฉุกเฉิน',
    'เภสัชกรรม',
    'อื่นๆ',
  ]),
  source: pick(['ผู้ป่วยแจ้ง', 'ญาติแจ้ง', 'เวชระเบียน', 'บัตรแพ้ยา', 'โรงพยาบาลอื่น']),
}

/* รายชื่อยาสามัญที่พบการแพ้บ่อย */
const DRUG_OPTIONS = pick([
  'Amoxicillin',
  'Ampicillin',
  'Penicillin',
  'Cloxacillin',
  'Cephalexin',
  'Ceftriaxone',
  'Cotrimoxazole',
  'Sulfonamide (ซัลฟา)',
  'Tetracycline',
  'Doxycycline',
  'Ciprofloxacin',
  'Norfloxacin',
  'Erythromycin',
  'Azithromycin',
  'Clindamycin',
  'Metronidazole',
  'Vancomycin',
  'Gentamicin',
  'Aspirin',
  'Ibuprofen',
  'Diclofenac',
  'Mefenamic acid',
  'Paracetamol',
  'Tramadol',
  'Morphine',
  'Codeine',
  'Phenytoin',
  'Carbamazepine',
  'Allopurinol',
  'สารทึบรังสี (Contrast media)',
  'อินซูลิน (Insulin)',
  'อื่นๆ',
])

function DrugAllergyTab({ seed }: { seed: AllergyEntry[] }) {
  const [list, setList] = useState<AllergyEntry[]>(seed)
  const [draft, setDraft] = useState<Record<string, string>>({})
  const [dflags, setDflags] = useState<Record<string, boolean>>({})
  const [open, setOpen] = useState(false)
  const [editId, setEditId] = useState<number | null>(null)
  const toast = useToast()

  const dbind = (name: string): Bind => ({
    value: draft[name] ?? '',
    onChange: (e) => setDraft((d) => ({ ...d, [name]: e.target.value })),
  })
  const dtoggle = (name: string) => setDflags((f) => ({ ...f, [name]: !f[name] }))

  const openAdd = () => {
    setEditId(null)
    setDraft({})
    setDflags({})
    setOpen(true)
  }
  const openEdit = (e: AllergyEntry) => {
    setEditId(e.id)
    setDraft({ ...e.data })
    setDflags({ ...e.flags })
    setOpen(true)
  }
  const save = () => {
    if (!draft.drug) {
      toast.warning('กรอกข้อมูลไม่ครบ', 'กรุณาระบุชื่อยาที่แพ้')
      return
    }
    if (editId != null) {
      setList((l) =>
        l.map((x) =>
          x.id === editId
            ? { ...x, data: { ...draft }, flags: { ...dflags } }
            : x
        )
      )
      toast.edit('แก้ไขประวัติแพ้ยาสำเร็จ', 'อัปเดตข้อมูลการแพ้ยาแล้ว')
    } else {
      setList((l) => [
        ...l,
        { id: Date.now(), data: { ...draft }, flags: { ...dflags } },
      ])
      toast.add('เพิ่มประวัติแพ้ยาสำเร็จ', 'บันทึกรายการแพ้ยาใหม่แล้ว')
    }
    setOpen(false)
  }

  return (
    <div className="space-y-4 xl:h-full xl:overflow-y-auto xl:pb-2">
      <Panel
        title="รายการแพ้ยา"
        desc={`ผู้ป่วยมีประวัติแพ้ยาทั้งหมด ${list.length} รายการ`}
        icon={Pill}
        action={
          <Button
            variant="accent"
            size="sm"
            leftIcon={<Plus className="h-3.5 w-3.5" />}
            onClick={openAdd}
          >
            เพิ่มรายการแพ้ยา
          </Button>
        }
      >
        {list.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-12 text-center">
            <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-500">
              <Pill className="h-6 w-6" />
            </div>
            <p className="mt-3 max-w-xs text-[13px] text-ink-500">
              ยังไม่มีประวัติการแพ้ยา — กดปุ่ม “เพิ่มรายการแพ้ยา” เพื่อบันทึก
            </p>
          </div>
        ) : (
          <div className="overflow-hidden rounded-xl border border-ink-900/[0.07]">
            <table className="w-full text-left">
              <thead>
                <tr className="bg-ink-900/[0.03] text-[11.5px] font-semibold text-ink-500">
                  <th className="px-3 py-2.5">ยาที่แพ้</th>
                  <th className="px-3 py-2.5">อาการที่แพ้</th>
                  <th className="px-3 py-2.5">ความร้ายแรง</th>
                  <th className="px-3 py-2.5">วันที่รายงาน</th>
                  <th className="px-3 py-2.5">ผู้รายงาน</th>
                  <th className="w-[88px] px-3 py-2.5" />
                </tr>
              </thead>
              <tbody>
                {list.map((e) => {
                  const s = e.data.seriousness ?? ''
                  const severe = !!s && s !== 'ไม่ร้ายแรง'
                  return (
                    <tr
                      key={e.id}
                      className="border-t border-ink-900/[0.06] text-[12.5px] text-ink-800"
                    >
                      <td className="px-3 py-2.5">
                        <div className="flex items-center gap-1.5">
                          <span className="font-medium">{e.data.drug}</span>
                          {e.flags.banned && (
                            <span className="rounded-full bg-rose-500/15 px-1.5 py-0.5 text-[10px] font-semibold text-rose-700">
                              ห้ามสั่ง
                            </span>
                          )}
                        </div>
                      </td>
                      <td className="px-3 py-2.5">{e.data.symptom || '—'}</td>
                      <td className="px-3 py-2.5">
                        {s ? (
                          <span
                            className={cn(
                              'inline-flex rounded-full px-2 py-0.5 text-[11px] font-semibold',
                              severe
                                ? 'bg-rose-500/15 text-rose-700'
                                : 'bg-emerald-500/15 text-emerald-700'
                            )}
                          >
                            {s}
                          </span>
                        ) : (
                          '—'
                        )}
                      </td>
                      <td className="px-3 py-2.5">{fmtThaiDate(e.data.reportDate)}</td>
                      <td className="px-3 py-2.5">{e.data.reporter || '—'}</td>
                      <td className="px-3 py-2.5">
                        <div className="flex items-center justify-end gap-1">
                          <button
                            type="button"
                            onClick={() => openEdit(e)}
                            className="inline-flex h-7 w-7 items-center justify-center rounded-lg text-ink-400 transition-colors hover:bg-brand-500/10 hover:text-brand-600"
                          >
                            <Pencil className="h-3.5 w-3.5" />
                          </button>
                          <button
                            type="button"
                            onClick={() => {
                              setList((l) => l.filter((x) => x.id !== e.id))
                              toast.remove(
                                'ลบประวัติแพ้ยาสำเร็จ',
                                'ลบรายการแพ้ยาออกจากเวชระเบียนแล้ว'
                              )
                            }}
                            className="inline-flex h-7 w-7 items-center justify-center rounded-lg text-ink-400 transition-colors hover:bg-rose-500/10 hover:text-rose-600"
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </Panel>

      {/* add-allergy popup */}
      <Modal
        open={open}
        onClose={() => setOpen(false)}
        title={editId == null ? 'เพิ่มรายการแพ้ยา' : 'แก้ไขรายการแพ้ยา'}
        description="บันทึกประวัติการแพ้ยาของผู้ป่วย"
        icon={Pill}
        size="xl"
        footer={
          <>
            <Button variant="ghost" size="sm" onClick={() => setOpen(false)}>
              ยกเลิก
            </Button>
            <Button
              variant="primary"
              size="sm"
              leftIcon={<Save className="h-3.5 w-3.5" />}
              onClick={save}
            >
              บันทึก
            </Button>
          </>
        }
      >
        <div className="grid grid-cols-1 gap-x-4 gap-y-3.5 sm:grid-cols-2 lg:grid-cols-3">
          <CDate label="วันที่มีรายงาน" bind={dbind('reportDate')} />
          <CDate label="วันที่มีอาการ" bind={dbind('onsetDate')} />
          <CText label="ผู้รายงาน" placeholder="ชื่อผู้รายงาน" bind={dbind('reporter')} />
          <CSelect
            className="sm:col-span-2"
            label="ยาที่แพ้ (ชื่อสามัญ)"
            options={DRUG_OPTIONS}
            bind={dbind('drug')}
            required
          />
          <CSelect label="ชนิดการแพ้" options={ALG.type} bind={dbind('type')} />
          <CText
            className="sm:col-span-2 lg:col-span-3"
            label="อาการที่แพ้"
            placeholder="เช่น ผื่นคัน ลมพิษ หน้าบวม หายใจลำบาก"
            bind={dbind('symptom')}
            required
          />
          <CSelect
            label="ความร้ายแรง"
            options={ALG.seriousness}
            bind={dbind('seriousness')}
            required
          />
          <CSelect label="ระดับความสัมพันธ์" options={ALG.relation} bind={dbind('relation')} />
          <CSelect label="ผลที่เกิดขึ้นภายหลัง" options={ALG.result} bind={dbind('result')} />
          <CSelect label="สาเหตุการเกิด" options={ALG.mechanism} bind={dbind('mechanism')} />
          <CSelect label="การเตือน" options={ALG.alert} bind={dbind('alert')} />
          <CSelect label="แผนก" options={ALG.dept} bind={dbind('dept')} />
          <CSelect label="แหล่งข้อมูล" options={ALG.source} bind={dbind('source')} />
          <CArea
            className="sm:col-span-2 lg:col-span-3"
            label="หมายเหตุ"
            rows={2}
            placeholder="รายละเอียดเพิ่มเติม"
            bind={dbind('note')}
          />
          <div className="flex flex-wrap gap-x-8 gap-y-2.5 rounded-xl glass-dim p-3 sm:col-span-2 lg:col-span-3">
            <CheckField
              checked={!!dflags.banned}
              onChange={() => dtoggle('banned')}
              label="ห้ามสั่งใช้ยานี้กับผู้ป่วย"
            />
            <CheckField
              checked={!!dflags.noAlert}
              onChange={() => dtoggle('noAlert')}
              label="ไม่ต้องเตือนการแพ้"
            />
          </div>
        </div>
      </Modal>
    </div>
  )
}

/* ───────────── generic list + add/edit-popup tab (Delphi list frames) ───────────── */

interface FieldDef {
  key: string
  label: string
  kind?: 'text' | 'select' | 'date' | 'time' | 'area' | 'check'
  options?: { value: string; label: string }[]
  placeholder?: string
  required?: boolean
  span?: 2 | 3
}
interface ColDef {
  key: string
  label: string
  date?: boolean
}
type ListRow = { id: number; data: Record<string, string> }

interface ListTabProps {
  title: string
  desc: (n: number) => string
  icon: LucideIcon
  emptyText: string
  columns: ColDef[]
  addLabel?: string
  fields?: FieldDef[]
  modalTitle?: { add: string; edit: string }
  modalDesc?: string
  modalSize?: 'md' | 'lg' | 'xl'
  readOnly?: boolean
  seed?: ListRow[]
}

function ListTab({
  title,
  desc,
  icon: Icon,
  emptyText,
  columns,
  addLabel = 'เพิ่มรายการ',
  fields = [],
  modalTitle = { add: 'เพิ่มรายการ', edit: 'แก้ไขรายการ' },
  modalDesc,
  modalSize = 'lg',
  readOnly,
  seed,
}: ListTabProps) {
  const [list, setList] = useState<ListRow[]>(seed ?? [])
  const [draft, setDraft] = useState<Record<string, string>>({})
  const [open, setOpen] = useState(false)
  const [editId, setEditId] = useState<number | null>(null)
  const toast = useToast()

  const dbind = (name: string): Bind => ({
    value: draft[name] ?? '',
    onChange: (e) => setDraft((d) => ({ ...d, [name]: e.target.value })),
  })

  const openAdd = () => {
    setEditId(null)
    setDraft({})
    setOpen(true)
  }
  const openEdit = (r: ListRow) => {
    setEditId(r.id)
    setDraft({ ...r.data })
    setOpen(true)
  }
  const reqKey = fields.find((f) => f.required)?.key
  const save = () => {
    if (reqKey && !draft[reqKey]) {
      toast.warning('กรอกข้อมูลไม่ครบ', 'กรุณากรอกข้อมูลในช่องที่จำเป็นให้ครบถ้วน')
      return
    }
    if (editId != null) {
      setList((l) =>
        l.map((x) => (x.id === editId ? { id: x.id, data: { ...draft } } : x))
      )
      toast.edit('แก้ไขรายการสำเร็จ', `อัปเดต${title}เรียบร้อยแล้ว`)
    } else {
      setList((l) => [...l, { id: Date.now(), data: { ...draft } }])
      toast.add('เพิ่มรายการสำเร็จ', `บันทึก${title}เพิ่มแล้ว`)
    }
    setOpen(false)
  }

  const renderField = (f: FieldDef) => {
    const span =
      f.span === 3
        ? 'sm:col-span-2 lg:col-span-3'
        : f.span === 2
          ? 'sm:col-span-2'
          : undefined
    if (f.kind === 'select')
      return (
        <CSelect
          key={f.key}
          className={span}
          label={f.label}
          required={f.required}
          options={f.options ?? []}
          bind={dbind(f.key)}
        />
      )
    if (f.kind === 'date')
      return (
        <CDate
          key={f.key}
          className={span}
          label={f.label}
          required={f.required}
          bind={dbind(f.key)}
        />
      )
    if (f.kind === 'time')
      return (
        <CTime
          key={f.key}
          className={span}
          label={f.label}
          required={f.required}
          bind={dbind(f.key)}
        />
      )
    if (f.kind === 'area')
      return (
        <CArea
          key={f.key}
          className={span}
          label={f.label}
          required={f.required}
          rows={3}
          placeholder={f.placeholder}
          bind={dbind(f.key)}
        />
      )
    if (f.kind === 'check')
      return (
        <div key={f.key} className={cn('flex items-end pb-2.5', span)}>
          <CheckField
            checked={draft[f.key] === '1'}
            onChange={() =>
              setDraft((d) => ({ ...d, [f.key]: d[f.key] === '1' ? '' : '1' }))
            }
            label={f.label}
          />
        </div>
      )
    return (
      <CText
        key={f.key}
        className={span}
        label={f.label}
        required={f.required}
        placeholder={f.placeholder}
        bind={dbind(f.key)}
      />
    )
  }

  return (
    <div className="space-y-4 xl:h-full xl:overflow-y-auto xl:pb-2">
      <Panel
        title={title}
        desc={desc(list.length)}
        icon={Icon}
        action={
          readOnly ? undefined : (
            <Button
              variant="accent"
              size="sm"
              leftIcon={<Plus className="h-3.5 w-3.5" />}
              onClick={openAdd}
            >
              {addLabel}
            </Button>
          )
        }
      >
        {list.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-12 text-center">
            <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-500">
              <Icon className="h-6 w-6" />
            </div>
            <p className="mt-3 max-w-xs text-[13px] text-ink-500">{emptyText}</p>
          </div>
        ) : (
          <div className="overflow-x-auto rounded-xl border border-ink-900/[0.07]">
            <table className="w-full text-left">
              <thead>
                <tr className="bg-ink-900/[0.03] text-[11.5px] font-semibold text-ink-500">
                  <th className="w-10 px-3 py-2.5">#</th>
                  {columns.map((c) => (
                    <th key={c.key} className="whitespace-nowrap px-3 py-2.5">
                      {c.label}
                    </th>
                  ))}
                  {!readOnly && <th className="w-[88px] px-3 py-2.5" />}
                </tr>
              </thead>
              <tbody>
                {list.map((r, i) => (
                  <tr
                    key={r.id}
                    className="border-t border-ink-900/[0.06] text-[12.5px] text-ink-800"
                  >
                    <td className="px-3 py-2.5 text-ink-400">{i + 1}</td>
                    {columns.map((c) => (
                      <td key={c.key} className="px-3 py-2.5">
                        {c.date
                          ? fmtThaiDate(r.data[c.key] ?? '')
                          : r.data[c.key] || '—'}
                      </td>
                    ))}
                    {!readOnly && (
                      <td className="px-3 py-2.5">
                        <div className="flex items-center justify-end gap-1">
                          <button
                            type="button"
                            onClick={() => openEdit(r)}
                            className="inline-flex h-7 w-7 items-center justify-center rounded-lg text-ink-400 transition-colors hover:bg-brand-500/10 hover:text-brand-600"
                          >
                            <Pencil className="h-3.5 w-3.5" />
                          </button>
                          <button
                            type="button"
                            onClick={() => {
                              setList((l) => l.filter((x) => x.id !== r.id))
                              toast.remove(
                                'ลบรายการสำเร็จ',
                                `ลบรายการออกจาก${title}แล้ว`
                              )
                            }}
                            className="inline-flex h-7 w-7 items-center justify-center rounded-lg text-ink-400 transition-colors hover:bg-rose-500/10 hover:text-rose-600"
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </button>
                        </div>
                      </td>
                    )}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </Panel>

      {!readOnly && (
        <Modal
          open={open}
          onClose={() => setOpen(false)}
          title={editId == null ? modalTitle.add : modalTitle.edit}
          description={modalDesc}
          icon={Icon}
          size={modalSize}
          footer={
            <>
              <Button variant="ghost" size="sm" onClick={() => setOpen(false)}>
                ยกเลิก
              </Button>
              <Button
                variant="primary"
                size="sm"
                leftIcon={<Save className="h-3.5 w-3.5" />}
                onClick={save}
              >
                บันทึก
              </Button>
            </>
          }
        >
          <div className="grid grid-cols-1 gap-x-4 gap-y-3.5 sm:grid-cols-2 lg:grid-cols-3">
            {fields.map(renderField)}
          </div>
        </Modal>
      )}
    </div>
  )
}

/* ───────────── per-tab configs (Delphi list frames) ───────────── */

const LIST_TABS: Record<string, ListTabProps> = {
  chronic: {
    title: 'รายการโรคประจำตัว',
    desc: (n) => `ผู้ป่วยมีโรคประจำตัวทั้งหมด ${n} รายการ`,
    icon: HeartPulse,
    addLabel: 'เพิ่มโรคประจำตัว',
    emptyText: 'ยังไม่มีข้อมูลโรคประจำตัว — กดปุ่ม “เพิ่มโรคประจำตัว”',
    seed: [
      { id: 1, data: { name: 'เบาหวานชนิดที่ 2', icd: 'E11', note: 'ควบคุมด้วยยา Metformin' } },
      { id: 2, data: { name: 'ความดันโลหิตสูง', icd: 'I10', note: 'ตรวจติดตามทุก 3 เดือน' } },
    ],
    modalTitle: { add: 'เพิ่มโรคประจำตัว', edit: 'แก้ไขโรคประจำตัว' },
    modalDesc: 'กรอกข้อมูลโรคประจำตัวของผู้ป่วย',
    columns: [
      { key: 'name', label: 'โรคประจำตัว' },
      { key: 'icd', label: 'รหัส ICD-10' },
      { key: 'note', label: 'หมายเหตุ' },
    ],
    fields: [
      { key: 'name', label: 'ชื่อโรคประจำตัว', span: 2, required: true, placeholder: 'เช่น เบาหวาน ความดันโลหิตสูง' },
      { key: 'icd', label: 'รหัส ICD-10', placeholder: 'เช่น E11' },
      { key: 'note', label: 'หมายเหตุ', kind: 'area', span: 3, placeholder: 'รายละเอียดเพิ่มเติม' },
    ],
  },
  'food-allergy': {
    title: 'รายการแพ้อาหาร',
    desc: (n) => `ผู้ป่วยมีประวัติแพ้อาหารทั้งหมด ${n} รายการ`,
    icon: Apple,
    addLabel: 'เพิ่มรายการแพ้อาหาร',
    emptyText: 'ยังไม่มีประวัติการแพ้อาหาร — กดปุ่ม “เพิ่มรายการแพ้อาหาร”',
    seed: [
      {
        id: 1,
        data: {
          food: 'อาหารทะเล (กุ้ง)',
          symptom: 'ผื่นคัน ปากบวม',
          note: 'หลีกเลี่ยงกุ้งและหอย',
        },
      },
    ],
    modalTitle: { add: 'เพิ่มรายการแพ้อาหาร', edit: 'แก้ไขรายการแพ้อาหาร' },
    modalDesc: 'บันทึกประวัติการแพ้อาหารของผู้ป่วย',
    columns: [
      { key: 'food', label: 'อาหารที่แพ้' },
      { key: 'symptom', label: 'อาการ' },
      { key: 'note', label: 'หมายเหตุ' },
    ],
    fields: [
      { key: 'food', label: 'ชื่ออาหารที่แพ้', span: 2, required: true, placeholder: 'เช่น อาหารทะเล ถั่ว นมวัว' },
      { key: 'symptom', label: 'อาการที่แพ้', placeholder: 'เช่น ผื่นคัน บวม' },
      { key: 'note', label: 'หมายเหตุ', kind: 'area', span: 3, placeholder: 'รายละเอียดเพิ่มเติม' },
    ],
  },
  special: {
    title: 'รายการสถานะพิเศษ',
    desc: (n) => `ผู้ป่วยมีสถานะพิเศษทั้งหมด ${n} รายการ`,
    icon: Star,
    addLabel: 'เพิ่มสถานะพิเศษ',
    emptyText: 'ยังไม่มีข้อมูลสถานะพิเศษ — กดปุ่ม “เพิ่มสถานะพิเศษ”',
    seed: [
      {
        id: 1,
        data: {
          status: 'ผู้ป่วยเรื้อรัง',
          note: 'เบาหวานและความดันโลหิตสูง',
        },
      },
    ],
    modalTitle: { add: 'เพิ่มสถานะพิเศษ', edit: 'แก้ไขสถานะพิเศษ' },
    modalDesc: 'กรอกข้อมูลสถานะพิเศษของผู้ป่วย',
    columns: [
      { key: 'status', label: 'สถานะพิเศษ' },
      { key: 'note', label: 'หมายเหตุ' },
    ],
    fields: [
      {
        key: 'status',
        label: 'สถานะพิเศษ',
        kind: 'select',
        required: true,
        options: pick([
          'ผู้สูงอายุ',
          'ผู้พิการ',
          'ผู้ป่วยเรื้อรัง',
          'ผู้ป่วยติดเตียง',
          'หญิงตั้งครรภ์',
          'พระภิกษุ / สามเณร',
          'ทหารผ่านศึก',
          'บุคคลสำคัญ (VIP)',
          'อื่นๆ',
        ]),
      },
      { key: 'note', label: 'หมายเหตุ', kind: 'area', span: 3, placeholder: 'รายละเอียดเพิ่มเติม' },
    ],
  },
  confidential: {
    title: 'รายการข้อมูลปกปิด',
    desc: (n) => `มีข้อมูลปกปิดทั้งหมด ${n} รายการ`,
    icon: Lock,
    addLabel: 'เพิ่มข้อมูลปกปิด',
    emptyText: 'ยังไม่มีข้อมูลปกปิด — กดปุ่ม “เพิ่มข้อมูลปกปิด”',
    seed: [
      {
        id: 1,
        data: {
          text: 'ผู้ป่วยขอปกปิดประวัติการรักษาบางส่วนจากบุคคลภายนอก',
        },
      },
    ],
    modalTitle: { add: 'เพิ่มข้อมูลปกปิด', edit: 'แก้ไขข้อมูลปกปิด' },
    modalDesc: 'ระบุข้อมูลที่ต้องการปกปิดจากการแสดงผล',
    modalSize: 'lg',
    columns: [{ key: 'text', label: 'รายละเอียด' }],
    fields: [
      {
        key: 'text',
        label: 'รายละเอียดข้อมูลปกปิด',
        kind: 'area',
        span: 3,
        required: true,
        placeholder: 'ระบุข้อมูลที่ต้องการปกปิดจากการแสดงผลทั่วไป',
      },
    ],
  },
  appointment: {
    title: 'รายการนัดหมาย',
    desc: (n) => `ผู้ป่วยมีนัดหมายทั้งหมด ${n} รายการ`,
    icon: CalendarDays,
    emptyText: 'ยังไม่มีรายการนัดหมาย',
    seed: [
      {
        id: 1,
        data: {
          status: 'รอมาตามนัด',
          visitDate: '2026-05-12',
          nextDate: '2026-08-12',
          nextTime: '09:00',
          doctor: 'พญ. นพมาศ ใจดี',
          clinic: 'คลินิกเบาหวาน',
          cause: 'ติดตามระดับน้ำตาลในเลือด',
        },
      },
      {
        id: 2,
        data: {
          status: 'มาตามนัด',
          visitDate: '2026-02-12',
          nextDate: '2026-05-12',
          nextTime: '09:00',
          doctor: 'พญ. นพมาศ ใจดี',
          clinic: 'คลินิกเบาหวาน',
          cause: 'ติดตามอาการ',
        },
      },
    ],
    readOnly: true,
    columns: [
      { key: 'status', label: 'สถานะ' },
      { key: 'visitDate', label: 'วันที่มารับบริการ', date: true },
      { key: 'nextDate', label: 'วันนัดถัดไป', date: true },
      { key: 'nextTime', label: 'เวลานัด' },
      { key: 'doctor', label: 'ผู้นัดหมาย' },
      { key: 'clinic', label: 'คลินิก' },
      { key: 'cause', label: 'เหตุที่นัด' },
    ],
  },
  note: {
    title: 'บันทึก Note',
    desc: (n) => `มีบันทึกทั้งหมด ${n} รายการ`,
    icon: StickyNote,
    addLabel: 'เพิ่ม Note',
    emptyText: 'ยังไม่มีบันทึก — กดปุ่ม “เพิ่ม Note”',
    seed: [
      {
        id: 1,
        data: {
          date: '2026-05-20',
          author: 'พญ. นพมาศ ใจดี',
          note: 'ผู้ป่วยให้ความร่วมมือดี นัดติดตามอาการเบาหวานทุก 3 เดือน',
        },
      },
    ],
    modalTitle: { add: 'เพิ่ม Note', edit: 'แก้ไข Note' },
    modalDesc: 'บันทึกข้อความสำหรับผู้ป่วยรายนี้',
    columns: [
      { key: 'date', label: 'วันที่', date: true },
      { key: 'author', label: 'ผู้เขียน' },
      { key: 'note', label: 'Note' },
    ],
    fields: [
      { key: 'date', label: 'วันที่', kind: 'date' },
      { key: 'author', label: 'ผู้เขียน', placeholder: 'ชื่อผู้เขียน' },
      { key: 'note', label: 'ข้อความ Note', kind: 'area', span: 3, required: true, placeholder: 'บันทึกข้อความ' },
    ],
  },
  caregiver: {
    title: 'รายการผู้ดูแล',
    desc: (n) => `ผู้ป่วยมีผู้ดูแลทั้งหมด ${n} คน`,
    icon: Users,
    addLabel: 'เพิ่มผู้ดูแล',
    emptyText: 'ยังไม่มีข้อมูลผู้ดูแล — กดปุ่ม “เพิ่มผู้ดูแล”',
    seed: [
      {
        id: 1,
        data: {
          relation: 'คู่สมรส',
          prefix: 'นาง',
          name: 'สมหญิง',
          lastName: 'ใจดี',
          cid: '1-4099-00567-89-0',
          phone: '089-555-6666',
          address: '79 หมู่ 4 ต.ห้วยโพธิ์ อ.เมืองกาฬสินธุ์ จ.กาฬสินธุ์ 46000',
        },
      },
    ],
    modalTitle: { add: 'เพิ่มผู้ดูแล', edit: 'แก้ไขผู้ดูแล' },
    modalDesc: 'กรอกข้อมูลผู้ดูแลสุขภาพของผู้ป่วย',
    modalSize: 'xl',
    columns: [
      { key: 'relation', label: 'ความเกี่ยวข้อง' },
      { key: 'name', label: 'ชื่อ' },
      { key: 'lastName', label: 'นามสกุล' },
      { key: 'cid', label: 'เลข 13 หลัก' },
      { key: 'phone', label: 'เบอร์โทรศัพท์' },
    ],
    fields: [
      { key: 'relation', label: 'ความสัมพันธ์กับผู้ป่วย', kind: 'select', required: true, options: O.relation },
      { key: 'prefix', label: 'คำนำหน้า', kind: 'select', options: O.prefix },
      { key: 'cid', label: 'เลขบัตรประชาชน', placeholder: '13 หลัก' },
      { key: 'name', label: 'ชื่อ', required: true, placeholder: 'ชื่อจริง' },
      { key: 'lastName', label: 'นามสกุล', placeholder: 'นามสกุล' },
      { key: 'birthdate', label: 'วันเกิด', kind: 'date' },
      { key: 'phone', label: 'เบอร์โทรศัพท์', placeholder: '08x-xxx-xxxx' },
      { key: 'address', label: 'ที่อยู่', kind: 'area', span: 3, placeholder: 'ที่อยู่ผู้ดูแล' },
      { key: 'note', label: 'หมายเหตุ', kind: 'area', span: 3, placeholder: 'รายละเอียดเพิ่มเติม' },
    ],
  },
}
