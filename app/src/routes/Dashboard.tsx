import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  Activity,
  AlertTriangle,
  ArrowDownRight,
  ArrowUpRight,
  BellRing,
  CalendarCheck,
  CalendarClock,
  CheckCheck,
  Clock3,
  FlaskConical,
  Hourglass,
  Pill,
  Plus,
  ShieldCheck,
  Stethoscope,
  Timer,
  UserPlus,
  Users,
} from 'lucide-react'
import { Badge } from '@/components/ui/Badge'
import { Avatar } from '@/components/ui/Avatar'
import { useToast, type ToastTone } from '@/components/ui/Toast'
import { dashboardStats, visits } from '@/data/mockData'
import { cn, formatTime } from '@/lib/utils'
import { useCountUp } from '@/hooks/useCountUp'

type Tone = 'brand' | 'sky' | 'emerald' | 'amber' | 'violet' | 'rose'

const DOCTOR_NAME = 'พญ. นพมาศ ใจดี'

/* Smooth eased fade — blends the hero image bottom into the panel with no
   perceptible kink (many stops approximate an ease curve) */
const HERO_FADE =
  'linear-gradient(to bottom, #000 0%, #000 48%, rgba(0,0,0,0.985) 55%, rgba(0,0,0,0.95) 62%, rgba(0,0,0,0.88) 68%, rgba(0,0,0,0.76) 74%, rgba(0,0,0,0.6) 80%, rgba(0,0,0,0.42) 86%, rgba(0,0,0,0.24) 91%, rgba(0,0,0,0.1) 96%, rgba(0,0,0,0) 100%)'

function greeting(): string {
  const h = new Date().getHours()
  if (h < 12) return 'สวัสดีตอนเช้า'
  if (h < 17) return 'สวัสดีตอนบ่าย'
  return 'สวัสดีตอนเย็น'
}

/* ── KPI cards ──────────────────────────────────────────── */
const kpis: {
  label: string
  value: number
  suffix: string
  tone: Tone
  icon: React.ComponentType<{ className?: string }>
  trend: { text: string; dir: 'up' | 'down' }
  description: string
  to: string
}[] = [
  {
    label: 'ผู้ป่วยวันนี้',
    value: dashboardStats.todayVisits,
    suffix: '',
    tone: 'brand',
    icon: Users,
    trend: { text: '12%', dir: 'up' },
    description: 'มากกว่าเมื่อวาน 9 ราย',
    to: '/visit',
  },
  {
    label: 'รอตรวจ',
    value: dashboardStats.waitingPatients,
    suffix: '',
    tone: 'amber',
    icon: Hourglass,
    trend: { text: '15%', dir: 'down' },
    description: 'คิวลดลงจากชั่วโมงก่อน',
    to: '/visit',
  },
  {
    label: 'ตรวจเสร็จแล้ว',
    value: dashboardStats.completedVisits,
    suffix: '',
    tone: 'emerald',
    icon: CalendarCheck,
    trend: { text: '8%', dir: 'up' },
    description: '74% ของผู้ป่วยวันนี้',
    to: '/visit',
  },
  {
    label: 'นัดหมายวันนี้',
    value: dashboardStats.appointments,
    suffix: '',
    tone: 'violet',
    icon: CalendarClock,
    trend: { text: '5%', dir: 'up' },
    description: '6 รายการรอยืนยัน',
    to: '/appointment',
  },
  {
    label: 'ผู้ป่วยใหม่',
    value: dashboardStats.newPatients,
    suffix: '',
    tone: 'sky',
    icon: UserPlus,
    trend: { text: '2 ราย', dir: 'up' },
    description: 'ลงทะเบียนเข้าระบบวันนี้',
    to: '/registry',
  },
  {
    label: 'เวลารอเฉลี่ย',
    value: dashboardStats.avgWaitMinutes,
    suffix: 'นาที',
    tone: 'rose',
    icon: Timer,
    trend: { text: '3 นาที', dir: 'down' },
    description: 'เร็วขึ้นกว่าเมื่อวาน',
    to: '/visit',
  },
]

/* ── Notifications ──────────────────────────────────────── */
const notifications: {
  id: number
  icon: React.ComponentType<{ className?: string }>
  tone: Tone
  title: string
  desc: string
  time: string
  unread: boolean
}[] = [
  {
    id: 1,
    icon: UserPlus,
    tone: 'brand',
    title: 'ผู้ป่วยใหม่เข้าคิว',
    desc: 'นาย อนุชา พงศ์สถาพร · คิว A-031',
    time: '2 นาทีที่แล้ว',
    unread: true,
  },
  {
    id: 2,
    icon: AlertTriangle,
    tone: 'rose',
    title: 'แจ้งเตือนแพ้ยา',
    desc: 'นาง สมหญิง รักษ์ดี แพ้ Penicillin',
    time: '15 นาทีที่แล้ว',
    unread: true,
  },
  {
    id: 3,
    icon: CalendarClock,
    tone: 'violet',
    title: 'นัดหมายรอยืนยัน',
    desc: 'มีนัด 6 รายการรอการยืนยันวันนี้',
    time: '40 นาทีที่แล้ว',
    unread: true,
  },
  {
    id: 4,
    icon: FlaskConical,
    tone: 'sky',
    title: 'ผลแล็บพร้อมแล้ว',
    desc: 'CBC · นาย วิชัย จันทร์เพ็ญ',
    time: '1 ชม. ที่แล้ว',
    unread: false,
  },
  {
    id: 5,
    icon: ShieldCheck,
    tone: 'amber',
    title: 'ตรวจสอบสิทธิการรักษา',
    desc: 'พบสิทธิหมดอายุ 2 ราย ต้องอัปเดต',
    time: '2 ชม. ที่แล้ว',
    unread: false,
  },
  {
    id: 6,
    icon: Clock3,
    tone: 'emerald',
    title: 'อัปเดตเวลารอคิว',
    desc: 'OPD ทั่วไป — รอเฉลี่ย 18 นาที',
    time: '2 ชม. ที่แล้ว',
    unread: false,
  },
  {
    id: 7,
    icon: CalendarCheck,
    tone: 'emerald',
    title: 'ยืนยันนัดหมายแล้ว',
    desc: 'นาง อรพิน วัฒนะ · พรุ่งนี้ 09:00',
    time: '3 ชม. ที่แล้ว',
    unread: false,
  },
  {
    id: 8,
    icon: Stethoscope,
    tone: 'brand',
    title: 'สรุปผลการตรวจ',
    desc: 'ตรวจเสร็จ 64 ราย จากทั้งหมด 87 ราย',
    time: 'เมื่อวาน 17:30',
    unread: false,
  },
]

const toneText: Record<Tone, string> = {
  brand: 'text-brand-600',
  sky: 'text-sky-600',
  emerald: 'text-emerald-600',
  amber: 'text-amber-600',
  violet: 'text-violet-600',
  rose: 'text-rose-600',
}

const toneSoft: Record<Tone, string> = {
  brand: 'bg-brand-500/10 text-brand-600',
  sky: 'bg-sky-500/10 text-sky-600',
  emerald: 'bg-emerald-500/10 text-emerald-600',
  amber: 'bg-amber-500/15 text-amber-700',
  violet: 'bg-violet-500/10 text-violet-600',
  rose: 'bg-rose-500/10 text-rose-600',
}

/* translucent colour-tinted icon badges — liquid glass */
const toneGlass: Record<Tone, string> = {
  brand: 'bg-gradient-to-br from-brand-400/85 to-brand-600/80',
  sky: 'bg-gradient-to-br from-sky-400/85 to-cyan-500/80',
  emerald: 'bg-gradient-to-br from-emerald-400/85 to-teal-500/80',
  amber: 'bg-gradient-to-br from-amber-400/85 to-orange-500/80',
  violet: 'bg-gradient-to-br from-violet-400/85 to-fuchsia-500/80',
  rose: 'bg-gradient-to-br from-rose-400/85 to-pink-500/80',
}

/* ── Service workflow — OPD patient journey stages ──────── */
const workflow: {
  stage: string
  desc: string
  count: number
  tone: Tone
  icon: React.ComponentType<{ className?: string }>
}[] = [
  { stage: 'ลงทะเบียน', desc: 'คัดกรองและออกบัตรคิว', count: 87, tone: 'brand', icon: UserPlus },
  { stage: 'ซักประวัติ · วัดสัญญาณชีพ', desc: 'จุดคัดกรองพยาบาล', count: 14, tone: 'sky', icon: Activity },
  { stage: 'รอพบแพทย์', desc: 'คิวหน้าห้องตรวจ', count: 12, tone: 'amber', icon: Hourglass },
  { stage: 'ตรวจรักษา', desc: 'แพทย์กำลังตรวจ', count: 5, tone: 'violet', icon: Stethoscope },
  { stage: 'ห้องยา · การเงิน', desc: 'รับยาและชำระเงิน', count: 9, tone: 'emerald', icon: Pill },
  { stage: 'เสร็จสิ้น', desc: 'จบกระบวนการให้บริการ', count: 64, tone: 'emerald', icon: CheckCheck },
]

/* connector colours — each segment flows from one step's tone to the next,
   so the whole journey reads as one continuous glowing route */
const PATH_GRADIENTS = [
  'from-brand-400 to-sky-400',
  'from-sky-400 to-amber-400',
  'from-amber-400 to-violet-400',
  'from-violet-400 to-emerald-400',
  'from-emerald-400 to-emerald-400',
]

/* map a notification tone → snackbar tone */
const NOTIF_TONE: Record<string, ToastTone> = {
  brand: 'info',
  violet: 'info',
  sky: 'info',
  rose: 'warning',
  amber: 'warning',
  emerald: 'success',
}

export default function Dashboard() {
  const navigate = useNavigate()
  const toast = useToast()
  const stats = dashboardStats
  const liveQueue = visits.filter(
    (v) => v.status === 'waiting' || v.status === 'in-progress'
  )
  const [readAll, setReadAll] = useState(false)
  const unreadCount = readAll
    ? 0
    : notifications.filter((n) => n.unread).length

  const todayLabel = new Date().toLocaleDateString('th-TH', {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })

  return (
    <div className="flex flex-col gap-4 xl:h-[calc(100vh-4rem)] xl:min-h-[660px]">
      {/* ── Top block: hero + overlapping KPI cards ────────── */}
      <div className="shrink-0">
        {/* Hero — full-bleed: breaks out of the panel padding to the edges */}
        <section className="relative -mx-4 -mt-4 rounded-t-[32px] px-7 pb-6 pt-7 sm:px-9 lg:h-[216px]">
          {/* background layers — faded out at the bottom to blend into the panel
             (overflow-hidden lives here, not on <section>, so the notification
             dropdown can escape the hero) */}
          <div
            className="pointer-events-none absolute inset-0 overflow-hidden rounded-t-[32px]"
            style={{ maskImage: HERO_FADE, WebkitMaskImage: HERO_FADE }}
          >
            <img
              src={`${import.meta.env.BASE_URL}hero-bg.jpg`}
              alt=""
              aria-hidden="true"
              className="absolute inset-0 h-full w-full scale-[1.06] object-cover blur-[2px]"
              style={{ objectPosition: '54% 42%' }}
            />
            {/* dark scrim — keeps the image vivid, dims only where text sits */}
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
              <p className="text-[12px] font-medium text-white/65 [text-shadow:0_1px_6px_rgba(6,10,34,0.6)]">
                {todayLabel}
              </p>
              <h1 className="text-[21px] font-bold leading-tight tracking-tight text-white [text-shadow:0_2px_12px_rgba(6,10,34,0.6)] sm:text-[24px] xl:text-[28px]">
                {greeting()}, {DOCTOR_NAME}
              </h1>
              <p className="text-[13px] font-medium text-white/85 [text-shadow:0_1px_8px_rgba(6,10,34,0.6)] sm:text-[13.5px]">
                วันนี้มีผู้ป่วยรอตรวจ {stats.waitingPatients} ราย ·
                ขอให้เป็นวันที่ดีนะคะ
              </p>
            </div>

            {/* CTAs */}
            <div className="flex shrink-0 flex-wrap items-center gap-2.5">
              {/* notifications — icon button + hover dropdown */}
              <div className="group/notif relative">
                <button
                  type="button"
                  aria-label="การแจ้งเตือน"
                  className="group relative inline-flex h-12 w-12 shrink-0 items-center justify-center rounded-full border border-white/55 bg-white/35 text-ink-900 shadow-[0_10px_28px_-8px_rgba(6,10,34,0.5),inset_0_1px_0_0_rgba(255,255,255,0.8)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:bg-white/55 active:scale-[0.95] focus-visible:ring-2 focus-visible:ring-brand-500/50"
                >
                  {/* circular sheen */}
                  <span className="pointer-events-none absolute inset-0 rounded-full bg-gradient-to-b from-white/55 via-white/5 to-transparent" />
                  {/* bell — swings on hover */}
                  <BellRing className="relative h-[19px] w-[19px] text-brand-600 [transform-origin:50%_20%] group-hover:[animation:bell-swing_0.7s_ease-in-out]" />
                  {/* unread badge */}
                  {unreadCount > 0 && (
                    <span className="absolute -right-0.5 -top-0.5 flex h-[18px] min-w-[18px] items-center justify-center rounded-full border-2 border-white bg-gradient-to-br from-rose-500 to-red-500 px-1 text-[10px] font-bold leading-none text-white shadow-[0_3px_8px_-2px_rgba(244,63,94,0.8)]">
                      {unreadCount}
                    </span>
                  )}
                </button>

                {/* hover dropdown — notification list */}
                <div className="invisible absolute left-0 top-full z-50 w-[332px] translate-y-1 pt-2.5 opacity-0 transition-all duration-200 group-hover/notif:visible group-hover/notif:translate-y-0 group-hover/notif:opacity-100">
                  <div className="liquid-glass relative overflow-hidden rounded-[22px] border border-white/60 bg-white/65 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.95),inset_0_0_0_1px_rgba(255,255,255,0.16),0_24px_56px_-16px_rgba(18,26,78,0.55)]">
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
                    {/* header */}
                    <div className="flex items-center gap-2.5 border-b border-ink-900/[0.07] px-4 py-3">
                      <div className="min-w-0 flex-1 leading-tight">
                        <p className="text-[13.5px] font-semibold text-ink-900">
                          แจ้งเตือน
                        </p>
                        <p className="text-[11px] text-ink-500">
                          {unreadCount > 0
                            ? `${unreadCount} รายการที่ยังไม่อ่าน`
                            : 'อ่านครบแล้ว'}
                        </p>
                      </div>
                      {unreadCount > 0 && (
                        <button
                          type="button"
                          onClick={() => {
                            setReadAll(true)
                            toast.success(
                              'อ่านการแจ้งเตือนทั้งหมดแล้ว',
                              'ทำเครื่องหมายว่าอ่านแล้วเรียบร้อย'
                            )
                          }}
                          className="inline-flex shrink-0 items-center gap-1 rounded-full px-2.5 py-1 text-[11px] font-semibold text-brand-600 transition hover:bg-brand-500/10"
                        >
                          <CheckCheck className="h-3.5 w-3.5" />
                          อ่านทั้งหมด
                        </button>
                      )}
                    </div>
                    {/* list */}
                    <div className="max-h-[296px] overflow-y-auto p-1.5 text-left">
                      {notifications.map((n) => {
                        const Icon = n.icon
                        const isUnread = n.unread && !readAll
                        return (
                          <button
                            type="button"
                            key={n.id}
                            onClick={() =>
                              toast.show({
                                tone: NOTIF_TONE[n.tone] ?? 'info',
                                title: n.title,
                                description: n.desc,
                              })
                            }
                            className="flex w-full gap-2.5 rounded-xl p-2.5 text-left transition-colors hover:bg-ink-900/[0.04]"
                          >
                            <span
                              className={cn(
                                'relative mt-0.5 flex h-8 w-8 shrink-0 items-center justify-center',
                                toneText[n.tone]
                              )}
                            >
                              <Icon className="h-[19px] w-[19px]" />
                              {isUnread && (
                                <span className="absolute -right-0.5 -top-0.5 h-2.5 w-2.5 rounded-full border-2 border-white bg-red-500" />
                              )}
                            </span>
                            <div className="min-w-0 flex-1">
                              <div className="flex items-baseline gap-2">
                                <p
                                  className={cn(
                                    'min-w-0 flex-1 truncate text-[12.5px] text-ink-900',
                                    isUnread ? 'font-bold' : 'font-medium'
                                  )}
                                >
                                  {n.title}
                                </p>
                                <span className="shrink-0 text-[10px] font-medium text-ink-400">
                                  {n.time}
                                </span>
                              </div>
                              <p className="mt-0.5 truncate text-[11.5px] text-ink-500">
                                {n.desc}
                              </p>
                            </div>
                          </button>
                        )
                      })}
                    </div>
                    {/* footer */}
                    <button
                      type="button"
                      className="w-full border-t border-ink-900/[0.07] py-2.5 text-center text-[12.5px] font-semibold text-brand-600 transition hover:bg-brand-500/[0.06]"
                    >
                      ดูการแจ้งเตือนทั้งหมด
                    </button>
                    </div>
                  </div>
                </div>
              </div>
              {/* Liquid-glass — clear */}
              <button
                onClick={() => navigate('/patient/new')}
                className="group relative inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/55 bg-white/30 px-5 text-[14.5px] font-semibold text-ink-900 shadow-[0_10px_28px_-8px_rgba(6,10,34,0.5),inset_0_1px_0_0_rgba(255,255,255,0.75)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:bg-white/45 active:scale-[0.97] focus-visible:ring-2 focus-visible:ring-brand-500/50"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/55 to-white/0" />
                <UserPlus className="relative h-[18px] w-[18px] text-brand-600 transition-transform duration-200 group-hover:scale-110" />
                <span className="relative">ลงทะเบียนผู้ป่วยใหม่</span>
              </button>
              {/* Liquid-glass — brand tinted */}
              <button
                onClick={() => navigate('/visit')}
                className="group relative inline-flex h-12 items-center gap-2 overflow-hidden rounded-full border border-white/35 bg-gradient-to-br from-pink-600/90 to-orange-500/90 px-5 text-[14.5px] font-semibold text-white shadow-[0_12px_30px_-8px_rgba(236,72,153,0.6),inset_0_1px_0_0_rgba(255,255,255,0.5)] outline-none liquid-glass-button transition-all duration-200 hover:-translate-y-0.5 hover:from-pink-600 hover:to-orange-500 active:scale-[0.97] focus-visible:ring-2 focus-visible:ring-white/80"
              >
                <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/30 to-white/0" />
                <Plus className="relative h-[17px] w-[17px] transition-transform duration-300 group-hover:rotate-90" />
                <span className="relative">สร้าง Visit ใหม่</span>
              </button>
            </div>
          </div>
        </section>

        {/* KPI cards — overlapping the hero */}
        <div className="relative z-10 mt-4 flex gap-4 overflow-x-auto px-1 pb-8 pt-3 lg:-mt-[72px] xl:overflow-visible xl:px-0 xl:pb-0">
          {kpis.map((k) => (
            <KpiCard key={k.label} kpi={k} onClick={() => navigate(k.to)} />
          ))}
        </div>
      </div>

      {/* ── Content row ───────────────────────────────────── */}
      <div className="flex flex-col gap-4 xl:min-h-0 xl:flex-1 xl:flex-row">
        {/* Today's queue */}
        <section className="flex flex-col overflow-hidden rounded-[24px] bg-white p-5 xl:min-h-0 xl:flex-1">
          <div className="flex shrink-0 items-center justify-between gap-3 pb-3">
            <div className="flex items-center gap-2.5">
              <span className="flex h-9 w-9 items-center justify-center rounded-2xl bg-gradient-to-br from-brand-500/14 via-violet-500/14 to-sky-500/14 text-brand-600">
                <Stethoscope className="h-[18px] w-[18px]" />
              </span>
              <div className="leading-tight">
                <h2 className="text-[16px] font-semibold tracking-tight text-ink-900">
                  คิวการตรวจวันนี้
                </h2>
                <p className="text-[12px] text-ink-500">
                  {liveQueue.length} รายในคิว — คลิกเพื่อเริ่มการตรวจ
                </p>
              </div>
            </div>
            <button
              onClick={() => navigate('/visit')}
              className="inline-flex items-center gap-1 rounded-full px-3 py-1.5 text-[12.5px] font-medium text-brand-600 transition hover:bg-brand-500/10 focus-ring"
            >
              ดูทั้งหมด
              <ArrowUpRight className="h-3.5 w-3.5" />
            </button>
          </div>

          <div className="flex flex-col gap-3 px-0.5 pb-1 xl:min-h-0 xl:flex-1 xl:overflow-y-auto">
            {liveQueue.map((v) => {
              const active = v.status === 'in-progress'
              return (
                <button
                  key={v.id}
                  onClick={() => navigate('/visit')}
                  className={cn(
                    'group flex items-center gap-4 rounded-2xl px-4 py-3.5 text-left transition-colors duration-200 focus-ring',
                    active
                      ? 'hover:bg-brand-500/[0.06]'
                      : 'hover:bg-ink-900/[0.04]'
                  )}
                >
                  {/* queue badge */}
                  <span
                    className={cn(
                      'inline-flex h-9 shrink-0 items-center justify-center rounded-full px-3.5 text-[13px] font-bold tabular-nums tracking-tight',
                      active
                        ? 'bg-gradient-to-br from-brand-500 to-brand-600 text-white shadow-[0_5px_12px_-4px_rgba(58,100,255,0.55)]'
                        : 'bg-amber-500/[0.14] text-amber-700'
                    )}
                  >
                    {v.queueNo}
                  </span>
                  {/* avatar */}
                  <Avatar name={v.patientName} src={v.photo} size="md" />
                  {/* main */}
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-2">
                      <span className="truncate text-[14px] font-semibold text-ink-900">
                        {v.patientName}
                      </span>
                      <span className="shrink-0 text-[11px] font-medium text-ink-400">
                        HN {v.hn}
                      </span>
                    </div>
                    <p className="mt-0.5 truncate text-[12px] text-ink-500">
                      {v.reason} · {v.department}
                    </p>
                  </div>
                  {/* right */}
                  <div className="flex shrink-0 items-center gap-3">
                    <StatusBadge status={v.status} />
                    <div className="hidden items-center gap-1.5 text-ink-400 sm:flex">
                      <Clock3 className="h-3.5 w-3.5" />
                      <span className="text-[12.5px] font-semibold tabular-nums text-ink-600">
                        {formatTime(v.visitDate)}
                      </span>
                    </div>
                  </div>
                </button>
              )
            })}
          </div>
        </section>

        {/* Service workflow */}
        <aside className="flex shrink-0 flex-col gap-2 rounded-[24px] border border-white/60 bg-white/55 p-3 backdrop-blur-md xl:h-full xl:w-[calc((100%_-_80px)/3_+_16px)]">
          {/* header */}
          <div className="flex shrink-0 items-center gap-2.5 px-1.5 pt-1">
            <div className="min-w-0 flex-1 leading-tight">
              <h2 className="text-[15px] font-semibold tracking-tight text-ink-900">
                ขั้นตอนการให้บริการ
              </h2>
              <p className="text-[11px] text-ink-500">
                จำนวนผู้ป่วยในแต่ละจุดบริการ
              </p>
            </div>
          </div>

          {/* workflow steps — vertical timeline.
             negative margin + large padding widens the scroll viewport so the
             coloured icon shadows (and their hover-grown state) never clip. */}
          <div className="-mx-3 flex flex-col px-6 pb-6 pt-3 xl:min-h-0 xl:flex-1 xl:overflow-y-auto">
            {workflow.map((w, i) => {
              const Icon = w.icon
              const last = i === workflow.length - 1
              return (
                <div key={w.stage} className="group flex gap-3">
                  {/* node + connector line */}
                  <div className="flex flex-col items-center">
                    <span
                      className={cn(
                        'liquid-glass-button relative flex h-10 w-10 shrink-0 items-center justify-center overflow-hidden rounded-2xl border border-white/50 text-white shadow-[0_6px_16px_-5px_rgba(28,38,92,0.5),inset_0_1px_0_0_rgba(255,255,255,0.6)] transition-[transform,box-shadow] duration-300 ease-[cubic-bezier(0.34,1.45,0.5,1)] group-hover:-translate-y-1 group-hover:scale-[1.12] group-hover:shadow-[0_12px_24px_-8px_rgba(28,38,92,0.6),inset_0_1px_0_0_rgba(255,255,255,0.75)]',
                        toneGlass[w.tone]
                      )}
                    >
                      <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/45 to-white/0" />
                      <Icon className="relative h-[18px] w-[18px] transition-transform duration-300 ease-[cubic-bezier(0.34,1.45,0.5,1)] group-hover:scale-110" />
                    </span>
                    {!last && (
                      <span className="relative my-1.5 w-[3px] flex-1">
                        {/* soft glow */}
                        <span
                          aria-hidden
                          className={cn(
                            'absolute -inset-x-[3px] inset-y-0 rounded-full bg-gradient-to-b opacity-40 blur-[5px]',
                            PATH_GRADIENTS[i]
                          )}
                        />
                        {/* path line */}
                        <span
                          className={cn(
                            'absolute inset-0 rounded-full bg-gradient-to-b',
                            PATH_GRADIENTS[i]
                          )}
                        />
                      </span>
                    )}
                  </div>
                  {/* content */}
                  <div
                    className={cn('min-w-0 flex-1', last ? 'pb-1' : 'pb-4')}
                  >
                    <div className="flex items-center gap-2">
                      <p className="min-w-0 flex-1 truncate text-[13px] font-semibold text-ink-900">
                        {w.stage}
                      </p>
                      <span
                        className={cn(
                          'shrink-0 rounded-full px-2 py-0.5 text-[11.5px] font-bold tabular-nums transition-transform duration-300 ease-[cubic-bezier(0.34,1.45,0.5,1)] group-hover:scale-110',
                          toneSoft[w.tone]
                        )}
                      >
                        {w.count}
                      </span>
                    </div>
                    <p className="mt-0.5 text-[11.5px] text-ink-500">
                      {w.desc}
                    </p>
                  </div>
                </div>
              )
            })}
          </div>

          {/* footer */}
          <button
            type="button"
            onClick={() => navigate('/visit')}
            className="shrink-0 rounded-xl py-2 text-center text-[12.5px] font-semibold text-brand-600 transition hover:bg-brand-500/10 focus-ring"
          >
            จัดการคิวการตรวจ
          </button>
        </aside>
      </div>
    </div>
  )
}

/* ── KPI card ───────────────────────────────────────────── */
function KpiCard({
  kpi,
  onClick,
}: {
  kpi: (typeof kpis)[number]
  onClick: () => void
}) {
  const counted = useCountUp(kpi.value)
  const Icon = kpi.icon
  const TrendArrow = kpi.trend.dir === 'up' ? ArrowUpRight : ArrowDownRight
  return (
    <button
      onClick={onClick}
      className="group flex w-[212px] shrink-0 flex-col rounded-[24px] bg-white p-[18px] text-left shadow-[0_12px_28px_-12px_rgba(28,38,92,0.3)] ring-1 ring-ink-900/[0.05] transition-all duration-200 hover:-translate-y-1 hover:shadow-[0_20px_36px_-16px_rgba(28,38,92,0.4)] focus-ring xl:w-auto xl:flex-1 xl:min-w-0"
    >
      <div className="flex items-start justify-between gap-2">
        <Icon className={cn('h-[22px] w-[22px]', toneText[kpi.tone])} />
        <span className="inline-flex items-center gap-0.5 rounded-full bg-emerald-500/15 py-1 pl-1.5 pr-2 text-[11px] font-semibold text-emerald-700">
          <TrendArrow className="h-3 w-3" />
          {kpi.trend.text}
        </span>
      </div>
      <div className="mt-4 flex items-baseline gap-1">
        <span className="text-[27px] font-bold leading-none tracking-tight text-ink-900">
          {counted}
        </span>
        {kpi.suffix && (
          <span className="text-[13px] font-semibold text-ink-400">
            {kpi.suffix}
          </span>
        )}
      </div>
      <div className="mt-2 truncate text-[13.5px] font-semibold text-ink-800">
        {kpi.label}
      </div>
      <div className="mt-0.5 truncate text-[12px] text-ink-500">
        {kpi.description}
      </div>
    </button>
  )
}

/* ── Queue status badge ─────────────────────────────────── */
function StatusBadge({ status }: { status: string }) {
  const map = {
    waiting: { tone: 'amber' as const, label: 'รอตรวจ' },
    'in-progress': { tone: 'brand' as const, label: 'กำลังตรวจ' },
    completed: { tone: 'emerald' as const, label: 'เสร็จสิ้น' },
    cancelled: { tone: 'rose' as const, label: 'ยกเลิก' },
  } as const
  const m = map[status as keyof typeof map] ?? map.waiting
  return (
    <Badge tone={m.tone} variant="soft">
      <span className="relative flex h-1.5 w-1.5">
        {status === 'in-progress' && (
          <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-current opacity-75" />
        )}
        <span className="relative inline-flex h-1.5 w-1.5 rounded-full bg-current" />
      </span>
      {m.label}
    </Badge>
  )
}
