import { Outlet, useLocation } from 'react-router-dom'
import { Sidebar } from './Sidebar'
import { GradientBackground } from './GradientBackground'
import { AiAssistantFab } from './AiAssistantFab'

export function AppShell() {
  const location = useLocation()
  return (
    <div className="relative flex h-screen gap-4 overflow-hidden p-4">
      <GradientBackground />
      <Sidebar />

      {/* Main translucent panel */}
      <main className="relative flex h-full min-w-0 flex-1 flex-col overflow-hidden rounded-[32px] border border-white/60 bg-white/70 shadow-[0_24px_60px_-28px_rgba(28,38,92,0.4)] backdrop-blur-2xl">
        <div className="min-h-0 flex-1 overflow-y-auto">
          <div
            key={location.pathname}
            className="min-h-full animate-page-in p-4"
          >
            <Outlet />
          </div>
        </div>
      </main>

      <AiAssistantFab />
    </div>
  )
}
