object PatientVisitEntryFrame: TPatientVisitEntryFrame
  Left = 0
  Top = 0
  Width = 1443
  Height = 805
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  OnReady = UniFrameReady
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  AutoScroll = True
  object UniSimplePanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1443
    Height = 65
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameRaised
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 14
      Top = 12
      Width = 117
      Height = 23
      Caption = #3626#3656#3591#3605#3619#3623#3592#3612#3641#3657#3611#3656#3623#3618
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-2'
    end
    object UniLabel2: TUniLabel
      Left = 185
      Top = 19
      Width = 24
      Height = 19
      Caption = 'HN'
      ParentFont = False
      Font.Color = clYellow
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object HNEdit: TUniEdit
      Left = 220
      Top = 15
      Width = 118
      Height = 28
      Alignment = taCenter
      ParentFont = False
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 3
      OnChange = HNEditChange
      OnKeyUp = HNEditKeyUp
    end
    object HNSearchButton: TUniButton
      Left = 339
      Top = 15
      Width = 68
      Height = 28
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 4
      Images = UniImageList1
      ImageIndex = 8
      OnClick = HNSearchButtonClick
    end
    object UniLabel14: TUniLabel
      Left = 416
      Top = 19
      Width = 32
      Height = 19
      Caption = #3623#3633#3609#3607#3637#3656
      ParentFont = False
      Font.Color = clYellow
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 5
    end
    object VisitDateEdit: TUniDateTimePicker
      Left = 457
      Top = 15
      Width = 120
      Height = 28
      DateTime = 43873.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 6
    end
    object UniLabel15: TUniLabel
      Left = 583
      Top = 18
      Width = 33
      Height = 19
      Caption = #3648#3623#3621#3634
      ParentFont = False
      Font.Color = clYellow
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 7
    end
    object VisitTimeEdit: TUniEdit
      Left = 620
      Top = 15
      Width = 69
      Height = 28
      Alignment = taCenter
      TabOrder = 8
      InputMask.Mask = '99:99'
    end
    object NewVisitButton: TUniButton
      Left = 751
      Top = 15
      Width = 105
      Height = 27
      Caption = #3626#3656#3591#3605#3619#3623#3592#3651#3627#3617#3656
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 9
      Images = UniImageList1
      ImageIndex = 6
      OnClick = NewVisitButtonClick
    end
    object UniButton2: TUniButton
      Left = 860
      Top = 15
      Width = 135
      Height = 27
      Caption = #3649#3585#3657#3652#3586#3585#3634#3619#3626#3656#3591#3605#3619#3623#3592
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 10
      Images = UniImageList1
      ImageIndex = 3
      OnClick = UniButton2Click
    end
    object LockTimeCheckBox: TUniCheckBox
      Left = 620
      Top = 45
      Width = 56
      Height = 17
      Caption = 'Lock'
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -13
      TabOrder = 11
    end
    object SaveButton: TUniButton
      Left = 1001
      Top = 15
      Width = 89
      Height = 27
      Caption = #3610#3633#3609#3607#3638#3585
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 12
      Images = UniImageList1
      ImageIndex = 5
      OnClick = SaveButtonClick
    end
    object CloseAfterSaveCheck: TUniCheckBox
      Left = 220
      Top = 45
      Width = 142
      Height = 17
      Checked = True
      Caption = #3611#3636#3604#3627#3621#3633#3591#3592#3634#3585#3610#3633#3609#3607#3638#3585
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -13
      TabOrder = 13
      OnChange = CloseAfterSaveCheckChange
    end
    object UniButton1: TUniButton
      Left = 1096
      Top = 15
      Width = 89
      Height = 27
      Caption = #3611#3636#3604
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 14
      Images = UniImageList1
      ImageIndex = 1
      OnClick = UniButton1Click
    end
    object AutoShowTemplateSelectCheck: TUniCheckBox
      Left = 16
      Top = 44
      Width = 193
      Height = 17
      Caption = #3649#3626#3604#3591#3627#3609#3657#3634#3592#3629#3648#3621#3639#3629#3585' Template'
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -13
      TabOrder = 15
      OnChange = AutoShowTemplateSelectCheckChange
    end
    object MophReferCheckBox: TUniCheckBox
      Left = 368
      Top = 45
      Width = 142
      Height = 17
      Caption = 'MOPH Refer'
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -13
      TabOrder = 16
      OnChange = MophReferCheckBoxChange
    end
  end
  object PatientInfoGroupBox: TUniGroupBox
    Left = 0
    Top = 65
    Width = 1443
    Height = 211
    Caption = #3586#3657#3629#3617#3641#3621#3612#3641#3657#3611#3656#3623#3618
    Align = alTop
    TabOrder = 1
  end
  object VisitGroupBox: TUniGroupBox
    Left = 0
    Top = 276
    Width = 1443
    Height = 529
    Caption = #3629#3634#3585#3634#3619#3626#3635#3588#3633#3597'/'#3585#3634#3619#3626#3656#3591#3605#3656#3629
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 1504
    ExplicitHeight = 357
    object UniLabel3: TUniLabel
      Left = 36
      Top = 38
      Width = 38
      Height = 19
      Alignment = taRightJustify
      Caption = #3649#3612#3609#3585
      TabOrder = 1
    end
    object UniDBEdit1: TUniDBEdit
      Left = 84
      Top = 34
      Width = 51
      Height = 28
      DataField = 'spclty'
      DataSource = OvstDS
      TabOrder = 2
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 141
      Top = 34
      Width = 283
      Height = 28
      ListFormat = 'spclty:name:spclty:Y'
      ListField = 'name'
      KeyField = 'spclty'
      ListFieldIndex = 0
      DataField = 'spclty'
      DataSource = OvstDS
      AnyMatch = True
      TabOrder = 3
      Color = clWindow
      RemoteQuery = True
      LayoutConfig.Cls = 'visit-entry-spclty-combobox'
      Style = csDropDown
    end
    object UniLabel4: TUniLabel
      Left = 485
      Top = 38
      Width = 36
      Height = 19
      Alignment = taRightJustify
      Caption = #3626#3634#3586#3634
      TabOrder = 4
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 530
      Top = 34
      Width = 308
      Height = 28
      ListFormat = 'sub_spclty:sub_spclty_name:sub_spclty_id:N'
      ListField = 'sub_spclty_name'
      KeyField = 'sub_spclty_id'
      ListFieldIndex = 0
      DataField = 'sub_spclty_id'
      DataSource = OvstSEQDS
      TabOrder = 5
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel5: TUniLabel
      Left = 2
      Top = 72
      Width = 132
      Height = 19
      Alignment = taRightJustify
      Caption = #3629#3634#3585#3634#3619#3626#3635#3588#3633#3597'/'#3626#3634#3648#3627#3605#3640
      TabOrder = 6
    end
    object UniLabel6: TUniLabel
      Left = 437
      Top = 72
      Width = 87
      Height = 19
      Alignment = taRightJustify
      Caption = #3611#3619#3632#3648#3616#3607#3612#3641#3657#3611#3656#3623#3618
      TabOrder = 7
    end
    object UniDBLookupComboBox4: TUniDBLookupComboBox
      Left = 530
      Top = 68
      Width = 308
      Height = 28
      ListFormat = 'er_pt_type:name:er_pt_type:N'
      ListField = 'name'
      KeyField = 'er_pt_type'
      ListFieldIndex = 0
      DataField = 'er_pt_type'
      DataSource = OvstSEQDS
      AnyMatch = True
      TabOrder = 8
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel7: TUniLabel
      Left = 43
      Top = 106
      Width = 92
      Height = 19
      Alignment = taRightJustify
      Caption = #3611#3619#3632#3648#3616#3607#3585#3634#3619#3617#3634
      TabOrder = 9
    end
    object UniDBLookupComboBox5: TUniDBLookupComboBox
      Left = 141
      Top = 102
      Width = 283
      Height = 28
      ListFormat = 'ovstist:name:ovstist:Y'
      ListField = 'name'
      KeyField = 'ovstist'
      ListFieldIndex = 0
      DataField = 'ovstist'
      DataSource = OvstDS
      AnyMatch = True
      TabOrder = 10
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniDBLookupComboBox6: TUniDBLookupComboBox
      Left = 530
      Top = 102
      Width = 130
      Height = 28
      ListFormat = 'pt_priority:name:id:N'
      ListField = 'name'
      KeyField = 'id'
      ListFieldIndex = 0
      DataField = 'pt_priority'
      DataSource = OvstDS
      TabOrder = 11
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel8: TUniLabel
      Left = 438
      Top = 106
      Width = 84
      Height = 19
      Alignment = taRightJustify
      Caption = #3588#3623#3634#3617#3648#3619#3656#3591#3604#3656#3623#3609
      TabOrder = 12
    end
    object UniDBLookupComboBox7: TUniDBLookupComboBox
      Left = 720
      Top = 102
      Width = 118
      Height = 28
      ListFormat = 'pt_walk:name:walk_id:N'
      ListField = 'name'
      KeyField = 'walk_id'
      ListFieldIndex = 0
      DataField = 'walk_id'
      DataSource = OPDScreenDS
      TabOrder = 13
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel9: TUniLabel
      Left = 673
      Top = 106
      Width = 39
      Height = 19
      Caption = #3626#3616#3634#3614
      TabOrder = 14
    end
    object UniLabel10: TUniLabel
      Left = 43
      Top = 140
      Width = 95
      Height = 19
      Alignment = taRightJustify
      Caption = #3626#3656#3591#3605#3656#3629#3652#3611#3607#3637#3656#3627#3657#3629#3591
      TabOrder = 15
    end
    object UniDBLookupComboBox8: TUniDBLookupComboBox
      Left = 194
      Top = 136
      Width = 466
      Height = 28
      ListFormat = 'kskdepartment:department:depcode:Y:depcode_active='#39'Y'#39
      ListField = 'department'
      KeyField = 'depcode'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'cur_dep'
      DataSource = OvstDS
      TabOrder = 16
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox8GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox8RemoteQuery
    end
    object UniDBEdit2: TUniDBEdit
      Left = 141
      Top = 136
      Width = 51
      Height = 28
      DataField = 'cur_dep'
      DataSource = OvstDS
      TabOrder = 17
    end
    object UniButton3: TUniButton
      Left = 666
      Top = 136
      Width = 75
      Height = 25
      Caption = #3648#3621#3639#3629#3585#3627#3657#3629#3591
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 18
    end
    object UniButton4: TUniButton
      Left = 747
      Top = 136
      Width = 91
      Height = 25
      Caption = #3627#3621#3634#3618#3627#3657#3629#3591
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 19
    end
    object UniLabel11: TUniLabel
      Left = 60
      Top = 174
      Width = 74
      Height = 19
      Alignment = taRightJustify
      Caption = #3648#3623#3621#3634#3607#3635#3585#3634#3619
      TabOrder = 20
    end
    object UniDBLookupComboBox9: TUniDBLookupComboBox
      Left = 141
      Top = 170
      Width = 283
      Height = 28
      ListFormat = 'visit_type:visit_type_name:visit_type:Y'
      ListField = 'visit_type_name'
      KeyField = 'visit_type'
      ListFieldIndex = 0
      DataField = 'visit_type'
      DataSource = OvstDS
      AnyMatch = True
      TabOrder = 21
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel12: TUniLabel
      Left = 46
      Top = 208
      Width = 88
      Height = 19
      Alignment = taRightJustify
      Caption = #3611#3619#3632#3648#3616#3607#3588#3609#3652#3586#3657
      TabOrder = 22
    end
    object UniDBLookupComboBox10: TUniDBLookupComboBox
      Left = 141
      Top = 204
      Width = 283
      Height = 28
      ListFormat = 'pt_subtype:name:pt_subtype:N'
      ListField = 'name'
      KeyField = 'pt_subtype'
      ListFieldIndex = 0
      DataField = 'pt_subtype'
      DataSource = OvstDS
      AnyMatch = True
      TabOrder = 23
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel13: TUniLabel
      Left = 16
      Top = 242
      Width = 119
      Height = 19
      Alignment = taRightJustify
      Caption = #3648#3611#3655#3609#3588#3609#3652#3586#3657#3586#3629#3591#3627#3657#3629#3591
      TabOrder = 24
    end
    object UniDBLookupComboBox11: TUniDBLookupComboBox
      Left = 141
      Top = 238
      Width = 283
      Height = 28
      ListFormat = 'kskdepartment:department:depcode:Y'
      ListField = 'department'
      KeyField = 'depcode'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'main_dep'
      DataSource = OvstDS
      TabOrder = 25
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox8GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox8RemoteQuery
    end
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 141
      Top = 270
      Width = 181
      Height = 25
      DataField = 'at_hospital'
      DataSource = OvstDS
      ValueChecked = 'N'
      ValueUnchecked = 'Y'
      Caption = #3651#3627#3657#3610#3619#3636#3585#3634#3619#3609#3629#3585#3626#3606#3634#3609#3607#3637#3656
      TabOrder = 26
      ParentColor = False
      Color = clBtnFace
    end
    object VisitSymptomCombobox: TUniDBComboBox
      Left = 141
      Top = 68
      Width = 283
      Height = 28
      DataField = 'symptom'
      DataSource = OPDScreenDS
      TabOrder = 27
      IconItems = <>
    end
    object UseQSSlotCheck: TUniCheckBox
      Left = 530
      Top = 174
      Width = 200
      Height = 17
      Caption = #3629#3629#3585#3588#3636#3623#3588#3633#3604#3585#3619#3629#3591' (qs-slot)'
      TabOrder = 28
    end
    object TemplateButton: TUniButton
      Left = 426
      Top = 171
      Width = 95
      Height = 25
      Caption = 'Template'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 29
      Images = UniImageList1
      ImageIndex = 7
      LayoutConfig.Cls = 'patient-visit-template-button'
      OnClick = TemplateButtonClick
    end
    object UniPageControl1: TUniPageControl
      Left = 852
      Top = 21
      Width = 581
      Height = 505
      ActivePage = UniTabSheet1
      TabOrder = 30
      object UniTabSheet1: TUniTabSheet
        Caption = #3626#3636#3607#3608#3636#3585#3634#3619#3619#3633#3585#3625#3634
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object PttypeGroupBox: TUniGroupBox
          Left = 0
          Top = 61
          Width = 573
          Height = 416
          Caption = #3626#3636#3607#3608#3636#3585#3634#3619#3619#3633#3585#3625#3634
          Align = alClient
          TabOrder = 0
          ParentFont = False
          Font.Height = -16
          object UniLabel16: TUniLabel
            Left = 48
            Top = 72
            Width = 30
            Height = 19
            Caption = #3626#3636#3607#3608#3636
            TabOrder = 1
          end
          object UniDBEdit3: TUniDBEdit
            Left = 84
            Top = 68
            Width = 51
            Height = 28
            DataField = 'pttype'
            DataSource = VisitPttypeDS
            TabOrder = 2
          end
          object UniDBLookupComboBox3: TUniDBLookupComboBox
            Left = 141
            Top = 68
            Width = 410
            Height = 28
            ListFormat = 'pttype:name:pttype:Y'
            ListField = 'name'
            KeyField = 'pttype'
            ListFieldIndex = 0
            DataField = 'pttype'
            DataSource = VisitPttypeDS
            TabOrder = 3
            Color = clWindow
            RemoteQuery = True
            Style = csDropDown
            OnGetKeyValue = UniDBLookupComboBox3GetKeyValue
            OnRemoteQuery = UniDBLookupComboBox3RemoteQuery
          end
          object UniLabel17: TUniLabel
            Left = 12
            Top = 107
            Width = 66
            Height = 19
            Caption = #3648#3621#3586#3607#3637#3656#3626#3636#3607#3608#3636
            TabOrder = 4
          end
          object UniDBEdit4: TUniDBEdit
            Left = 84
            Top = 102
            Width = 210
            Height = 28
            DataField = 'pttypeno'
            DataSource = VisitPttypeDS
            TabOrder = 5
          end
          object UniLabel18: TUniLabel
            Left = 93
            Top = 208
            Width = 40
            Height = 19
            Caption = #3623#3633#3609#3648#3619#3636#3656#3617
            TabOrder = 6
          end
          object UniDBDateTimePicker1: TUniDBDateTimePicker
            Left = 147
            Top = 204
            Width = 125
            Height = 28
            DataField = 'begin_date'
            DataSource = VisitPttypeDS
            DateTime = 44166.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 7
          end
          object UniDBDateTimePicker2: TUniDBDateTimePicker
            Left = 376
            Top = 204
            Width = 125
            Height = 28
            DataField = 'expire_date'
            DataSource = VisitPttypeDS
            DateTime = 44166.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 8
          end
          object UniLabel19: TUniLabel
            Left = 287
            Top = 206
            Width = 75
            Height = 19
            Caption = #3623#3633#3609#3627#3617#3604#3629#3634#3618#3640
            TabOrder = 9
          end
          object UniLabel20: TUniLabel
            Left = 16
            Top = 141
            Width = 122
            Height = 19
            Caption = #3626#3606#3634#3609#3614#3618#3634#3610#3634#3621#3627#3621#3633#3585
            TabOrder = 10
          end
          object UniDBEdit5: TUniDBEdit
            Left = 148
            Top = 136
            Width = 100
            Height = 28
            DataField = 'hospmain'
            DataSource = VisitPttypeDS
            TabOrder = 11
          end
          object UniDBLookupComboBox12: TUniDBLookupComboBox
            Left = 254
            Top = 136
            Width = 297
            Height = 28
            ListFormat = 'hospcode:concat(hospcode,'#39'^'#39',hosptype,'#39' '#39',name):hospcode:Y'
            ListField = 'hospname'
            KeyField = 'hospcode'
            ListFieldIndex = 0
            ClearButton = True
            DataField = 'hospmain'
            DataSource = VisitPttypeDS
            TabOrder = 12
            Color = clWindow
            RemoteQuery = True
            Style = csDropDown
          end
          object UniLabel21: TUniLabel
            Left = 16
            Top = 172
            Width = 118
            Height = 19
            Caption = #3626#3606#3634#3609#3614#3618#3634#3610#3634#3621#3619#3629#3591
            TabOrder = 13
          end
          object UniDBEdit6: TUniDBEdit
            Left = 148
            Top = 170
            Width = 100
            Height = 28
            DataField = 'hospsub'
            DataSource = VisitPttypeDS
            TabOrder = 14
          end
          object UniDBLookupComboBox13: TUniDBLookupComboBox
            Left = 254
            Top = 170
            Width = 297
            Height = 28
            ListFormat = 'hospcode:concat(hospcode,'#39'^'#39',hosptype,'#39' '#39',name):hospcode:Y'
            ListField = 'hospname'
            KeyField = 'hospcode'
            ListFieldIndex = 0
            ClearButton = True
            DataField = 'hospsub'
            DataSource = VisitPttypeDS
            TabOrder = 15
            Color = clWindow
            RemoteQuery = True
            Style = csDropDown
          end
          object UniLabel22: TUniLabel
            Left = 17
            Top = 241
            Width = 118
            Height = 19
            Caption = #3585#3634#3619#3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636
            TabOrder = 16
          end
          object PttypeCheckStatusCombobox: TUniComboBox
            Left = 147
            Top = 238
            Width = 354
            Height = 27
            Style = csDropDownList
            TabOrder = 17
            IconItems = <>
          end
          object UniButton5: TUniButton
            Left = 12
            Top = 25
            Width = 174
            Height = 27
            Caption = #3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636' '#3626#3611#3626#3594'.'
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 18
            Images = UniImageList1
            ImageIndex = 0
            OnClick = UniButton5Click
          end
          object UniLabel23: TUniLabel
            Left = 300
            Top = 107
            Width = 75
            Height = 19
            Caption = 'Auth Code'
            TabOrder = 19
          end
          object UniDBEdit7: TUniDBEdit
            Left = 385
            Top = 102
            Width = 119
            Height = 28
            DataField = 'auth_code'
            DataSource = VisitPttypeDS
            TabOrder = 20
          end
          object UniButton6: TUniButton
            Left = 192
            Top = 26
            Width = 126
            Height = 27
            Caption = #3586#3629' Auth Code'
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 21
            Images = UniImageList1
            ImageIndex = 0
            OnClick = UniButton6Click
          end
          object UniButton8: TUniButton
            Left = 324
            Top = 27
            Width = 75
            Height = 25
            Caption = 'FWF'
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 22
            OnClick = UniButton8Click
          end
          object UniMenuButton1: TUniMenuButton
            Left = 405
            Top = 27
            Width = 75
            Height = 25
            DropdownMenu = UniPopupMenu1
            Caption = 'Task'
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 23
          end
          object UniButton9: TUniButton
            Left = 486
            Top = 27
            Width = 75
            Height = 25
            Caption = #3611#3619#3632#3623#3633#3605#3636
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 24
            OnClick = UniButton9Click
          end
          object CheckAuthenCodeButton: TUniButton
            Left = 510
            Top = 102
            Width = 41
            Height = 25
            Visible = False
            Caption = 'CA'
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 25
            OnClick = CheckAuthenCodeButtonClick
          end
        end
        object UniGroupBox2: TUniGroupBox
          Left = 0
          Top = 0
          Width = 573
          Height = 61
          Caption = 'Task'
          Align = alTop
          TabOrder = 1
          ParentFont = False
          Font.Height = -16
          object ClLabel: TUniLabel
            Left = 191
            Top = 15
            Width = 370
            Height = 50
            Visible = False
            AutoSize = False
            Caption = 'Cl'
            ParentFont = False
            Font.Color = 193
            Font.Height = -16
            Font.Style = [fsBold]
            TabOrder = 1
          end
          object CheckCommonIllness: TUniDBCheckBox
            Left = 15
            Top = 26
            Width = 170
            Height = 17
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = #3648#3594#3655#3588'CI '#3614#3619#3657#3629#3617#3648#3594#3655#3588#3626#3636#3607#3608#3636#3660
            TabOrder = 2
            ParentColor = False
            Color = clBtnFace
            OnClick = CheckCommonIllnessClick
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Caption = #3585#3634#3619#3614#3636#3617#3614#3660#3648#3629#3585#3626#3634#3619
        object UniGroupBox1: TUniGroupBox
          Left = 0
          Top = 0
          Width = 573
          Height = 477
          Caption = #3648#3629#3585#3626#3634#3619
          Align = alClient
          TabOrder = 0
          ParentFont = False
          Font.Height = -16
          object PrintCheckBox1: TUniCheckBox
            Left = 21
            Top = 39
            Width = 308
            Height = 17
            Checked = True
            Caption = #3614#3636#3617#3614#3660#3651#3610#3626#3633#3656#3591#3618#3634
            TabOrder = 1
          end
          object PrintCheckBox2: TUniCheckBox
            Left = 21
            Top = 67
            Width = 214
            Height = 17
            Caption = #3614#3636#3617#3614#3660#3651#3610#3609#3635#3607#3634#3591' (VN Slip)'
            TabOrder = 2
          end
          object PrintOtherDocumentCheck: TUniCheckBox
            Left = 21
            Top = 95
            Width = 164
            Height = 17
            Caption = #3648#3629#3585#3626#3634#3619#3629#3639#3656#3609#3654
            TabOrder = 3
          end
          object UniButton7: TUniButton
            Left = 21
            Top = 134
            Width = 115
            Height = 28
            Caption = #3614#3636#3617#3614#3660
            ParentFont = False
            Font.Height = -13
            Font.Style = [fsBold]
            TabOrder = 4
            Images = UniImageList1
            ImageIndex = 4
            OnClick = UniButton7Click
          end
        end
      end
      object UniTabSheet3: TUniTabSheet
        Caption = 'Task'
        Font.Height = -16
        ParentFont = False
        object DeleteButton: TUniButton
          Left = 12
          Top = 16
          Width = 149
          Height = 29
          Caption = #3621#3610#3585#3634#3619#3626#3656#3591#3605#3619#3623#3592
          ParentFont = False
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 0
          Images = UniImageList1
          ImageIndex = 2
          OnClick = DeleteButtonClick
        end
      end
    end
    object NHSOHistoryGroupBox: TUniGroupBox
      Left = 0
      Top = 301
      Width = 838
      Height = 225
      Caption = #3611#3619#3632#3623#3633#3605#3636#3585#3634#3619#3586#3629' Auth Code'
      Align = alCustom
      TabOrder = 31
    end
  end
  object OvstCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from ovst limit 0'#13#10
    Params = <>
    BeforePost = OvstCDSBeforePost
    OnNewRecord = OvstCDSNewRecord
    Left = 466
    Top = 99
  end
  object OvstDS: TDataSource
    DataSet = OvstCDS
    Left = 533
    Top = 97
  end
  object OvstSEQCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from ovst_seq limit 0'#13#10
    Params = <>
    BeforePost = OvstSEQCDSBeforePost
    Left = 82
    Top = 83
  end
  object OvstSEQDS: TDataSource
    DataSet = OvstSEQCDS
    Left = 154
    Top = 90
  end
  object OPDScreenCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from opdscreen limit 0'#13#10
    Params = <>
    BeforePost = OPDScreenCDSBeforePost
    OnNewRecord = OPDScreenCDSNewRecord
    Left = 272
    Top = 87
  end
  object OPDScreenDS: TDataSource
    DataSet = OPDScreenCDS
    Left = 355
    Top = 83
  end
  object VisitPttypeCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from visit_pttype limit 0'#13#10
    Params = <>
    BeforePost = VisitPttypeCDSBeforePost
    OnNewRecord = VisitPttypeCDSNewRecord
    Left = 645
    Top = 106
  end
  object VisitPttypeDS: TDataSource
    DataSet = VisitPttypeCDS
    Left = 747
    Top = 104
  end
  object DepartmentLookupDS: TDataSource
    DataSet = DepartmentLookupCDS
    Left = 982
    Top = 96
  end
  object DepartmentLookupCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select depcode,department from kskdepartment  limit 0'#13#10
    Params = <>
    Left = 842
    Top = 95
  end
  object RefreshAuthCodeTimer: TUniTimer
    Interval = 500
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = RefreshAuthCodeTimerTimer
    Left = 1115
    Top = 121
  end
  object ShowTemplateTimer: TUniTimer
    Interval = 50
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = ShowTemplateTimerTimer
    Left = 404
    Top = 183
  end
  object UniImageList1: TUniImageList
    Left = 1216
    Top = 168
    Bitmap = {
      494C010109000D00400010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005F5F657D60606780000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005E5E62791818E2FF1818E2FF606067800000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000181818194545454D5E5E5E7E5757576A3333333606060607000000005D5D
      62781818E2FF1818E2FF1818E2FF5E5E637B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000A0A0A0B6161
      6195000000FE232323FF545454FF404040FF0D0D0DFF2B2B2BE5626269931818
      E2FF1818E2FF1818E2FF5E5E637A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001A1A1A1B373737DC3E3E
      3EFFCCC8DBFFD4CFE6FFD1CBE5FFD2CCE5FFD5D0E9FF9C9AA2FF0D0D0DFF0A0A
      66FF1818E2FF5F5F657E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000575757B85F5F5FFFCFC7
      E9FFE4E2EBFFFEFEFEFFFFFFFFFFFFFFFFFFF9F9F9FFD1CCE4FFD0CCDFFF0D0D
      0DFF626269940000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005050505D1A1A1AFFD1CBE6FFEFEE
      F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CCE4FF9C9A
      A2FF2B2B2BE50606060700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5FA6818181FFD1CBE4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFD5D0
      E9FF0F0F0FFF3333333600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000393939DAB0ACBEFFE5E3EAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CC
      E5FF454545FF5757576A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1D1DEEBDB7D0FFEDEDEDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0CB
      E5FF5A5A5AFF5E5E5E7E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000545454BD99989BFFD7D3E6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFD0CA
      E6FF262626FF4545454D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000616161884B4B4BFFCEC8E5FFFBFB
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E1EBFFC9C4
      DCFF000000FE1818181900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017171718212121ECACAAB4FFCEC9
      E3FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEF1FFCDC6E8FF3E3E
      3EFF616161950000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004C4C4C57111111FFACAA
      B4FFCFC9E5FFD7D3E6FFEDEDEDFFE4E2E9FFD0CAE4FFD0CAE5FF5F5F5FFF3737
      37DC0A0A0A0B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004C4C4C572121
      21EC4B4B4BFF99989BFFBDB7D0FFB0ACBEFF818181FF1A1A1AFF575757B81A1A
      1A1B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001717
      171861616188545454BD1D1D1DEE393939DA5F5F5FA65050505D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006867
      658F9E907BFF9E907BFF9E907BFF9E907BFF9E907BFF9E907BFF9E907BFF9E90
      7BFF6867658F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002929292B6B6D618E8A9241D3ADB515F3B4B115F3938C41D36C6A618D2828
      282A000000000000000000000000000000000000000000000000000000000000
      00002E2E2E30636C6797488563D927A05DF927A05DF9488563D9636C67972E2E
      2E30000000000000000000000000000000000000000000000000000000006C6B
      699BE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6
      E1FF6C6B699B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000050505066C6F
      6293A9D204FCB4D600FFBBD000FFC2CB00FFCAC600FFD1C100FFD8BB00FFD6B1
      04FC6F6C6191040404050000000000000000000000000000000008080809636D
      679A24A85EFD22AF63FF23B064FF23B064FF23B064FF23B064FF22AF63FF24A8
      5EFD636D689A0808080900000000000000000000000000000000000000006C6B
      699BE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6
      E1FF6C6B699B0000000000000000000000000000000000000000AD884AECCF96
      3DFFE7E4DEFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE7E4
      DEFFCF963DFFAE884AED00000000000000000000000005050506778755BCA6E0
      00FFADDB00FFB4D600FFBBD000FFC2CB00FFCAC600FFD1C100FFD8BB00FFDFB6
      00FFE6B100FF887955BB04040405000000000000000008080809587968C123B0
      63FF24B166FF24B266FF24B266FF24B266FF24B266FF24B266FF24B266FF24B1
      66FF23B063FF587968C108080809000000000000000042424248535352606F6C
      679FA69E90E9A69E90E9A69E90E9A69E90E9A69E90E9A69E90E9A69E90E9A69E
      90E96F6C679F5353526042424248000000000000000000000000CC943EFECF96
      3DFFE8EAEAFFC9E3F1FFBFE1F3FFBFE1F3FFBFE1F3FFBFE1F3FFC9E3F1FFE8EA
      EAFFCF963DFFCF963DFF0000000000000000000000006C716194B9ED41FFCDED
      6CFFADDB00FFB4D600FFBBD000FFC2CB00FFCAC600FFD1C100FFE1CA36FFF0DC
      85FFE6B100FFEDAB00FF706B61910000000000000000636D689A23B165FF25B3
      67FF25B367FF25B367FF25B367FF25B367FF25B367FF25B367FF25B367FF25B3
      67FF25B367FF23B165FF636D689A000000004545454CA17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FF4545454C0000000000000000CE9540FED198
      3FFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EA
      EAFFD1983FFFD1983FFF00000000000000002A2A2A2C94E204FCB1EB2DFFEFFA
      D2FFAEDB00FFB4D600FFBBD000FFC2CB00FFCAC600FFD2C305FFE4D04AFFF4E7
      AAFFE7B305FFEDAC00FFEBA204FC2828282A2E2E2E3026AA62FD26B469FF5CC7
      91FF68CB9AFF68CB9AFF68CB9AFF68CB9AFF68CB9AFF68CB9AFF68CB9AFF68CB
      9AFF51C38AFF26B469FF26AA62FD2E2E2E3058575668A17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FF585756680000000000000000CE9540FED198
      3FFFE8EAEAFFC9E3F1FFBFE1F3FFBFE1F3FFBFE1F3FFBFE1F3FFC9E3F1FFE8EA
      EAFFD1983FFFD1983FFF00000000000000006A6F619098EB00FF9FE600FFE4F6
      B1FFDBEF8EFFB5D701FFBBD000FFC2CB00FFCCC806FFFBF9E8FFFCFAEEFFFEFD
      F7FFFDF8E8FFF4CB5EFFF4A600FF6E6A618D636C679726B469FF27B66BFFACE2
      C6FFCAEDDBFFCAEDDBFFCAEDDBFFCAEDDBFFCAEDDBFFCAEDDBFFCAEDDBFFCAED
      DBFF93DAB5FF27B66BFF26B469FF636D679758575668A17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FF585756680000000000000000CE9540FED198
      3FFFE8EAEAFFC9E3F1FFBFE1F3FFBFE1F3FFBFE1F3FFBFE1F3FFC9E3F1FFE8EA
      EAFFD1983FFFD1983FFF00000000000000007AA13FD598EB00FF9FE600FFABE2
      0AFFE3F3A7FFF6FAE1FFE8EFA8FFF0F2C0FFD2CF25FFD1C100FFE3CE45FFF4E6
      A8FFE6B100FFEDAB00FFF4A600FFA48141D34A8866D927B66CFF28B76DFF91D9
      B4FFA8E1C4FFA8E1C4FFA8E1C4FFA8E1C4FFA8E1C4FFA8E1C4FFA8E1C4FFA8E1
      C4FF7AD3A7FF28B76DFF27B66CFF4A8866D958575668A17219FF9C792BFFA172
      19FFA1781CFFA17219FFA17219FFA17219FFA17219FFA17219FFA17219FFA172
      19FFA17219FFA17219FFA17219FF585756680000000000000000CE9540FED198
      3FFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EAEAFFE8EA
      EAFFD1983FFFD1983FFF000000000000000088CF17F298EB00FF9FE600FFA6E0
      00FFCCE95EFFEFF6CAFFD4E15AFFECEFAFFFE8E690FFD1C100FFDFC82DFFEDD6
      6DFFE6B100FFEDAB00FFF4A600FFD59319F12BA966F929B86EFF29B96FFF79D3
      A7FF8FDAB4FF8FDAB4FF8FDAB4FF8FDAB4FF8FDAB4FF8FDAB4FF8FDAB4FF8FDA
      B4FF6ACE9DFF29B96FFF29B86EFF2BA966F9585756689C792BFF74AEA8FFA17A
      1DFFA0A030FFAB8537FFC0A97CFFC0A97CFFC0A97CFFC0A97CFFC0A97CFFC0A9
      7CFFC0A97CFFC0A97CFFC0A97CFF696765890000000000000000CE9540FED198
      3FFFE1CFB3FFE2D5BEFFE2D5BEFFE2D5BEFFE2D5BEFFE2D5BEFFE2D5BEFFE1CF
      B2FFD1983FFFD1983FFF000000000000000087D115F398EB00FF9FE600FFA6E0
      00FFEBF6C0FFC2DE2EFFBBD000FFC4CD05FFFAFAE9FFD1C100FFD9BD06FFEED7
      72FFEBBF2CFFEDAB00FFF4A600FFD79317F22CAA68F92ABA70FF2ABA70FFBDE9
      D3FFDEF4E9FFDEF4E9FFDEF4E9FFDEF4E9FFDEF4E9FFDEF4E9FFDEF4E9FFDEF4
      E9FFA1E0C0FF2ABA70FF2ABA70FF2CAA68F91A1A1A1B7F6E4FCF8A6D37E98A6C
      38EA907442EC907442EC907442EC907442EC907442EC907442EC907442EC9074
      42EC8A6C38EA8A6D37E97F6E4FCF1A1A1A1B0000000000000000CE9540FED198
      3FFFD1983FFFD1983FFFD1983FFFD1983FFFD1983FFFD1983FFFD1983FFFD198
      3FFFD1983FFFD1983FFF00000000000000007AA13FD598EB00FF9FE600FFA6E0
      00FFE4F3AAFFCEE457FFBBD000FFCDD429FFFFFFFDFFF5F1C6FFFCFAEEFFEDD7
      6FFFE6B100FFEDAB00FFF4A600FFA48141D34C8A68D92CBA71FF2CBB72FF66CE
      9CFF74D2A4FF74D2A4FF74D2A4FF74D2A4FF74D2A4FF74D2A4FF74D2A4FF74D2
      A4FF5BCA94FF2CBB72FF2CBA71FF4C8A68D900000000000000006B6965A87B69
      51FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6
      E1FF7B6951FF6B6965A800000000000000000000000000000000CE9540FED198
      3FFFCA903DFFD4AC70FFE2D2BDFFE2D2BDFFE2D2BDFFE2D2BDFFD7AE71FFCD94
      3BFFD1983FFFD1983FFF00000000000000006A70619198EB00FF9FE600FFA6E0
      00FFBAE124FFF4F9DBFFF0F4C6FFFCFCF2FFE5E383FFDBCE33FFF4ECB9FFECD5
      68FFE6B100FFEDAB00FFF4A600FF6F6A618E646D67972CBA71FF2EBC74FFCEEF
      DEFFF2FAF6FFF2FAF6FFF2FAF6FFF2FAF6FFF2FAF6FFF2FAF6FFF2FAF6FFF2FA
      F6FFB0E5CAFF2EBC74FF2CBA71FF646D689700000000000000006B6965A87B69
      51FFE9E6E1FFE3DFDCFFE3DFDCFFE3DFDCFFE3DFDCFFE3DFDCFFE3DFDCFFE9E6
      E1FF7B6951FF6B6965A800000000000000000000000000000000CE9540FED198
      3FFFC78C3BFFD9BC95FFEBEBEBFFEBEBEBFFC68F45FFD4B894FFDCBF96FFC38D
      32FFD1983FFFD1983FFF00000000000000002B2B2B2D96E502FD9FE600FFA6E0
      00FFADDB00FFB5D702FFC8D92FFFFBFCEEFFCAC600FFD1C100FFE1CA35FFF6EA
      B6FFE6B100FFEDAB00FFEBA204FC2929292B2E2E2E302EB26DFD30BC75FF30BD
      75FF30BD75FF30BD75FF30BD75FF30BD75FF30BD75FF30BD75FF30BD75FF30BD
      75FF30BD75FF30BC75FF2EB26DFD2E2E2E3000000000000000004646464E6968
      668DE9E6E1FFE3DFDCFFE3DFDCFFE3DFDCFFE3DFDCFFE3DFDCFFE3DFDCFFE9E6
      E1FF6968668D4646464E00000000000000000000000000000000CC943EFECF96
      3DFFC78C3BFFD9BC95FFEBEBEBFFEBEBEBFFC78C3BFFCEAB7AFFDCBF96FFC891
      36FFD1983FFFD1983FFF0000000000000000000000006D7361979FE600FFA6E0
      00FFADDB00FFB4D600FFBBD000FFF5F6D5FFD7D43CFFD1C100FFEDDF87FFF1DE
      8DFFE6B100FFEDAB00FF716C62930000000000000000646E699A2FBA72FF31BD
      76FF32BE77FF32BE77FF32BE77FF32BE77FF32BE77FF32BE77FF32BE77FF32BE
      77FF31BD76FF2FBA72FF656E699A000000000000000000000000000000002626
      2628E9E6E1FFE6E3DFFFE6E3DFFFE6E3DFFFE7E4DFFFE9E6E1FFE9E6E1FFE9E6
      E1FF262626280000000000000000000000000000000000000000AE884AEDCF96
      3DFFC78C3BFFD9BC95FFEBEBEBFFEBEBEBFFDDD0BEFFE5DED5FFDCBF96FF736E
      669BD1983FFF6664628000000000000000000000000006060607788853BEA6E0
      00FFADDB00FFB4D600FFBBD000FFCED530FFF6F5D4FFFCFBEDFFF3EAB2FFE1BB
      0DFFE6B100FF8A7A54BD050505060000000000000000080808095B7D6CC130BB
      73FF33BE77FF34BE78FF34BF78FF34BF78FF34BF78FF34BF78FF34BE78FF33BE
      77FF30BB73FF5B7D6CC108080809000000000000000000000000000000002626
      2628E9E6E1FFE6E2DEFFE5E2DEFFE5E2DEFFE6E3DFFFE9E6E1FFF1EEE9FFB2AF
      ADE1060606070000000000000000000000000000000000000000000000000000
      000000000000212121223F3F3F443F3F3F443F3F3F443F3F3F44212121220000
      0000000000000000000000000000000000000000000000000000060606076D71
      6196A8D502FDB4D600FFBBD000FFC2CB00FFCAC600FFD1C100FFD8BB00FFD6B1
      04FC706D6194050505060000000000000000000000000000000008080809656E
      699A32B470FD32BC76FF34BE78FF35BF78FF35BF78FF34BE78FF32BC76FF32B4
      70FD656F699A0808080900000000000000000000000000000000000000002626
      2628E9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FFE9E6E1FF9F9E9CD40707
      0708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B2B2B2D6C6E61918B9340D4B0B714F4B6B314F4938D40D46E6C61902A2A
      2A2C000000000000000000000000000000000000000000000000000000000000
      00002E2E2E30646D68974E8C6BD934AE6CF934AE6CF94E8C6BD9646D68972E2E
      2E30000000000000000000000000000000000000000000000000000000000000
      0000FDFCFC00F6FEFF00F6FFFF00F6FFFF00F6FFFF00F6FFFF00F6FFFF00FBFB
      FA00000000000000000000000000000000000000000000000000000000000000
      000025252526636267806A6780B36157B0E66157B0E66A6780B3636267802525
      2526000000000000000000000000000000000000000000000000000000006364
      6985536AD6F9516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF536A
      D6F9636468840000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005656566768645BC3606156DB6262
      58D3696764A30D0D0D0E00000000000000000000000000000000000000000000
      0000EDF2F400E0BCAC00EAA18900EAA68A00EAA78A00EAA28900E5B6A000E8EB
      ED00000000000000000000000000000000000000000000000000000000015B5B
      5D705E50CAF65C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5E50
      CAF65B5B5D70000000010000000000000000000000000000000000000000536A
      D6F9516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF546AD6F80000000000000000000000000000000000000000000000000000
      00000000000000000000000000006766639353827CF33DD4F6FF3CD9FDFF3CD9
      FDFF43B9CEFE615C4EDC1919191A000000000000000000000000000000000000
      0000EDFCFF00F28A5D00FF340000FF410000FF410000FF350000F9713500EAF5
      F9000000000000000000000000000000000000000000000000016A6782B55C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6A6782B50000000100000000000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF000000000000000000000000000000005151505D6F5F4ACC705D
      43D3705D43D3705D43D36B5438DE547B75F05B5136F55C5F50EC4F9196F33CD9
      FDFF3CD9FDFF40C4DDFF68645BC1000000000000000000000000000000000000
      0000EFFEFF00F0926A00FF390000FF400000FF4B0000FF410000F7784000EBF5
      FA0000000000000000000000000000000000000000005B5B5D705C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5B5B5D7000000000000000000000000000000000516B
      E7FF516BE7FF516BE7FF6A84EBFF516BE7FF516BE7FF6781EAFF556EE8FF516B
      E7FF516BE7FF000000000000000000000000151515167D5F2AE7E6AA00FFE8AB
      00FFE8AB00FFE8AB00FF785825EF3ED0EFFF57706AED5B5843F0566D60F25384
      82F13CD9FDFF3CD9FDFF5D655AE30D0D0D0EFDFDFD00EAEDEE00EBF7FB00EBF7
      FB00E0F2F800F27C4A00FB663100F9814D00FD4E0500FF3D0000F87B4400E3F6
      FE00EBF6FB00EBF7FB00E9EEF000FBFAFA00252525265E50CAF65C4CE0FF5C4C
      E0FF6454E1FFB4ACF0FF6152E1FF5C4CE0FF5C4CE0FF6152E1FFB4ACF0FF6454
      E1FF5C4CE0FF5C4CE0FF5E50CAF625252526000000000000000000000000516B
      E7FF516BE7FF516BE7FFE3E7FBFFA2B1F2FF7C92EDFFF0F2FDFF6781EAFF516B
      E7FF516BE7FF00000000000000000000000041414147AB7909FAE8AB00FFE8AB
      00FFE8AB00FFE8AB00FF6E5C35EA3CD9FDFF41C2DAFF5B5C49EE3ECFEFFF5478
      73EF538482F13CD9FDFF547F7AEF3636363AF9FDFD00E3C3B500F6764700F578
      4700F2895B00F66D3100FA814C00FAFFFF00FB662700FC460400FA5A1500F87C
      4A00F57B4800F6724600E6B49E00F4FBFB00636267805C4CE0FF5C4CE0FF5C4C
      E0FFB4ACF0FFFFFFFFFFD2CEF6FF6152E1FF6152E1FFD2CEF6FFFFFFFFFFB4AC
      F0FF5C4CE0FF5C4CE0FF5C4CE0FF6261667F000000000000000000000000516B
      E7FF516BE7FF516BE7FF627AE9FFE8ECFCFFF6F7FEFF7C92EDFF516BE7FF516B
      E7FF516BE7FF00000000000000000000000042424248AD7807FBE8AB00FFC58C
      00FFB98200FFB98200FF6B4B1DF43CD8FCFF3CD9FDFF43B9CFFE5B5C4AEE3ECE
      EDFF55746CF14F9195F35B6C62E61919191AF9FFFF00E8B7A100FF390000FF34
      0000FA885500F6B79800F64E0C00F8D1BD00F97D4700F37B4200F59D7300FF38
      0000FF410000FF340000ED9E7C00F4FFFF006A6780B35C4CE0FF5C4CE0FF5C4C
      E0FF6152E1FFD2CEF6FFFFFFFFFFD4D0F7FFD3D0F6FFFFFFFFFFD2CEF6FF6152
      E1FF5C4CE0FF5C4CE0FF5C4CE0FF6A6780B3000000000000000000000000516B
      E7FF516BE7FF516BE7FF7C92EDFFF0F2FDFFE8ECFCFFA2B1F2FF516BE7FF516B
      E7FF516BE7FF00000000000000000000000042424248AD7807FBE8AB00FFC58C
      00FFB98200FFB98200FF8E6213F6519493F63CD9FDFF3CD9FDFF43B9CFFE5B5C
      49EE5B5D4AED44B2C4FE645F53D100000000F9FFFF00E8BAA500FF450000FF3F
      0000F98B5900F0BFA500EF7F4A00F3783F00F7723700F08E5F00EFCBB400F975
      3A00FF440000FF400000ECA38300F4FFFF006157B0E65C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6152E1FFD4D0F7FFFFFFFFFFFFFFFFFFD3D0F6FF6152E1FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF6157B0E6000000000000000000000000516B
      E7FF516BE7FF516BE7FFE4E8FBFF7C92EDFF627AE9FFE3E7FBFF6A84EBFF516B
      E7FF516BE7FF00000000000000000000000042424248AD7807FBE8AB00FFA870
      00FF945E01FF945E01FF905B02FF653C0DFB4CA6ADFA3CD9FDFF3CD9FDFF42BE
      D6FE489FA8FE5D5D4EE63232323500000000F9FFFF00E8BAA500FF450000FF47
      0000FA561300F5E5DA00F9C0A700F6AC8A00F1794100F2A47E00F8EBE200F8AC
      8A00FF3D0000FF400000ECA38300F4FFFF006157B0E65C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6152E1FFD3D0F6FFFFFFFFFFFFFFFFFFD4D0F7FF6152E1FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF6157B0E6000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF00000000000000000000000042424248AD7807FBE8AB00FFE6A9
      00FFE4A700FFE4A700FFE4A700FFDFA300FF8A6420EF6B5935ED636C56EC5F60
      4EE8696964B70F0F0F100000000000000000F9FFFF00E9B7A100FF380000FF3F
      0000FF320000FA8C5E00F9FFFF00F4CBB600F07C4500F1D1BF00FDFFFF00FCA9
      8400FF300000FF330000ED9F7C00F4FFFF006A6780B35C4CE0FF5C4CE0FF5C4C
      E0FF6152E1FFD2CEF6FFFFFFFFFFD3D0F6FFD4D0F7FFFFFFFFFFD2CEF6FF6152
      E1FF5C4CE0FF5C4CE0FF5C4CE0FF6A6780B3000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF00000000000000000000000042424248AD7807FBE8AB00FFA56E
      00FF8F5A02FF8F5A02FF956001FFE6AA00FFE8AB00FFE7AA00FFD29800FF6E64
      56BB00000000000000000000000000000000F9FCFC00E1C6BA00F2865D00F189
      5C00F28C6000FA5E2300F6855B00F9F4EF00F9E2D600FCFFFF00F9EFE800EF8F
      6300F2835D00F2825D00E3B9A600F4FAFA00636267805C4CE0FF5C4CE0FF5C4C
      E0FFB4ACF0FFFFFFFFFFD2CEF6FF6152E1FF6152E1FFD2CEF6FFFFFFFFFFB4AC
      F0FF5C4CE0FF5C4CE0FF5C4CE0FF6261667F000000000000000000000000516B
      E7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516BE7FF516B
      E7FF516BE7FF00000000000000000000000042424248AD7807FBE8AB00FFE8AB
      00FFE8AB00FFE8AB00FFE8AB00FFE8AB00FFE8AB00FFE8AB00FFE4A700FF6E64
      56BB00000000000000000000000000000000FEFDFD00ECEFF100EBFAFF00EBF9
      FF00E0FBFF00F1976E00FF310000F9591500F9916300FA8D6500F3845200DFE2
      E200EBFAFF00EBFAFF00EAF0F200FCFBFB00252525265E50CAF65C4CE0FF5C4C
      E0FF6454E1FFB4ACF0FF6152E1FF5C4CE0FF5C4CE0FF6152E1FFB4ACF0FF6454
      E1FF5C4CE0FF5C4CE0FF5E50CAF62525252600000000000000009E9574FF9E95
      74FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E95
      74FF9E9574FF9E9574FF000000000000000042424248AD7807FBE8AB00FFE8AB
      00FFE8AB00FFE8AB00FFE8AB00FFE8AB00FFE0A400FFC78E00FFC38B00FF6E64
      56BB000000000000000000000000000000000000000000000000000000000000
      0000EFFEFF00EF8E6400FF400000FE470000FE3F0000FF320000F7743A00ECF9
      FE0000000000000000000000000000000000000000005B5B5D705C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5B5B5D700000000000000000000000009E9574FF9E95
      74FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E95
      74FF9E9574FF9E9574FF000000000000000042424248AD7807FBE8AB00FFE8AB
      00FFE8AB00FFE8AB00FFE8AB00FFD69B00FF6C5117F4918D16F3694A12F75554
      5363000000000000000000000000000000000000000000000000000000000000
      0000ECFCFF00F18B5E00FF360000FF430000FF430000FF370000F8723700EAF5
      F9000000000000000000000000000000000000000000000000016A6782B55C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6A6782B5000000010000000000000000000000007A776FC59E95
      74FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E9574FF9E95
      74FF9E9574FF79766FC3000000000000000042424248AD7807FBE8AB00FFE8AB
      00FFE8AB00FFE8AB00FFE8AB00FF98731AF1B3C000FF857E23EC605F5D7A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEF2F400E1C3B600EAAE9900E9B19900E9B19A00E9AE9900E6BFAD00E9EC
      ED00000000000000000000000000000000000000000000000000000000015B5B
      5D705E50CAF65C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5E50
      CAF65B5B5D700000000100000000000000000000000000000000000000000000
      000000000000000000008C805FFF00000000000000008C805FFF000000000000
      000000000000000000000000000000000000242424258A6726EAE8AB00FFE8AB
      00FFE8AB00FFE8AB00FFE8AB00FF96711CF07B6A16F465646187000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFDFD00F9FFFF00F9FFFF00F9FFFF00F9FFFF00F9FFFF00F9FFFF00FDFC
      FC00000000000000000000000000000000000000000000000000000000000000
      000025252526636267806A6780B36157B0E66157B0E66A6780B3636267802525
      2526000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C805FFF8C805FFF8C805FFF8C805FFF000000000000
      000000000000000000000000000000000000000000006A666197755D38DD765C
      33E1765C33E1765C33E1765C33E16D4F26EB6866629200000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFF9000000000000FFF0000000000000
      F020000000000000C00100000000000080030000000000008007000000000000
      0003000000000000000300000000000000030000000000000003000000000000
      0003000000000000000300000000000000070000000000008007000000000000
      C00F000000000000E03F000000000000E007FFFFF00FF00FE007FFFFC003C003
      E007C003800180018001C003800180010000C003000000000000C00300000000
      0000C003000000000000C003000000000000C003000000000000C00300000000
      C003C00300000000C003C00300000000C003C00380018001E007C00380018001
      E007F81FC003C003E00FFFFFF00FF00FF00FF00FE007FF03F00FC003E007FE01
      F00F8001E0078001F00F8001E007000000000000E007000000000000E0070000
      00000000E007000100000000E007000100000000E007000300000000E007000F
      00000000E007000F00000000C003000FF00F8001C003000FF00F8001C003001F
      F00FC003FDBF003FF00FF00FFC3F807F00000000000000000000000000000000
      000000000000}
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 1296
    Top = 168
    object N1: TUniMenuItem
      Caption = #3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636#3585#3619#3617#3608#3619#3619#3617#3660#3607#3633#3657#3591#3627#3617#3604
      Visible = False
      OnClick = N1Click
    end
    object VaccineHPVPP1: TUniMenuItem
      Caption = #3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636' Vaccine HPV/'#3610#3619#3636#3585#3634#3619' PP'
      Visible = False
      OnClick = VaccineHPVPP1Click
    end
    object Quota1: TUniMenuItem
      Caption = #3605#3619#3623#3592#3626#3629#3610' Quota '#3585#3621#3640#3656#3617#3610#3619#3636#3585#3634#3619
      Visible = False
      OnClick = Quota1Click
    end
  end
  object UniTimer1: TUniTimer
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 1136
    Top = 184
  end
end
