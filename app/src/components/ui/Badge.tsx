import type { HTMLAttributes, ReactNode } from 'react'
import { cn } from '@/lib/utils'

type Tone = 'brand' | 'violet' | 'sky' | 'emerald' | 'amber' | 'rose' | 'neutral'

interface BadgeProps extends HTMLAttributes<HTMLSpanElement> {
  tone?: Tone
  variant?: 'soft' | 'solid' | 'outline'
  icon?: ReactNode
}

const tones: Record<Tone, { soft: string; solid: string; outline: string }> = {
  brand: {
    soft: 'bg-brand-500/15 text-brand-700',
    solid: 'bg-brand-500 text-white',
    outline: 'text-brand-700 ring-1 ring-brand-500/30',
  },
  violet: {
    soft: 'bg-violet-500/15 text-violet-700',
    solid: 'bg-violet-500 text-white',
    outline: 'text-violet-700 ring-1 ring-violet-500/30',
  },
  sky: {
    soft: 'bg-sky-500/15 text-sky-700',
    solid: 'bg-sky-500 text-white',
    outline: 'text-sky-700 ring-1 ring-sky-500/30',
  },
  emerald: {
    soft: 'bg-emerald-500/15 text-emerald-700',
    solid: 'bg-emerald-500 text-white',
    outline: 'text-emerald-700 ring-1 ring-emerald-500/30',
  },
  amber: {
    soft: 'bg-amber-500/15 text-amber-800',
    solid: 'bg-amber-500 text-white',
    outline: 'text-amber-700 ring-1 ring-amber-500/30',
  },
  rose: {
    soft: 'bg-rose-500/15 text-rose-700',
    solid: 'bg-rose-500 text-white',
    outline: 'text-rose-700 ring-1 ring-rose-500/30',
  },
  neutral: {
    soft: 'bg-ink-900/10 text-ink-700',
    solid: 'bg-ink-800 text-white',
    outline: 'text-ink-700 ring-1 ring-ink-900/15',
  },
}

export function Badge({
  tone = 'brand',
  variant = 'soft',
  icon,
  className,
  children,
  ...props
}: BadgeProps) {
  return (
    <span
      className={cn('chip', tones[tone][variant], className)}
      {...props}
    >
      {icon}
      {children}
    </span>
  )
}
