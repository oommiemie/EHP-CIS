object PatientOPDCardSocialFrame: TPatientOPDCardSocialFrame
  Left = 0
  Top = 0
  Width = 742
  Height = 187
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 742
    Height = 187
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 177
    object UniLabel1: TUniLabel
      Left = 28
      Top = 33
      Width = 123
      Height = 19
      Caption = #3626#3606#3634#3609#3632#3651#3609#3588#3619#3629#3610#3588#3619#3633#3623
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 88
      Top = 66
      Width = 63
      Height = 19
      Caption = #3585#3634#3619#3624#3638#3585#3625#3634
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 29
      Top = 100
      Width = 122
      Height = 19
      Caption = #3594#3609#3636#3604#3610#3640#3588#3588#3621#3605#3656#3634#3591#3604#3657#3634#3623
      TabOrder = 3
    end
    object UniLabel4: TUniLabel
      Left = 39
      Top = 133
      Width = 112
      Height = 19
      Caption = #3605#3635#3649#3627#3609#3656#3591#3651#3609#3594#3640#3617#3594#3609
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 335
      Top = 33
      Width = 84
      Height = 19
      Caption = #3626#3606#3634#3609#3632#3610#3640#3588#3588#3621
      TabOrder = 5
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 425
      Top = 32
      Width = 300
      Height = 28
      ListFormat = 'house_regist_type:house_regist_type_name:house_regist_type_id'
      ListFieldIndex = 0
      DataField = 'type_area'
      DataSource = PatientDS
      TabOrder = 6
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
      OnChange = UniDBLookupComboBox2Change
    end
    object UniDBLookupComboBox3: TUniDBLookupComboBox
      Left = 157
      Top = 64
      Width = 362
      Height = 28
      ListFormat = 'education:name:education'
      ListField = 'name'
      KeyField = 'education'
      ListFieldIndex = 0
      DataField = 'educate'
      DataSource = PatientDS
      TabOrder = 7
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniDBLookupComboBox4: TUniDBLookupComboBox
      Left = 157
      Top = 98
      Width = 362
      Height = 28
      ListFormat = 'person_labor_type:person_labor_type_name:person_labor_type_id:N'
      ListField = 'person_labor_type_name'
      KeyField = 'person_labor_type_id'
      ListFieldIndex = 0
      DataField = 'person_labor_type_id'
      DataSource = PatientDS
      TabOrder = 8
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniDBLookupComboBox5: TUniDBLookupComboBox
      Left = 157
      Top = 131
      Width = 362
      Height = 28
      ListFormat = 
        'patient_person_type:patient_person_type_name:patient_person_type' +
        '_id:N'
      ListField = 'patient_person_type_name'
      KeyField = 'patient_person_type_id'
      ListFieldIndex = 0
      DataField = 'person_type'
      DataSource = PatientDS
      TabOrder = 9
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 537
      Top = 66
      Width = 175
      Height = 23
      DataField = 'inregion'
      DataSource = PatientDS
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = #3629#3618#3641#3656#3651#3609#3648#3586#3605#3619#3633#3610#3612#3636#3604#3594#3629#3610
      TabOrder = 10
      ParentColor = False
      Color = clBtnFace
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 157
      Top = 30
      Width = 172
      Height = 28
      ListFormat = 
        'patient_family_status:patient_family_status_name:patient_family_' +
        'status_id:N'
      ListFieldIndex = 0
      DataField = 'family_status'
      DataSource = PatientDS
      TabOrder = 11
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
  end
  object xPatientCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 16
  end
  object PatientDS: TDataSource
    DataSet = xPatientCDS
    Left = 416
    Top = 16
  end
end
