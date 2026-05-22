import { type ReactNode } from 'react'
import { cn } from '@/lib/utils'

export interface TabItem {
  value: string
  label: ReactNode
  icon?: ReactNode
  badge?: ReactNode
}

interface TabsProps {
  items: TabItem[]
  value: string
  onChange: (value: string) => void
  variant?: 'pill' | 'underline'
  className?: string
}

export function Tabs({
  items,
  value,
  onChange,
  variant = 'pill',
  className,
}: TabsProps) {
  if (variant === 'pill') {
    return (
      <div
        className={cn(
          'liquid-glass-button inline-flex items-center gap-1 rounded-2xl border border-white/60 bg-white/60 p-1 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.9),0_10px_26px_-12px_rgba(28,38,92,0.34)]',
          className
        )}
        role="tablist"
      >
        {items.map((item) => {
          const active = item.value === value
          return (
            <button
              key={item.value}
              role="tab"
              aria-selected={active}
              onClick={() => onChange(item.value)}
              className={cn(
                'relative inline-flex items-center gap-2 rounded-xl px-4 h-9 text-sm font-medium transition-all focus-ring',
                active
                  ? 'bg-white text-ink-900 shadow-glass-sm'
                  : 'text-ink-500 hover:text-ink-800'
              )}
            >
              {item.icon}
              <span>{item.label}</span>
              {item.badge}
            </button>
          )
        })}
      </div>
    )
  }
  // underline variant
  return (
    <div
      className={cn('flex gap-1 border-b border-ink-900/8 overflow-x-auto', className)}
      role="tablist"
    >
      {items.map((item) => {
        const active = item.value === value
        return (
          <button
            key={item.value}
            role="tab"
            aria-selected={active}
            onClick={() => onChange(item.value)}
            className={cn(
              'relative inline-flex items-center gap-2 px-4 py-3 text-sm font-medium whitespace-nowrap transition-colors',
              active ? 'text-brand-600' : 'text-ink-500 hover:text-ink-800'
            )}
          >
            {item.icon}
            <span>{item.label}</span>
            {item.badge}
            {active && (
              <span className="absolute inset-x-3 -bottom-px h-0.5 rounded-full bg-gradient-to-r from-brand-500 via-violet-500 to-sky-500" />
            )}
          </button>
        )
      })}
    </div>
  )
}
