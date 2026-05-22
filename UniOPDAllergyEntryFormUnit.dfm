object UniOPDAllergyEntryForm: TUniOPDAllergyEntryForm
  Left = 0
  Top = 0
  ClientHeight = 810
  ClientWidth = 1410
  Caption = 'UniOPDAllergyEntryForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  Font.Height = -16
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1410
    Height = 53
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    DesignSize = (
      1410
      53)
    object UniLabel1: TUniLabel
      Left = 13
      Top = 12
      Width = 145
      Height = 23
      Caption = ' '#3586#3657#3629#3617#3641#3621' '#3585#3634#3619#3649#3614#3657#3618#3634
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object LogButton: TUniButton
      Left = 1323
      Top = 12
      Width = 75
      Height = 29
      Caption = 'Log'
      Anchors = [akTop, akRight]
      TabOrder = 2
      ImageIndex = 12
      OnClick = LogButtonClick
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 764
    Width = 1410
    Height = 46
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      1410
      46)
    object UniButton1: TUniButton
      Left = 12
      Top = 9
      Width = 78
      Height = 27
      Caption = #3621#3610
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniImageList1
      ImageIndex = 2
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 1322
      Top = 9
      Width = 75
      Height = 27
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniImageList1
      ImageIndex = 1
      OnClick = UniButton2Click
    end
    object UniButton3: TUniButton
      Left = 1236
      Top = 9
      Width = 80
      Height = 27
      Caption = #3610#3633#3609#3607#3638#3585
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniImageList1
      ImageIndex = 0
      OnClick = UniButton3Click
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 53
    Width = 1410
    Height = 711
    ActivePage = UniTabSheet1
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 96
    ExplicitTop = 213
    ExplicitWidth = 289
    ExplicitHeight = 193
    object UniTabSheet1: TUniTabSheet
      Caption = #3586#3657#3629#3617#3641#3621#3585#3634#3619#3649#3614#3657#3618#3634
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object cxScrollBox1: TUniPanel
        Left = 0
        Top = 0
        Width = 1402
        Height = 683
        AutoScroll = True
        Align = alClient
        TabOrder = 0
        ScrollDirection = sdVertical
        ExplicitTop = -2
        ExplicitHeight = 677
        ScrollHeight = 780
        ScrollWidth = 1402
        object Label13: TUniLabel
          Left = 46
          Top = 13
          Width = 60
          Height = 13
          Caption = #3623#3633#3609#3607#3637#3656#3617#3637#3619#3634#3618#3591#3634#3609
          TabOrder = 29
        end
        object Label14: TUniLabel
          Left = 360
          Top = 13
          Width = 56
          Height = 13
          Caption = #3623#3633#3609#3607#3637#3656#3617#3637#3629#3634#3585#3634#3619
          TabOrder = 30
        end
        object Label12: TUniLabel
          Left = 9
          Top = 48
          Width = 86
          Height = 13
          Caption = #3618#3634#3607#3637#3656#3649#3614#3657' ('#3594#3639#3656#3629#3626#3634#3617#3633#3597')'
          TabOrder = 31
        end
        object Label15: TUniLabel
          Left = 62
          Top = 84
          Width = 51
          Height = 13
          Caption = #3629#3634#3585#3634#3619#3607#3637#3656#3649#3614#3657
          TabOrder = 32
        end
        object Label20: TUniLabel
          Left = 51
          Top = 121
          Width = 57
          Height = 13
          Caption = #3588#3623#3634#3617#3619#3657#3634#3618#3649#3619#3591
          TabOrder = 33
        end
        object Label7: TUniLabel
          Left = 447
          Top = 121
          Width = 42
          Height = 13
          Caption = #3585#3634#3619#3648#3605#3639#3629#3609
          TabOrder = 34
        end
        object Label21: TUniLabel
          Left = 44
          Top = 156
          Width = 65
          Height = 13
          Caption = #3626#3634#3648#3627#3605#3640#3585#3634#3619#3648#3585#3636#3604
          TabOrder = 35
        end
        object Label22: TUniLabel
          Left = 15
          Top = 192
          Width = 82
          Height = 13
          Caption = #3619#3632#3604#3633#3610#3588#3623#3634#3617#3626#3633#3617#3614#3633#3609#3608#3660
          TabOrder = 36
        end
        object Label23: TUniLabel
          Left = 5
          Top = 228
          Width = 91
          Height = 13
          Caption = #3612#3621#3607#3637#3656#3648#3585#3636#3604#3586#3638#3657#3609#3616#3634#3618#3627#3621#3633#3591
          TabOrder = 37
        end
        object Label24: TUniLabel
          Left = 48
          Top = 264
          Width = 61
          Height = 13
          Caption = #3611#3619#3632#3648#3616#3607#3612#3641#3657#3611#3656#3623#3618
          TabOrder = 38
        end
        object Label25: TUniLabel
          Left = 299
          Top = 263
          Width = 39
          Height = 13
          Caption = #3627#3629#3612#3641#3657#3611#3656#3623#3618
          TabOrder = 39
        end
        object Label3: TUniLabel
          Left = 650
          Top = 556
          Width = 40
          Height = 13
          Caption = #3612#3641#3657#3619#3634#3618#3591#3634#3609
          TabOrder = 40
        end
        object Label26: TUniLabel
          Left = 97
          Top = 297
          Width = 28
          Height = 13
          Caption = #3649#3612#3609#3585
          TabOrder = 41
        end
        object Label5: TUniLabel
          Left = 102
          Top = 331
          Width = 19
          Height = 13
          Caption = #3627#3657#3629#3591
          TabOrder = 42
        end
        object Label11: TUniLabel
          Left = 299
          Top = 331
          Width = 69
          Height = 13
          Caption = #3611#3619#3632#3648#3616#3607#3619#3634#3618#3591#3634#3609
          TabOrder = 43
        end
        object Label4: TUniLabel
          Left = 73
          Top = 360
          Width = 43
          Height = 13
          Caption = #3627#3617#3634#3618#3648#3627#3605#3640
          TabOrder = 44
        end
        object Label10: TUniLabel
          Left = 34
          Top = 424
          Width = 67
          Height = 13
          Caption = 'Consult dialog'
          TabOrder = 45
        end
        object Label16: TUniLabel
          Left = 675
          Top = 48
          Width = 155
          Height = 13
          Caption = #3619#3627#3633#3626#3617#3634#3605#3619#3600#3634#3609#3586#3629#3591#3618#3634' 24 '#3627#3621#3633#3585' '#3607#3637#3656#3649#3614#3657
          TabOrder = 46
        end
        object Label6: TUniLabel
          Left = 736
          Top = 83
          Width = 68
          Height = 13
          Caption = 'Naranjo result'
          TabOrder = 47
        end
        object Label1: TUniLabel
          Left = 32
          Top = 462
          Width = 67
          Height = 13
          Caption = 'Symptom (43)'
          TabOrder = 50
        end
        object cxDBDateEdit1: TUniDBDateTimePicker
          Left = 147
          Top = 11
          Width = 188
          Height = 28
          DataField = 'report_date'
          DataSource = OPDAllergyDS
          DateTime = 45134.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 0
        end
        object cxDBDateEdit2: TUniDBDateTimePicker
          Left = 449
          Top = 11
          Width = 188
          Height = 28
          DataField = 'begin_date'
          DataSource = OPDAllergyDS
          DateTime = 45134.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object cxDBComboBox1: TUniDBComboBox
          Left = 148
          Top = 45
          Width = 489
          Height = 28
          AnyMatch = True
          DataField = 'agent'
          DataSource = OPDAllergyDS
          TabOrder = 2
          IconItems = <>
        end
        object cxDBTextEdit1: TUniDBEdit
          Left = 147
          Top = 83
          Width = 454
          Height = 28
          DataField = 'symptom'
          DataSource = OPDAllergyDS
          TabOrder = 3
        end
        object cxDBLookupComboBox1: TUniDBLookupComboBox
          Left = 147
          Top = 119
          Width = 122
          Height = 28
          ListField = 'seiousness_name'
          ListSource = SeriousDS
          KeyField = 'seriousness_id'
          ListFieldIndex = 0
          DataField = 'seriousness_id'
          DataSource = OPDAllergyDS
          TabOrder = 4
          Color = clWindow
        end
        object cxDBLookupComboBox10: TUniDBLookupComboBox
          Left = 509
          Top = 119
          Width = 128
          Height = 28
          ListFormat = 
            'opd_allergy_alert_type:opd_allergy_alert_type_name:opd_allergy_a' +
            'lert_type_id:N'
          ListField = 'opd_allergy_alert_type_name'
          KeyField = 'opd_allergy_alert_type_id'
          ListFieldIndex = 0
          DataField = 'opd_allergy_alert_type_id'
          DataSource = OPDAllergyDS
          TabOrder = 5
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox2: TUniDBLookupComboBox
          Left = 147
          Top = 154
          Width = 208
          Height = 28
          ListFormat = 'allergy_group:allergy_group_name:allergy_group_id:N'
          ListField = 'allergy_group_name'
          KeyField = 'allergy_group_id'
          ListFieldIndex = 0
          DataField = 'allergy_group_id'
          DataSource = OPDAllergyDS
          TabOrder = 6
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox3: TUniDBLookupComboBox
          Left = 147
          Top = 190
          Width = 491
          Height = 28
          ListFormat = 'allergy_relation:relation_name:allergy_relation_id:N'
          ListField = 'relation_name'
          KeyField = 'allergy_relation_id'
          ListFieldIndex = 0
          DataField = 'allergy_relation_id'
          DataSource = OPDAllergyDS
          TabOrder = 7
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox4: TUniDBLookupComboBox
          Left = 147
          Top = 226
          Width = 491
          Height = 28
          ListFormat = 'allergy_result:result_name:allergy_result_id:N'
          ListField = 'result_name'
          KeyField = 'allergy_result_id'
          ListFieldIndex = 0
          DataField = 'allergy_result_id'
          DataSource = OPDAllergyDS
          TabOrder = 8
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBComboBox2: TUniDBComboBox
          Left = 147
          Top = 262
          Width = 145
          Height = 28
          DataField = 'department'
          DataSource = OPDAllergyDS
          Items.Strings = (
            'OPD'
            'IPD')
          TabOrder = 9
          IconItems = <>
        end
        object cxDBLookupComboBox5: TUniDBLookupComboBox
          Left = 359
          Top = 262
          Width = 278
          Height = 28
          ListFormat = 'ward:name:ward:Y'
          ListField = 'name'
          KeyField = 'ward'
          ListFieldIndex = 0
          DataField = 'ward'
          DataSource = OPDAllergyDS
          TabOrder = 10
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox7: TUniDBLookupComboBox
          Left = 724
          Top = 554
          Width = 278
          Height = 28
          ListFormat = 'opduser:name:loginname:Y'
          ListField = 'name'
          KeyField = 'loginname'
          ListFieldIndex = 0
          DataField = 'reporter'
          DataSource = OPDAllergyDS
          TabOrder = 11
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox6: TUniDBLookupComboBox
          Left = 147
          Top = 296
          Width = 491
          Height = 28
          ListFormat = 'spclty:name:spclty:Y'
          ListField = 'name'
          KeyField = 'spclty'
          ListFieldIndex = 0
          DataField = 'spclty'
          DataSource = OPDAllergyDS
          TabOrder = 12
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox8: TUniDBLookupComboBox
          Left = 147
          Top = 330
          Width = 145
          Height = 28
          ListFormat = 'kskdepartment:department:depcode:Y'
          ListField = 'department'
          KeyField = 'depcode'
          ListFieldIndex = 0
          DataField = 'depcode'
          DataSource = OPDAllergyDS
          TabOrder = 13
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBLookupComboBox12: TUniDBLookupComboBox
          Left = 405
          Top = 330
          Width = 233
          Height = 28
          ListFormat = 
            'opd_allergy_report_type:opd_allergy_report_type_name:opd_allergy' +
            '_report_type_id:N'
          ListField = 'opd_allergy_report_type_name'
          KeyField = 'opd_allergy_report_type_id'
          ListFieldIndex = 0
          DataField = 'opd_allergy_report_type_id'
          DataSource = OPDAllergyDS
          TabOrder = 14
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBMemo1: TUniDBMemo
          Left = 147
          Top = 364
          Width = 491
          Height = 53
          DataField = 'note'
          DataSource = OPDAllergyDS
          TabOrder = 15
        end
        object cxDBLookupComboBox11: TUniDBLookupComboBox
          Left = 147
          Top = 424
          Width = 491
          Height = 28
          ListFormat = 
            'adr_consult_dialog:adr_consult_dialog_name:adr_consult_dialog_id' +
            ':N'
          ListField = 'adr_consult_dialog_name'
          KeyField = 'adr_consult_dialog_id'
          ListFieldIndex = 0
          DataField = 'adr_consult_dialog_id'
          DataSource = OPDAllergyDS
          TabOrder = 16
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBTextEdit9: TUniDBEdit
          Left = 912
          Top = 45
          Width = 248
          Height = 28
          DataField = 'agent_code24'
          DataSource = OPDAllergyDS
          TabOrder = 17
        end
        object cxButton3: TUniButton
          Left = 645
          Top = 424
          Width = 37
          Height = 30
          TabOrder = 18
        end
        object cxDBLookupComboBox9: TUniDBLookupComboBox
          Left = 843
          Top = 82
          Width = 318
          Height = 28
          ListFormat = 'naranjo_result:naranjo_result_name:naranjo_result_id:N'
          ListField = 'naranjo_result_name'
          KeyField = 'naranjo_result_id'
          ListFieldIndex = 0
          DataField = 'naranjo_result_id'
          DataSource = OPDAllergyDS
          TabOrder = 19
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxButton5: TUniButton
          Left = 843
          Top = 118
          Width = 234
          Height = 30
          Caption = #3649#3610#3610#3607#3604#3626#3629#3610' Naranjo '#39's algorithm'
          ParentFont = False
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 20
        end
        object cxDBCheckBox3: TUniDBCheckBox
          Left = 724
          Top = 160
          Width = 97
          Height = 17
          DataField = 'preventable'
          DataSource = OPDAllergyDS
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Preventable'
          ParentFont = False
          Font.Height = -13
          TabOrder = 21
          ParentColor = False
          Color = clBtnFace
        end
        object cxDBCurrencyEdit1: TUniDBNumberEdit
          Left = 842
          Top = 155
          Width = 55
          Height = 28
          DataField = 'adr_preventable_score'
          DataSource = OPDAllergyDS
          TabOrder = 22
          DecimalSeparator = '.'
        end
        object cxButton6: TUniButton
          Left = 915
          Top = 154
          Width = 236
          Height = 30
          Caption = #3649#3610#3610#3607#3604#3626#3629#3610' Preventibility'
          ParentFont = False
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 23
        end
        object cxDBCheckBox2: TUniDBCheckBox
          Left = 653
          Top = 11
          Width = 126
          Height = 17
          DataField = 'force_no_order'
          DataSource = OPDAllergyDS
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = #3627#3657#3634#3617#3626#3633#3656#3591#3651#3594#3657#3585#3633#3610#3612#3641#3657#3611#3656#3623#3618
          ParentFont = False
          Font.Height = -13
          TabOrder = 24
          ParentColor = False
          Color = clBtnFace
        end
        object cxDBCheckBox1: TUniDBCheckBox
          Left = 801
          Top = 11
          Width = 141
          Height = 17
          DataField = 'no_alert'
          DataSource = OPDAllergyDS
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = #3652#3617#3656#3605#3657#3629#3591#3648#3605#3639#3629#3609#3585#3634#3619#3649#3614#3657
          ParentFont = False
          Font.Height = -13
          TabOrder = 25
          ParentColor = False
          Color = clBtnFace
        end
        object cxDBLookupComboBox13: TUniDBLookupComboBox
          Left = 147
          Top = 460
          Width = 491
          Height = 28
          ListFormat = 
            'opd_allergy_symptom_type:opd_allergy_symtom_type_name:opd_allerg' +
            'y_symptom_type_id:N'
          ListField = 'opd_allergy_symtom_type_name'
          KeyField = 'opd_allergy_symptom_type_id'
          ListFieldIndex = 0
          DataField = 'opd_allergy_symtom_type_id'
          DataSource = OPDAllergyDS
          TabOrder = 26
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxDBCheckBox4: TUniDBCheckBox
          Left = 948
          Top = 11
          Width = 190
          Height = 17
          DataField = 'cross_group_check'
          DataSource = OPDAllergyDS
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = #3605#3619#3623#3592#3626#3629#3610#3585#3634#3619#3649#3614#3657#3618#3634#3586#3657#3634#3617#3585#3621#3640#3656#3617
          ParentFont = False
          Font.Height = -13
          TabOrder = 27
          ParentColor = False
          Color = clBtnFace
        end
        object cxGroupBox1: TUniGroupBox
          Left = 1017
          Top = 192
          Width = 354
          Height = 354
          Caption = #3594#3639#3656#3629#3618#3634#3651#3609#3585#3621#3640#3656#3617#3607#3637#3656#3626#3634#3617#3634#3619#3606#3605#3619#3623#3592#3626#3629#3610#3652#3604#3657
          TabOrder = 48
        end
        object cxButton1: TUniButton
          Left = 1163
          Top = 45
          Width = 67
          Height = 28
          Caption = #3588#3657#3609#3627#3634
          ParentFont = False
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 49
        end
        object cxLabel1: TUniLabel
          Left = 275
          Top = 121
          Width = 52
          Height = 13
          Caption = #3594#3609#3636#3604#3585#3634#3619#3649#3614#3657
          TabOrder = 52
        end
        object cxDBLookupComboBox14: TUniDBLookupComboBox
          Left = 352
          Top = 119
          Width = 90
          Height = 28
          ListFormat = 'opd_allergy_type:opd_allergy_type_name:opd_allergy_type_id:N'
          ListField = 'opd_allergy_type_name'
          KeyField = 'opd_allergy_type_id'
          ListFieldIndex = 0
          DataField = 'opd_allergy_type_id'
          DataSource = OPDAllergyDS
          TabOrder = 51
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object STDNameLabel: TUniLabel
          Left = 147
          Top = 496
          Width = 71
          Height = 13
          Caption = 'STDNameLabel'
          TabOrder = 53
        end
        object cxLabel2: TUniLabel
          Left = 362
          Top = 155
          Width = 54
          Height = 13
          Caption = #3649#3627#3621#3656#3591#3586#3657#3629#3617#3641#3621
          TabOrder = 55
        end
        object cxDBLookupComboBox15: TUniDBLookupComboBox
          Left = 445
          Top = 154
          Width = 193
          Height = 28
          ListFormat = 
            'opd_allergy_source:opd_allergy_source_name:opd_allergy_source_id' +
            ':N'
          ListField = 'opd_allergy_source_name'
          KeyField = 'opd_allergy_source_id'
          ListFieldIndex = 0
          DataField = 'opd_allergy_source_id'
          DataSource = OPDAllergyDS
          TabOrder = 54
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
        end
        object cxLabel3: TUniLabel
          Left = 1019
          Top = 554
          Width = 252
          Height = 13
          Caption = #3585#3634#3619#3648#3621#3639#3629#3585#3626#3633#3656#3591#3592#3656#3634#3618#3652#3604#3657' '#3592#3632#3607#3635#3651#3627#3657#3612#3641#3657#3626#3633#3656#3591#3652#3617#3656#3605#3657#3629#3591#3619#3632#3610#3640#3648#3627#3605#3640#3612#3621#3585#3634#3619#3626#3633#3656#3591
          TabOrder = 56
        end
        object cxLabel4: TUniLabel
          Left = 67
          Top = 522
          Width = 48
          Height = 13
          Caption = #3612#3641#3657#3651#3627#3657#3610#3619#3636#3585#3634#3619
          TabOrder = 59
        end
        object cxDBLookupComboBox16: TUniDBLookupComboBox
          Left = 147
          Top = 521
          Width = 491
          Height = 28
          ListFormat = 'doctor:name:code:Y'
          ListField = 'name'
          KeyField = 'code'
          ListFieldIndex = 0
          DataField = 'doctor_code'
          DataSource = OPDAllergyDS
          TabOrder = 57
          Color = clWindow
          RemoteQuery = True
          RemoteQueryCache = False
          Style = csDropDown
        end
        object cxGroupBox2: TUniGroupBox
          Left = 724
          Top = 192
          Width = 281
          Height = 358
          Caption = #3585#3634#3619#3605#3619#3623#3592#3626#3629#3610#3586#3657#3634#3617#3585#3621#3640#3656#3617
          TabOrder = 58
        end
        object cxLabel5: TUniLabel
          Left = 97
          Top = 555
          Width = 26
          Height = 13
          Caption = #3586#3609#3634#3604
          TabOrder = 61
        end
        object cxDBMemo2: TUniDBMemo
          Left = 147
          Top = 557
          Width = 491
          Height = 70
          DataField = 'dosage_text'
          DataSource = OPDAllergyDS
          ScrollBars = ssVertical
          TabOrder = 60
        end
        object cxLabel6: TUniLabel
          Left = 101
          Top = 630
          Width = 23
          Height = 13
          Caption = #3623#3636#3608#3637#3651#3594#3657
          TabOrder = 63
        end
        object cxDBMemo3: TUniDBMemo
          Left = 147
          Top = 634
          Width = 491
          Height = 70
          DataField = 'usage_text'
          DataSource = OPDAllergyDS
          ScrollBars = ssVertical
          TabOrder = 62
        end
        object cxLabel7: TUniLabel
          Left = 105
          Top = 709
          Width = 17
          Height = 13
          Caption = 'Lab'
          TabOrder = 66
        end
        object cxDBMemo4: TUniDBMemo
          Left = 147
          Top = 710
          Width = 491
          Height = 70
          DataField = 'lab_text'
          DataSource = OPDAllergyDS
          ScrollBars = ssVertical
          TabOrder = 64
        end
        object cxButton4: TUniButton
          Left = 602
          Top = 82
          Width = 37
          Height = 29
          Caption = 'Find'
          TabOrder = 65
        end
      end
    end
    object UniTabSheet2: TUniTabSheet
      Caption = #3619#3641#3611#3585#3634#3619#3649#3614#3657#3618#3634
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
    end
  end
  object OPDAllergyCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from opd_allergy'#13#10
    Params = <>
    BeforePost = OPDAllergyCDSBeforePost
    OnNewRecord = OPDAllergyCDSNewRecord
    Left = 584
    Top = 7
  end
  object OPDAllergyDS: TDataSource
    DataSet = OPDAllergyCDS
    Left = 684
    Top = 6
  end
  object AllergyResultCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 8
    Data = {
      C00000009619E0BD010000001800000002000500000003000000540011616C6C
      657267795F726573756C745F696404000100000000000B726573756C745F6E61
      6D65010049000000010005574944544802000200FA0000000000010000000BCB
      D2C2E0BBE7B9BBA1B5D400000200000013CBD2C2E2B4C2C1D5C3E8CDA7C3CDC2
      E0B4D4C10000030000000EC2D1A7C1D5CDD2A1D2C3CDC2D9E800000400000009
      E0CAD5C2AAD5C7D4B500000500000014E4C1E8CAD2C1D2C3B6B5D4B4B5D2C1BC
      C5E4B4E9}
  end
  object AllergyResultDS: TDataSource
    DataSet = AllergyResultCDS
    Left = 280
    Top = 8
  end
  object SeriousCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 694
    Top = 74
    Data = {
      CF0000009619E0BD01000000180000000200040000000300000055000E736572
      696F75736E6573735F696404000100000000000F7365696F75736E6573735F6E
      616D65010049000000010005574944544802000200FA0000000000010000000A
      E4C1E8C3E9D2C2E1C3A700000200000013C3E9D2C2E1C3A7202D20E0CAD5C2AA
      D5C7D4B500000300000019C3E9D2C2E1C3A7202D20CDD1B9B5C3D2C2B6D6A7AA
      D5C7D4B500000400000028C3E9D2C2E1C3A7202D20B5E9CDA7E0A2E9D2C3D1BA
      A1D2C3C3D1A1C9D2E3B9E2C3A7BEC2D2BAD2C5}
  end
  object SeriousDS: TDataSource
    DataSet = SeriousCDS
    Left = 762
    Top = 72
  end
  object NaranjoResultCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 572
    Top = 61
    Data = {
      290100009619E0BD010000001800000004000400000003000000A800116E6172
      616E6A6F5F726573756C745F696404000100000001000950524F56464C414753
      0400018007000000136E6172616E6A6F5F726573756C745F6E616D6501004900
      00000100055749445448020002009600096D696E5F73636F7265040001000000
      0000096D61785F73636F7265040001000000000001000B5052494D4152595F4B
      45590200820001000000010000000100000011446566696E697465202D20E3AA
      E8E1B9E809000000E70300000000020000000E50726F6261626C65202D20E3AA
      E8050000000800000000000300000013506F737369626C65202D20CDD2A8A8D0
      E3AAE8010000000400000000000400000013446F75627466756C202D20B9E8D2
      CAA7CAD1C219FCFFFF00000000}
  end
  object NaranjoResultDS: TDataSource
    DataSet = NaranjoResultCDS
    Left = 630
    Top = 70
  end
  object AllergyGroupCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 789
    Top = 7
    Data = {
      A20000009619E0BD0100000018000000020002000000030000005A0010616C6C
      657267795F67726F75705F6964040001000000000012616C6C657267795F6772
      6F75705F6E616D65010049000000010005574944544802000200FA0000000000
      010000001743617264696F76617363756C6172206469616F7264657200000200
      000023426C6F6F6420616E64206C796D7068617469632073797374656D206469
      736F72646572}
  end
  object AllergyGroupDS: TDataSource
    DataSet = AllergyGroupCDS
    Left = 896
    Top = 12
  end
  object PharmacologyGroupCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select * from pharmacology_group order by pharmacology_group_nam' +
      'e limit 0'#13#10
    Params = <>
    Left = 370
    Top = 8
    Data = {
      300100009619E0BD010000001800000003000000000003000000300115706861
      726D61636F6C6F67795F67726F75705F69640400010000000100064F52494749
      4E020049802900706861726D61636F6C6F67795F67726F75702E706861726D61
      636F6C6F67795F67726F75705F69640017706861726D61636F6C6F67795F6772
      6F75705F6E616D650100490000000200055749445448020002009600064F5249
      47494E020049802B00706861726D61636F6C6F67795F67726F75702E70686172
      6D61636F6C6F67795F67726F75705F6E616D6500076F75746C696E6501004900
      00000200055749445448020002000F00064F524947494E020049801B00706861
      726D61636F6C6F67795F67726F75702E6F75746C696E650001000D4445464155
      4C545F4F52444552040082000100000002000000}
  end
  object PharmacologyGroupDS: TDataSource
    DataSet = PharmacologyGroupCDS
    Left = 483
    Top = 15
  end
  object OpdAllergyAlertTypeCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 402
    Top = 47
    Data = {
      B80000009619E0BD0100000018000000020002000000030000009400196F7064
      5F616C6C657267795F616C6572745F747970655F696404000100000001000950
      524F56464C41475304000180070000001B6F70645F616C6C657267795F616C65
      72745F747970655F6E616D650100490000000100055749445448020002009600
      01000B5052494D4152595F4B45590200820001000000010000000100000005E1
      BEE9C2D200000200000011E0BDE9D2C3D0C7D1A7A1D2C3E3AAE9C2D2}
  end
  object OpdAllergyAlertTypeDS: TDataSource
    DataSet = OpdAllergyAlertTypeCDS
    Left = 477
    Top = 56
  end
  object OPDAllergyTypeCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from opd_allergy_type limit 0'#13#10
    Params = <>
    Left = 239
    Top = 82
    Data = {
      C60000009619E0BD010000001800000002000000000003000000C600136F7064
      5F616C6C657267795F747970655F69640400010000000100064F524947494E02
      00498025006F70645F616C6C657267795F747970652E6F70645F616C6C657267
      795F747970655F696400156F70645F616C6C657267795F747970655F6E616D65
      010049000000020005574944544802000200C800064F524947494E0200498027
      006F70645F616C6C657267795F747970652E6F70645F616C6C657267795F7479
      70655F6E616D65000000}
  end
  object OPDAllergyTypeDS: TDataSource
    DataSet = OPDAllergyTypeCDS
    Left = 315
    Top = 52
  end
  object AdrConsultDialogCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 694
    Top = 136
    Data = {
      FA0000009619E0BD010000001800000002000000000003000000FA0015616472
      5F636F6E73756C745F6469616C6F675F696404000100000002000950524F5646
      4C4147530400018007000000064F524947494E0200498029006164725F636F6E
      73756C745F6469616C6F672E6164725F636F6E73756C745F6469616C6F675F69
      6400176164725F636F6E73756C745F6469616C6F675F6E616D65010049000000
      020005574944544802000200FA00064F524947494E020049802B006164725F63
      6F6E73756C745F6469616C6F672E6164725F636F6E73756C745F6469616C6F67
      5F6E616D650001000B5052494D4152595F4B455902008200010000000100}
  end
  object AdrConsultDialogDS: TDataSource
    DataSet = AdrConsultDialogCDS
    Left = 762
    Top = 121
  end
  object OPDAllergyPCGroupCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = '  select * from opd_allergy_pc_group'#13#10
    Params = <>
    Left = 502
    Top = 147
    Data = {
      780100009619E0BD0100000018000000040000000000030000007801176F7064
      5F616C6C657267795F70635F67726F75705F69640400010000000100064F5249
      47494E020049802D006F70645F616C6C657267795F70635F67726F75702E6F70
      645F616C6C657267795F70635F67726F75705F6964000E6F70645F616C6C6572
      67795F69640400010000000100064F524947494E0200498024006F70645F616C
      6C657267795F70635F67726F75702E6F70645F616C6C657267795F6964001570
      6861726D61636F6C6F67795F67726F75705F69640400010000000100064F5249
      47494E020049802B006F70645F616C6C657267795F70635F67726F75702E7068
      61726D61636F6C6F67795F67726F75705F6964000B63726F73735F636865636B
      01004900000003000753554254595045020049000A0046697865644368617200
      055749445448020002000100064F524947494E0200498021006F70645F616C6C
      657267795F70635F67726F75702E63726F73735F636865636B000000}
  end
  object OPDAllergyPCGroupDS: TDataSource
    DataSet = OPDAllergyPCGroupCDS
    Left = 611
    Top = 167
  end
  object OPDAllergySymptomTypeCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from opd_allergy_symptom_type  limit 0'#13#10
    Params = <>
    Left = 878
    Top = 195
    Data = {
      C20100009619E0BD010000001800000004000000000003000000C2011B6F7064
      5F616C6C657267795F73796D70746F6D5F747970655F69640400010000000200
      0950524F56464C4147530400018007000000064F524947494E0200498035006F
      70645F616C6C657267795F73796D70746F6D5F747970652E6F70645F616C6C65
      7267795F73796D70746F6D5F747970655F6964001C6F70645F616C6C65726779
      5F73796D746F6D5F747970655F6E616D65010049000000020005574944544802
      000200C800064F524947494E0200498036006F70645F616C6C657267795F7379
      6D70746F6D5F747970652E6F70645F616C6C657267795F73796D746F6D5F7479
      70655F6E616D65001270726F7669735F6578706F72745F636F64650100490000
      000200055749445448020002000300064F524947494E020049802C006F70645F
      616C6C657267795F73796D70746F6D5F747970652E70726F7669735F6578706F
      72745F636F646500056963643130010049000000020005574944544802000200
      0A00064F524947494E020049801F006F70645F616C6C657267795F73796D7074
      6F6D5F747970652E69636431300001000B5052494D4152595F4B455902008200
      010000000100}
  end
  object OPDAllergySymptomTypeDS: TDataSource
    DataSet = OPDAllergySymptomTypeCDS
    Left = 941
    Top = 198
  end
  object OPDAllergyReportTypeCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 299
    Top = 163
    Data = {
      B70100009619E0BD0100000018000000020004000000030000005B011A6F7064
      5F616C6C657267795F7265706F72745F747970655F6964040001000000020009
      50524F56464C4147530400018007000000064F524947494E0200498033006F70
      645F616C6C657267795F7265706F72745F747970652E6F70645F616C6C657267
      795F7265706F72745F747970655F6964001C6F70645F616C6C657267795F7265
      706F72745F747970655F6E616D65010049000000020005574944544802000200
      C800064F524947494E0200498035006F70645F616C6C657267795F7265706F72
      745F747970652E6F70645F616C6C657267795F7265706F72745F747970655F6E
      616D650002000A4348414E47455F4C4F47040082000C00000001000000000000
      0004000000020000000000000004000000030000000000000004000000040000
      0000000000040000000B5052494D4152595F4B45590200820001000000010004
      00010000001C53706F6E74616E656F7573207265706F7274696E672073797374
      656D0400020000000D5472696767657220746F6F6C7304000300000009496E74
      656E736976650400040000000E4372696E6963616C20747269616C}
  end
  object OPDAllergyReportTypeDS: TDataSource
    DataSet = OPDAllergyReportTypeCDS
    Left = 396
    Top = 156
  end
  object AllergyRelationCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 875
    Top = 125
    Data = {
      B20000009619E0BD010000001800000002000600000003000000580013616C6C
      657267795F72656C6174696F6E5F696404000100000000000D72656C6174696F
      6E5F6E616D65010049000000010005574944544802000200FA00000000000100
      0000074365727461696E0000020000000850726F6261626C6500000300000008
      506F737369626C6500000400000008556E6C696B656C790000050000000C556E
      636C61737369666C656400000600000005CDD7E8B9E6}
  end
  object AllergyRelationDS: TDataSource
    DataSet = AllergyRelationCDS
    Left = 980
    Top = 122
  end
  object OPDAllergySourceCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from opd_allergy_source  limit 0'#13#10
    Params = <>
    Left = 836
    Top = 69
    Data = {
      D20000009619E0BD010000001800000002000000000003000000D200156F7064
      5F616C6C657267795F736F757263655F69640400010000000100064F52494749
      4E0200498029006F70645F616C6C657267795F736F757263652E6F70645F616C
      6C657267795F736F757263655F696400176F70645F616C6C657267795F736F75
      7263655F6E616D65010049000000020005574944544802000200C800064F5249
      47494E020049802B006F70645F616C6C657267795F736F757263652E6F70645F
      616C6C657267795F736F757263655F6E616D65000000}
  end
  object OPDAllergySourceDS: TDataSource
    DataSet = OPDAllergySourceCDS
    Left = 918
    Top = 66
  end
  object OPDAllergyCrossChkCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from opd_allergy_cross_chk'#13#10
    Params = <>
    Left = 1009
    Top = 17
    Data = {
      AD0100009619E0BD010000001800000005000000000003000000AD01186F7064
      5F616C6C657267795F63726F73735F63686B5F69640400010000000100064F52
      4947494E020049802F006F70645F616C6C657267795F63726F73735F63686B2E
      6F70645F616C6C657267795F63726F73735F63686B5F69640002686E01004900
      00000200055749445448020002000900064F524947494E0200498019006F7064
      5F616C6C657267795F63726F73735F63686B2E686E00056167656E7401004900
      0000020005574944544802000200FA00064F524947494E020049801C006F7064
      5F616C6C657267795F63726F73735F63686B2E6167656E74000B63726F73735F
      6167656E74010049000000020005574944544802000200FA00064F524947494E
      0200498022006F70645F616C6C657267795F63726F73735F63686B2E63726F73
      735F6167656E74000B616C6C6F775F6F72646572010049000000030007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      064F524947494E0200498022006F70645F616C6C657267795F63726F73735F63
      686B2E616C6C6F775F6F72646572000000}
  end
  object OPDAllergyCrossChkDS: TDataSource
    DataSet = OPDAllergyCrossChkCDS
    Left = 1060
    Top = 53
  end
  object ATCCodeCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select atc_code,atc_level_name from atc_code where atc_level = 7' +
      ' order by atc_level_name limit 10'#13#10
    Params = <>
    Left = 684
    Top = 321
    Data = {
      D20100009619E0BD010000001800000002000A00000003000000B80008617463
      5F636F64650100490000000200055749445448020002000F00064F524947494E
      0200498012006174635F636F64652E6174635F636F6465000E6174635F6C6576
      656C5F6E616D65010049000000020005574944544802000200C800064F524947
      494E0200498018006174635F636F64652E6174635F6C6576656C5F6E616D6500
      01000D44454641554C545F4F5244455204008200010000000200000000000741
      3033414231363328322D62656E7A68796472796C6F7879657468796C29646965
      7468796C2D6D657468796C616D6D6F6E69756D20696F64696465000007443031
      414530361A322D28342D63686C6F727068656E6F7879292D657468616E6F6C00
      00074A30344141303115342D616D696E6F73616C6963796C6963206163696400
      00075630334142323715342D64696D657468796C616D696E6F7068656E6F6C00
      00074A3035414630360861626163617669720000074C30324258303108616261
      72656C69780000074C3034414132340961626174616365707400000742303141
      433133096162636978696D61620000074C3031584535300B6162656D61636963
      6C69620000074C3034414132320861626574696D7573}
  end
  object ATCCodeDS: TDataSource
    DataSet = ATCCodeCDS
    Left = 776
    Top = 321
  end
  object UniImageList1: TUniImageList
    Left = 880
    Top = 400
    Bitmap = {
      494C0101030008001C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00002525252662656180667863B355964CE655964CE6667863B3626561802525
      2526000000000000000000000000000000000000000000000000000000000000
      000025252526636267806A6780B36157B0E66157B0E66A6780B3636267802525
      2526000000000000000000000000000000000000000000000000000000006364
      6985536AD6F9516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF536A
      D6F9636468840000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000015B5D
      5B704CA940F647B538FF47B538FF47B538FF47B538FF47B538FF47B538FF4CA9
      40F65B5D5B700000000100000000000000000000000000000000000000015B5B
      5D705E50CAF65C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5E50
      CAF65B5B5D70000000010000000000000000000000000000000000000000536A
      D6F9516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF546AD6F80000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001667A63B547B5
      38FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B5
      38FF47B538FF667A63B5000000010000000000000000000000016A6782B55C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6A6782B50000000100000000000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005B5D5B7047B538FF47B5
      38FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B5
      38FF47B538FF47B538FF5B5D5B7000000000000000005B5B5D705C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5B5B5D7000000000000000000000000000000000516B
      E7FF516BE7FF516BE7FF6A84EBFF516BE7FF516BE7FF6781EAFF556EE8FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000252525264CA940F647B538FF47B5
      38FF47B538FF47B538FF68BE56FF4BB63CFF47B538FF47B538FF47B538FF47B5
      38FF47B538FF47B538FF4CA940F625252526252525265E50CAF65C4CE0FF5C4C
      E0FF6454E1FFB4ACF0FF6152E1FF5C4CE0FF5C4CE0FF6152E1FFB4ACF0FF6454
      E1FF5C4CE0FF5C4CE0FF5E50CAF625252526000000000000000000000000516B
      E7FF516BE7FF516BE7FFE3E7FBFFA2B1F2FF7C92EDFFF0F2FDFF6781EAFF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006265618047B538FF47B538FF47B5
      38FF47B538FF74C161FFEEDFCFFFC0D4A5FF4BB63CFF47B538FF47B538FF47B5
      38FF47B538FF47B538FF47B538FF6164607F636267805C4CE0FF5C4CE0FF5C4C
      E0FFB4ACF0FFFFFFFFFFD2CEF6FF6152E1FF6152E1FFD2CEF6FFFFFFFFFFB4AC
      F0FF5C4CE0FF5C4CE0FF5C4CE0FF6261667F000000000000000000000000516B
      E7FF516BE7FF516BE7FF627AE9FFE8ECFCFFF6F7FEFF7C92EDFF516BE7FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000667863B347B538FF47B538FF47B5
      38FF76C162FFEEDFCFFFF4E1D4FFF4E1D4FFC0D4A5FF4BB63CFF47B538FF47B5
      38FF47B538FF47B538FF47B538FF667863B36A6780B35C4CE0FF5C4CE0FF5C4C
      E0FF6152E1FFD2CEF6FFFFFFFFFFD4D0F7FFD3D0F6FFFFFFFFFFD2CEF6FF6152
      E1FF5C4CE0FF5C4CE0FF5C4CE0FF6A6780B3000000000000000000000000516B
      E7FF516BE7FF516BE7FF7C92EDFFF0F2FDFFE8ECFCFFA2B1F2FF516BE7FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000055964CE647B538FF47B538FF66BD
      54FFEFE0CFFFF2E0D2FF8FC776FFCFD8B3FFF4E1D4FFC0D4A5FF4BB63CFF47B5
      38FF47B538FF47B538FF47B538FF55964CE66157B0E65C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6152E1FFD4D0F7FFFFFFFFFFFFFFFFFFD3D0F6FF6152E1FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF6157B0E6000000000000000000000000516B
      E7FF516BE7FF516BE7FFE4E8FBFF7C92EDFF627AE9FFE3E7FBFF6A84EBFF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000055964CE647B538FF47B538FF48B5
      39FFAECF95FF87C56FFF47B538FF51B841FFCFD8B3FFF4E1D4FFC0D4A5FF4BB6
      3CFF47B538FF47B538FF47B538FF55964CE66157B0E65C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6152E1FFD3D0F6FFFFFFFFFFFFFFFFFFD4D0F7FF6152E1FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF6157B0E6000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000667864B247B538FF47B538FF47B5
      38FF47B538FF47B538FF47B538FF47B538FF51B841FFCFD8B3FFF4E1D4FFC0D4
      A5FF4BB63CFF47B538FF47B538FF667863B36A6780B35C4CE0FF5C4CE0FF5C4C
      E0FF6152E1FFD2CEF6FFFFFFFFFFD3D0F6FFD4D0F7FFFFFFFFFFD2CEF6FF6152
      E1FF5C4CE0FF5C4CE0FF5C4CE0FF6A6780B3000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006064607E47B538FF47B538FF47B5
      38FF47B538FF47B538FF47B538FF47B538FF47B538FF51B841FFCFD8B3FFE9DE
      CAFF62BC51FF47B538FF47B538FF6164607F636267805C4CE0FF5C4CE0FF5C4C
      E0FFB4ACF0FFFFFFFFFFD2CEF6FF6152E1FF6152E1FFD2CEF6FFFFFFFFFFB4AC
      F0FF5C4CE0FF5C4CE0FF5C4CE0FF6261667F000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000232323244CA940F647B538FF47B5
      38FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF51B841FF63BC
      51FF47B538FF47B538FF4CA940F625252526252525265E50CAF65C4CE0FF5C4C
      E0FF6454E1FFB4ACF0FF6152E1FF5C4CE0FF5C4CE0FF6152E1FFB4ACF0FF6454
      E1FF5C4CE0FF5C4CE0FF5E50CAF62525252600000000000000009E9574FF9E95
      74FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E95
      74FF9E9574FF9E9574FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005C5E5C7247B538FF47B5
      38FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B5
      38FF47B538FF47B538FF5B5D5B7000000000000000005B5B5D705C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5B5B5D700000000000000000000000009E9574FF9E95
      74FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E95
      74FF9E9574FF9E9574FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010102657C61BB47B5
      38FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B538FF47B5
      38FF47B538FF667A63B5000000010000000000000000000000016A6782B55C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6A6782B5000000010000000000000000000000007A776FC59E95
      74FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E95
      74FF9E9574FF79766FC300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010101025E60
      5D764BAA3EF847B538FF47B538FF47B538FF47B538FF47B538FF47B538FF4CA9
      40F65B5D5B700000000100000000000000000000000000000000000000015B5B
      5D705E50CAF65C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5E50
      CAF65B5B5D700000000100000000000000000000000000000000000000000000
      000000000000000000008C805FFF00000000000000008C805FFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002828282A62656181667963B454974AE755964CE6667863B3626561802525
      2526000000000000000000000000000000000000000000000000000000000000
      000025252526636267806A6780B36157B0E66157B0E66A6780B3636267802525
      2526000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C805FFF8C805FFF8C805FFF8C805FFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F00FF00FE0070000C003C003E0070000
      80018001E007000080018001E007000000000000E007000000000000E0070000
      00000000E007000000000000E007000000000000E007000000000000E0070000
      00000000E007000000000000C003000080018001C003000080018001C0030000
      C003C003FDBF0000F00FF00FFC3F000000000000000000000000000000000000
      000000000000}
  end
end
