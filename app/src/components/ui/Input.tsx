import { forwardRef, type InputHTMLAttributes, type ReactNode } from 'react'
import { cn } from '@/lib/utils'

interface InputProps extends Omit<InputHTMLAttributes<HTMLInputElement>, 'size'> {
  label?: string
  hint?: string
  error?: string
  leftIcon?: ReactNode
  rightSlot?: ReactNode
  size?: 'md' | 'lg'
}

export const Input = forwardRef<HTMLInputElement, InputProps>(
  (
    {
      label,
      hint,
      error,
      leftIcon,
      rightSlot,
      size = 'md',
      className,
      id,
      ...props
    },
    ref
  ) => {
    const inputId = id || (label ? `i-${label.replace(/\s+/g, '-')}` : undefined)
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
            'group relative flex items-center rounded-full glass-tight transition-colors duration-200',
            'focus-within:border-brand-500',
            error && 'ring-2 ring-rose-400/60',
            size === 'md' && 'h-9',
            size === 'lg' && 'h-11'
          )}
        >
          {leftIcon && (
            <div className="pl-4 pr-1 text-ink-400 group-focus-within:text-brand-500">
              {leftIcon}
            </div>
          )}
          <input
            ref={ref}
            id={inputId}
            className={cn(
              'min-w-0 flex-1 bg-transparent px-4 text-[13px] text-ink-900 placeholder-ink-400 outline-none',
              leftIcon && 'pl-2',
              rightSlot && 'pr-2',
              className
            )}
            {...props}
          />
          {rightSlot && <div className="pr-2">{rightSlot}</div>}
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
Input.displayName = 'Input'

export const Textarea = forwardRef<
  HTMLTextAreaElement,
  React.TextareaHTMLAttributes<HTMLTextAreaElement> & {
    label?: string
    hint?: string
    error?: string
  }
>(({ label, hint, error, className, id, ...props }, ref) => {
  const inputId = id || (label ? `t-${label.replace(/\s+/g, '-')}` : undefined)
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
          'relative rounded-[18px] glass-tight transition-colors duration-200 focus-within:border-brand-500',
          error && 'ring-2 ring-rose-400/60'
        )}
      >
        <textarea
          ref={ref}
          id={inputId}
          className={cn(
            'block w-full resize-none bg-transparent px-4 py-2.5 text-[13px] text-ink-900 placeholder-ink-400 outline-none',
            className
          )}
          rows={4}
          {...props}
        />
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
})
Textarea.displayName = 'Textarea'
