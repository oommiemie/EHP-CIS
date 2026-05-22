import { forwardRef, type SelectHTMLAttributes } from 'react'
import { ChevronDown } from 'lucide-react'
import { cn } from '@/lib/utils'

interface SelectProps extends SelectHTMLAttributes<HTMLSelectElement> {
  label?: string
  hint?: string
  error?: string
  options: { value: string; label: string }[]
}

export const Select = forwardRef<HTMLSelectElement, SelectProps>(
  ({ label, hint, error, options, className, id, ...props }, ref) => {
    const inputId = id || (label ? `s-${label.replace(/\s+/g, '-')}` : undefined)
    return (
      <div className="w-full">
        {label && (
          <label
            htmlFor={inputId}
            className="mb-1.5 block text-[12px] font-medium text-ink-500"
          >
            {label}
          </label>
        )}
        <div
          className={cn(
            'relative flex h-9 items-center rounded-full glass-tight transition-colors duration-200',
            'focus-within:border-brand-500',
            error && 'ring-2 ring-rose-400/60'
          )}
        >
          <select
            ref={ref}
            id={inputId}
            className={cn(
              'w-full min-w-0 cursor-pointer appearance-none bg-transparent px-4 pr-9 text-[13px] text-ink-900 outline-none',
              className
            )}
            {...props}
          >
            {options.map((o) => (
              <option key={o.value} value={o.value}>
                {o.label}
              </option>
            ))}
          </select>
          <ChevronDown className="pointer-events-none absolute right-3 h-4 w-4 text-ink-400" />
        </div>
        {(hint || error) && (
          <p
            className={cn(
              'mt-1.5 text-xs',
              error ? 'text-rose-600' : 'text-ink-400'
            )}
          >
            {error || hint}
          </p>
        )}
      </div>
    )
  }
)
Select.displayName = 'Select'
