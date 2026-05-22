import { useState } from 'react'
import { NavLink, useNavigate, useLocation } from 'react-router-dom'
import {
  LayoutGrid,
  Contact,
  Stethoscope,
  ClipboardList,
  CalendarDays,
  HeartPulse,
  Droplets,
  FolderOpen,
  ChevronRight,
  ChevronsLeft,
  DoorOpen,
  Building2,
  Settings,
  LogOut,
} from 'lucide-react'
import { cn } from '@/lib/utils'
import { Avatar } from '@/components/ui/Avatar'

type IconType = React.ComponentType<{ className?: string }>

interface NavItem {
  to: string
  label: string
  icon: IconType
  /** extra paths that should also keep this item highlighted */
  match?: string[]
}

const homeItem: NavItem = { to: '/', label: 'ภาพรวม', icon: LayoutGrid }

const opdRegistry: NavItem[] = [
  { to: '/registry', label: 'ทะเบียนผู้ป่วย', icon: Contact, match: ['/patient'] },
  { to: '/visit', label: 'ส่งตรวจผู้ป่วย', icon: Stethoscope },
  { to: '/visit-list', label: 'ทะเบียนผู้มารับบริการ', icon: ClipboardList },
  { to: '/appointment', label: 'ทะเบียนนัดหมาย', icon: CalendarDays },
  { to: '/chronic', label: 'ทะเบียนโรคเรื้อรัง', icon: HeartPulse },
  { to: '/dialysis', label: 'นัดหมายฟอกเลือด', icon: Droplets },
]

export function Sidebar() {
  const navigate = useNavigate()
  const [collapsed, setCollapsed] = useState(() => {
    try {
      return localStorage.getItem('sidebar-collapsed') === '1'
    } catch {
      return false
    }
  })

  function toggle() {
    setCollapsed((c) => {
      const next = !c
      try {
        localStorage.setItem('sidebar-collapsed', next ? '1' : '0')
      } catch {
        /* ignore */
      }
      return next
    })
  }

  return (
    <aside
      className={cn(
        'hidden h-full shrink-0 flex-col gap-3 transition-[width] duration-300 ease-[cubic-bezier(0.22,1,0.36,1)] lg:flex',
        collapsed ? 'w-[74px]' : 'w-[208px]'
      )}
    >
      {/* Brand */}
      <button
        onClick={() => navigate('/')}
        className={cn(
          'group flex items-center rounded-[22px] border border-white/20 bg-gradient-to-br from-brand-600 via-brand-600 to-violet-600 text-left shadow-[inset_0_1px_0_0_rgba(255,255,255,0.25),0_14px_30px_-14px_rgba(58,100,255,0.65)] transition-all duration-200 hover:from-brand-500 hover:to-violet-500 focus-ring',
          collapsed ? 'justify-center p-1.5' : 'gap-2.5 p-1.5 pr-3.5'
        )}
      >
        <span className="relative flex h-[44px] w-[44px] shrink-0 items-center justify-center">
          {/* soft white glow */}
          <span
            aria-hidden
            className="absolute inset-[3px] rounded-[15px] bg-white opacity-40 blur-[7px] transition-opacity duration-300 group-hover:opacity-65"
          />
          <span className="relative flex h-full w-full items-center justify-center rounded-[15px] bg-white text-brand-600 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.9),0_4px_10px_-4px_rgba(11,16,32,0.5)] transition-transform duration-300 group-hover:scale-105">
            <img
              src={`${import.meta.env.BASE_URL}logo-ehp.png`}
              alt="EHP CIS"
              className="h-[30px] w-[30px] object-contain"
            />
          </span>
        </span>
        {!collapsed && (
          <span className="min-w-0 leading-tight">
            <span className="block text-[17px] font-extrabold tracking-tight text-white">
              EHP CIS
            </span>
            <span className="block text-[9px] font-bold uppercase tracking-[0.14em] text-white/65">
              Cloud Platform
            </span>
          </span>
        )}
      </button>

      {/* Nav — negative margin + equal padding gives the scroll box a 20px
          gutter so active-item glow shadows aren't clipped by overflow */}
      <nav
        className={cn(
          '-m-5 flex min-h-0 flex-1 flex-col p-5',
          collapsed ? 'gap-1 overflow-visible' : 'gap-0.5 overflow-y-auto'
        )}
      >
        {collapsed ? (
          <>
            <NavRow item={homeItem} collapsed />
            <NavGroupCollapsed
              label="OPD Registry"
              icon={FolderOpen}
              items={opdRegistry}
            />
          </>
        ) : (
          <>
            <NavRow item={homeItem} />
            <NavGroup
              label="OPD Registry"
              icon={FolderOpen}
              items={opdRegistry}
            />
          </>
        )}
      </nav>

      {/* User card + hover profile popup */}
      <div className="group/profile relative shrink-0">
        {/* ── hover profile detail — pops out to the side ── */}
        <div className="invisible absolute bottom-0 left-full z-50 w-[252px] -translate-x-1 pl-2.5 opacity-0 transition-all duration-200 group-hover/profile:visible group-hover/profile:translate-x-0 group-hover/profile:opacity-100">
          <div className="liquid-glass overflow-hidden rounded-[22px] border border-white/60 bg-white/65 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.9),0_22px_52px_-14px_rgba(18,26,78,0.55)]">
            {/* cover image */}
            <div className="relative h-[70px]">
              <img
                src={`${import.meta.env.BASE_URL}hero-bg.jpg`}
                alt=""
                aria-hidden="true"
                className="h-full w-full object-cover"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/25 to-transparent" />
            </div>
            {/* body — relative so it paints above the cover layer */}
            <div className="relative px-3.5 pb-3.5">
              <img
                src="https://randomuser.me/api/portraits/women/76.jpg"
                alt="พญ. นพมาศ ใจดี"
                className="-mt-8 h-[58px] w-[58px] rounded-2xl border-[3px] border-white object-cover shadow-[0_8px_18px_-6px_rgba(28,38,92,0.5)]"
              />
              <div className="mt-2 leading-tight">
                <div className="text-[14px] font-bold tracking-tight text-ink-900">
                  พญ. นพมาศ ใจดี
                </div>
                <div className="text-[11.5px] font-semibold text-brand-600">
                  แพทย์
                </div>
              </div>
              {/* details */}
              <div className="mt-2.5 space-y-2 rounded-xl bg-ink-900/[0.03] px-3 py-2.5">
                <ProfileRow icon={Stethoscope} label="สาขา" value="อายุรกรรม" />
                <ProfileRow icon={DoorOpen} label="ห้อง" value="ห้องตรวจ 2" />
                <ProfileRow
                  icon={Building2}
                  label="หน่วยงาน"
                  value="กลุ่มงานผู้ป่วยนอก"
                />
              </div>
              {/* actions — vertical menu so labels never get squished */}
              <div className="mt-3 space-y-0.5 border-t border-ink-900/[0.07] pt-2.5">
                <button
                  type="button"
                  onClick={() => navigate('/settings')}
                  className="flex w-full items-center gap-2.5 rounded-xl px-2.5 py-2 text-left text-[12.5px] font-semibold text-ink-700 transition hover:bg-ink-900/[0.05] active:scale-[0.98]"
                >
                  <Settings className="h-4 w-4 shrink-0 text-ink-400" />
                  ตั้งค่า
                </button>
                <button
                  type="button"
                  onClick={() => navigate('/login')}
                  className="flex w-full items-center gap-2.5 rounded-xl px-2.5 py-2 text-left text-[12.5px] font-semibold text-rose-600 transition hover:bg-rose-500/[0.1] active:scale-[0.98]"
                >
                  <LogOut className="h-4 w-4 shrink-0" />
                  ออกจากระบบ
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* ── trigger card ── */}
        <div
          className={cn(
            'cursor-pointer transition-all duration-200',
            collapsed
              ? 'mx-auto flex h-[46px] w-[46px] items-center justify-center rounded-full hover:bg-white/60'
              : 'flex items-center gap-2 rounded-full border border-white/60 bg-white/55 py-2 pl-2 pr-3 backdrop-blur-md shadow-[0_8px_22px_-14px_rgba(28,38,92,0.5)] group-hover/profile:bg-white/85'
          )}
        >
          <Avatar
            name="พญ. นพมาศ ใจดี"
            src="https://randomuser.me/api/portraits/women/76.jpg"
            size={collapsed ? 'md' : 'sm'}
            status="online"
          />
          {!collapsed && (
            <>
              <div className="min-w-0 flex-1 leading-tight">
                <div className="truncate text-[12.5px] font-semibold text-ink-900">
                  พญ. นพมาศ ใจดี
                </div>
                <div className="truncate text-[10px] text-ink-500">แพทย์</div>
              </div>
              <ChevronRight className="h-4 w-4 shrink-0 text-ink-400 transition-transform duration-200 group-hover/profile:translate-x-0.5" />
            </>
          )}
        </div>
      </div>

      {/* collapse / expand toggle — bottom centre */}
      <button
        type="button"
        onClick={toggle}
        aria-label={collapsed ? 'ขยายเมนู' : 'ย่อเมนู'}
        className="flex h-9 w-9 shrink-0 items-center justify-center self-center rounded-full bg-white text-ink-500 shadow-[0_6px_16px_-6px_rgba(28,38,92,0.45)] ring-1 ring-ink-900/[0.06] transition-all duration-200 hover:scale-110 hover:text-brand-600 active:scale-95"
      >
        <ChevronsLeft
          className={cn(
            'h-[18px] w-[18px] transition-transform duration-300',
            collapsed && 'rotate-180'
          )}
        />
      </button>
    </aside>
  )
}

/* a labelled detail row in the profile popup */
function ProfileRow({
  icon: Icon,
  label,
  value,
}: {
  icon: IconType
  label: string
  value: string
}) {
  return (
    <div className="flex items-center gap-2">
      <Icon className="h-3.5 w-3.5 shrink-0 text-ink-400" />
      <span className="w-[58px] shrink-0 text-[11px] text-ink-400">
        {label}
      </span>
      <span className="min-w-0 flex-1 truncate text-[12px] font-medium text-ink-800">
        {value}
      </span>
    </div>
  )
}

/** an item is active on its own path — or on any of its extra `match` paths */
function isItemActive(item: NavItem, pathname: string) {
  if (item.to === '/') return pathname === '/'
  if (pathname === item.to || pathname.startsWith(`${item.to}/`)) return true
  return !!item.match?.some(
    (m) => pathname === m || pathname.startsWith(`${m}/`)
  )
}

/* collapsible group — e.g. "OPD Registry" with its sub-menu items */
function NavGroup({
  label,
  icon: Icon,
  items,
}: {
  label: string
  icon: IconType
  items: NavItem[]
}) {
  const { pathname } = useLocation()
  const hasActive = items.some((it) => isItemActive(it, pathname))
  const [open, setOpen] = useState(true)

  return (
    <div>
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        className="group flex w-full items-center gap-2 rounded-full p-1.5 transition-all duration-200 active:scale-[0.97] focus-ring hover:bg-white/70"
      >
        <span
          className={cn(
            'flex h-[30px] w-[30px] shrink-0 items-center justify-center rounded-full transition-all duration-200',
            hasActive
              ? 'liquid-glass-button border border-white/30 bg-gradient-to-br from-brand-500/85 via-brand-500/85 to-violet-500/85 text-white shadow-[inset_0_1px_0_0_rgba(255,255,255,0.5),0_6px_15px_-4px_rgba(58,100,255,0.9)]'
              : 'liquid-glass-button border border-white/55 bg-white/45 text-ink-500 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.85),0_3px_9px_-3px_rgba(28,38,92,0.3)] group-hover:bg-white/70 group-hover:text-brand-600'
          )}
        >
          <Icon className="h-[15px] w-[15px]" />
        </span>
        <span className="flex-1 truncate text-left text-[12.5px] font-semibold text-ink-800">
          {label}
        </span>
        <ChevronRight
          className={cn(
            'mr-1 h-3.5 w-3.5 shrink-0 text-ink-400 transition-transform duration-200',
            open && 'rotate-90'
          )}
        />
      </button>

      {open && (
        <div className="mt-0.5 space-y-0.5 pl-2.5">
          {items.map((it) => (
            <NavRow key={it.to} item={it} />
          ))}
        </div>
      )}
    </div>
  )
}

/* collapsed group — folder icon with a flyout submenu on hover */
function NavGroupCollapsed({
  label,
  icon: Icon,
  items,
}: {
  label: string
  icon: IconType
  items: NavItem[]
}) {
  const navigate = useNavigate()
  const { pathname } = useLocation()
  const hasActive = items.some((it) => isItemActive(it, pathname))

  return (
    <div className="group/grp relative mx-auto">
      <button
        type="button"
        onClick={() => navigate(items[0].to)}
        title={label}
        className="flex h-[46px] w-[46px] items-center justify-center rounded-full transition-all duration-200 hover:bg-white/60 active:scale-[0.95] focus-ring"
      >
        <span
          className={cn(
            'flex h-[38px] w-[38px] items-center justify-center rounded-full transition-all duration-200',
            hasActive
              ? 'liquid-glass-button scale-105 border border-white/30 bg-gradient-to-br from-brand-500/85 via-brand-500/85 to-violet-500/85 text-white shadow-[inset_0_1px_0_0_rgba(255,255,255,0.5),0_0_18px_-1px_rgba(95,124,255,0.95),0_6px_14px_-3px_rgba(58,100,255,0.7)]'
              : 'liquid-glass-button border border-white/55 bg-white/45 text-ink-500 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.85),0_3px_9px_-3px_rgba(28,38,92,0.3)] group-hover/grp:bg-white/70 group-hover/grp:text-brand-600'
          )}
        >
          <Icon className="h-[18px] w-[18px]" />
        </span>
      </button>

      {/* flyout submenu — Apple-style liquid glass */}
      <div className="invisible absolute left-full top-0 z-50 w-[216px] -translate-x-1 pl-2.5 opacity-0 transition-all duration-200 group-hover/grp:visible group-hover/grp:translate-x-0 group-hover/grp:opacity-100">
        <div className="liquid-glass relative overflow-hidden rounded-[22px] border border-white/60 bg-white/65 p-2 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.95),inset_0_0_0_1px_rgba(255,255,255,0.16),0_22px_52px_-14px_rgba(18,26,78,0.55)]">
          {/* specular highlights — light catching the glass */}
          <span
            aria-hidden
            className="pointer-events-none absolute inset-x-0 top-0 h-1/2 bg-gradient-to-b from-white/55 via-white/[0.12] to-transparent"
          />
          <span
            aria-hidden
            className="pointer-events-none absolute -left-6 -top-8 h-28 w-28 rounded-full bg-white/40 blur-2xl"
          />
          {/* content */}
          <div className="relative">
            <div className="px-2 pb-1.5 pt-1 text-[10.5px] font-bold uppercase tracking-[0.1em] text-ink-500">
              {label}
            </div>
            <div className="space-y-0.5">
              {items.map((it) => (
                <FlyoutRow key={it.to} item={it} />
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

/* a row inside the collapsed-group flyout */
function FlyoutRow({ item }: { item: NavItem }) {
  const Icon = item.icon
  const { pathname } = useLocation()
  const active = isItemActive(item, pathname)
  return (
    <NavLink
      to={item.to}
      end={item.to === '/'}
      className={cn(
        'group flex items-center gap-2.5 rounded-full px-2 py-1.5 transition-colors duration-150 focus-ring',
        active ? 'bg-brand-500/[0.1]' : 'hover:bg-ink-900/[0.04]'
      )}
    >
      <span
        className={cn(
          'flex h-8 w-8 shrink-0 items-center justify-center rounded-full transition-colors',
          active
            ? 'liquid-glass-button border border-white/30 bg-gradient-to-br from-brand-500/85 to-violet-500/85 text-white shadow-[inset_0_1px_0_0_rgba(255,255,255,0.5),0_4px_10px_-3px_rgba(58,100,255,0.7)]'
            : 'liquid-glass-button border border-white/55 bg-white/45 text-ink-500 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.85),0_3px_9px_-3px_rgba(28,38,92,0.3)] group-hover:bg-white/70 group-hover:text-brand-600'
        )}
      >
        <Icon className="h-[15px] w-[15px]" />
      </span>
      <span
        className={cn(
          'min-w-0 flex-1 truncate text-[12.5px]',
          active ? 'font-semibold text-brand-700' : 'font-medium text-ink-700'
        )}
      >
        {item.label}
      </span>
    </NavLink>
  )
}

function NavRow({ item, collapsed }: { item: NavItem; collapsed?: boolean }) {
  const Icon = item.icon
  const { pathname } = useLocation()
  const active = isItemActive(item, pathname)

  /* ── collapsed: icon-only rail ── */
  if (collapsed) {
    return (
      <NavLink
        to={item.to}
        end={item.to === '/'}
        title={item.label}
        className="group relative mx-auto flex h-[46px] w-[46px] items-center justify-center rounded-full transition-all duration-200 hover:bg-white/60 active:scale-[0.95] focus-ring"
      >
        <span
          className={cn(
            'flex h-[38px] w-[38px] items-center justify-center rounded-full transition-all duration-200',
            active
              ? 'liquid-glass-button scale-105 border border-white/30 bg-gradient-to-br from-brand-500/85 via-brand-500/85 to-violet-500/85 text-white shadow-[inset_0_1px_0_0_rgba(255,255,255,0.5),0_0_18px_-1px_rgba(95,124,255,0.95),0_6px_14px_-3px_rgba(58,100,255,0.7)]'
              : 'liquid-glass-button border border-white/55 bg-white/45 text-ink-500 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.85),0_3px_9px_-3px_rgba(28,38,92,0.3)] group-hover:bg-white/70 group-hover:text-brand-600'
          )}
        >
          <Icon className="h-[18px] w-[18px]" />
        </span>
      </NavLink>
    )
  }

  /* ── expanded: full row ── */
  return (
    <NavLink
      to={item.to}
      end={item.to === '/'}
      className={cn(
        'group relative flex items-center gap-2 rounded-full p-1.5 transition-all duration-200 active:scale-[0.97] focus-ring',
        active
          ? 'animate-nav-pop bg-white shadow-[0_0_22px_-2px_rgba(125,150,255,0.65),0_14px_28px_-12px_rgba(58,100,255,0.5)] ring-1 ring-inset ring-white'
          : 'hover:bg-white/70'
      )}
    >
      {/* icon chip */}
      <span
        className={cn(
          'relative flex h-[30px] w-[30px] shrink-0 items-center justify-center rounded-full transition-all duration-200',
          active
            ? 'liquid-glass-button border border-white/30 bg-gradient-to-br from-brand-500/85 via-brand-500/85 to-violet-500/85 text-white shadow-[inset_0_1px_0_0_rgba(255,255,255,0.5),0_6px_15px_-4px_rgba(58,100,255,0.9)]'
            : 'liquid-glass-button border border-white/55 bg-white/45 text-ink-500 shadow-[inset_0_1px_0_0_rgba(255,255,255,0.85),0_3px_9px_-3px_rgba(28,38,92,0.3)] group-hover:bg-white/70 group-hover:text-brand-600'
        )}
      >
        <Icon className="h-4 w-4" />
      </span>
      {/* label */}
      <span
        className={cn(
          'relative min-w-0 flex-1 truncate text-[12.5px]',
          active
            ? 'font-bold text-ink-900'
            : 'font-medium text-ink-600 group-hover:text-ink-900'
        )}
      >
        {item.label}
      </span>
      {/* active marker */}
      {active && (
        <span className="mr-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-gradient-to-br from-brand-500 to-violet-500" />
      )}
    </NavLink>
  )
}
