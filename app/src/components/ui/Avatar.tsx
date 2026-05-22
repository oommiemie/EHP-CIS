import { useState } from 'react'
import { cn, initials } from '@/lib/utils'

interface AvatarProps {
  name: string
  src?: string
  size?: 'sm' | 'md' | 'lg' | 'xl'
  status?: 'online' | 'busy' | 'offline'
  className?: string
}

const sizes = {
  sm: 'h-8 w-8 text-xs',
  md: 'h-10 w-10 text-sm',
  lg: 'h-14 w-14 text-base',
  xl: 'h-20 w-20 text-xl',
}

const statusColors = {
  online: 'bg-emerald-500',
  busy: 'bg-amber-500',
  offline: 'bg-ink-300',
}

export function Avatar({ name, src, size = 'md', status, className }: AvatarProps) {
  const [failed, setFailed] = useState(false)
  const showImage = !!src && !failed

  return (
    <div className={cn('relative inline-flex shrink-0', className)}>
      <div
        className={cn(
          'flex items-center justify-center overflow-hidden rounded-full font-semibold text-white',
          'bg-gradient-to-br from-brand-500 via-violet-500 to-sky-500',
          'shadow-soft ring-2 ring-white/60',
          sizes[size]
        )}
      >
        {showImage ? (
          <img
            src={src}
            alt={name}
            loading="lazy"
            onError={() => setFailed(true)}
            className="h-full w-full object-cover"
          />
        ) : (
          <span>{initials(name)}</span>
        )}
      </div>
      {status && (
        <span
          className={cn(
            'absolute bottom-0 right-0 h-3 w-3 rounded-full ring-2 ring-white',
            statusColors[status]
          )}
        />
      )}
    </div>
  )
}
