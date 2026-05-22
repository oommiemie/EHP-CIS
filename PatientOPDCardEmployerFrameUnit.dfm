object PatientOPDCardEmployerFrame: TPatientOPDCardEmployerFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  OnCreate = UniFrameCreate
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Caption = #3649#3619#3591#3591#3634#3609#3605#3656#3634#3591#3604#3657#3634#3623
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 890
    ExplicitHeight = 281
    object UniLabel1: TUniLabel
      Left = 19
      Top = 21
      Width = 109
      Height = 19
      Caption = #3627#3609#3656#3623#3618#3586#3638#3657#3609#3607#3632#3648#3610#3637#3618#3609
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 3
      Top = 54
      Width = 125
      Height = 19
      Caption = #3594#3639#3656#3629'/'#3627#3609#3656#3623#3618#3591#3634#3609#3607#3637#3656#3592#3657#3634#3591
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 465
      Top = 54
      Width = 58
      Height = 19
      Caption = #3650#3607#3619#3624#3633#3614#3607#3660
      TabOrder = 3
    end
    object UniLabel4: TUniLabel
      Left = 56
      Top = 87
      Width = 72
      Height = 19
      Caption = #3594#3639#3656#3629#3609#3634#3618#3592#3657#3634#3591
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 398
      Top = 87
      Width = 125
      Height = 19
      Caption = #3648#3621#3586#3607#3637#3656#3610#3633#3605#3619#3611#3619#3632#3594#3634#3594#3609
      TabOrder = 5
    end
    object UniLabel6: TUniLabel
      Left = 26
      Top = 121
      Width = 102
      Height = 19
      Caption = #3611#3619#3632#3648#3616#3607#3609#3634#3618#3592#3657#3634#3591
      TabOrder = 6
    end
    object UniLabel7: TUniLabel
      Left = 234
      Top = 121
      Width = 90
      Height = 19
      Caption = #3623#3633#3609#3586#3638#3657#3609#3607#3632#3648#3610#3637#3618#3609
      TabOrder = 7
    end
    object UniLabel8: TUniLabel
      Left = 442
      Top = 121
      Width = 129
      Height = 19
      Caption = #3648#3621#3586#3607#3632#3648#3610#3637#3618#3609#3605#3656#3634#3591#3604#3657#3634#3623
      TabOrder = 8
    end
    object UniLabel9: TUniLabel
      Left = 28
      Top = 154
      Width = 100
      Height = 19
      Caption = #3611#3619#3632#3648#3616#3607#3649#3619#3591#3591#3634#3609
      TabOrder = 9
    end
    object UniLabel10: TUniLabel
      Left = 413
      Top = 154
      Width = 112
      Height = 19
      Caption = #3648#3621#3586#3607#3632#3648#3610#3637#3618#3609' FWF'
      TabOrder = 10
    end
    object UniDBEdit1: TUniDBEdit
      Left = 134
      Top = 19
      Width = 94
      Height = 27
      DataField = 'office_hospcode'
      DataSource = PatientEmployerDS
      TabOrder = 11
    end
    object UniDBEdit2: TUniDBEdit
      Left = 315
      Top = 19
      Width = 400
      Height = 27
      DataField = 'foreign_office'
      DataSource = PatientEmployerDS
      TabOrder = 12
    end
    object UniDBEdit3: TUniDBEdit
      Left = 134
      Top = 52
      Width = 250
      Height = 27
      DataField = 'employer_name'
      DataSource = PatientEmployerDS
      TabOrder = 13
    end
    object UniDBEdit4: TUniDBEdit
      Left = 529
      Top = 52
      Width = 186
      Height = 27
      DataField = 'employer_phone'
      DataSource = PatientEmployerDS
      TabOrder = 14
    end
    object UniDBEdit5: TUniDBEdit
      Left = 134
      Top = 85
      Width = 250
      Height = 27
      DataField = 'employer_person_name'
      DataSource = PatientEmployerDS
      TabOrder = 15
    end
    object UniDBEdit6: TUniDBEdit
      Left = 529
      Top = 85
      Width = 186
      Height = 27
      DataField = 'employer_cid'
      DataSource = PatientEmployerDS
      TabOrder = 16
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 134
      Top = 118
      Width = 94
      Height = 27
      ListFormat = 
        'patient_employer_type:patient_employer_type_name:patient_employe' +
        'r_type_id:N'
      ListField = 'patient_employer_type_name'
      KeyField = 'patient_employer_type_id'
      ListFieldIndex = 0
      DataField = 'employer_type'
      DataSource = PatientEmployerDS
      TabOrder = 17
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniDBDateTimePicker1: TUniDBDateTimePicker
      Left = 330
      Top = 118
      Width = 105
      Height = 27
      DataField = 'register_date'
      DataSource = PatientEmployerDS
      DateTime = 43873.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 18
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 134
      Top = 151
      Width = 250
      Height = 27
      ListFormat = 
        'patient_employee_type:patient_employee_type_name:patient_employe' +
        'e_type_id:N'
      ListField = 'patient_employee_type_name'
      KeyField = 'patient_employee_type_id'
      ListFieldIndex = 0
      DataField = 'patient_employee_type_id'
      DataSource = PatientEmployerDS
      TabOrder = 19
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniDBEdit8: TUniDBEdit
      Left = 531
      Top = 151
      Width = 184
      Height = 27
      DataField = 'fwf_code'
      DataSource = PatientEmployerDS
      TabOrder = 20
    end
    object UniButton1: TUniButton
      Left = 234
      Top = 19
      Width = 75
      Height = 27
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 21
      OnClick = UniButton1Click
    end
    object UniDBEdit7: TUniDBEdit
      Left = 577
      Top = 118
      Width = 138
      Height = 27
      DataField = 'cardno'
      DataSource = PtCardDS
      TabOrder = 22
    end
  end
  object PatientEmployerCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = PatientEmployerCDSBeforePost
    Left = 24
    Top = 80
  end
  object PatientEmployerDS: TDataSource
    DataSet = PatientEmployerCDS
    Left = 8
    Top = 120
  end
  object PatientEmployerTypeCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 24
  end
  object PatientEmployerTypeDS: TDataSource
    DataSet = PatientEmployerTypeCDS
    Left = 760
    Top = 144
  end
  object PatientEmployeeTypeCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 788
    Top = 8
  end
  object PatientEmployeeTypeDS: TDataSource
    DataSet = PatientEmployeeTypeCDS
    Left = 744
    Top = 40
  end
  object PtCardCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = PtCardCDSBeforePost
    Left = 376
    Top = 40
  end
  object PtCardDS: TDataSource
    DataSet = PtCardCDS
    Left = 424
    Top = 56
  end
end
