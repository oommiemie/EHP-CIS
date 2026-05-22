export interface Patient {
  hn: string
  cid: string // เลขบัตรประชาชน
  prefix: string
  firstName: string
  lastName: string
  gender: 'male' | 'female' | 'other'
  birthdate: string // ISO date
  bloodGroup?: 'A' | 'B' | 'AB' | 'O'
  rh?: '+' | '-'
  phone?: string
  address?: string
  email?: string
  religion?: string
  occupation?: string
  nationality?: string
  marital?: string
  insurance?: string // สิทธิการรักษา
  insuranceCode?: string
  hospitalMain?: string
  hospitalSub?: string
  photo?: string
  lastVisit?: string
  totalVisits?: number
  status?: 'active' | 'inactive' | 'deceased'
  tags?: string[]
}

export interface Visit {
  id: string
  hn: string
  patientName: string
  photo?: string
  visitDate: string // ISO datetime
  type: 'walk-in' | 'appointment' | 'emergency' | 'follow-up'
  status: 'waiting' | 'in-progress' | 'completed' | 'cancelled'
  department: string
  doctor: string
  queueNo: string
  reason: string // อาการสำคัญ
  insurance: string
  vitals?: {
    bp?: string
    hr?: number
    rr?: number
    temp?: number
    spo2?: number
    weight?: number
    height?: number
  }
  diagnosis?: string
}

export interface Allergy {
  id: string
  hn: string
  patientName: string
  drugName: string // ยา/อาหาร
  type: 'drug' | 'food' | 'other'
  symptom: string // อาการที่แพ้
  severity: 'mild' | 'moderate' | 'severe' | 'life-threatening'
  reportedDate: string
  reportedBy: string
  notes?: string
  naranjoScore?: number
  status: 'confirmed' | 'suspected' | 'ruled-out'
}

export interface DashboardStats {
  todayVisits: number
  waitingPatients: number
  completedVisits: number
  appointments: number
  newPatients: number
  avgWaitMinutes: number
}
