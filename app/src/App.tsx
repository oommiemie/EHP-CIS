import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { ToastProvider } from '@/components/ui/Toast'
import { AppShell } from '@/components/layout/AppShell'
import Dashboard from '@/routes/Dashboard'
import PatientRegistry from '@/routes/PatientRegistry'
import PatientOPDCard from '@/routes/PatientOPDCard'
import PatientVisit from '@/routes/PatientVisit'
import VisitList from '@/routes/VisitList'
import PatientAllergy from '@/routes/PatientAllergy'
import Login from '@/routes/Login'
import Placeholder from '@/routes/Placeholder'

export default function App() {
  return (
    <ToastProvider>
      <BrowserRouter basename={import.meta.env.BASE_URL.replace(/\/$/, '')}>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route element={<AppShell />}>
          <Route index element={<Dashboard />} />
          <Route path="registry" element={<PatientRegistry />} />
          <Route path="patient" element={<PatientOPDCard />} />
          <Route path="patient/new" element={<PatientOPDCard />} />
          <Route path="patient/:hn" element={<PatientOPDCard />} />
          <Route path="visit" element={<PatientVisit />} />
          <Route path="allergy" element={<PatientAllergy />} />
          <Route path="appointment" element={<Placeholder title="ทะเบียนนัดหมาย" />} />
          <Route path="visit-list" element={<VisitList />} />
          <Route path="chronic" element={<Placeholder title="ทะเบียนผู้ป่วยโรคเรื้อรัง" />} />
          <Route path="dialysis" element={<Placeholder title="ทะเบียนนัดหมายฟอกเลือด" />} />
          <Route path="notes" element={<Placeholder title="บันทึกผู้ป่วย" />} />
          <Route path="caregiver" element={<Placeholder title="ผู้ดูแลผู้ป่วย" />} />
          <Route path="help" element={<Placeholder title="ศูนย์ช่วยเหลือ" />} />
          <Route path="settings" element={<Placeholder title="ตั้งค่าระบบ" />} />
          <Route path="*" element={<Placeholder title="ไม่พบหน้าที่ค้นหา" />} />
        </Route>
      </Routes>
      </BrowserRouter>
    </ToastProvider>
  )
}
