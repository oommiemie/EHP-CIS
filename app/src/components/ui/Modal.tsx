import { useEffect, type ReactNode } from 'react'
import { createPortal } from 'react-dom'
import { X, type LucideIcon } from 'lucide-react'
import { cn } from '@/lib/utils'

interface ModalProps {
  open: boolean
  onClose: () => void
  title?: ReactNode
  description?: ReactNode
  icon?: LucideIcon
  children: ReactNode
  footer?: ReactNode
  size?: 'sm' | 'md' | 'lg' | 'xl'
}

const sizes = {
  sm: 'max-w-sm',
  md: 'max-w-md',
  lg: 'max-w-2xl',
  xl: 'max-w-4xl',
}

export function Modal({
  open,
  onClose,
  title,
  description,
  icon: Icon,
  children,
  footer,
  size = 'md',
}: ModalProps) {
  useEffect(() => {
    if (!open) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    document.body.style.overflow = 'hidden'
    return () => {
      window.removeEventListener('keydown', onKey)
      document.body.style.overflow = ''
    }
  }, [open, onClose])

  if (!open) return null

  return createPortal(
    <div className="fixed inset-0 z-[100] flex items-center justify-center p-4">
      <div
        className="absolute inset-0 bg-ink-900/30 backdrop-blur-sm animate-fade-up"
        onClick={onClose}
      />
      <div
        className={cn(
          'relative w-full rounded-3xl glass-strong p-6 animate-pop-in',
          sizes[size]
        )}
        role="dialog"
        aria-modal="true"
      >
        <button
          onClick={onClose}
          className="absolute right-4 top-4 inline-flex h-9 w-9 items-center justify-center rounded-2xl text-ink-500 hover:bg-ink-900/5 hover:text-ink-900 focus-ring"
          aria-label="Close"
        >
          <X className="h-4 w-4" />
        </button>
        {title && (
          <div className="mb-4 flex items-center gap-3 pr-10">
            {Icon && (
              <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-2xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-600">
                <Icon className="h-5 w-5" />
              </span>
            )}
            <div className="min-w-0">
              <h3 className="text-lg font-semibold tracking-tight text-ink-900">
                {title}
              </h3>
              {description && (
                <p className="mt-0.5 text-sm text-ink-500">{description}</p>
              )}
            </div>
          </div>
        )}
        <div>{children}</div>
        {footer && <div className="mt-6 flex items-center justify-end gap-2">{footer}</div>}
      </div>
    </div>,
    document.body
  )
}
