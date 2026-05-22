import { findPatient } from './mockData'
import type { Patient } from '@/types'

/* ───────────────────────── types ───────────────────────── */

export interface OPDRight {
  id: number
  code: string
  name: string
  no: string
  begin: string
  expire: string
}

export interface OPDAllergy {
  id: number
  data: Record<string, string>
  flags: Record<string, boolean>
}

export interface OPDListRow {
  id: number
  data: Record<string, string>
}

export interface OPDProfile {
  patient: Patient
  form: Record<string, string>
  flags: Record<string, boolean>
  rights: OPDRight[]
  drugAllergies: OPDAllergy[]
  lists: Record<string, OPDListRow[]>
}

interface ProfileSeed {
  form: Record<string, string>
  flags: Record<string, boolean>
  rights: Omit<OPDRight, 'id'>[]
  drugAllergies: Omit<OPDAllergy, 'id'>[]
  lists: Record<string, Record<string, string>[]>
}

/* ─────────────────── base form from Patient ─────────────────── */

const TH_GENDER: Record<Patient['gender'], string> = {
  male: 'ชาย',
  female: 'หญิง',
  other: 'อื่นๆ',
}

/** 13-digit CID → x-xxxx-xxxxx-xx-x */
function fmtCid(cid: string): string {
  const d = cid.replace(/\D/g, '')
  if (d.length !== 13) return cid
  return `${d[0]}-${d.slice(1, 5)}-${d.slice(5, 10)}-${d.slice(10, 12)}-${d[12]}`
}

/** identity fields that already live on the registry Patient record */
function baseForm(p: Patient): Record<string, string> {
  return {
    hn: p.hn,
    prefix: p.prefix,
    firstName: p.firstName,
    lastName: p.lastName,
    cid: fmtCid(p.cid),
    gender: TH_GENDER[p.gender],
    birthdate: p.birthdate,
    race: 'ไทย',
    nationality: p.nationality || 'ไทย',
    religion: p.religion || 'พุทธ',
    blood: p.bloodGroup || '',
    rh: p.rh ? `Rh${p.rh}` : '',
    occupation: p.occupation || '',
    marital: p.marital || '',
    phoneMobile: p.phone || '',
    email: p.email || '',
    refNo: `HN${p.hn}`,
    country: 'ไทย',
  }
}

/* ───────────────────── per-patient OPD data ───────────────────── */

const seeds: Record<string, ProfileSeed> = {
  /* ── นาง สมหญิง รักษ์ดี ── */
  '6800001234': {
    form: {
      birthtime: '06:45',
      siblings: '4',
      childOrder: '2',
      drugAllergy: 'Penicillin, Aspirin',
      informer: 'นาย ประสิทธิ์ รักษ์ดี',
      informerRelation: 'คู่สมรส',
      nickname: 'หญิง',
      skin: 'ผิวสองสี',
      language: 'ไทย',
      workplace: 'บริษัท กรุงไทยพัฒนา จำกัด',
      houseNo: '99/12',
      moo: '-',
      road: 'สีลม',
      subdistrict: 'สีลม',
      district: 'เขตบางรัก',
      province: 'กรุงเทพมหานคร',
      zipcode: '10500',
      phoneHome: '02-234-5678',
      phoneWork: '02-200-7788',
      fatherFirstName: 'สมบัติ',
      fatherLastName: 'รักษ์ดี',
      fatherCid: '3-1009-00045-12-1',
      fatherPhone: '081-100-2003',
      motherFirstName: 'บุญเรือน',
      motherLastName: 'รักษ์ดี',
      motherCid: '3-1009-00046-23-2',
      motherPhone: '081-100-2004',
      spouseFirstName: 'ประสิทธิ์',
      spouseLastName: 'รักษ์ดี',
      spouseCid: '3-1009-00111-45-6',
      spousePhone: '081-555-7001',
      contactFirstName: 'ประสิทธิ์',
      contactLastName: 'รักษ์ดี',
      contactRelation: 'คู่สมรส',
      contactPhone: '081-555-7001',
      familyStatus: 'หัวหน้าครอบครัว',
      personStatus: 'มีชีวิต',
      education: 'ปริญญาตรี',
      communityRole: 'อสม.',
      personType: 'ประชาชนทั่วไป',
      birthPlace: 'โรงพยาบาลศิริราช',
      birthWeight: '3000',
      birthGravida: '2',
      birthGestation: '39',
      enPrefix: 'Mrs.',
      enFirstName: 'Somying',
      enLastName: 'Rakdee',
      enAddress: '99/12 Silom Rd., Bang Rak, Bangkok 10500',
    },
    flags: { inResponsibleArea: true, consentGiven: true },
    rights: [
      {
        code: '10',
        name: 'หลักประกันสุขภาพถ้วนหน้า (บัตรทอง)',
        no: 'UC-1101700123456',
        begin: '2002-10-01',
        expire: '2035-12-31',
      },
    ],
    drugAllergies: [
      {
        data: {
          reportDate: '2024-08-10',
          onsetDate: '2024-08-09',
          reporter: 'พญ. นพมาศ ใจดี',
          drug: 'Penicillin',
          type: 'แพ้ยา',
          symptom: 'ผื่นแดงทั่วตัว หายใจติดขัด',
          seriousness: 'ร้ายแรง — ต้องนอนโรงพยาบาล',
          relation: 'น่าจะใช่ (Probable)',
          result: 'หายเป็นปกติ',
          mechanism: 'ภูมิแพ้ (Allergy)',
          alert: 'ห้ามสั่งจ่าย',
          dept: 'อายุรกรรม',
          source: 'ผู้ป่วยแจ้ง',
          note: 'ห้ามใช้ยากลุ่ม Beta-lactam ทั้งหมด',
        },
        flags: { banned: true },
      },
      {
        data: {
          reportDate: '2023-05-22',
          onsetDate: '2023-05-21',
          reporter: 'นพ. ธีรเดช อภัยมูล',
          drug: 'Aspirin',
          type: 'แพ้ยา',
          symptom: 'หน้าบวม หายใจไม่สะดวก',
          seriousness: 'อันตรายถึงชีวิต',
          relation: 'ใช่แน่นอน (Certain)',
          result: 'หายเป็นปกติ',
          mechanism: 'ภูมิแพ้ (Allergy)',
          alert: 'ห้ามสั่งจ่าย',
          dept: 'ห้องฉุกเฉิน',
          source: 'เวชระเบียน',
          note: 'เคยแอดมิตที่ห้อง ICU 2 วัน',
        },
        flags: { banned: true },
      },
    ],
    lists: {
      chronic: [
        { name: 'เบาหวานชนิดที่ 2', icd: 'E11', note: 'ควบคุมระดับน้ำตาลด้วยยา Metformin' },
        { name: 'ความดันโลหิตสูง', icd: 'I10', note: 'ตรวจติดตามทุก 3 เดือน' },
      ],
      special: [{ status: 'ผู้ป่วยเรื้อรัง', note: 'เบาหวานและความดันโลหิตสูง' }],
      appointment: [
        {
          status: 'รอมาตามนัด',
          visitDate: '2026-05-12',
          nextDate: '2026-08-12',
          nextTime: '09:00',
          doctor: 'พญ. นพมาศ ใจดี',
          clinic: 'คลินิกเบาหวาน',
          cause: 'ติดตามระดับน้ำตาลในเลือด',
        },
      ],
      note: [
        {
          date: '2026-05-12',
          author: 'พญ. นพมาศ ใจดี',
          note: 'ผู้ป่วยให้ความร่วมมือดี ควบคุมอาหารได้ตามแผน',
        },
      ],
      caregiver: [
        {
          relation: 'คู่สมรส',
          prefix: 'นาย',
          name: 'ประสิทธิ์',
          lastName: 'รักษ์ดี',
          cid: '3-1009-00111-45-6',
          phone: '081-555-7001',
          birthdate: '1970-02-10',
          address: '99/12 ถ.สีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร 10500',
          note: 'ดูแลเรื่องการรับประทานยา',
        },
      ],
    },
  },

  /* ── นาย อนุชา พงศ์สถาพร ── */
  '6800002871': {
    form: {
      birthtime: '14:20',
      siblings: '2',
      childOrder: '1',
      drugAllergy: 'ไม่มี (มีประวัติแพ้อาหารทะเล)',
      informer: 'นาง มาลี พงศ์สถาพร',
      informerRelation: 'มารดา',
      nickname: 'ชา',
      skin: 'ขาว',
      language: 'ไทย',
      workplace: 'บริษัท ดิจิทัล โซลูชันส์ จำกัด',
      houseNo: '14',
      moo: '-',
      road: 'สุขุมวิท 71',
      subdistrict: 'คลองตันเหนือ',
      district: 'เขตวัฒนา',
      province: 'กรุงเทพมหานคร',
      zipcode: '10110',
      phoneHome: '02-391-4455',
      phoneWork: '02-700-8899',
      fatherFirstName: 'สมบูรณ์',
      fatherLastName: 'พงศ์สถาพร',
      fatherCid: '3-1020-00077-66-1',
      fatherPhone: '081-244-3299',
      motherFirstName: 'มาลี',
      motherLastName: 'พงศ์สถาพร',
      motherCid: '3-1020-00088-11-2',
      motherPhone: '081-244-3300',
      contactFirstName: 'มาลี',
      contactLastName: 'พงศ์สถาพร',
      contactRelation: 'มารดา',
      contactPhone: '081-244-3300',
      familyStatus: 'บุตร',
      personStatus: 'มีชีวิต',
      education: 'ปริญญาตรี',
      communityRole: 'ไม่มี',
      personType: 'ประชาชนทั่วไป',
      birthPlace: 'โรงพยาบาลพญาไท 2',
      birthWeight: '3200',
      birthGravida: '1',
      birthGestation: '40',
      enPrefix: 'Mr.',
      enFirstName: 'Anucha',
      enLastName: 'Pongsataporn',
      enAddress: '14 Soi Sukhumvit 71, Khlong Tan Nuea, Watthana, Bangkok 10110',
    },
    flags: { inResponsibleArea: false, consentGiven: true },
    rights: [
      {
        code: '20',
        name: 'ประกันสังคม',
        no: 'SSO-3102000456789',
        begin: '2008-06-01',
        expire: '2030-09-02',
      },
    ],
    drugAllergies: [],
    lists: {
      chronic: [
        {
          name: 'โรคจมูกอักเสบภูมิแพ้',
          icd: 'J30.4',
          note: 'อาการกำเริบช่วงเปลี่ยนฤดู',
        },
      ],
      'food-allergy': [
        {
          food: 'อาหารทะเล (กุ้ง)',
          symptom: 'ผื่นลมพิษ คันทั่วตัว',
          note: 'หลีกเลี่ยงกุ้งและหอย',
        },
      ],
      appointment: [
        {
          status: 'รอมาตามนัด',
          visitDate: '2026-05-18',
          nextDate: '2026-06-18',
          nextTime: '10:30',
          doctor: 'นพ. กิตติพงษ์ ปิยะนันท์',
          clinic: 'คลินิกภูมิแพ้',
          cause: 'ติดตามอาการภูมิแพ้',
        },
      ],
      note: [
        {
          date: '2026-05-18',
          author: 'นพ. กิตติพงษ์ ปิยะนันท์',
          note: 'แนะนำให้หลีกเลี่ยงสารก่อภูมิแพ้และฝุ่นละออง',
        },
      ],
      caregiver: [
        {
          relation: 'มารดา',
          prefix: 'นาง',
          name: 'มาลี',
          lastName: 'พงศ์สถาพร',
          cid: '3-1020-00088-11-2',
          phone: '081-244-3300',
          birthdate: '1958-03-15',
          address: '14 ซ.สุขุมวิท 71 แขวงคลองตันเหนือ เขตวัฒนา กรุงเทพมหานคร 10110',
          note: '',
        },
      ],
    },
  },

  /* ── เด็กหญิง พิมพ์ลภัส ศิริมงคล ── */
  '6800003344': {
    form: {
      prefix: 'เด็กหญิง',
      birthtime: '03:10',
      siblings: '1',
      childOrder: '1',
      drugAllergy: 'ไม่มี',
      informer: 'นาย ธนา ศิริมงคล',
      informerRelation: 'บิดา',
      nickname: 'น้องพิม',
      skin: 'ขาว',
      language: 'ไทย',
      houseNo: '88',
      moo: '5',
      road: '-',
      subdistrict: 'บางพลีใหญ่',
      district: 'บางพลี',
      province: 'สมุทรปราการ',
      zipcode: '10540',
      phoneHome: '02-750-1122',
      fatherFirstName: 'ธนา',
      fatherLastName: 'ศิริมงคล',
      fatherCid: '3-1020-00077-22-3',
      fatherPhone: '089-321-7788',
      motherFirstName: 'ปริศนา',
      motherLastName: 'ศิริมงคล',
      motherCid: '3-1020-00077-33-4',
      motherPhone: '089-321-7799',
      contactFirstName: 'ธนา',
      contactLastName: 'ศิริมงคล',
      contactRelation: 'บิดา',
      contactPhone: '089-321-7788',
      familyStatus: 'บุตร',
      personStatus: 'มีชีวิต',
      education: 'ประถมศึกษา',
      communityRole: 'ไม่มี',
      personType: 'ประชาชนทั่วไป',
      birthPlace: 'โรงพยาบาลสมุทรปราการ',
      birthWeight: '2950',
      birthDoctor: 'พญ. อรวรรณ สุขเกษม',
      birthGravida: '1',
      birthGestation: '38',
      enPrefix: 'Miss',
      enFirstName: 'Pimlapas',
      enLastName: 'Sirimongkol',
      enAddress: '88 Moo 5, Bang Phli Yai, Bang Phli, Samut Prakan 10540',
    },
    flags: { inResponsibleArea: true, consentGiven: true },
    rights: [
      {
        code: '30',
        name: 'ข้าราชการ / รัฐวิสาหกิจ (เบิกจ่ายตรง)',
        no: 'CSMBS-1209900112233',
        begin: '2018-12-21',
        expire: '2036-12-21',
      },
    ],
    drugAllergies: [],
    lists: {
      appointment: [
        {
          status: 'มาตามนัด',
          visitDate: '2026-05-20',
          nextDate: '2026-08-20',
          nextTime: '08:30',
          doctor: 'นพ. กิตติพงษ์ ปิยะนันท์',
          clinic: 'คลินิกสุขภาพเด็กดี',
          cause: 'ตรวจพัฒนาการและรับวัคซีนตามเกณฑ์',
        },
      ],
      note: [
        {
          date: '2026-05-20',
          author: 'นพ. กิตติพงษ์ ปิยะนันท์',
          note: 'พัฒนาการสมวัย รับวัคซีนครบตามเกณฑ์',
        },
      ],
      caregiver: [
        {
          relation: 'บิดา',
          prefix: 'นาย',
          name: 'ธนา',
          lastName: 'ศิริมงคล',
          cid: '3-1020-00077-22-3',
          phone: '089-321-7788',
          birthdate: '1986-07-09',
          address: '88 หมู่ 5 ต.บางพลีใหญ่ อ.บางพลี จ.สมุทรปราการ 10540',
          note: 'ผู้ปกครองหลัก',
        },
      ],
    },
  },

  /* ── นาย วิชัย จันทร์เพ็ญ ── */
  '6800004021': {
    form: {
      birthtime: '11:00',
      siblings: '6',
      childOrder: '4',
      drugAllergy: 'NSAIDs (กลุ่ม Ibuprofen)',
      informer: 'นาง สุดา จันทร์เพ็ญ',
      informerRelation: 'คู่สมรส',
      nickname: 'ชัย',
      skin: 'คล้ำ',
      language: 'ไทย',
      occupation: 'ข้าราชการบำนาญ',
      workplace: 'เกษียณอายุราชการ',
      houseNo: '7/9',
      moo: '-',
      road: 'มิตรภาพ',
      subdistrict: 'ในเมือง',
      district: 'เมืองนครราชสีมา',
      province: 'นครราชสีมา',
      zipcode: '30000',
      phoneHome: '044-242-100',
      fatherFirstName: 'เพิ่ม',
      fatherLastName: 'จันทร์เพ็ญ',
      motherFirstName: 'ทองคำ',
      motherLastName: 'จันทร์เพ็ญ',
      spouseFirstName: 'สุดา',
      spouseLastName: 'จันทร์เพ็ญ',
      spouseCid: '3-3010-00112-33-4',
      spousePhone: '081-876-5400',
      contactFirstName: 'สุดา',
      contactLastName: 'จันทร์เพ็ญ',
      contactRelation: 'คู่สมรส',
      contactPhone: '081-876-5400',
      familyStatus: 'หัวหน้าครอบครัว',
      personStatus: 'มีชีวิต',
      education: 'มัธยมศึกษา',
      communityRole: 'ผู้นำชุมชน',
      personType: 'ประชาชนทั่วไป',
      birthPlace: 'บ้าน',
      birthGravida: '4',
      enPrefix: 'Mr.',
      enFirstName: 'Wichai',
      enLastName: 'Chanpen',
      enAddress: '7/9 Mittraphap Rd., Nai Mueang, Mueang Nakhon Ratchasima 30000',
    },
    flags: { inResponsibleArea: true, consentGiven: true },
    rights: [
      {
        code: '10',
        name: 'หลักประกันสุขภาพถ้วนหน้า (บัตรทอง)',
        no: 'UC-5550100998877',
        begin: '2002-10-01',
        expire: '2035-12-31',
      },
    ],
    drugAllergies: [
      {
        data: {
          reportDate: '2025-02-18',
          reporter: 'นพ. ธีรเดช อภัยมูล',
          drug: 'Ibuprofen',
          type: 'อาการไม่พึงประสงค์จากยา (ADR)',
          symptom: 'ปัสสาวะน้อยลง ค่าการทำงานของไตสูงขึ้น',
          seriousness: 'ร้ายแรง — ต้องรักษา',
          relation: 'อาจจะใช่ (Possible)',
          result: 'อาการดีขึ้น',
          mechanism: 'พิษจากยา (Toxic)',
          alert: 'เตือนและต้องยืนยัน',
          dept: 'อายุรกรรม',
          source: 'เวชระเบียน',
          note: 'เลี่ยงยากลุ่ม NSAIDs ในผู้ป่วยโรคไต',
        },
        flags: { banned: false },
      },
    ],
    lists: {
      chronic: [
        {
          name: 'โรคหลอดเลือดหัวใจ',
          icd: 'I25.1',
          note: 'รับประทานยาต้านเกล็ดเลือดต่อเนื่อง',
        },
        {
          name: 'โรคไตเรื้อรัง ระยะที่ 3',
          icd: 'N18.3',
          note: 'ติดตามค่า eGFR ทุก 3 เดือน',
        },
      ],
      special: [{ status: 'ผู้สูงอายุ', note: 'อายุ 67 ปี ต้องดูแลใกล้ชิด' }],
      appointment: [
        {
          status: 'รอมาตามนัด',
          visitDate: '2026-05-19',
          nextDate: '2026-06-19',
          nextTime: '09:00',
          doctor: 'นพ. ธีรเดช อภัยมูล',
          clinic: 'คลินิกโรคไต',
          cause: 'ติดตามค่าการทำงานของไต',
        },
      ],
      note: [
        {
          date: '2026-05-19',
          author: 'นพ. ธีรเดช อภัยมูล',
          note: 'ค่าไตคงที่ แนะนำควบคุมความดันและงดอาหารเค็ม',
        },
      ],
      caregiver: [
        {
          relation: 'คู่สมรส',
          prefix: 'นาง',
          name: 'สุดา',
          lastName: 'จันทร์เพ็ญ',
          cid: '3-3010-00112-33-4',
          phone: '081-876-5400',
          birthdate: '1961-05-20',
          address: '7/9 ถ.มิตรภาพ ต.ในเมือง อ.เมืองนครราชสีมา จ.นครราชสีมา 30000',
          note: 'ดูแลเรื่องอาหารและการรับประทานยา',
        },
      ],
    },
  },

  /* ── นางสาว เบญจวรรณ อินทรานนท์ ── */
  '6800005192': {
    form: {
      birthtime: '19:50',
      siblings: '2',
      childOrder: '2',
      drugAllergy: 'ไม่มี',
      informer: 'นาง นงนุช อินทรานนท์',
      informerRelation: 'มารดา',
      nickname: 'เบญ',
      skin: 'ขาว',
      language: 'ไทย',
      occupation: 'นักออกแบบกราฟิก',
      workplace: 'บริษัท ครีเอทีฟ สตูดิโอ จำกัด',
      houseNo: '12',
      moo: '-',
      road: 'ลาดพร้าว',
      subdistrict: 'คลองเจ้าคุณสิงห์',
      district: 'เขตวังทองหลาง',
      province: 'กรุงเทพมหานคร',
      zipcode: '10310',
      phoneHome: '02-514-7788',
      fatherFirstName: 'วิรัช',
      fatherLastName: 'อินทรานนท์',
      fatherCid: '3-1040-00055-12-6',
      fatherPhone: '081-666-1200',
      motherFirstName: 'นงนุช',
      motherLastName: 'อินทรานนท์',
      motherCid: '3-1040-00055-23-7',
      motherPhone: '081-666-1201',
      contactFirstName: 'นงนุช',
      contactLastName: 'อินทรานนท์',
      contactRelation: 'มารดา',
      contactPhone: '081-666-1201',
      familyStatus: 'บุตร',
      personStatus: 'มีชีวิต',
      education: 'ปริญญาตรี',
      communityRole: 'ไม่มี',
      personType: 'ประชาชนทั่วไป',
      birthPlace: 'โรงพยาบาลรามคำแหง',
      birthWeight: '2800',
      birthGravida: '2',
      birthGestation: '38',
      enPrefix: 'Miss',
      enFirstName: 'Benjawan',
      enLastName: 'Intranon',
      enAddress: '12 Lat Phrao Rd., Khlong Chaokhun Sing, Wang Thonglang, Bangkok 10310',
    },
    flags: { inResponsibleArea: false, consentGiven: true },
    rights: [
      { code: '01', name: 'ชำระเงินเอง', no: '-', begin: '', expire: '' },
    ],
    drugAllergies: [],
    lists: {
      appointment: [
        {
          status: 'รอมาตามนัด',
          visitDate: '2026-05-15',
          nextDate: '2026-11-15',
          nextTime: '13:30',
          doctor: 'พญ. นพมาศ ใจดี',
          clinic: 'คลินิกตรวจสุขภาพ',
          cause: 'ตรวจสุขภาพประจำปี',
        },
      ],
      note: [
        {
          date: '2026-05-15',
          author: 'พญ. นพมาศ ใจดี',
          note: 'สุขภาพแข็งแรงดี ผลตรวจอยู่ในเกณฑ์ปกติ',
        },
      ],
    },
  },

  /* ── นาง อรพิน วัฒนะ ── */
  '6800006453': {
    form: {
      birthtime: '05:30',
      siblings: '5',
      childOrder: '3',
      drugAllergy: 'ไม่มี',
      informer: 'นางสาว กนกวรรณ วัฒนะ',
      informerRelation: 'บุตร/ธิดา',
      nickname: 'พิน',
      skin: 'ผิวสองสี',
      language: 'ไทย',
      occupation: 'ค้าขาย',
      workplace: 'ร้านค้าส่วนตัว',
      houseNo: '203',
      moo: '6',
      road: '-',
      subdistrict: 'สันทรายหลวง',
      district: 'สันทราย',
      province: 'เชียงใหม่',
      zipcode: '50210',
      phoneHome: '053-491-200',
      fatherFirstName: 'คำ',
      fatherLastName: 'ใจมา',
      motherFirstName: 'บัวลอย',
      motherLastName: 'ใจมา',
      contactFirstName: 'กนกวรรณ',
      contactLastName: 'วัฒนะ',
      contactRelation: 'บุตร/ธิดา',
      contactPhone: '086-770-1234',
      familyStatus: 'หัวหน้าครอบครัว',
      personStatus: 'มีชีวิต',
      education: 'ประถมศึกษา',
      communityRole: 'อสม.',
      personType: 'ประชาชนทั่วไป',
      birthPlace: 'บ้าน',
      birthGravida: '3',
      enPrefix: 'Mrs.',
      enFirstName: 'Orapin',
      enLastName: 'Wattana',
      enAddress: '203 Moo 6, San Sai Luang, San Sai, Chiang Mai 50210',
    },
    flags: { inResponsibleArea: true, consentGiven: true },
    rights: [
      {
        code: '10',
        name: 'หลักประกันสุขภาพถ้วนหน้า (บัตรทอง)',
        no: 'UC-3678900112233',
        begin: '2002-10-01',
        expire: '2035-12-31',
      },
    ],
    drugAllergies: [],
    lists: {
      chronic: [
        {
          name: 'ความดันโลหิตสูง',
          icd: 'I10',
          note: 'รับประทานยาลดความดันสม่ำเสมอ',
        },
      ],
      special: [{ status: 'ผู้สูงอายุ', note: '' }],
      appointment: [
        {
          status: 'มาตามนัด',
          visitDate: '2026-05-17',
          nextDate: '2026-08-17',
          nextTime: '10:00',
          doctor: 'นพ. ธีรเดช อภัยมูล',
          clinic: 'คลินิกความดันโลหิตสูง',
          cause: 'ติดตามระดับความดันโลหิต',
        },
      ],
      note: [
        {
          date: '2026-05-17',
          author: 'นพ. ธีรเดช อภัยมูล',
          note: 'ความดันควบคุมได้ดี แนะนำออกกำลังกายสม่ำเสมอ',
        },
      ],
      caregiver: [
        {
          relation: 'บุตร/ธิดา',
          prefix: 'นางสาว',
          name: 'กนกวรรณ',
          lastName: 'วัฒนะ',
          cid: '1-5010-00223-44-5',
          phone: '086-770-1234',
          birthdate: '1990-09-12',
          address: '203 หมู่ 6 ต.สันทรายหลวง อ.สันทราย จ.เชียงใหม่ 50210',
          note: 'ดูแลผู้ป่วยเป็นหลัก',
        },
      ],
    },
  },
}

/* ───────────────────────── lookup ───────────────────────── */

/** Build the full OPD profile for a patient by HN, or undefined if unknown. */
export function getPatientProfile(hn: string): OPDProfile | undefined {
  const patient = findPatient(hn)
  const seed = seeds[hn]
  if (!patient || !seed) return undefined
  return {
    patient,
    form: { ...baseForm(patient), ...seed.form },
    flags: seed.flags,
    rights: seed.rights.map((r, i) => ({ id: i + 1, ...r })),
    drugAllergies: seed.drugAllergies.map((a, i) => ({ id: i + 1, ...a })),
    lists: Object.fromEntries(
      Object.entries(seed.lists).map(([key, rows]) => [
        key,
        rows.map((data, i) => ({ id: i + 1, data })),
      ])
    ),
  }
}
