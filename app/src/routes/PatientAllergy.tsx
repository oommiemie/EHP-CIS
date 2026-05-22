import { useMemo, useState } from 'react'
import {
  AlertTriangle,
  Plus,
  Pill,
  Apple,
  HelpCircle,
  ShieldAlert,
  Calendar,
  UserCheck,
} from 'lucide-react'
import { Card, CardHeader } from '@/components/ui/Card'
import { Button } from '@/components/ui/Button'
import { Badge } from '@/components/ui/Badge'
import { Input, Textarea } from '@/components/ui/Input'
import { Select } from '@/components/ui/Select'
import { Modal } from '@/components/ui/Modal'
import { Tabs, type TabItem } from '@/components/ui/Tabs'
import { allergies as allAllergies } from '@/data/mockData'
import { formatThaiDate, cn } from '@/lib/utils'
import type { Allergy } from '@/types'

const severityMap = {
  mild: { tone: 'sky' as const, label: 'เล็กน้อย', dot: 'bg-sky-500' },
  moderate: { tone: 'amber' as const, label: 'ปานกลาง', dot: 'bg-amber-500' },
  severe: { tone: 'rose' as const, label: 'รุนแรง', dot: 'bg-rose-500' },
  'life-threatening': {
    tone: 'rose' as const,
    label: 'อันตรายถึงชีวิต',
    dot: 'bg-rose-600',
  },
}

const typeMap = {
  drug: { icon: Pill, label: 'ยา', tone: 'brand' as const },
  food: { icon: Apple, label: 'อาหาร', tone: 'emerald' as const },
  other: { icon: HelpCircle, label: 'อื่นๆ', tone: 'violet' as const },
}

const statusMap = {
  confirmed: { tone: 'rose' as const, label: 'ยืนยันแล้ว' },
  suspected: { tone: 'amber' as const, label: 'สงสัย' },
  'ruled-out': { tone: 'neutral' as const, label: 'ตัดออก' },
}

const filterTabs: TabItem[] = [
  { value: 'all', label: 'ทั้งหมด' },
  { value: 'drug', label: 'แพ้ยา', icon: <Pill className="h-4 w-4" /> },
  { value: 'food', label: 'แพ้อาหาร', icon: <Apple className="h-4 w-4" /> },
  { value: 'other', label: 'อื่นๆ', icon: <HelpCircle className="h-4 w-4" /> },
]

export default function PatientAllergy() {
  const [filter, setFilter] = useState('all')
  const [openModal, setOpenModal] = useState(false)

  const list = useMemo(
    () => allAllergies.filter((a) => filter === 'all' || a.type === filter),
    [filter]
  )

  const critical = allAllergies.filter(
    (a) => a.severity === 'severe' || a.severity === 'life-threatening'
  ).length

  return (
    <div className="space-y-6">
      <header className="flex justify-end">
        <Button
          variant="primary"
          leftIcon={<Plus className="h-4 w-4" />}
          onClick={() => setOpenModal(true)}
        >
          เพิ่มรายการแพ้
        </Button>
      </header>

      {/* Critical banner */}
      {critical > 0 && (
        <div className="flex items-center gap-3 rounded-3xl bg-gradient-to-r from-rose-500/12 to-rose-500/5 p-4 ring-1 ring-rose-500/20">
          <div className="flex h-11 w-11 items-center justify-center rounded-2xl bg-rose-500 text-white">
            <ShieldAlert className="h-5 w-5" />
          </div>
          <div className="flex-1">
            <div className="text-sm font-semibold text-rose-800">
              มีรายการแพ้ระดับรุนแรง {critical} รายการ
            </div>
            <div className="text-xs text-rose-600">
              ระบบจะบล็อกการสั่งยาที่เกี่ยวข้องโดยอัตโนมัติ และต้องยืนยันก่อนทุกครั้ง
            </div>
          </div>
        </div>
      )}

      {/* Summary cards */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
        <SummaryCard label="ทั้งหมด" value={allAllergies.length} tone="brand" />
        <SummaryCard
          label="แพ้ยา"
          value={allAllergies.filter((a) => a.type === 'drug').length}
          tone="violet"
        />
        <SummaryCard
          label="แพ้อาหาร"
          value={allAllergies.filter((a) => a.type === 'food').length}
          tone="emerald"
        />
        <SummaryCard label="ระดับรุนแรง" value={critical} tone="rose" />
      </div>

      <Tabs items={filterTabs} value={filter} onChange={setFilter} variant="underline" />

      {/* List */}
      <div className="stagger-children grid grid-cols-1 lg:grid-cols-2 gap-3">
        {list.map((a) => (
          <AllergyCard key={a.id} allergy={a} />
        ))}
      </div>

      {/* Add modal */}
      <Modal
        open={openModal}
        onClose={() => setOpenModal(false)}
        title="เพิ่มรายการแพ้ยา/อาหาร"
        description="กรอกข้อมูลเท่าที่ทราบ — สามารถแก้ไขเพิ่มเติมภายหลังได้"
        size="lg"
        footer={
          <>
            <Button variant="ghost" onClick={() => setOpenModal(false)}>
              ยกเลิก
            </Button>
            <Button variant="primary" onClick={() => setOpenModal(false)}>
              บันทึกรายการแพ้
            </Button>
          </>
        }
      >
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <Select
            label="ประเภท"
            options={[
              { value: 'drug', label: 'ยา' },
              { value: 'food', label: 'อาหาร' },
              { value: 'other', label: 'อื่นๆ' },
            ]}
          />
          <Input label="ชื่อยา / อาหารที่แพ้" placeholder="เช่น Penicillin" />
          <Select
            label="ระดับความรุนแรง"
            options={[
              { value: 'mild', label: 'เล็กน้อย' },
              { value: 'moderate', label: 'ปานกลาง' },
              { value: 'severe', label: 'รุนแรง' },
              { value: 'life-threatening', label: 'อันตรายถึงชีวิต' },
            ]}
          />
          <Select
            label="สถานะ"
            options={[
              { value: 'suspected', label: 'สงสัย' },
              { value: 'confirmed', label: 'ยืนยันแล้ว' },
              { value: 'ruled-out', label: 'ตัดออก' },
            ]}
          />
          <div className="md:col-span-2">
            <Textarea label="อาการที่แสดง" placeholder="เช่น ผื่นแดง คันทั่วตัว หายใจติดขัด" rows={3} />
          </div>
          <div className="md:col-span-2">
            <Textarea label="หมายเหตุเพิ่มเติม" rows={2} />
          </div>
        </div>
      </Modal>
    </div>
  )
}

function SummaryCard({
  label,
  value,
  tone,
}: {
  label: string
  value: number
  tone: 'brand' | 'violet' | 'emerald' | 'rose'
}) {
  const ring = {
    brand: 'text-brand-600',
    violet: 'text-violet-600',
    emerald: 'text-emerald-600',
    rose: 'text-rose-600',
  }[tone]
  return (
    <div className="rounded-2xl glass-tight p-4">
      <div className="text-xs text-ink-500">{label}</div>
      <div className={cn('mt-1 text-2xl font-semibold', ring)}>{value}</div>
    </div>
  )
}

function AllergyCard({ allergy }: { allergy: Allergy }) {
  const t = typeMap[allergy.type]
  const sev = severityMap[allergy.severity]
  const st = statusMap[allergy.status]
  const TypeIcon = t.icon
  const critical =
    allergy.severity === 'severe' || allergy.severity === 'life-threatening'

  return (
    <div
      className={cn(
        'rounded-3xl glass p-4 transition hover:-translate-y-0.5 hover:shadow-glow',
        critical && 'ring-1 ring-rose-500/25'
      )}
    >
      <div className="flex items-start gap-3">
        <div
          className={cn(
            'flex h-12 w-12 shrink-0 items-center justify-center rounded-2xl',
            critical
              ? 'bg-rose-500 text-white'
              : 'bg-gradient-to-br from-brand-500/15 to-violet-500/15 text-brand-600'
          )}
        >
          {critical ? (
            <AlertTriangle className="h-5 w-5" />
          ) : (
            <TypeIcon className="h-5 w-5" />
          )}
        </div>
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2">
            <h3 className="truncate text-[15px] font-semibold text-ink-900">
              {allergy.drugName}
            </h3>
            <span className={cn('h-2 w-2 rounded-full', sev.dot)} />
          </div>
          <p className="mt-0.5 text-sm text-ink-600">{allergy.symptom}</p>
        </div>
      </div>

      <div className="mt-3 flex flex-wrap items-center gap-1.5">
        <Badge tone={t.tone} variant="soft">
          {t.label}
        </Badge>
        <Badge tone={sev.tone} variant="soft">
          {sev.label}
        </Badge>
        <Badge tone={st.tone} variant="outline">
          {st.label}
        </Badge>
        {allergy.naranjoScore != null && (
          <Badge tone="neutral" variant="soft">
            Naranjo {allergy.naranjoScore}
          </Badge>
        )}
      </div>

      {allergy.notes && (
        <div className="mt-3 rounded-2xl glass-dim px-3 py-2 text-xs text-ink-600">
          {allergy.notes}
        </div>
      )}

      <div className="mt-3 flex items-center justify-between border-t border-ink-900/6 pt-3 text-xs text-ink-500">
        <span className="inline-flex items-center gap-1">
          <Calendar className="h-3.5 w-3.5" />
          {formatThaiDate(allergy.reportedDate)}
        </span>
        <span className="inline-flex items-center gap-1">
          <UserCheck className="h-3.5 w-3.5" />
          {allergy.reportedBy}
        </span>
      </div>
    </div>
  )
}
