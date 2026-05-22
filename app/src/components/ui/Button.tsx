import {
  forwardRef,
  useState,
  type ButtonHTMLAttributes,
  type MouseEvent,
  type ReactNode,
} from 'react'
import { cn } from '@/lib/utils'

type Variant =
  | 'primary'
  | 'secondary'
  | 'ghost'
  | 'glass'
  | 'danger'
  | 'success'
  | 'accent'
type Size = 'sm' | 'md' | 'lg' | 'icon'

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: Variant
  size?: Size
  leftIcon?: ReactNode
  rightIcon?: ReactNode
  loading?: boolean
}

interface Ripple {
  x: number
  y: number
  size: number
  id: number
}

/* liquid-glass buttons — rich gradient + bright inset rim + soft refraction */
const variants: Record<Variant, string> = {
  primary:
    'liquid-glass-button border border-white/25 bg-gradient-to-br from-brand-500/90 via-brand-500/90 to-violet-500/90 text-white shadow-[0_12px_28px_-8px_rgba(58,100,255,0.55),inset_0_1px_0_0_rgba(255,255,255,0.55)] hover:brightness-[1.07]',
  secondary:
    'liquid-glass-button border border-white/60 bg-white/65 text-ink-800 shadow-[0_8px_20px_-10px_rgba(28,38,92,0.4),inset_0_1px_0_0_rgba(255,255,255,0.85)] hover:bg-white/80',
  ghost: 'bg-transparent text-ink-700 hover:bg-white/50',
  glass: 'glass text-ink-800 hover:brightness-105',
  danger:
    'liquid-glass-button border border-white/25 bg-gradient-to-br from-rose-500/90 to-pink-500/90 text-white shadow-[0_12px_28px_-8px_rgba(244,63,94,0.5),inset_0_1px_0_0_rgba(255,255,255,0.5)] hover:brightness-[1.07]',
  success:
    'liquid-glass-button border border-white/25 bg-gradient-to-br from-emerald-500/90 to-teal-500/90 text-white shadow-[0_12px_28px_-8px_rgba(16,185,129,0.5),inset_0_1px_0_0_rgba(255,255,255,0.5)] hover:brightness-[1.07]',
  accent:
    'liquid-glass-button border border-white/25 bg-gradient-to-br from-pink-600/90 to-orange-500/90 text-white shadow-[0_12px_28px_-8px_rgba(236,72,153,0.55),inset_0_1px_0_0_rgba(255,255,255,0.5)] hover:brightness-[1.07]',
}

/* filled variants get a top specular sheen */
const filledVariants: Variant[] = ['primary', 'accent', 'danger', 'success']

const sizes: Record<Size, string> = {
  sm: 'h-9 px-3.5 text-sm rounded-xl gap-1.5',
  md: 'h-11 px-5 text-sm rounded-2xl gap-2',
  lg: 'h-12 px-6 text-base rounded-2xl gap-2',
  icon: 'h-10 w-10 rounded-2xl',
}

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      className,
      variant = 'primary',
      size = 'md',
      leftIcon,
      rightIcon,
      loading,
      disabled,
      children,
      onClick,
      ...props
    },
    ref
  ) => {
    const [ripples, setRipples] = useState<Ripple[]>([])
    const lightSurface =
      variant === 'secondary' || variant === 'ghost' || variant === 'glass'
    const showSheen = filledVariants.includes(variant)

    function handleClick(e: MouseEvent<HTMLButtonElement>) {
      const rect = e.currentTarget.getBoundingClientRect()
      const diameter = Math.max(rect.width, rect.height)
      const id = Date.now() + Math.random()
      setRipples((r) => [
        ...r,
        {
          id,
          size: diameter,
          x: e.clientX - rect.left - diameter / 2,
          y: e.clientY - rect.top - diameter / 2,
        },
      ])
      window.setTimeout(
        () => setRipples((r) => r.filter((rr) => rr.id !== id)),
        600
      )
      onClick?.(e)
    }

    return (
      <button
        ref={ref}
        disabled={disabled || loading}
        onClick={handleClick}
        className={cn(
          'relative inline-flex items-center justify-center overflow-hidden font-medium tracking-tight transition-all duration-200 focus-ring select-none',
          'active:scale-[0.96]',
          'disabled:opacity-50 disabled:cursor-not-allowed disabled:active:scale-100',
          variants[variant],
          sizes[size],
          className
        )}
        {...props}
      >
        {ripples.map((r) => (
          <span
            key={r.id}
            className="ripple-layer"
            style={{
              left: r.x,
              top: r.y,
              width: r.size,
              height: r.size,
              background: lightSurface
                ? 'rgba(28, 38, 92, 0.16)'
                : 'rgba(255, 255, 255, 0.5)',
            }}
          />
        ))}
        {showSheen && (
          <span
            aria-hidden
            className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/25 to-transparent"
          />
        )}
        {loading && (
          <span className="absolute inset-0 flex items-center justify-center">
            <span className="h-4 w-4 animate-spin rounded-full border-2 border-current border-r-transparent opacity-70" />
          </span>
        )}
        <span
          className={cn(
            'relative inline-flex items-center gap-2',
            loading && 'opacity-0'
          )}
        >
          {leftIcon}
          {children}
          {rightIcon}
        </span>
      </button>
    )
  }
)
Button.displayName = 'Button'
