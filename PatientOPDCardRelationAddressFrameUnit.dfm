object PatientOPDCardRelationAddressFrame: TPatientOPDCardRelationAddressFrame
  Left = 0
  Top = 0
  Width = 1040
  Height = 190
  OnCreate = UniFrameCreate
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1040
    Height = 190
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -3
    object UniDBEdit1: TUniDBEdit
      Left = 92
      Top = 14
      Width = 120
      Height = 28
      DataField = 'fathername'
      DataSource = PatientDS
      TabOrder = 1
    end
    object UniLabel1: TUniLabel
      Left = 38
      Top = 18
      Width = 48
      Height = 19
      Caption = #3594#3639#3656#3629#3610#3636#3604#3634
      TabOrder = 13
    end
    object UniLabel2: TUniLabel
      Left = 23
      Top = 51
      Width = 63
      Height = 19
      Caption = #3594#3639#3656#3629#3617#3634#3619#3604#3634
      TabOrder = 14
    end
    object UniDBEdit2: TUniDBEdit
      Left = 92
      Top = 48
      Width = 120
      Height = 28
      DataField = 'mathername'
      DataSource = PatientDS
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 85
      Width = 67
      Height = 19
      Caption = #3594#3639#3656#3629#3588#3641#3656#3626#3617#3619#3626
      TabOrder = 15
    end
    object UniDBEdit3: TUniDBEdit
      Left = 92
      Top = 82
      Width = 120
      Height = 28
      DataField = 'spsname'
      DataSource = PatientDS
      TabOrder = 7
    end
    object UniLabel4: TUniLabel
      Left = 215
      Top = 51
      Width = 57
      Height = 19
      Caption = #3609#3634#3617#3626#3585#3640#3621
      TabOrder = 16
    end
    object UniDBEdit4: TUniDBEdit
      Left = 279
      Top = 14
      Width = 100
      Height = 28
      DataField = 'fatherlname'
      DataSource = PatientDS
      TabOrder = 2
    end
    object UniDBEdit5: TUniDBEdit
      Left = 279
      Top = 82
      Width = 100
      Height = 28
      DataField = 'spslname'
      DataSource = PatientDS
      TabOrder = 8
    end
    object UniDBEdit6: TUniDBEdit
      Left = 279
      Top = 48
      Width = 100
      Height = 28
      DataField = 'motherlname'
      DataSource = PatientDS
      TabOrder = 5
    end
    object UniLabel7: TUniLabel
      Left = 16
      Top = 120
      Width = 70
      Height = 19
      Caption = #3594#3639#3656#3629#3612#3641#3657#3605#3636#3604#3605#3656#3629
      TabOrder = 17
    end
    object UniDBEdit7: TUniDBEdit
      Left = 92
      Top = 116
      Width = 120
      Height = 28
      DataField = 'ec_fname'
      DataSource = PatientDS
      TabOrder = 10
    end
    object UniDBEdit8: TUniDBEdit
      Left = 279
      Top = 116
      Width = 100
      Height = 28
      DataField = 'ec_lname'
      DataSource = PatientDS
      TabOrder = 11
    end
    object UniButton1: TUniButton
      Left = 384
      Top = 16
      Width = 50
      Height = 25
      Caption = #3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 18
      OnClick = UniButton1Click
    end
    object UniDBEdit9: TUniDBEdit
      Left = 537
      Top = 14
      Width = 110
      Height = 28
      DataField = 'father_cid'
      DataSource = PatientDS
      TabOrder = 3
    end
    object UniDBEdit10: TUniDBEdit
      Left = 537
      Top = 48
      Width = 110
      Height = 28
      DataField = 'mother_cid'
      DataSource = PatientDS
      TabOrder = 6
    end
    object UniDBEdit11: TUniDBEdit
      Left = 537
      Top = 82
      Width = 110
      Height = 28
      DataField = 'couple_cid'
      DataSource = PatientDS
      TabOrder = 9
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 537
      Top = 116
      Width = 195
      Height = 28
      ListFormat = 
        'patient_relation_type:patient_relation_type_name:patient_relatio' +
        'n_type_id:N:patient_relation_type_id<9'
      ListField = 'patient_relation_type_name'
      KeyField = 'patient_relation_type_id'
      ListFieldIndex = 0
      DataField = 'ec_relation_type_id'
      DataSource = PatientDS
      TabOrder = 12
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniButton5: TUniButton
      Left = 652
      Top = 14
      Width = 83
      Height = 25
      Caption = #3648#3623#3594#3619#3632#3648#3610#3637#3618#3609
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 19
      OnClick = UniButton5Click
    end
    object UniButton6: TUniButton
      Left = 652
      Top = 49
      Width = 83
      Height = 25
      Caption = #3648#3623#3594#3619#3632#3648#3610#3637#3618#3609
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 20
      OnClick = UniButton6Click
    end
    object UniButton7: TUniButton
      Left = 652
      Top = 83
      Width = 83
      Height = 25
      Caption = #3648#3623#3594#3619#3632#3648#3610#3637#3618#3609
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 21
      OnClick = UniButton7Click
    end
    object UniLabel9: TUniLabel
      Left = 438
      Top = 51
      Width = 93
      Height = 19
      Caption = #3648#3621#3586#3607#3637#3656#3610#3633#3605#3619#3611#3594#3594
      TabOrder = 22
    end
    object UniLabel12: TUniLabel
      Left = 437
      Top = 85
      Width = 93
      Height = 19
      Caption = #3648#3621#3586#3607#3637#3656#3610#3633#3605#3619#3611#3594#3594
      TabOrder = 23
    end
    object UniLabel5: TUniLabel
      Left = 215
      Top = 85
      Width = 57
      Height = 19
      Caption = #3609#3634#3617#3626#3585#3640#3621
      TabOrder = 24
    end
    object UniLabel6: TUniLabel
      Left = 215
      Top = 120
      Width = 57
      Height = 19
      Caption = #3609#3634#3617#3626#3585#3640#3621
      TabOrder = 25
    end
    object UniLabel8: TUniLabel
      Left = 215
      Top = 18
      Width = 57
      Height = 19
      Caption = #3609#3634#3617#3626#3585#3640#3621
      TabOrder = 26
    end
    object UniButton2: TUniButton
      Left = 384
      Top = 49
      Width = 50
      Height = 25
      Caption = #3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 27
      OnClick = UniButton2Click
    end
    object UniButton3: TUniButton
      Left = 384
      Top = 83
      Width = 50
      Height = 25
      Caption = #3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 28
      OnClick = UniButton3Click
    end
    object UniButton4: TUniButton
      Left = 384
      Top = 117
      Width = 50
      Height = 25
      Caption = #3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 29
      OnClick = UniButton4Click
    end
    object UniLabel10: TUniLabel
      Left = 437
      Top = 18
      Width = 93
      Height = 19
      Caption = #3648#3621#3586#3607#3637#3656#3610#3633#3605#3619#3611#3594#3594
      TabOrder = 30
    end
    object UniLabel11: TUniLabel
      Left = 445
      Top = 120
      Width = 86
      Height = 19
      Caption = #3588#3623#3634#3617#3626#3633#3617#3614#3633#3609#3608#3660
      TabOrder = 31
    end
  end
  object PatientCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 152
  end
  object PatientDS: TDataSource
    DataSet = PatientCDS
    Left = 456
    Top = 152
  end
  object PatientRelationTypeCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 128
  end
  object PatientRelationTypeDS: TDataSource
    DataSet = PatientRelationTypeCDS
    Left = 664
    Top = 128
  end
end
