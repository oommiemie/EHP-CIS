import { useEffect, useRef, useState } from 'react'
import {
  Calendar,
  Clock,
  ChevronLeft,
  ChevronRight,
  ChevronDown,
} from 'lucide-react'
import { cn } from '@/lib/utils'

/** trigger styles — 'field' = bordered pill, 'ghost' = borderless (เหมือนตัวกรองวันหน้าทะเบียน) */
type PickerVariant = 'field' | 'ghost'

const TH_MONTHS = [
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
const TH_DOW = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส']

/* trigger button — matches the compact pill fields */
const fieldCx =
  'flex h-9 w-full items-center gap-2 rounded-full glass-tight px-4 text-left text-[13px] transition-colors duration-200'
/* borderless trigger — matches the date filter on หน้าทะเบียนผู้ป่วย */
const ghostCx =
  'flex h-11 w-full items-center gap-2 rounded-full px-4 text-left text-[13.5px] font-medium transition-colors duration-200'

/* liquid-glass popup surface — เหมือน dropdown แจ้งเตือน */
const popupShell =
  'liquid-glass overflow-hidden border border-white/60 bg-white/65 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.95),inset_0_0_0_1px_rgba(255,255,255,0.16),0_24px_56px_-16px_rgba(18,26,78,0.55)]'

/** specular light streaks for the liquid-glass popups */
function PopupSheen() {
  return (
    <>
      <span
        aria-hidden
        className="pointer-events-none absolute inset-x-0 top-0 h-1/3 bg-gradient-to-b from-white/55 via-white/[0.12] to-transparent"
      />
      <span
        aria-hidden
        className="pointer-events-none absolute -left-8 -top-10 h-32 w-32 rounded-full bg-white/40 blur-2xl"
      />
    </>
  )
}

/** close the popup when clicking anywhere outside `ref` */
function useClickOutside(
  ref: React.RefObject<HTMLElement>,
  active: boolean,
  close: () => void
) {
  useEffect(() => {
    if (!active) return
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) close()
    }
    document.addEventListener('mousedown', handler)
    return () => document.removeEventListener('mousedown', handler)
  }, [ref, active, close])
}

function NavBtn({
  onClick,
  dir,
}: {
  onClick: () => void
  dir: 'prev' | 'next'
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="flex h-7 w-7 items-center justify-center rounded-lg text-ink-500 transition-colors hover:bg-brand-500/10 hover:text-brand-600 active:scale-90"
    >
      {dir === 'prev' ? (
        <ChevronLeft className="h-4 w-4" />
      ) : (
        <ChevronRight className="h-4 w-4" />
      )}
    </button>
  )
}

/* ───────────────────────── Date Picker ───────────────────────── */

export function DatePicker({
  value,
  onChange,
  placeholder = 'เลือกวันที่',
  disabled,
  variant = 'field',
}: {
  value: string
  onChange: (v: string) => void
  placeholder?: string
  disabled?: boolean
  variant?: PickerVariant
}) {
  const isGhost = variant === 'ghost'
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)
  useClickOutside(ref, open, () => setOpen(false))

  const selected = value ? new Date(`${value}T00:00:00`) : null
  const [view, setView] = useState(() => selected ?? new Date())

  // jump the calendar to the selected month each time it opens
  useEffect(() => {
    if (open && selected) setView(new Date(selected.getFullYear(), selected.getMonth(), 1))
  }, [open]) // eslint-disable-line react-hooks/exhaustive-deps

  const year = view.getFullYear()
  const month = view.getMonth()
  const firstDow = new Date(year, month, 1).getDay()
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const today = new Date()

  const cells: (number | null)[] = [
    ...Array<null>(firstDow).fill(null),
    ...Array.from({ length: daysInMonth }, (_, i) => i + 1),
  ]

  const sameDay = (d: number, dt: Date | null) =>
    !!dt &&
    dt.getFullYear() === year &&
    dt.getMonth() === month &&
    dt.getDate() === d

  const emit = (y: number, m: number, d: number) => {
    onChange(
      `${y}-${String(m + 1).padStart(2, '0')}-${String(d).padStart(2, '0')}`
    )
    setOpen(false)
  }

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        disabled={disabled}
        onClick={() => !disabled && setOpen((o) => !o)}
        className={cn(
          isGhost ? ghostCx : fieldCx,
          disabled
            ? 'cursor-not-allowed border-ink-900/[0.07] bg-ink-900/[0.035]'
            : isGhost
              ? open
                ? 'bg-ink-900/[0.06]'
                : 'hover:bg-ink-900/[0.055]'
              : open && 'border-brand-500'
        )}
      >
        <Calendar
          className={cn(
            'shrink-0',
            isGhost ? 'h-4 w-4' : 'h-3.5 w-3.5',
            disabled
              ? 'text-ink-300'
              : isGhost
                ? 'text-brand-500'
                : 'text-ink-400'
          )}
        />
        <span
          className={cn(
            'flex-1 truncate',
            !selected
              ? 'text-ink-400'
              : disabled
                ? 'text-ink-600'
                : isGhost
                  ? 'text-ink-700'
                  : 'text-ink-900'
          )}
        >
          {selected
            ? `${selected.getDate()} ${TH_MONTHS[selected.getMonth()]} ${
                selected.getFullYear() + 543
              }`
            : placeholder}
        </span>
        {isGhost && (
          <ChevronDown
            className={cn(
              'h-4 w-4 shrink-0 text-ink-400 transition-transform duration-200',
              open && 'rotate-180'
            )}
          />
        )}
      </button>

      {open && (
        <div
          className={cn(
            'absolute left-0 top-[calc(100%+16px)] z-50 w-[256px] animate-pop-in rounded-2xl',
            popupShell
          )}
        >
          <PopupSheen />
          <div className="relative p-3">
          {/* month nav */}
          <div className="mb-2 flex items-center justify-between">
            <NavBtn onClick={() => setView(new Date(year, month - 1, 1))} dir="prev" />
            <span className="text-[13px] font-semibold text-ink-900">
              {TH_MONTHS[month]} {year + 543}
            </span>
            <NavBtn onClick={() => setView(new Date(year, month + 1, 1))} dir="next" />
          </div>

          {/* weekday header */}
          <div className="mb-1 grid grid-cols-7">
            {TH_DOW.map((d) => (
              <span
                key={d}
                className="text-center text-[10px] font-semibold text-ink-400"
              >
                {d}
              </span>
            ))}
          </div>

          {/* day grid */}
          <div className="grid grid-cols-7 gap-0.5">
            {cells.map((d, i) =>
              d === null ? (
                <span key={i} />
              ) : (
                <button
                  key={i}
                  type="button"
                  onClick={() => emit(year, month, d)}
                  className={cn(
                    'flex h-8 items-center justify-center rounded-lg text-[12.5px] transition-all duration-150 active:scale-90',
                    sameDay(d, selected)
                      ? 'bg-gradient-to-br from-brand-500 to-violet-500 font-semibold text-white shadow-[0_4px_10px_-3px_rgba(58,100,255,0.6)]'
                      : sameDay(d, today)
                        ? 'font-semibold text-brand-600 ring-1 ring-inset ring-brand-500/40 hover:bg-brand-500/10'
                        : 'text-ink-700 hover:bg-brand-500/10'
                  )}
                >
                  {d}
                </button>
              )
            )}
          </div>

          {/* footer */}
          <div className="mt-2 flex gap-1.5 border-t border-ink-900/[0.07] pt-2">
            <button
              type="button"
              onClick={() => {
                const t = new Date()
                emit(t.getFullYear(), t.getMonth(), t.getDate())
              }}
              className="flex-1 rounded-lg bg-brand-500/10 py-1.5 text-[11.5px] font-semibold text-brand-600 transition-colors hover:bg-brand-500/20"
            >
              วันนี้
            </button>
            <button
              type="button"
              onClick={() => {
                onChange('')
                setOpen(false)
              }}
              className="flex-1 rounded-lg bg-ink-900/[0.05] py-1.5 text-[11.5px] font-semibold text-ink-500 transition-colors hover:bg-ink-900/10"
            >
              ล้าง
            </button>
          </div>
          </div>
        </div>
      )}
    </div>
  )
}

/* ───────────────────────── Time Picker ───────────────────────── */

export function TimePicker({
  value,
  onChange,
  placeholder = 'เลือกเวลา',
  disabled,
  variant = 'field',
}: {
  value: string
  onChange: (v: string) => void
  placeholder?: string
  disabled?: boolean
  variant?: PickerVariant
}) {
  const isGhost = variant === 'ghost'
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)
  useClickOutside(ref, open, () => setOpen(false))

  const [hh, mm] = value ? value.split(':') : ['', '']
  const hours = Array.from({ length: 24 }, (_, i) => String(i).padStart(2, '0'))
  const mins = Array.from({ length: 12 }, (_, i) => String(i * 5).padStart(2, '0'))

  const cellCx = (on: boolean) =>
    cn(
      'h-7 rounded-lg text-[12px] transition-all duration-150 active:scale-90',
      on
        ? 'bg-gradient-to-br from-brand-500 to-violet-500 font-semibold text-white shadow-[0_3px_8px_-3px_rgba(58,100,255,0.6)]'
        : 'text-ink-700 hover:bg-brand-500/10'
    )

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        disabled={disabled}
        onClick={() => !disabled && setOpen((o) => !o)}
        className={cn(
          isGhost ? ghostCx : fieldCx,
          disabled
            ? 'cursor-not-allowed border-ink-900/[0.07] bg-ink-900/[0.035]'
            : isGhost
              ? open
                ? 'bg-ink-900/[0.06]'
                : 'hover:bg-ink-900/[0.055]'
              : open && 'border-brand-500'
        )}
      >
        <Clock
          className={cn(
            'shrink-0',
            isGhost ? 'h-4 w-4' : 'h-3.5 w-3.5',
            disabled
              ? 'text-ink-300'
              : isGhost
                ? 'text-brand-500'
                : 'text-ink-400'
          )}
        />
        <span
          className={cn(
            'flex-1 truncate',
            !value
              ? 'text-ink-400'
              : disabled
                ? 'text-ink-600'
                : isGhost
                  ? 'text-ink-700'
                  : 'text-ink-900'
          )}
        >
          {value ? `${value} น.` : placeholder}
        </span>
        {isGhost && (
          <ChevronDown
            className={cn(
              'h-4 w-4 shrink-0 text-ink-400 transition-transform duration-200',
              open && 'rotate-180'
            )}
          />
        )}
      </button>

      {open && (
        <div
          className={cn(
            'absolute left-0 top-[calc(100%+16px)] z-50 w-[244px] animate-pop-in rounded-2xl',
            popupShell
          )}
        >
          <PopupSheen />
          <div className="relative p-3">
          <div className="mb-1 text-[11px] font-semibold text-ink-400">
            ชั่วโมง
          </div>
          <div className="grid grid-cols-6 gap-1">
            {hours.map((h) => (
              <button
                key={h}
                type="button"
                onClick={() => onChange(`${h}:${mm || '00'}`)}
                className={cellCx(h === hh)}
              >
                {h}
              </button>
            ))}
          </div>
          <div className="mb-1 mt-3 text-[11px] font-semibold text-ink-400">
            นาที
          </div>
          <div className="grid grid-cols-6 gap-1">
            {mins.map((m) => (
              <button
                key={m}
                type="button"
                onClick={() => onChange(`${hh || '00'}:${m}`)}
                className={cellCx(m === mm)}
              >
                {m}
              </button>
            ))}
          </div>
          <button
            type="button"
            onClick={() => setOpen(false)}
            className="mt-3 w-full rounded-lg bg-brand-500/10 py-1.5 text-[11.5px] font-semibold text-brand-600 transition-colors hover:bg-brand-500/20"
          >
            เสร็จสิ้น
          </button>
          </div>
        </div>
      )}
    </div>
  )
}
