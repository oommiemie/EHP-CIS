import { useEffect, useRef, useState } from 'react'
import { Sparkles, Send, Trash2, X } from 'lucide-react'
import { patients, visits, allergies, dashboardStats } from '@/data/mockData'
import { getPatientProfile } from '@/data/patientProfiles'
import { calculateAge, cn } from '@/lib/utils'

/* ───────────────────────── mock AI engine ─────────────────────────
   No backend — replies are generated from the in-app mock data so the
   assistant can answer real questions about patients and statistics. */

function getAiReply(raw: string): string {
  const q = raw.trim().toLowerCase()
  const has = (...ks: string[]) => ks.some((k) => q.includes(k.toLowerCase()))
  if (!q) return 'พิมพ์คำถามเข้ามาได้เลยค่ะ 🙂'

  if (has('สวัสดี', 'หวัดดี', 'hello', 'hi'))
    return 'สวัสดีค่ะ 👋 ดิฉันเป็นผู้ช่วย AI ของระบบ EHP CIS — สอบถามข้อมูลผู้ป่วย คิวการตรวจ หรือสถิติของวันนี้ได้เลยค่ะ'

  if (has('ทำอะไร', 'ช่วยอะไร', 'help', 'เมนู', 'คำสั่ง'))
    return 'ดิฉันช่วยได้หลายเรื่องค่ะ เช่น\n•  จำนวนผู้ป่วย / คิวรอตรวจ / นัดหมายวันนี้\n•  ค้นหาข้อมูลผู้ป่วยรายคน (พิมพ์ชื่อหรือ HN)\n•  ตรวจสอบประวัติการแพ้ยา\n•  สรุปสถิติของโรงพยาบาลวันนี้'

  // ── patient lookup by name or HN ──
  const hit =
    patients.find((p) => q.includes(p.hn)) ??
    patients.find(
      (p) =>
        q.includes(p.firstName.toLowerCase()) ||
        q.includes(p.lastName.toLowerCase())
    )
  if (hit) {
    const prof = getPatientProfile(hit.hn)
    const allergyTxt =
      prof && prof.drugAllergies.length
        ? prof.drugAllergies.map((a) => a.data.drug).join(', ')
        : 'ไม่พบประวัติแพ้ยา'
    const chronic = prof?.lists.chronic?.map((c) => c.data.name).join(', ')
    let r = `ข้อมูลผู้ป่วย\n👤  ${hit.prefix} ${hit.firstName} ${hit.lastName}\n🆔  HN ${hit.hn} · ${calculateAge(hit.birthdate)} · ${
      hit.gender === 'male' ? 'ชาย' : 'หญิง'
    }\n🛡️  สิทธิ: ${hit.insurance ?? '-'}\n⚠️  แพ้ยา: ${allergyTxt}`
    if (chronic) r += `\n💊  โรคประจำตัว: ${chronic}`
    return r
  }

  if (has('แพ้ยา', 'แพ้อาหาร', 'แพ้')) {
    const list = allergies
      .map(
        (a) =>
          `•  ${a.patientName} — ${a.drugName} (${
            a.type === 'drug' ? 'แพ้ยา' : a.type === 'food' ? 'แพ้อาหาร' : 'อื่นๆ'
          })`
      )
      .join('\n')
    return `พบประวัติการแพ้ทั้งหมด ${allergies.length} รายการค่ะ\n${list}`
  }

  if (has('รอตรวจ', 'คิว', 'queue'))
    return `ขณะนี้มีผู้ป่วยรอตรวจ ${dashboardStats.waitingPatients} ราย และอยู่ในคิวการตรวจ ${
      visits.filter((v) => v.status === 'waiting' || v.status === 'in-progress')
        .length
    } ราย — เวลารอเฉลี่ย ${dashboardStats.avgWaitMinutes} นาทีค่ะ`

  if (has('นัดหมาย', 'นัด'))
    return `วันนี้มีนัดหมายทั้งหมด ${dashboardStats.appointments} ราย โดยมี 6 รายการที่รอการยืนยันค่ะ`

  if (has('ตรวจเสร็จ', 'เสร็จแล้ว', 'เสร็จสิ้น'))
    return `วันนี้ตรวจเสร็จแล้ว ${dashboardStats.completedVisits} ราย จากผู้ป่วยทั้งหมด ${dashboardStats.todayVisits} ราย (คิดเป็น 74%) ค่ะ`

  if (has('ผู้ป่วยใหม่', 'ลงทะเบียน'))
    return `วันนี้มีผู้ป่วยลงทะเบียนใหม่ ${dashboardStats.newPatients} ราย เข้าระบบค่ะ`

  if (
    (has('ผู้ป่วย', 'คนไข้') &&
      has('กี่', 'จำนวน', 'ทั้งหมด', 'เท่าไร', 'เท่าไหร่')) ||
    has('มีผู้ป่วย')
  )
    return `ในทะเบียนมีผู้ป่วยทั้งหมด ${patients.length} ราย และวันนี้มีผู้มารับบริการ ${dashboardStats.todayVisits} รายค่ะ`

  if (has('วันนี้', 'สถิติ', 'สรุป', 'ภาพรวม', 'รายงาน'))
    return `สรุปภาพรวมวันนี้ค่ะ 📊\n•  ผู้ป่วยวันนี้: ${dashboardStats.todayVisits} ราย\n•  รอตรวจ: ${dashboardStats.waitingPatients} ราย\n•  ตรวจเสร็จแล้ว: ${dashboardStats.completedVisits} ราย\n•  นัดหมาย: ${dashboardStats.appointments} ราย\n•  ผู้ป่วยใหม่: ${dashboardStats.newPatients} ราย\n•  เวลารอเฉลี่ย: ${dashboardStats.avgWaitMinutes} นาที`

  if (has('ขอบคุณ', 'thank'))
    return 'ยินดีค่ะ 😊 มีอะไรให้ช่วยอีกบอกได้เลยนะคะ'

  return 'ขออภัยค่ะ ดิฉันยังไม่เข้าใจคำถามนี้ทั้งหมด 🙏 ลองถามเรื่องข้อมูลผู้ป่วย คิวการตรวจ หรือสถิติวันนี้ดูนะคะ'
}

const SUGGESTIONS = [
  'วันนี้มีผู้ป่วยกี่คน',
  'ผู้ป่วยรอตรวจมีกี่ราย',
  'ใครมีประวัติแพ้ยาบ้าง',
  'สรุปภาพรวมวันนี้',
]

interface ChatMessage {
  id: number
  role: 'user' | 'ai'
  text: string
}

/* ───────────────────────── floating panel ───────────────────────── */

export function AiChatPanel({
  open,
  onClose,
}: {
  open: boolean
  onClose: () => void
}) {
  const [messages, setMessages] = useState<ChatMessage[]>([])
  const [input, setInput] = useState('')
  const [typing, setTyping] = useState(false)
  const [sending, setSending] = useState(false)
  const idRef = useRef(0)
  const bottomRef = useRef<HTMLDivElement>(null)
  const inputRef = useRef<HTMLInputElement>(null)

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth', block: 'end' })
  }, [messages, typing])

  useEffect(() => {
    if (open) inputRef.current?.focus()
  }, [open])

  function send(text: string) {
    const t = text.trim()
    if (!t || typing) return
    setMessages((m) => [...m, { id: ++idRef.current, role: 'user', text: t }])
    setInput('')
    setTyping(true)
    setSending(true)
    window.setTimeout(() => setSending(false), 520)
    const reply = getAiReply(t)
    const delay = 650 + Math.min(1400, reply.length * 13)
    window.setTimeout(() => {
      setMessages((m) => [
        ...m,
        { id: ++idRef.current, role: 'ai', text: reply },
      ])
      setTyping(false)
      inputRef.current?.focus()
    }, delay)
  }

  const empty = messages.length === 0
  const canSend = !!input.trim() && !typing

  return (
    <div
      className={cn(
        'fixed bottom-6 right-6 z-50 flex h-[548px] max-h-[calc(100vh-3rem)] w-[374px] max-w-[calc(100vw-2rem)] origin-bottom-right flex-col overflow-hidden rounded-[24px] border border-ink-900/[0.08] bg-white shadow-[0_6px_20px_-6px_rgba(28,38,92,0.3),0_38px_80px_-18px_rgba(28,38,92,0.62)] ring-1 ring-ink-900/[0.04] transition-[transform,opacity] duration-300 ease-[cubic-bezier(0.22,1,0.36,1)]',
        open
          ? 'scale-100 opacity-100'
          : 'pointer-events-none scale-[0.4] opacity-0'
      )}
    >
      {/* drifting blurred colour background */}
      <div aria-hidden className="pointer-events-none absolute inset-0">
        <div
          className="blob animate-blob-drift"
          style={{
            top: '-32%',
            left: '-22%',
            width: 240,
            height: 240,
            opacity: 0.5,
            background:
              'radial-gradient(circle at 40% 40%, #93b8ff 0%, #5a7cff 55%, transparent 72%)',
          }}
        />
        <div
          className="blob animate-blob-drift"
          style={{
            bottom: '-26%',
            right: '-20%',
            width: 280,
            height: 280,
            opacity: 0.46,
            animationDelay: '-7s',
            background:
              'radial-gradient(circle at 50% 50%, #d8c8ff 0%, #a78bfa 55%, transparent 72%)',
          }}
        />
        <div
          className="blob animate-blob-drift"
          style={{
            bottom: '14%',
            left: '12%',
            width: 220,
            height: 220,
            opacity: 0.4,
            animationDelay: '-13s',
            background:
              'radial-gradient(circle at 50% 50%, #b6e6ff 0%, #5cc8f5 52%, transparent 72%)',
          }}
        />
      </div>

      {/* content above the background */}
      <div className="relative flex min-h-0 flex-1 flex-col">
        {/* ── header ── */}
        <div className="flex shrink-0 items-center gap-2.5 border-b border-ink-900/[0.06] px-4 py-3">
          <AiOrb className="h-8 w-8" iconClass="h-[17px] w-[17px]" />
          <div className="min-w-0 flex-1 leading-tight">
            <div className="text-[13.5px] font-semibold text-ink-900">
              ผู้ช่วย AI
            </div>
            <div className="flex items-center gap-1 text-[11px] text-ink-500">
              <span className="h-1.5 w-1.5 rounded-full bg-emerald-400" />
              ออนไลน์
            </div>
          </div>
          {!empty && (
            <button
              type="button"
              aria-label="ล้างแชท"
              onClick={() => setMessages([])}
              className="flex h-7 w-7 items-center justify-center rounded-full text-ink-400 transition hover:bg-ink-900/[0.05] hover:text-ink-700"
            >
              <Trash2 className="h-[15px] w-[15px]" />
            </button>
          )}
          <button
            type="button"
            aria-label="ปิด"
            onClick={onClose}
            className="flex h-7 w-7 items-center justify-center rounded-full text-ink-400 transition hover:bg-ink-900/[0.05] hover:text-ink-700"
          >
            <X className="h-[17px] w-[17px]" />
          </button>
        </div>

        {/* ── messages ── */}
        <div className="min-h-0 flex-1 overflow-y-auto px-4 py-4">
          {empty ? (
            <div className="flex h-full flex-col items-center justify-center text-center">
              <AiOrb
                className="h-12 w-12 origin-bottom animate-ai-hop"
                iconClass="h-6 w-6"
              />
              <h3 className="mt-3 text-[14.5px] font-semibold text-ink-900">
                มีอะไรให้ช่วยไหมคะ
              </h3>
              <p className="mt-1 text-[12px] text-ink-500">
                ถามข้อมูลผู้ป่วย คิว หรือสถิติของวันนี้ได้เลย
              </p>
              <div className="mt-4 flex flex-wrap justify-center gap-1.5">
                {SUGGESTIONS.map((s) => (
                  <button
                    key={s}
                    type="button"
                    onClick={() => send(s)}
                    className="rounded-full border border-white/70 bg-white/70 px-3 py-1.5 text-[12px] font-medium text-ink-600 backdrop-blur-md transition-colors duration-200 hover:bg-white active:scale-[0.96]"
                  >
                    {s}
                  </button>
                ))}
              </div>
            </div>
          ) : (
            <div className="flex flex-col gap-2.5">
              {messages.map((m) => (
                <Bubble key={m.id} message={m} />
              ))}
              {typing && <TypingBubble />}
              <div ref={bottomRef} />
            </div>
          )}
        </div>

        {/* ── input ── */}
        <div className="shrink-0 px-3 pb-3 pt-1">
          <div className="group relative">
            <form
              onSubmit={(e) => {
                e.preventDefault()
                send(input)
              }}
              className="relative flex items-center gap-1.5 rounded-full border border-white/70 bg-white/85 py-1.5 pl-4 pr-1.5 backdrop-blur-md transition-colors duration-200 group-focus-within:border-brand-300/70"
            >
              <input
                ref={inputRef}
                value={input}
                onChange={(e) => setInput(e.target.value)}
                placeholder="พิมพ์คำถาม…"
                className="min-w-0 flex-1 bg-transparent text-[13.5px] text-ink-900 placeholder-ink-400 outline-none"
              />
              <button
                type="submit"
                disabled={!canSend}
                aria-label="ส่งข้อความ"
                className={cn(
                  'flex h-8 w-8 shrink-0 items-center justify-center rounded-full transition-all duration-200 active:scale-[0.92]',
                  canSend
                    ? 'bg-gradient-to-br from-brand-500 via-violet-500 to-pink-500 text-white shadow-[0_4px_12px_-3px_rgba(150,80,210,0.6)] hover:brightness-110'
                    : 'bg-ink-900/[0.06] text-ink-400'
                )}
              >
                <Send
                  className={cn(
                    'h-[15px] w-[15px]',
                    sending && 'animate-send-fly'
                  )}
                />
              </button>
            </form>

            {/* glowing line running along the field border — focus only */}
            <div
              aria-hidden
              className="pointer-events-none absolute inset-0 opacity-0 transition-opacity duration-300 group-focus-within:opacity-100"
            >
              {/* fuzzy glow */}
              <div className="ai-border-beam absolute -inset-[3px] rounded-full p-[3px] opacity-80 blur-[6px]" />
              {/* crisp gradient line */}
              <div className="ai-border-beam absolute -inset-px rounded-full p-[1.6px]" />
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

/* ───────────────────────── pieces ───────────────────────── */

function AiOrb({
  className,
  iconClass,
}: {
  className?: string
  iconClass?: string
}) {
  return (
    <span
      className={cn(
        'relative flex shrink-0 items-center justify-center overflow-hidden rounded-full',
        className
      )}
      style={{
        background:
          'radial-gradient(circle at 33% 26%, #9fb8ff 0%, #6c6cf0 36%, #9a55e2 62%, #d65cb4 84%, #7a2f9e 100%)',
      }}
    >
      <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/50 to-transparent" />
      <Sparkles
        className={cn('relative text-white', iconClass)}
        strokeWidth={2.3}
      />
    </span>
  )
}

function Bubble({ message }: { message: ChatMessage }) {
  const isUser = message.role === 'user'
  return (
    <div
      className={cn(
        'flex',
        isUser
          ? 'animate-msg-send-in justify-end'
          : 'animate-pop-in justify-start'
      )}
    >
      <div
        className={cn(
          'max-w-[86%] whitespace-pre-wrap rounded-2xl px-3.5 py-2.5 text-[13px] leading-relaxed',
          isUser
            ? 'rounded-br-md bg-brand-500 text-white shadow-soft'
            : 'rounded-bl-md border border-white/70 bg-white/75 text-ink-800 shadow-[0_4px_14px_-8px_rgba(28,38,92,0.45)] backdrop-blur-md'
        )}
      >
        {message.text}
      </div>
    </div>
  )
}

function TypingBubble() {
  return (
    <div className="flex animate-pop-in justify-start">
      <div className="flex items-center gap-1.5 rounded-2xl rounded-bl-md border border-white/70 bg-white/75 px-3.5 py-3 backdrop-blur-md">
        {[0, 1, 2].map((i) => (
          <span
            key={i}
            className="h-1.5 w-1.5 animate-bounce rounded-full bg-brand-400"
            style={{ animationDelay: `${i * 0.15}s` }}
          />
        ))}
      </div>
    </div>
  )
}
