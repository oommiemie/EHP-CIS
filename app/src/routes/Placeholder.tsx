import { Construction } from 'lucide-react'
import { Card } from '@/components/ui/Card'
import { Button } from '@/components/ui/Button'
import { useNavigate } from 'react-router-dom'

export default function Placeholder({ title }: { title: string }) {
  const navigate = useNavigate()
  return (
    <div className="flex min-h-[60vh] items-center justify-center">
      <Card className="max-w-md text-center" padding="lg">
        <div className="mx-auto flex h-16 w-16 items-center justify-center rounded-3xl bg-gradient-to-br from-brand-500/15 via-violet-500/15 to-sky-500/15 text-brand-500">
          <Construction className="h-7 w-7" />
        </div>
        <h2 className="mt-4 text-xl font-semibold text-ink-900">{title}</h2>
        <p className="mt-1.5 text-sm text-ink-500">
          หน้านี้อยู่ในแผนพัฒนาเฟสถัดไป — โครงสร้าง Design System พร้อมรองรับแล้ว
        </p>
        <Button className="mt-5" variant="secondary" onClick={() => navigate('/')}>
          กลับสู่แดชบอร์ด
        </Button>
      </Card>
    </div>
  )
}
