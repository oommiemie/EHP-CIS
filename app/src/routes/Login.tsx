import { useState, type FormEvent } from 'react'
import { useNavigate } from 'react-router-dom'
import {
  UserRound,
  Lock,
  Eye,
  EyeOff,
  ArrowRight,
  ShieldCheck,
  Stethoscope,
  CalendarCheck,
  Check,
  type LucideIcon,
} from 'lucide-react'
import { cn } from '@/lib/utils'

const FEATURES: { icon: LucideIcon; label: string }[] = [
  { icon: Stethoscope, label: 'เวชระเบียนอิเล็กทรอนิกส์ครบวงจร' },
  { icon: CalendarCheck, label: 'จัดการคิวการตรวจและนัดหมาย' },
  { icon: ShieldCheck, label: 'ตรวจสอบสิทธิ สปสช. แบบเรียลไทม์' },
]

export default function Login() {
  const navigate = useNavigate()
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [showPw, setShowPw] = useState(false)
  const [remember, setRemember] = useState(true)

  function submit(e: FormEvent) {
    e.preventDefault()
    navigate('/')
  }

  return (
    <div className="relative flex min-h-screen w-full items-center justify-center overflow-hidden p-4 sm:p-6">
      {/* ── full-bleed blurred backdrop (hero-bg), slowly drifting ── */}
      <img
        src={`${import.meta.env.BASE_URL}hero-bg.jpg`}
        alt=""
        aria-hidden="true"
        className="animate-login-drift absolute inset-0 h-full w-full object-cover blur-2xl"
      />
      <div className="absolute inset-0 bg-[#0b1030]/55" />

      {/* ── login card ── */}
      <div className="relative grid w-full max-w-[940px] animate-pop-in overflow-hidden rounded-[30px] border border-white/50 bg-white shadow-[0_50px_120px_-30px_rgba(8,12,40,0.78)] lg:grid-cols-2">
        {/* ════ LEFT — image showcase ════ */}
        <div className="relative hidden min-h-[544px] flex-col justify-between overflow-hidden p-9 lg:flex">
          {/* crisp hero image — drifts on its own phase */}
          <img
            src={`${import.meta.env.BASE_URL}hero-bg.jpg`}
            alt=""
            aria-hidden="true"
            className="animate-login-drift absolute inset-0 h-full w-full object-cover"
            style={{ animationDelay: '-14s' }}
          />
          {/* readable scrim */}
          <div
            className="absolute inset-0"
            style={{
              background:
                'linear-gradient(125deg, rgba(8,12,40,0.92) 0%, rgba(20,28,86,0.62) 46%, rgba(40,50,124,0.2) 100%)',
            }}
          />
          <div className="absolute inset-x-0 top-0 h-32 bg-gradient-to-b from-white/15 to-transparent" />

          {/* brand */}
          <div className="relative flex items-center gap-3">
            <span className="flex h-[52px] w-[52px] items-center justify-center rounded-2xl bg-white/15 ring-1 ring-inset ring-white/30 backdrop-blur-md">
              <span className="flex h-[40px] w-[40px] items-center justify-center rounded-xl bg-white shadow-[0_6px_14px_-4px_rgba(6,10,34,0.5)]">
                <img
                  src={`${import.meta.env.BASE_URL}logo-ehp.png`}
                  alt="EHP CIS"
                  className="h-[28px] w-[28px] object-contain"
                />
              </span>
            </span>
            <div className="leading-tight text-white [text-shadow:0_2px_10px_rgba(6,10,34,0.5)]">
              <div className="text-[19px] font-bold tracking-tight">
                EHP CIS
              </div>
              <div className="text-[11px] font-medium text-white/70">
                Cloud Platform
              </div>
            </div>
          </div>

          {/* headline */}
          <div className="relative">
            <h1 className="text-[34px] font-bold leading-[1.18] tracking-tight text-white [text-shadow:0_4px_22px_rgba(6,10,34,0.5)] xl:text-[38px]">
              ระบบบริหารจัดการ
              <br />
              บริการดูแล
              <span className="bg-gradient-to-r from-sky-200 via-white to-violet-200 bg-clip-text text-transparent">
                สุขภาพ
              </span>
            </h1>
            <p className="mt-3.5 max-w-[346px] text-[14px] leading-relaxed text-white/75">
              ครบเครื่องสำหรับร้านขายยา คลินิก รพ.สต. และโรงพยาบาลชุมชน —
              ดูแลงานบริการสุขภาพได้อย่างเป็นระบบในที่เดียว
            </p>
          </div>

          {/* feature list */}
          <div className="relative space-y-2.5">
            {FEATURES.map((f) => (
              <div key={f.label} className="flex items-center gap-3">
                <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-xl bg-white/15 text-white ring-1 ring-inset ring-white/20 backdrop-blur-sm">
                  <f.icon className="h-[17px] w-[17px]" />
                </span>
                <span className="text-[13px] font-medium text-white/90">
                  {f.label}
                </span>
              </div>
            ))}
          </div>
        </div>

        {/* ════ RIGHT — login form ════ */}
        <div className="flex flex-col justify-center bg-white px-7 py-10 sm:px-10">
          {/* brand — mobile only */}
          <div className="mb-7 flex items-center gap-2.5 lg:hidden">
            <span className="flex h-11 w-11 items-center justify-center rounded-2xl bg-white shadow-[0_8px_18px_-6px_rgba(28,38,92,0.35)] ring-1 ring-ink-900/[0.06]">
              <img
                src={`${import.meta.env.BASE_URL}logo-ehp.png`}
                alt="EHP CIS"
                className="h-[30px] w-[30px] object-contain"
              />
            </span>
            <div className="leading-tight">
              <div className="text-[16px] font-bold tracking-tight text-ink-900">
                EHP CIS
              </div>
              <div className="text-[10.5px] font-medium text-ink-500">
                Cloud Platform
              </div>
            </div>
          </div>

          <h2 className="text-[27px] font-bold tracking-tight text-ink-900">
            เข้าสู่<span className="text-gradient">ระบบ</span>
          </h2>
          <p className="mt-1.5 text-[13.5px] text-ink-500">
            ยินดีต้อนรับกลับ — กรอกข้อมูลเพื่อเข้าใช้งาน
          </p>

          <form onSubmit={submit} className="mt-7 space-y-4">
            <Field
              label="ชื่อผู้ใช้งาน"
              icon={UserRound}
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              placeholder="กรอกชื่อผู้ใช้งาน"
              autoComplete="username"
            />
            <Field
              label="รหัสผ่าน"
              icon={Lock}
              type={showPw ? 'text' : 'password'}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="กรอกรหัสผ่าน"
              autoComplete="current-password"
              trailing={
                <button
                  type="button"
                  aria-label={showPw ? 'ซ่อนรหัสผ่าน' : 'แสดงรหัสผ่าน'}
                  onClick={() => setShowPw((v) => !v)}
                  className="flex h-7 w-7 shrink-0 items-center justify-center rounded-lg text-ink-400 transition hover:bg-ink-900/[0.06] hover:text-ink-700"
                >
                  {showPw ? (
                    <EyeOff className="h-[17px] w-[17px]" />
                  ) : (
                    <Eye className="h-[17px] w-[17px]" />
                  )}
                </button>
              }
            />

            <div className="flex items-center justify-between pt-0.5">
              <button
                type="button"
                onClick={() => setRemember((v) => !v)}
                className="group inline-flex items-center gap-2 text-left"
              >
                <span
                  className={cn(
                    'flex h-[18px] w-[18px] shrink-0 items-center justify-center rounded-[6px] border transition-all duration-200',
                    remember
                      ? 'border-transparent bg-gradient-to-br from-brand-500 to-violet-500 text-white shadow-[0_3px_8px_-3px_rgba(58,100,255,0.6)]'
                      : 'border-ink-900/25 bg-white group-hover:border-brand-400'
                  )}
                >
                  {remember && <Check className="h-2.5 w-2.5" strokeWidth={4} />}
                </span>
                <span className="text-[12.5px] font-medium text-ink-600">
                  จดจำการเข้าสู่ระบบ
                </span>
              </button>
              <a
                href="#"
                className="text-[12.5px] font-semibold text-brand-600 transition hover:text-brand-700 hover:underline"
              >
                ลืมรหัสผ่าน?
              </a>
            </div>

            <button
              type="submit"
              className="group relative mt-1 flex h-12 w-full items-center justify-center gap-2 overflow-hidden rounded-2xl bg-gradient-to-br from-brand-500 via-brand-500 to-violet-500 text-[14.5px] font-semibold text-white shadow-[0_14px_30px_-10px_rgba(58,100,255,0.6)] transition-all duration-200 hover:-translate-y-0.5 hover:brightness-110 active:scale-[0.98]"
            >
              <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/25 to-transparent" />
              <span className="relative">เข้าสู่ระบบ</span>
              <ArrowRight className="relative h-[18px] w-[18px] transition-transform duration-200 group-hover:translate-x-0.5" />
            </button>
          </form>

          <div className="mt-8 flex items-center gap-2 text-[11.5px] text-ink-400">
            <ShieldCheck className="h-3.5 w-3.5 shrink-0" />
            ระบบสำหรับเจ้าหน้าที่ที่ได้รับอนุญาตเท่านั้น · © 2026 EHP CIS
          </div>
        </div>
      </div>
    </div>
  )
}

/* ───────────────────────── field ───────────────────────── */

function Field({
  label,
  icon: Icon,
  type = 'text',
  value,
  onChange,
  placeholder,
  autoComplete,
  trailing,
}: {
  label: string
  icon: LucideIcon
  type?: string
  value: string
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void
  placeholder?: string
  autoComplete?: string
  trailing?: React.ReactNode
}) {
  return (
    <div>
      <label className="mb-1.5 block text-[13px] font-medium text-ink-600">
        {label}
      </label>
      <div className="group flex h-12 items-center gap-2.5 rounded-2xl border border-ink-900/[0.1] bg-white pl-3.5 pr-2 transition-all duration-200 focus-within:border-brand-400 focus-within:ring-4 focus-within:ring-brand-500/10">
        <Icon className="h-[18px] w-[18px] shrink-0 text-ink-400 transition-colors group-focus-within:text-brand-500" />
        <input
          type={type}
          value={value}
          onChange={onChange}
          placeholder={placeholder}
          autoComplete={autoComplete}
          className="min-w-0 flex-1 bg-transparent text-[14px] text-ink-900 placeholder-ink-400 outline-none"
        />
        {trailing}
      </div>
    </div>
  )
}
