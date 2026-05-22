import { useEffect, useState } from 'react'
import { Sparkles, X } from 'lucide-react'
import { cn } from '@/lib/utils'
import { AiChatPanel } from './AiChatPanel'

/** Soft glow particles that orbit and scatter around the button. */
const PARTICLES = [
  { r: 50, dur: 6.5, delay: 0, size: 16, color: 'rgba(125,168,255,0.9)', rev: false, tw: 2.8 },
  { r: 59, dur: 9, delay: -2, size: 10, color: 'rgba(56,189,248,0.95)', rev: true, tw: 3.6 },
  { r: 44, dur: 5.6, delay: -1, size: 14, color: 'rgba(244,114,182,0.9)', rev: false, tw: 2.4 },
  { r: 63, dur: 11, delay: -4, size: 9, color: 'rgba(255,255,255,0.95)', rev: true, tw: 4 },
  { r: 53, dur: 7.6, delay: -3, size: 15, color: 'rgba(147,197,253,0.88)', rev: false, tw: 3.2 },
  { r: 47, dur: 8.4, delay: -1.5, size: 11, color: 'rgba(249,168,212,0.92)', rev: true, tw: 2.6 },
]

/** Voice-waveform bars shown while "talking" on hover/focus. */
const WAVE = [
  { h: 20, dur: '0.5s', delay: '0s' },
  { h: 20, dur: '0.37s', delay: '0.09s' },
  { h: 20, dur: '0.6s', delay: '0s' },
  { h: 20, dur: '0.43s', delay: '0.13s' },
  { h: 20, dur: '0.53s', delay: '0.05s' },
]

/** Greeting lines — shown one at a time, rotating, never twice in a row. */
const GREETINGS = [
  'สวัสดีค่ะ 👋 วันนี้อยากทราบข้อมูลอะไรคะ — เริ่มสนทนากับฉันได้เลย',
  'มีอะไรให้ช่วยไหมคะ 😊 ถามเรื่องผู้ป่วยหรือสถิติได้เลยนะคะ',
  'อยากรู้ว่าวันนี้มีผู้ป่วยกี่คน? กดถามฉันได้เลยค่ะ ✨',
  'พิมพ์ชื่อหรือ HN ผู้ป่วย ฉันสรุปข้อมูลให้ได้ทันทีค่ะ 📋',
  'ตรวจสอบประวัติแพ้ยาหรือคิวการตรวจ ให้ฉันช่วยได้นะคะ',
  'ต้องการสรุปภาพรวมของวันนี้ไหมคะ ถามฉันได้เลยค่ะ 📊',
]

/* timings for the greeting cycle */
const BUBBLE_FIRST = 2200 // first appearance
const BUBBLE_SHOW = 6500 // how long it stays
const BUBBLE_GAP = 18000 // pause before the next greeting

/**
 * Floating AI-assistant button — gentle idle motion, a talking voice-wave
 * on hover/focus, a soft particle aura, plus a rotating greeting bubble.
 */
export function AiAssistantFab() {
  const [engaged, setEngaged] = useState(false) // hover / keyboard focus
  const [bubbleOn, setBubbleOn] = useState(false)
  const [greetIndex, setGreetIndex] = useState(0)
  const [open, setOpen] = useState(false)

  // greeting cycle — pop up, auto-close, wait, then a fresh random line
  useEffect(() => {
    if (open) return
    let alive = true
    let timer = 0
    const run = (delay: number) => {
      timer = window.setTimeout(() => {
        if (!alive) return
        setBubbleOn(true)
        timer = window.setTimeout(() => {
          if (!alive) return
          setBubbleOn(false)
          setGreetIndex((i) => {
            let n = i
            while (n === i) n = Math.floor(Math.random() * GREETINGS.length)
            return n
          })
          run(BUBBLE_GAP)
        }, BUBBLE_SHOW)
      }, delay)
    }
    run(BUBBLE_FIRST)
    return () => {
      alive = false
      window.clearTimeout(timer)
    }
  }, [open])

  const showBubble = !open && (engaged || bubbleOn)

  return (
    <>
      {/* ── Floating button (smoothly fades out as the panel grows) ── */}
      <div
        className={cn(
          'fixed bottom-6 right-6 z-50 flex items-center gap-3 transition-[transform,opacity] duration-300 ease-[cubic-bezier(0.22,1,0.36,1)]',
          open
            ? 'pointer-events-none scale-90 opacity-0'
            : 'scale-100 opacity-100'
        )}
      >
        {/* ── Greeting bubble ─────────────────────────────── */}
      {showBubble && (
        <div className="animate-ai-bubble-in w-[244px] origin-right">
          <div className="glass-strong relative rounded-2xl p-3.5 pr-8">
            <div className="flex items-center gap-1.5">
              <Sparkles className="h-3.5 w-3.5 text-brand-500" />
              <span className="text-[10.5px] font-bold uppercase tracking-[0.12em] text-brand-600">
                ผู้ช่วย AI
              </span>
            </div>
            <p className="mt-1.5 text-[13px] leading-relaxed text-ink-700">
              {GREETINGS[greetIndex]}
            </p>
            <button
              type="button"
              aria-label="ปิด"
              onClick={() => setBubbleOn(false)}
              className="absolute right-2 top-2 flex h-5 w-5 items-center justify-center rounded-full text-ink-400 transition hover:bg-ink-900/5 hover:text-ink-700"
            >
              <X className="h-3.5 w-3.5" />
            </button>
            <span className="absolute right-[-5px] top-1/2 h-2.5 w-2.5 -translate-y-1/2 rotate-45 border-r border-t border-white/80 bg-white" />
          </div>
        </div>
      )}

      {/* ── Floating button ─────────────────────────────── */}
      <div className="animate-ai-float shrink-0">
        <button
          type="button"
          aria-label="เปิดผู้ช่วย AI"
          onMouseEnter={() => setEngaged(true)}
          onMouseLeave={() => setEngaged(false)}
          onFocus={() => setEngaged(true)}
          onBlur={() => setEngaged(false)}
          onClick={() => setOpen(true)}
          className={cn(
            'group relative h-16 w-16 rounded-full outline-none transition-transform duration-300 ease-out focus-visible:ring-4 focus-visible:ring-brand-500/30',
            engaged && 'scale-[1.1]'
          )}
        >
          {/* pulsing aura */}
          <span
            aria-hidden
            className="animate-ai-glow pointer-events-none absolute -inset-3 rounded-full blur-xl"
            style={{
              background:
                'radial-gradient(circle, rgba(140,90,230,0.88), rgba(244,114,182,0.3) 62%, transparent 78%)',
            }}
          />
          {/* spinning conic halo */}
          <span
            aria-hidden
            className={cn(
              'pointer-events-none absolute -inset-[3px] rounded-full opacity-90 blur-[2px]',
              engaged ? 'animate-ai-spin-fast' : 'animate-ai-spin-slow'
            )}
            style={{
              background:
                'conic-gradient(from 0deg, #3a64ff, #38bdf8, #a78bfa, #f472b6, #8b5cf6, #3a64ff)',
            }}
          />
          {/* orbiting glow particles */}
          <span
            aria-hidden
            className={cn(
              'pointer-events-none absolute inset-0 transition-opacity duration-300',
              engaged ? 'opacity-100' : 'opacity-0'
            )}
          >
            {PARTICLES.map((p, i) => (
              <span
                key={i}
                className="animate-ai-orbit absolute left-1/2 top-1/2"
                style={{
                  width: p.r * 2,
                  height: p.r * 2,
                  marginLeft: -p.r,
                  marginTop: -p.r,
                  animationDuration: `${p.dur}s`,
                  animationDelay: `${p.delay}s`,
                  animationDirection: p.rev ? 'reverse' : 'normal',
                }}
              >
                <span
                  className="animate-ai-twinkle absolute left-1/2 top-0 rounded-full blur-[1.5px]"
                  style={{
                    width: p.size,
                    height: p.size,
                    marginLeft: -p.size / 2,
                    marginTop: -p.size / 2,
                    background: `radial-gradient(circle, ${p.color} 0%, transparent 68%)`,
                    animationDuration: `${p.tw}s`,
                    animationDelay: `${p.delay}s`,
                  }}
                />
              </span>
            ))}
          </span>
          {/* orb */}
          <span
            className="absolute inset-0 flex items-center justify-center overflow-hidden rounded-full shadow-[0_12px_30px_-6px_rgba(150,80,210,0.72),inset_0_2px_7px_rgba(255,255,255,0.55),inset_0_-8px_14px_-6px_rgba(40,16,56,0.5)]"
            style={{
              background:
                'radial-gradient(circle at 33% 26%, #9fb8ff 0%, #6c6cf0 36%, #9a55e2 62%, #d65cb4 84%, #7a2f9e 100%)',
            }}
          >
            {/* glossy sheen */}
            <span className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/55 to-transparent" />
            {/* highlight */}
            <span className="pointer-events-none absolute left-[24%] top-[22%] h-3 w-3 rounded-full bg-white/75 blur-[3px]" />
            {/* idle — sparkles icon */}
            <span
              className={cn(
                'absolute inset-0 flex items-center justify-center transition-opacity duration-200',
                engaged ? 'opacity-0' : 'opacity-100'
              )}
            >
              <Sparkles
                className="h-7 w-7 text-white drop-shadow-[0_2px_4px_rgba(10,8,40,0.4)]"
                strokeWidth={2.2}
              />
            </span>
            {/* talking — voice waveform */}
            <span
              className={cn(
                'absolute inset-0 flex items-center justify-center gap-[3px] transition-opacity duration-200',
                engaged ? 'opacity-100' : 'opacity-0'
              )}
            >
              {WAVE.map((b, i) => (
                <span
                  key={i}
                  className="animate-ai-wave w-[3.5px] rounded-full bg-white drop-shadow-[0_1px_2px_rgba(10,8,40,0.35)]"
                  style={{
                    height: b.h,
                    animationDuration: b.dur,
                    animationDelay: b.delay,
                  }}
                />
              ))}
            </span>
          </span>
          {/* online indicator */}
          <span aria-hidden className="absolute right-1 top-1 flex h-3.5 w-3.5">
            <span className="absolute inline-flex h-full w-full animate-ping rounded-full bg-emerald-400 opacity-70" />
            <span className="relative inline-flex h-3.5 w-3.5 rounded-full border-2 border-white bg-emerald-400" />
          </span>
        </button>
      </div>
      </div>

      {/* ── Chat panel — grows from / collapses to the button ── */}
      <AiChatPanel open={open} onClose={() => setOpen(false)} />
    </>
  )
}
