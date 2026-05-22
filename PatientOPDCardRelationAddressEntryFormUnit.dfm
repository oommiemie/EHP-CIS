object PatientOPDCardRelationAddressEntryForm: TPatientOPDCardRelationAddressEntryForm
  Left = 0
  Top = 0
  ClientHeight = 587
  ClientWidth = 691
  Caption = 'PatientOPDCardRelationAddressEntryForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object TUniSimplePanel
    Left = 0
    Top = 0
    Width = 691
    Height = 96
    ParentColor = False
    Color = 9452297
    Align = alTop
    TabOrder = 0
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 16
      Top = 9
      Width = 98
      Height = 25
      Caption = #3586#3657#3629#3617#3641#3621#3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -21
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 16
      Top = 44
      Width = 178
      Height = 19
      Caption = '000125856:'#3609#3634#3618#3626#3635#3619#3634#3597
      ParentFont = False
      Font.Color = 4227327
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 16
      Top = 69
      Width = 318
      Height = 16
      Caption = 'Front Officer >> '#3648#3623#3594#3619#3632#3648#3610#3637#3618#3609' >> OPDCard >> '#3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Color = clYellow
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object UniLabel4: TUniLabel
      Left = 329
      Top = 36
      Width = 349
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = #3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656' BMS'
      ParentFont = False
      Font.Color = 65408
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 465
      Top = 66
      Width = 211
      Height = 16
      Alignment = taRightJustify
      Caption = #3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656' BMS, '#3612#3641#3657#3604#3641#3649#3621#3619#3632#3610#3610' - Admin'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 5
    end
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 540
    Width = 691
    Height = 47
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    object UniButton3: TUniButton
      Left = 9
      Top = 9
      Width = 82
      Height = 28
      Caption = #3621#3610
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 7
      OnClick = UniButton3Click
    end
    object UniButton4: TUniButton
      Left = 583
      Top = 9
      Width = 89
      Height = 28
      Caption = #3611#3636#3604
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton4Click
    end
    object UniButton5: TUniButton
      Left = 491
      Top = 9
      Width = 89
      Height = 28
      Caption = #3610#3633#3609#3607#3638#3585
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 1
      OnClick = UniButton5Click
    end
  end
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 96
    Width = 691
    Height = 444
    Caption = #3619#3634#3618#3621#3632#3648#3629#3637#3618#3604
    Align = alClient
    TabOrder = 2
    ExplicitTop = 112
    ExplicitHeight = 437
    object UniLabel6: TUniLabel
      Left = 48
      Top = 30
      Width = 58
      Height = 19
      Caption = #3607#3637#3656#3629#3618#3641#3656#3586#3629#3591
      TabOrder = 12
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 112
      Top = 27
      Width = 273
      Height = 27
      ListFormat = 
        'patient_relation_type:patient_relation_type_name:patient_relatio' +
        'n_type_id:N:patient_relation_type_id<9'
      ListField = 'patient_relation_type_name'
      KeyField = 'patient_relation_type_id'
      ListFieldIndex = 0
      DataField = 'patient_relation_type_id'
      DataSource = PatientRelationDS
      TabStop = False
      TabOrder = 13
      ReadOnly = True
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
    end
    object UniButton1: TUniButton
      Left = 549
      Top = 27
      Width = 122
      Height = 27
      Caption = #3651#3594#3657#3607#3637#3656#3629#3618#3641#3656#3611#3633#3592#3592#3640#3610#3633#3609
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 14
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 391
      Top = 27
      Width = 152
      Height = 27
      Caption = #3607#3637#3656#3629#3618#3641#3656#3605#3634#3617#3607#3632#3648#3610#3637#3618#3609#3610#3657#3634#3609
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabStop = False
      TabOrder = 15
      OnClick = UniButton2Click
    end
    object UniLabel7: TUniLabel
      Left = 42
      Top = 63
      Width = 64
      Height = 19
      Caption = #3648#3621#3586#3607#3637#3656#3610#3657#3634#3609
      TabOrder = 16
    end
    object UniDBEdit1: TUniDBEdit
      Left = 112
      Top = 60
      Width = 273
      Height = 28
      DataField = 'addrpart'
      DataSource = PatientRelationDS
      TabOrder = 1
    end
    object UniLabel8: TUniLabel
      Left = 431
      Top = 63
      Width = 20
      Height = 19
      Caption = #3627#3617#3641#3656
      TabOrder = 17
    end
    object UniDBEdit2: TUniDBEdit
      Left = 457
      Top = 60
      Width = 214
      Height = 28
      DataField = 'moopart'
      DataSource = PatientRelationDS
      TabOrder = 2
    end
    object UniLabel9: TUniLabel
      Left = 77
      Top = 97
      Width = 29
      Height = 19
      Caption = #3606#3609#3609
      TabOrder = 18
    end
    object UniDBEdit3: TUniDBEdit
      Left = 112
      Top = 94
      Width = 233
      Height = 28
      DataField = 'road'
      DataSource = PatientRelationDS
      TabOrder = 3
    end
    object UniDBEdit4: TUniDBEdit
      Left = 398
      Top = 94
      Width = 273
      Height = 28
      DataField = 'soi'
      DataSource = PatientRelationDS
      TabOrder = 4
    end
    object UniLabel10: TUniLabel
      Left = 362
      Top = 97
      Width = 30
      Height = 19
      Caption = #3595#3629#3618
      TabOrder = 19
    end
    object UniLabel11: TUniLabel
      Left = 61
      Top = 131
      Width = 45
      Height = 19
      Caption = #3592#3633#3591#3627#3623#3633#3604
      TabOrder = 20
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 112
      Top = 128
      Width = 559
      Height = 28
      ListFormat = 'province:province_name:province_code'
      ListField = 'province_name'
      KeyField = 'province_code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'province_code'
      DataSource = PatientAddressDS
      TabOrder = 5
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      RemoteQueryCache = False
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox2GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox2RemoteQuery
      OnSelect = UniDBLookupComboBox2Select
    end
    object UniLabel12: TUniLabel
      Left = 63
      Top = 165
      Width = 43
      Height = 19
      Caption = #3629#3635#3648#3616#3629
      TabOrder = 21
    end
    object UniDBLookupComboBox3: TUniDBLookupComboBox
      Left = 112
      Top = 162
      Width = 559
      Height = 28
      ListFormat = 'district:district_name:district_code'
      ListField = 'district_name'
      KeyField = 'district_code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'district_code'
      DataSource = PatientAddressDS
      TabOrder = 6
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      RemoteQueryCache = False
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox3GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox3RemoteQuery
      OnSelect = UniDBLookupComboBox3Select
    end
    object UniLabel13: TUniLabel
      Left = 68
      Top = 199
      Width = 38
      Height = 19
      Caption = #3605#3635#3610#3621
      TabOrder = 22
    end
    object UniDBLookupComboBox4: TUniDBLookupComboBox
      Left = 112
      Top = 196
      Width = 559
      Height = 28
      ListFormat = 'tambol:tambol_name:tambol_code'
      ListField = 'tambol_name'
      KeyField = 'tambol_code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'tambol_code'
      DataSource = PatientAddressDS
      TabOrder = 7
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      RemoteQueryCache = False
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox4GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox4RemoteQuery
    end
    object UniLabel14: TUniLabel
      Left = 67
      Top = 233
      Width = 39
      Height = 19
      Caption = 'Email'
      TabOrder = 23
    end
    object UniDBEdit5: TUniDBEdit
      Left = 112
      Top = 230
      Width = 559
      Height = 28
      DataField = 'email'
      DataSource = PatientRelationDS
      TabOrder = 8
    end
    object UniDBEdit6: TUniDBEdit
      Left = 112
      Top = 264
      Width = 559
      Height = 28
      DataField = 'phone'
      DataSource = PatientRelationDS
      TabOrder = 9
    end
    object UniLabel15: TUniLabel
      Left = 20
      Top = 267
      Width = 86
      Height = 19
      Caption = #3650#3607#3619#3624#3633#3614#3607#3660#3610#3657#3634#3609
      TabOrder = 24
    end
    object UniDBEdit7: TUniDBEdit
      Left = 112
      Top = 298
      Width = 559
      Height = 28
      DataField = 'mobile'
      DataSource = PatientRelationDS
      TabOrder = 10
    end
    object UniLabel16: TUniLabel
      Left = 9
      Top = 301
      Width = 97
      Height = 19
      Caption = #3650#3607#3619#3624#3633#3614#3607#3660#3617#3639#3629#3606#3639#3629
      TabOrder = 25
    end
    object UniLabel17: TUniLabel
      Left = 44
      Top = 335
      Width = 62
      Height = 19
      Caption = #3627#3617#3634#3618#3648#3627#3605#3640
      TabOrder = 26
    end
    object UniDBMemo1: TUniDBMemo
      Left = 112
      Top = 332
      Width = 559
      Height = 89
      DataField = 'address_note'
      DataSource = PatientRelationDS
      TabOrder = 11
    end
  end
  object PatientRelationDS: TDataSource
    DataSet = PatientRelationCDS
    Left = 138
    Top = 215
  end
  object PatientRelationCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = PatientRelationCDSBeforePost
    Left = 220
    Top = 213
  end
  object RelationDS: TDataSource
    DataSet = RelationCDS
    Left = 423
    Top = 215
  end
  object RelationCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 481
    Top = 213
  end
  object PatientDS: TDataSource
    DataSet = PatientCDS
    Left = 291
    Top = 214
  end
  object PatientCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = PatientRelationCDSBeforePost
    Left = 354
    Top = 213
  end
  object PatientAddressCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from patient_address where 1<0'#13#10
    Params = <>
    Left = 324
    Top = 291
    Data = {
      340100009619E0BD010000001800000004000000000003000000340102686E01
      00490000000200055749445448020002000900064F524947494E020049801300
      70617469656E745F616464726573732E686E000D70726F76696E63655F636F64
      650100490000000200055749445448020002000200064F524947494E02004980
      1E0070617469656E745F616464726573732E70726F76696E63655F636F646500
      0D64697374726963745F636F6465010049000000020005574944544802000200
      0400064F524947494E020049801E0070617469656E745F616464726573732E64
      697374726963745F636F6465000B74616D626F6C5F636F646501004900000002
      00055749445448020002000600064F524947494E020049801C0070617469656E
      745F616464726573732E74616D626F6C5F636F6465000000}
  end
  object PatientAddressDS: TDataSource
    DataSet = PatientAddressCDS
    Left = 426
    Top = 291
  end
end
