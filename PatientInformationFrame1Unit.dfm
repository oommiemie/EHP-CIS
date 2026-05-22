object PatientInformationFrame1: TPatientInformationFrame1
  Left = 0
  Top = 0
  Width = 999
  Height = 195
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniLabel1: TUniLabel
    Left = 16
    Top = 19
    Width = 64
    Height = 19
    Caption = #3588#3635#3609#3635#3627#3609#3657#3634
    TabOrder = 0
  end
  object UniDBEdit1: TUniDBEdit
    Left = 86
    Top = 14
    Width = 98
    Height = 28
    DataField = 'pname'
    DataSource = PatientDS
    TabOrder = 1
  end
  object UniLabel2: TUniLabel
    Left = 191
    Top = 19
    Width = 20
    Height = 19
    Caption = #3594#3639#3656#3629
    TabOrder = 2
  end
  object UniDBEdit2: TUniDBEdit
    Left = 217
    Top = 14
    Width = 162
    Height = 28
    DataField = 'fname'
    DataSource = PatientDS
    TabOrder = 3
  end
  object UniLabel3: TUniLabel
    Left = 385
    Top = 19
    Width = 57
    Height = 19
    Caption = #3609#3634#3617#3626#3585#3640#3621
    TabOrder = 4
  end
  object UniDBEdit3: TUniDBEdit
    Left = 448
    Top = 14
    Width = 167
    Height = 28
    DataField = 'lname'
    DataSource = PatientDS
    TabOrder = 5
  end
  object UniLabel4: TUniLabel
    Left = 622
    Top = 19
    Width = 26
    Height = 19
    Caption = #3648#3614#3624
    TabOrder = 6
  end
  object UniDBEdit4: TUniDBEdit
    Left = 654
    Top = 14
    Width = 90
    Height = 28
    DataField = 'sex_name'
    DataSource = PatientDS
    TabOrder = 7
  end
  object UniLabel5: TUniLabel
    Left = 16
    Top = 53
    Width = 42
    Height = 19
    Caption = #3623#3633#3609#3648#3585#3636#3604
    TabOrder = 8
  end
  object UniLabel6: TUniLabel
    Left = 187
    Top = 53
    Width = 27
    Height = 19
    Caption = #3629#3634#3618#3640
    TabOrder = 9
  end
  object UniLabel7: TUniLabel
    Left = 385
    Top = 53
    Width = 55
    Height = 19
    Caption = #3627#3617#3641#3656#3648#3621#3639#3629#3604
    TabOrder = 10
  end
  object UniDBEdit6: TUniDBEdit
    Left = 448
    Top = 48
    Width = 46
    Height = 28
    DataField = 'bloodgrp'
    DataSource = PatientDS
    TabOrder = 11
  end
  object UniLabel8: TUniLabel
    Left = 499
    Top = 53
    Width = 63
    Height = 19
    Caption = #3648#3621#3586#3607#3637#3656#3610#3633#3605#3619
    TabOrder = 12
  end
  object UniDBEdit7: TUniDBEdit
    Left = 569
    Top = 48
    Width = 175
    Height = 28
    DataField = 'cid'
    DataSource = PatientDS
    TabOrder = 13
  end
  object PatientAgeEdit: TUniEdit
    Left = 217
    Top = 48
    Width = 162
    Height = 28
    TabOrder = 14
  end
  object UniLabel9: TUniLabel
    Left = 15
    Top = 87
    Width = 64
    Height = 19
    Caption = #3610#3657#3634#3609#3648#3621#3586#3607#3637#3656
    TabOrder = 15
  end
  object UniDBEdit8: TUniDBEdit
    Left = 86
    Top = 82
    Width = 98
    Height = 28
    DataField = 'addrpart'
    DataSource = PatientDS
    TabOrder = 16
  end
  object UniLabel10: TUniLabel
    Left = 192
    Top = 87
    Width = 31
    Height = 19
    Caption = #3627#3617#3641#3656#3607#3637#3656
    TabOrder = 17
  end
  object UniDBEdit9: TUniDBEdit
    Left = 229
    Top = 82
    Width = 60
    Height = 28
    DataField = 'moopart'
    DataSource = PatientDS
    TabOrder = 18
  end
  object UniLabel11: TUniLabel
    Left = 295
    Top = 87
    Width = 29
    Height = 19
    Caption = #3606#3609#3609
    TabOrder = 19
  end
  object UniDBEdit10: TUniDBEdit
    Left = 330
    Top = 82
    Width = 85
    Height = 28
    DataField = 'road'
    DataSource = PatientDS
    TabOrder = 20
  end
  object UniDBEdit11: TUniDBEdit
    Left = 421
    Top = 82
    Width = 323
    Height = 28
    DataField = 'full_name'
    DataSource = PatientDS
    TabOrder = 21
  end
  object UniLabel12: TUniLabel
    Left = 54
    Top = 121
    Width = 22
    Height = 19
    Caption = 'HN'
    TabOrder = 22
  end
  object UniDBEdit12: TUniDBEdit
    Left = 86
    Top = 116
    Width = 98
    Height = 28
    DataField = 'hn'
    DataSource = PatientDS
    TabOrder = 23
  end
  object UniLabel13: TUniLabel
    Left = 189
    Top = 121
    Width = 58
    Height = 19
    Caption = #3650#3607#3619#3624#3633#3614#3607#3660
    TabOrder = 24
  end
  object UniDBEdit13: TUniDBEdit
    Left = 253
    Top = 116
    Width = 162
    Height = 28
    DataField = 'mobile_phone_number'
    DataSource = PatientDS
    TabOrder = 25
  end
  object UniDBEdit15: TUniDBEdit
    Left = 486
    Top = 116
    Width = 129
    Height = 28
    DataField = 'citizenship_name'
    DataSource = PatientDS
    TabOrder = 26
  end
  object UniLabel15: TUniLabel
    Left = 429
    Top = 121
    Width = 51
    Height = 19
    Caption = #3626#3633#3597#3594#3634#3605#3636
    TabOrder = 27
  end
  object UniGroupBox1: TUniGroupBox
    Left = 752
    Top = 1
    Width = 115
    Height = 143
    Caption = #3619#3641#3611
    TabOrder = 28
    object UniDBImage1: TUniDBImage
      Left = 2
      Top = 21
      Width = 111
      Height = 120
      DataField = 'image'
      DataSource = PatientImageDS
      Proportional = True
      Align = alClient
    end
  end
  object BirthDateEdit: TUniEdit
    Left = 86
    Top = 48
    Width = 98
    Height = 28
    Alignment = taCenter
    Text = 'BirthDateEdit'
    TabOrder = 29
    ReadOnly = True
  end
  object UniButton1: TUniButton
    Left = 621
    Top = 116
    Width = 123
    Height = 28
    Caption = #55357#56761' '#3649#3585#3657#3652#3586#3648#3623#3594#3619#3632#3648#3610#3637#3618#3609
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 30
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 873
    Top = 10
    Width = 72
    Height = 25
    Caption = 'Video Call'
    ParentFont = False
    TabOrder = 31
    OnClick = UniButton2Click
  end
  object UniLabel14: TUniLabel
    Left = 19
    Top = 154
    Width = 61
    Height = 19
    Caption = #3585#3634#3619#3649#3614#3657#3618#3634
    TabOrder = 32
  end
  object UniDBEdit5: TUniDBEdit
    Left = 86
    Top = 150
    Width = 329
    Height = 28
    DataField = 'drugallergy'
    DataSource = PatientDS
    TabOrder = 33
  end
  object PatientDS: TDataSource
    DataSet = PatientCDS
    Left = 861
    Top = 25
  end
  object PatientCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    AfterOpen = PatientCDSAfterOpen
    Left = 782
    Top = 35
  end
  object PatientImageDS: TDataSource
    DataSet = PatientImageCDS
    Left = 769
    Top = 79
  end
  object PatientImageCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 854
    Top = 75
  end
end
