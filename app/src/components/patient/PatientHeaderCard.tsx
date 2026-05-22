import { AlertTriangle, IdCard, Phone, ShieldCheck } from 'lucide-react'
import { Avatar } from '@/components/ui/Avatar'
import { Badge } from '@/components/ui/Badge'
import { calculateAge } from '@/lib/utils'
import type { Patient } from '@/types'

export function PatientHeaderCard({
  patient,
  allergyCount = 0,
}: {
  patient: Patient
  allergyCount?: number
}) {
  const fullName = `${patient.prefix} ${patient.firstName} ${patient.lastName}`
  return (
    <div className="rounded-3xl glass p-5">
      <div className="flex flex-wrap items-center gap-4">
        <Avatar name={fullName} size="xl" status="online" />
        <div className="min-w-0 flex-1">
          <div className="flex flex-wrap items-center gap-2">
            <h2 className="text-xl font-semibold tracking-tight text-ink-900">{fullName}</h2>
            <Badge tone="neutral" variant="outline">
              {patient.gender === 'male' ? 'ชาย' : patient.gender === 'female' ? 'หญิง' : 'อื่นๆ'}
            </Badge>
            {patient.bloodGroup && (
              <Badge tone="rose" variant="soft">
                กรุ๊ป {patient.bloodGroup}
                {patient.rh}
              </Badge>
            )}
          </div>
          <div className="mt-1.5 flex flex-wrap items-center gap-x-4 gap-y-1 text-sm text-ink-500">
            <span className="inline-flex items-center gap-1.5">
              <IdCard className="h-4 w-4" /> HN {patient.hn}
            </span>
            <span>เลขบัตร {patient.cid}</span>
            <span>{calculateAge(patient.birthdate)}</span>
            <span className="inline-flex items-center gap-1.5">
              <Phone className="h-4 w-4" /> {patient.phone || '-'}
            </span>
          </div>
        </div>
        <div className="flex flex-col items-end gap-2">
          <Badge tone="brand" variant="soft" icon={<ShieldCheck className="h-3.5 w-3.5" />}>
            {patient.insurance?.split('(')[0].trim()}
          </Badge>
          {allergyCount > 0 && (
            <Badge tone="rose" variant="solid" icon={<AlertTriangle className="h-3.5 w-3.5" />}>
              แพ้ยา {allergyCount} รายการ
            </Badge>
          )}
        </div>
      </div>
    </div>
  )
}
