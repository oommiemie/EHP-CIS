import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useRef,
  useState,
  type ReactNode,
} from 'react'
import { createPortal } from 'react-dom'
import {
  CheckCircle2,
  XCircle,
  AlertTriangle,
  Info,
  PlusCircle,
  PencilLine,
  Trash2,
  RefreshCw,
  X,
  type LucideIcon,
} from 'lucide-react'
import { cn } from '@/lib/utils'

/* ───────────────────────── types ───────────────────────── */

export type ToastTone =
  | 'success'
  | 'error'
  | 'warning'
  | 'info'
  | 'add'
  | 'edit'
  | 'delete'
  | 'update'

export interface ToastOptions {
  title: string
  description?: string
  tone?: ToastTone
  /** ms before auto-dismiss — `0` keeps it until closed manually */
  duration?: number
}

interface ToastItem {
  id: number
  title: string
  description?: string
  tone: ToastTone
  duration: number
}

interface ToastApi {
  show: (o: ToastOptions) => void
  success: (title: string, description?: string) => void
  error: (title: string, description?: string) => void
  warning: (title: string, description?: string) => void
  info: (title: string, description?: string) => void
  add: (title: string, description?: string) => void
  edit: (title: string, description?: string) => void
  remove: (title: string, description?: string) => void
  update: (title: string, description?: string) => void
}

/* ──────────────────────── variants ─────────────────────── */

/* solid, vivid icon badges — gradient fill + white glyph */
const CHIP =
  'text-white shadow-[inset_0_1px_0_0_rgba(255,255,255,0.45),0_5px_14px_-4px_rgba(0,0,0,0.55)]'

const VARIANTS: Record<
  ToastTone,
  { icon: LucideIcon; chip: string; ring: string; glow: string }
> = {
  success: {
    icon: CheckCircle2,
    chip: `bg-gradient-to-br from-emerald-400 to-teal-500 ${CHIP}`,
    ring: 'text-emerald-300',
    glow: 'bg-emerald-500/40',
  },
  error: {
    icon: XCircle,
    chip: `bg-gradient-to-br from-rose-500 to-red-600 ${CHIP}`,
    ring: 'text-rose-300',
    glow: 'bg-rose-500/40',
  },
  warning: {
    icon: AlertTriangle,
    chip: `bg-gradient-to-br from-amber-400 to-orange-500 ${CHIP}`,
    ring: 'text-amber-300',
    glow: 'bg-amber-500/40',
  },
  info: {
    icon: Info,
    chip: `bg-gradient-to-br from-sky-400 to-cyan-500 ${CHIP}`,
    ring: 'text-sky-300',
    glow: 'bg-sky-500/40',
  },
  add: {
    icon: PlusCircle,
    chip: `bg-gradient-to-br from-violet-500 to-fuchsia-500 ${CHIP}`,
    ring: 'text-violet-300',
    glow: 'bg-violet-500/40',
  },
  edit: {
    icon: PencilLine,
    chip: `bg-gradient-to-br from-blue-500 to-indigo-500 ${CHIP}`,
    ring: 'text-blue-300',
    glow: 'bg-blue-500/40',
  },
  delete: {
    icon: Trash2,
    chip: `bg-gradient-to-br from-rose-500 to-pink-600 ${CHIP}`,
    ring: 'text-rose-300',
    glow: 'bg-rose-500/40',
  },
  update: {
    icon: RefreshCw,
    chip: `bg-gradient-to-br from-cyan-400 to-sky-500 ${CHIP}`,
    ring: 'text-cyan-300',
    glow: 'bg-cyan-500/40',
  },
}

/** longer dwell for things the user must not miss */
const DEFAULT_DURATION: Record<ToastTone, number> = {
  success: 4600,
  info: 4600,
  add: 4600,
  edit: 4600,
  update: 4600,
  warning: 5600,
  error: 6800,
  delete: 6000,
}

/* ──────────────────────── context ──────────────────────── */

const ToastContext = createContext<ToastApi | null>(null)

export function useToast(): ToastApi {
  const ctx = useContext(ToastContext)
  if (!ctx) throw new Error('useToast must be used within <ToastProvider>')
  return ctx
}

const MAX_VISIBLE = 5

let seq = 0

export function ToastProvider({ children }: { children: ReactNode }) {
  const [toasts, setToasts] = useState<ToastItem[]>([])
  const queue = useRef<ToastItem[]>([])
  const draining = useRef(false)

  const close = useCallback((id: number) => {
    setToasts((cur) => cur.filter((t) => t.id !== id))
  }, [])

  /** release queued toasts one-by-one so they pop out in sequence */
  const drain = useCallback(() => {
    const next = queue.current.shift()
    if (!next) {
      draining.current = false
      return
    }
    setToasts((cur) => [next, ...cur].slice(0, MAX_VISIBLE))
    window.setTimeout(drain, 240)
  }, [])

  const api = useMemo<ToastApi>(() => {
    const show = (o: ToastOptions) => {
      const tone = o.tone ?? 'info'
      queue.current.push({
        id: ++seq,
        title: o.title,
        description: o.description,
        tone,
        duration: o.duration ?? DEFAULT_DURATION[tone],
      })
      if (!draining.current) {
        draining.current = true
        drain()
      }
    }
    const make =
      (tone: ToastTone) => (title: string, description?: string) =>
        show({ title, description, tone })
    return {
      show,
      success: make('success'),
      error: make('error'),
      warning: make('warning'),
      info: make('info'),
      add: make('add'),
      edit: make('edit'),
      remove: make('delete'),
      update: make('update'),
    }
  }, [drain])

  return (
    <ToastContext.Provider value={api}>
      {children}
      <ToastViewport toasts={toasts} onClose={close} />
    </ToastContext.Provider>
  )
}

/* ──────────────────────── viewport ─────────────────────── */

function ToastViewport({
  toasts,
  onClose,
}: {
  toasts: ToastItem[]
  onClose: (id: number) => void
}) {
  if (typeof document === 'undefined') return null
  return createPortal(
    <div className="pointer-events-none fixed right-3 top-3 z-[200] flex w-[362px] max-w-[calc(100vw-24px)] flex-col">
      {toasts.map((t) => (
        <ToastRow key={t.id} toast={t} onClose={onClose} />
      ))}
    </div>,
    document.body
  )
}

/* ───────────────────────── row ─────────────────────────── */

function ToastRow({
  toast,
  onClose,
}: {
  toast: ToastItem
  onClose: (id: number) => void
}) {
  const [leaving, setLeaving] = useState(false)
  const [paused, setPaused] = useState(false)
  const closed = useRef(false)
  const timer = useRef<number | undefined>(undefined)
  const remaining = useRef(toast.duration)
  const startedAt = useRef(0)

  const dismiss = useCallback(() => {
    if (closed.current) return
    closed.current = true
    window.clearTimeout(timer.current)
    setLeaving(true)
    window.setTimeout(() => onClose(toast.id), 320)
  }, [toast.id, onClose])

  const arm = useCallback(() => {
    if (!toast.duration || closed.current) return
    startedAt.current = Date.now()
    timer.current = window.setTimeout(dismiss, remaining.current)
  }, [toast.duration, dismiss])

  const hold = useCallback(() => {
    if (!toast.duration) return
    window.clearTimeout(timer.current)
    remaining.current -= Date.now() - startedAt.current
  }, [toast.duration])

  useEffect(() => {
    arm()
    return () => window.clearTimeout(timer.current)
  }, [arm])

  const v = VARIANTS[toast.tone]
  const Icon = v.icon

  return (
    <div
      className={cn(
        'grid transition-[grid-template-rows,opacity] duration-300 ease-[cubic-bezier(0.22,1,0.36,1)]',
        leaving ? 'grid-rows-[0fr] opacity-0' : 'grid-rows-[1fr] opacity-100'
      )}
    >
      <div
        className={cn(
          'min-h-0',
          /* clip only while collapsing — keeps the drop shadow un-cropped at rest */
          leaving ? 'overflow-hidden' : 'overflow-visible'
        )}
      >
        <div className="px-5 pb-3.5 pt-2.5">
          <div
            role="status"
            onMouseEnter={() => {
              setPaused(true)
              hold()
            }}
            onMouseLeave={() => {
              setPaused(false)
              arm()
            }}
            className={cn(
              'liquid-glass pointer-events-auto relative flex items-center gap-3 overflow-hidden rounded-full border border-white/[0.14] py-2.5 pl-2.5 pr-11 shadow-[0_18px_38px_-12px_rgba(4,6,24,0.78),inset_0_1px_0_0_rgba(255,255,255,0.14)]',
              leaving ? 'animate-toast-out' : 'animate-toast-in'
            )}
            style={{
              background:
                'linear-gradient(140deg, rgba(20,24,53,0.9) 0%, rgba(11,14,34,0.86) 100%)',
            }}
          >
            {/* tone glow */}
            <span
              aria-hidden
              className={cn(
                'pointer-events-none absolute -left-7 -top-8 h-24 w-24 rounded-full blur-2xl',
                v.glow
              )}
            />
            {/* top hairline sheen */}
            <span
              aria-hidden
              className="pointer-events-none absolute inset-x-10 top-[3px] h-px bg-gradient-to-r from-transparent via-white/40 to-transparent"
            />

            {/* icon + countdown ring */}
            <span className="relative flex h-11 w-11 shrink-0 items-center justify-center">
              {toast.duration > 0 && (
                <svg
                  viewBox="0 0 44 44"
                  aria-hidden
                  className={cn(
                    'absolute inset-0 h-full w-full -rotate-90',
                    v.ring
                  )}
                >
                  <circle
                    cx="22"
                    cy="22"
                    r="20"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2.5"
                    className="opacity-[0.18]"
                  />
                  <circle
                    cx="22"
                    cy="22"
                    r="20"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2.5"
                    strokeLinecap="round"
                    pathLength={100}
                    style={{
                      strokeDasharray: 100,
                      animation: `toast-ring ${toast.duration}ms linear forwards`,
                      animationPlayState: paused ? 'paused' : 'running',
                    }}
                  />
                </svg>
              )}
              <span
                className={cn(
                  'relative flex h-9 w-9 items-center justify-center rounded-full',
                  v.chip
                )}
              >
                <Icon className="h-[19px] w-[19px]" strokeWidth={2.3} />
              </span>
            </span>

            {/* text */}
            <div className="relative min-w-0 flex-1">
              <p className="truncate text-[13.5px] font-semibold leading-snug text-white">
                {toast.title}
              </p>
              {toast.description && (
                <p className="mt-0.5 truncate text-[12px] leading-snug text-white/60">
                  {toast.description}
                </p>
              )}
            </div>

            {/* close */}
            <button
              type="button"
              onClick={dismiss}
              aria-label="ปิดการแจ้งเตือน"
              className="absolute right-2.5 top-1/2 flex h-7 w-7 -translate-y-1/2 items-center justify-center rounded-full text-white/45 transition-colors hover:bg-white/10 hover:text-white"
            >
              <X className="h-3.5 w-3.5" />
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}
