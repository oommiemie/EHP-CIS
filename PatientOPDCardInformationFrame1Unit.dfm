object PatientOPDCardInformationFrame1: TPatientOPDCardInformationFrame1
  Left = 0
  Top = 0
  Width = 1306
  Height = 752
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  AutoScroll = True
  object UniGroupBox1: TUniGroupBox
    Left = 1
    Top = 5
    Width = 710
    Height = 246
    Caption = #3586#3657#3629#3617#3641#3621#3607#3633#3656#3623#3652#3611
    TabOrder = 0
    object UniLabel1: TUniLabel
      Left = 6
      Top = 34
      Width = 64
      Height = 19
      Caption = #3588#3635#3609#3635#3627#3609#3657#3634
      TabOrder = 16
    end
    object PNameCombobox: TUniDBComboBox
      Left = 76
      Top = 30
      Width = 108
      Height = 27
      DataField = 'pname'
      DataSource = PatientDS
      Style = csSimple
      TabOrder = 0
      IconItems = <>
      OnSelect = PNameComboboxSelect
    end
    object UniLabel2: TUniLabel
      Left = 190
      Top = 34
      Width = 20
      Height = 19
      Caption = #3594#3639#3656#3629
      TabOrder = 17
    end
    object UniDBEdit1: TUniDBEdit
      Left = 216
      Top = 30
      Width = 200
      Height = 27
      DataField = 'fname'
      DataSource = PatientDS
      TabOrder = 1
      OnExit = UniDBEdit1Exit
    end
    object UniDBEdit2: TUniDBEdit
      Left = 493
      Top = 30
      Width = 204
      Height = 27
      DataField = 'lname'
      DataSource = PatientDS
      TabOrder = 2
      OnExit = UniDBEdit1Exit
    end
    object UniLabel3: TUniLabel
      Left = 424
      Top = 34
      Width = 57
      Height = 19
      Caption = #3609#3634#3617#3626#3585#3640#3621
      TabOrder = 18
    end
    object UniLabel4: TUniLabel
      Left = 7
      Top = 66
      Width = 67
      Height = 19
      Caption = #3610#3633#3605#3619' '#3611#3594#3594'.'
      TabOrder = 19
    end
    object UniDBEdit3: TUniDBEdit
      Left = 76
      Top = 63
      Width = 164
      Height = 27
      DataField = 'cid'
      DataSource = PatientDS
      TabOrder = 3
      OnMouseDown = UniDBEdit3MouseDown
    end
    object UniButton1: TUniButton
      Left = 244
      Top = 63
      Width = 30
      Height = 27
      Caption = 'G'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 20
      OnClick = UniButton1Click
    end
    object UniLabel5: TUniLabel
      Left = 294
      Top = 66
      Width = 42
      Height = 19
      Caption = #3623#3633#3609#3648#3585#3636#3604
      TabOrder = 21
    end
    object BirthDateMaskEdit: TUniEdit
      Left = 349
      Top = 63
      Width = 119
      Height = 27
      Alignment = taCenter
      TabOrder = 4
      InputMask.Mask = '99/99/9999'
      InputMask.RemoveMaskChar = False
      LayoutConfig.Cls = 'pt-opdcard-birthdate-edit'
      OnChange = BirthDateMaskEditChange
      OnExit = BirthDateMaskEditExit
    end
    object UniButton2: TUniButton
      Left = 553
      Top = 63
      Width = 31
      Height = 27
      Caption = 'G'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 22
      OnClick = UniButton2Click
    end
    object UniDBCheckBox1: TUniDBCheckBox
      Left = 474
      Top = 67
      Width = 78
      Height = 17
      ValueChecked = 'N'
      ValueUnchecked = 'Y'
      Caption = #3652#3617#3656#3649#3609#3656#3651#3592
      TabOrder = 23
      ParentColor = False
      Color = clBtnFace
    end
    object UniLabel6: TUniLabel
      Left = 9
      Top = 100
      Width = 55
      Height = 19
      Caption = #3648#3623#3621#3634#3648#3585#3636#3604
      TabOrder = 24
    end
    object BirthTimeMaskEdit: TUniEdit
      Left = 76
      Top = 96
      Width = 108
      Height = 27
      Alignment = taCenter
      TabOrder = 5
      InputMask.Mask = '99:99'
      InputMask.RemoveWhiteSpace = True
      InputMask.RemoveMaskChar = False
      OnExit = BirthTimeMaskEditExit
    end
    object UniLabel7: TUniLabel
      Left = 197
      Top = 100
      Width = 39
      Height = 19
      Caption = #3629#3634#3594#3637#3614
      TabOrder = 25
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 246
      Top = 96
      Width = 451
      Height = 27
      ListFormat = 'occupation:name:occupation:Y'
      ListField = 'name'
      KeyField = 'occupation'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'occupation'
      DataSource = PatientDS
      TabOrder = 6
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 100
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox1GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox1RemoteQuery
    end
    object UniLabel8: TUniLabel
      Left = 9
      Top = 133
      Width = 53
      Height = 19
      Caption = #3648#3594#3639#3657#3629#3594#3634#3605#3636
      TabOrder = 26
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 76
      Top = 129
      Width = 141
      Height = 27
      ListFormat = 'nationality:name:nationality'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'nationality'
      DataSource = PatientDS
      TabOrder = 7
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox2GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox2RemoteQuery
    end
    object UniLabel9: TUniLabel
      Left = 221
      Top = 133
      Width = 51
      Height = 19
      Caption = #3626#3633#3597#3594#3634#3605#3636
      TabOrder = 27
    end
    object UniDBLookupComboBox3: TUniDBLookupComboBox
      Left = 278
      Top = 129
      Width = 133
      Height = 27
      ListFormat = 'nationality:name:nationality'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'citizenship'
      DataSource = PatientDS
      TabOrder = 8
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox2GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox2RemoteQuery
      OnSelect = UniDBLookupComboBox3Select
    end
    object UniLabel10: TUniLabel
      Left = 417
      Top = 133
      Width = 46
      Height = 19
      Caption = #3624#3634#3626#3609#3634
      TabOrder = 28
    end
    object UniDBLookupComboBox4: TUniDBLookupComboBox
      Left = 469
      Top = 129
      Width = 97
      Height = 27
      ListFormat = 'religion:name:religion:Y'
      ListField = 'name'
      KeyField = 'religion'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'religion'
      DataSource = PatientDS
      TabOrder = 9
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox4GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox4RemoteQuery
    end
    object UniLabel11: TUniLabel
      Left = 572
      Top = 133
      Width = 84
      Height = 19
      Caption = #3592#3635#3609#3623#3609#3614#3637#3656#3609#3657#3629#3591
      TabOrder = 29
    end
    object UniDBNumberEdit1: TUniDBNumberEdit
      Left = 662
      Top = 129
      Width = 35
      Height = 27
      DataField = 'number_of_relatives'
      DataSource = PatientDS
      Alignment = taCenter
      TabOrder = 10
      DecimalSeparator = '.'
    end
    object UniLabel12: TUniLabel
      Left = 9
      Top = 164
      Width = 55
      Height = 19
      Caption = #3627#3617#3641#3656#3648#3621#3639#3629#3604
      TabOrder = 30
    end
    object UniLabel13: TUniLabel
      Left = 135
      Top = 164
      Width = 19
      Height = 19
      Caption = 'Rh'
      TabOrder = 31
    end
    object UniLabel14: TUniLabel
      Left = 226
      Top = 164
      Width = 61
      Height = 19
      Caption = #3585#3634#3619#3649#3614#3657#3618#3634
      TabOrder = 32
    end
    object UniDBEdit4: TUniDBEdit
      Left = 293
      Top = 162
      Width = 194
      Height = 27
      DataField = 'drugallergy'
      DataSource = PatientDS
      TabOrder = 13
    end
    object UniDBLookupComboBox5: TUniDBLookupComboBox
      Left = 76
      Top = 162
      Width = 56
      Height = 27
      ListFormat = 'blood_group:name:name:Y'
      ListField = 'name'
      KeyField = 'name'
      ListFieldIndex = 0
      DataField = 'bloodgrp'
      DataSource = PatientDS
      AnyMatch = True
      TabOrder = 11
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniDBLookupComboBox6: TUniDBLookupComboBox
      Left = 158
      Top = 162
      Width = 59
      Height = 27
      ParentShowHint = False
      ListFormat = 'blood_rh:name:name:Y'
      ListField = 'name'
      KeyField = 'name'
      ListFieldIndex = 0
      DataField = 'bloodgroup_rh'
      DataSource = PatientDS
      AnyMatch = True
      TabOrder = 12
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel15: TUniLabel
      Left = 572
      Top = 164
      Width = 58
      Height = 19
      Caption = #3610#3640#3605#3619#3588#3609#3607#3637#3656
      TabOrder = 33
    end
    object UniDBNumberEdit2: TUniDBNumberEdit
      Left = 662
      Top = 160
      Width = 35
      Height = 27
      DataField = 'birth_order'
      DataSource = PatientDS
      Alignment = taCenter
      TabOrder = 14
      DecimalSeparator = '.'
    end
    object UniLabel16: TUniLabel
      Left = 9
      Top = 199
      Width = 73
      Height = 19
      Caption = #3626#3606#3634#3609#3632#3616#3634#3614
      TabOrder = 34
    end
    object UniDBLookupComboBox7: TUniDBLookupComboBox
      Left = 88
      Top = 195
      Width = 127
      Height = 27
      ListFormat = 'marrystatus:name:code:Y::order by code'
      ListField = 'name'
      KeyField = 'code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'marrystatus'
      DataSource = PatientDS
      AnyMatch = True
      TabOrder = 35
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object UniLabel17: TUniLabel
      Left = 225
      Top = 199
      Width = 36
      Height = 19
      Caption = #3612#3641#3657#3649#3592#3657#3591
      TabOrder = 36
    end
    object UniDBEdit5: TUniDBEdit
      Left = 267
      Top = 195
      Width = 173
      Height = 27
      DataField = 'informname'
      DataSource = PatientDS
      TabOrder = 37
    end
    object UniButton3: TUniButton
      Left = 446
      Top = 195
      Width = 41
      Height = 27
      Caption = #3607#3637#3656#3629#3618#3641#3656
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 38
      OnClick = UniButton3Click
    end
    object UniLabel18: TUniLabel
      Left = 491
      Top = 199
      Width = 86
      Height = 19
      Caption = #3588#3623#3634#3617#3626#3633#3617#3614#3633#3609#3608#3660
      TabOrder = 39
    end
    object UniDBComboBox1: TUniDBComboBox
      Left = 583
      Top = 193
      Width = 108
      Height = 27
      AnyMatch = True
      DataField = 'informrelation'
      DataSource = PatientDS
      Style = csDropDownList
      Items.Strings = (
        #3649#3592#3657#3591#3648#3629#3591
        #3610#3636#3604#3634
        #3617#3634#3619#3604#3634
        #3588#3641#3656#3626#3617#3619#3626
        #3610#3640#3605#3619
        #3597#3634#3605#3636
        #3648#3614#3639#3656#3629#3609
        #3617#3641#3621#3609#3636#3608#3636
        #3652#3617#3656#3648#3585#3637#3656#3618#3623#3586#3657#3629#3591#3585#3633#3609)
      TabOrder = 40
      IconItems = <>
      OnChange = UniDBComboBox1Change
    end
    object UniLabel49: TUniLabel
      Left = 588
      Top = 66
      Width = 26
      Height = 19
      Caption = #3648#3614#3624
      TabOrder = 41
    end
    object UniDBComboBox3: TUniDBLookupComboBox
      Left = 619
      Top = 63
      Width = 78
      Height = 27
      ListFormat = 'sex:name:code:Y'
      ListField = 'name'
      KeyField = 'code'
      ListFieldIndex = 0
      DataField = 'sex'
      DataSource = PatientDS
      AnyMatch = True
      TabOrder = 42
      Color = clWindow
      RemoteQuery = True
      Style = csDropDown
    end
    object DrugAllergyButton: TUniButton
      Left = 493
      Top = 161
      Width = 73
      Height = 28
      Caption = #3585#3634#3619#3649#3614#3657#3618#3634
      TabOrder = 43
      ClientEvents.ExtEvents.Strings = (
        
          'click=  function click(sender, e, eOpts){'#13#10'  if (window._OPDCard' +
          'EntryFrame){'#13#10'    ajaxRequest(window._OPDCardEntryFrame, '#39'PageCo' +
          'ntrolSwitch'#39', ['#39'idx=2'#39']);'#13#10'  }'#13#10'}'#13#10)
      OnClick = DrugAllergyButtonClick
    end
  end
  object UniGroupBox2: TUniGroupBox
    Left = 717
    Top = 0
    Width = 180
    Height = 238
    Caption = #3619#3641#3611#3612#3641#3657#3611#3656#3623#3618
    TabOrder = 1
    object UniDBImage1: TUniDBImage
      Left = 2
      Top = 21
      Width = 176
      Height = 195
      DataField = 'image'
      DataSource = PatientImageDS
      Stretch = True
      Proportional = True
      Align = alClient
    end
    object UniSimplePanel2: TUniSimplePanel
      Left = 2
      Top = 216
      Width = 176
      Height = 20
      ParentColor = False
      Align = alBottom
      TabOrder = 2
      object UniButton5: TUniButton
        Left = 0
        Top = 0
        Width = 60
        Height = 20
        Caption = 'Upload'
        Align = alLeft
        ParentFont = False
        TabOrder = 1
        OnClick = UniButton5Click
      end
      object UniButton6: TUniButton
        Left = 60
        Top = 0
        Width = 63
        Height = 20
        Caption = 'Webcam'
        Align = alLeft
        ParentFont = False
        TabOrder = 2
        OnClick = UniButton6Click
      end
    end
  end
  object UniGroupBox3: TUniGroupBox
    Left = 3
    Top = 257
    Width = 744
    Height = 174
    Caption = #3607#3637#3656#3629#3618#3641#3656#3611#3633#3592#3592#3640#3610#3633#3609
    TabOrder = 2
    object UniLabel19: TUniLabel
      Left = 26
      Top = 32
      Width = 64
      Height = 19
      Caption = #3610#3657#3634#3609#3648#3621#3586#3607#3637#3656
      TabOrder = 1
    end
    object UniDBEdit6: TUniDBEdit
      Left = 100
      Top = 28
      Width = 74
      Height = 27
      DataField = 'addrpart'
      DataSource = PatientDS
      TabOrder = 2
    end
    object UniLabel20: TUniLabel
      Left = 180
      Top = 32
      Width = 20
      Height = 19
      Caption = #3627#3617#3641#3656
      TabOrder = 3
    end
    object UniDBEdit7: TUniDBEdit
      Left = 206
      Top = 28
      Width = 50
      Height = 27
      DataField = 'moopart'
      DataSource = PatientDS
      TabOrder = 4
    end
    object UniLabel21: TUniLabel
      Left = 263
      Top = 32
      Width = 29
      Height = 19
      Caption = #3606#3609#3609
      TabOrder = 5
    end
    object UniDBEdit8: TUniDBEdit
      Left = 298
      Top = 28
      Width = 183
      Height = 27
      DataField = 'road'
      DataSource = PatientDS
      TabOrder = 6
    end
    object UniLabel22: TUniLabel
      Left = 490
      Top = 32
      Width = 30
      Height = 19
      Caption = #3595#3629#3618
      TabOrder = 7
    end
    object UniDBEdit9: TUniDBEdit
      Left = 525
      Top = 28
      Width = 205
      Height = 27
      DataField = 'addr_soi'
      DataSource = PatientDS
      TabOrder = 8
    end
    object UniLabel23: TUniLabel
      Left = 45
      Top = 66
      Width = 45
      Height = 19
      Caption = #3592#3633#3591#3627#3623#3633#3604
      TabOrder = 9
    end
    object UniDBLookupComboBox8: TUniDBLookupComboBox
      Left = 141
      Top = 63
      Width = 133
      Height = 27
      ListFormat = 'province:province_name:province_code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'province_code'
      DataSource = PatientAddressDS
      TabOrder = 10
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      RemoteQueryCache = False
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox8GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox8RemoteQuery
      OnChange = UniDBLookupComboBox8Change
      OnSelect = UniDBLookupComboBox8Select
    end
    object UniLabel24: TUniLabel
      Left = 280
      Top = 66
      Width = 43
      Height = 19
      Caption = #3629#3635#3648#3616#3629
      TabOrder = 11
    end
    object UniDBLookupComboBox9: TUniDBLookupComboBox
      Left = 370
      Top = 63
      Width = 135
      Height = 27
      ListFormat = 'district:district_name:district_code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'district_code'
      DataSource = PatientAddressDS
      TabOrder = 12
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      RemoteQueryCache = False
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox9GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox9RemoteQuery
      OnChange = UniDBLookupComboBox9Change
      OnSelect = UniDBLookupComboBox9Select
    end
    object UniLabel25: TUniLabel
      Left = 508
      Top = 66
      Width = 38
      Height = 19
      Caption = #3605#3635#3610#3621
      TabOrder = 13
    end
    object UniDBLookupComboBox10: TUniDBLookupComboBox
      Left = 593
      Top = 63
      Width = 137
      Height = 27
      ListFormat = 'tambol:tambol_name:tambol_code'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'tambol_code'
      DataSource = PatientAddressDS
      TabOrder = 14
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      RemoteQueryCache = False
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox10GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox10RemoteQuery
      OnChange = UniDBLookupComboBox10Change
    end
    object UniLabel26: TUniLabel
      Left = 3
      Top = 99
      Width = 87
      Height = 19
      Caption = #3619#3627#3633#3626#3652#3611#3619#3625#3603#3637#3618#3660
      TabOrder = 15
    end
    object UniDBEdit13: TUniDBEdit
      Left = 100
      Top = 96
      Width = 94
      Height = 27
      DataField = 'po_code'
      DataSource = PatientDS
      TabOrder = 16
    end
    object UniButton4: TUniButton
      Left = 197
      Top = 96
      Width = 154
      Height = 25
      Caption = #3607#3637#3656#3629#3618#3641#3656#3605#3634#3617#3607#3632#3648#3610#3637#3618#3609#3610#3657#3634#3609
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 17
      OnClick = UniButton4Click
    end
    object UniLabel27: TUniLabel
      Left = 383
      Top = 100
      Width = 85
      Height = 19
      Visible = False
      Caption = #3605#3635#3649#3627#3609#3656#3591#3649#3615#3657#3617
      TabOrder = 18
    end
    object UniDBLookupComboBox11: TUniDBLookupComboBox
      Left = 483
      Top = 96
      Width = 247
      Height = 27
      Visible = False
      ListField = 'name'
      KeyField = 'id'
      ListFieldIndex = 0
      DataField = 'hospital_department_id'
      DataSource = PatientDS
      TabOrder = 19
      Color = clWindow
    end
    object UniLabel28: TUniLabel
      Left = 40
      Top = 133
      Width = 50
      Height = 19
      Caption = #3611#3619#3632#3648#3607#3624
      TabOrder = 20
    end
    object UniDBEdit14: TUniDBEdit
      Left = 100
      Top = 129
      Width = 35
      Height = 27
      DataField = 'country'
      DataSource = PatientDS
      TabOrder = 21
    end
    object UniDBLookupComboBox12: TUniDBLookupComboBox
      Left = 141
      Top = 129
      Width = 286
      Height = 27
      ListFormat = 'nationality:name:nationality'
      ListFieldIndex = 0
      ClearButton = True
      DataField = 'country'
      DataSource = PatientDS
      TabOrder = 22
      Color = clWindow
      RemoteQuery = True
      RemoteQueryDelay = 50
      Style = csDropDown
      OnGetKeyValue = UniDBLookupComboBox2GetKeyValue
      OnRemoteQuery = UniDBLookupComboBox2RemoteQuery
    end
    object UniDBCheckBox2: TUniDBCheckBox
      Left = 443
      Top = 134
      Width = 161
      Height = 17
      DataField = 'is_card_destroy'
      DataSource = PatientDS
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = #3649#3615#3657#3617#3606#3641#3585#3607#3635#3621#3634#3618'  '#3623#3633#3609#3607#3637#3656
      TabOrder = 23
      ParentColor = False
      Color = clBtnFace
    end
    object UniDBDateTimePicker1: TUniDBDateTimePicker
      Left = 610
      Top = 129
      Width = 120
      Height = 27
      DataField = 'card_destroy_date'
      DataSource = PatientDS
      DateTime = 43852.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 24
    end
    object UniDBEdit11: TUniDBEdit
      Left = 329
      Top = 63
      Width = 35
      Height = 27
      DataField = 'amppart'
      DataSource = PatientDS
      TabOrder = 25
      OnChange = UniDBEdit11Change
    end
    object UniDBEdit12: TUniDBEdit
      Left = 552
      Top = 63
      Width = 35
      Height = 27
      DataField = 'tmbpart'
      DataSource = PatientDS
      TabOrder = 26
      OnChange = UniDBEdit12Change
    end
    object UniDBEdit10: TUniDBEdit
      Left = 100
      Top = 63
      Width = 35
      Height = 27
      DataField = 'chwpart'
      DataSource = PatientDS
      TabOrder = 27
      OnChange = UniDBEdit10Change
    end
  end
  object UniGroupBox4: TUniGroupBox
    Left = 753
    Top = 273
    Width = 331
    Height = 397
    Caption = #3586#3657#3629#3617#3641#3621#3629#3639#3656#3609#3654
    TabOrder = 3
    object UniScrollBox1: TUniScrollBox
      Left = 2
      Top = 21
      Width = 327
      Height = 374
      Align = alClient
      TabOrder = 1
      ScrollHeight = 357
      ScrollWidth = 284
      object UniLabel38: TUniLabel
        Left = 62
        Top = 333
        Width = 37
        Height = 19
        Caption = #3607#3637#3656#3591#3634#3609
        ParentFont = False
        Font.Height = -16
        TabOrder = 0
      end
      object UniDBEdit22: TUniDBEdit
        Left = 105
        Top = 330
        Width = 179
        Height = 27
        DataField = 'work_addr'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 1
      end
      object UniDBEdit21: TUniDBEdit
        Left = 105
        Top = 297
        Width = 179
        Height = 27
        DataField = 'alias_name'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 2
      end
      object UniLabel37: TUniLabel
        Left = 54
        Top = 301
        Width = 45
        Height = 19
        Caption = #3594#3639#3656#3629#3648#3621#3656#3609
        ParentFont = False
        Font.Height = -16
        TabOrder = 3
      end
      object UniLabel36: TUniLabel
        Left = 19
        Top = 268
        Width = 80
        Height = 19
        Caption = #3648#3621#3586#3607#3637#3656#3629#3657#3634#3591#3629#3636#3591
        ParentFont = False
        Font.Height = -16
        TabOrder = 4
      end
      object UniDBEdit20: TUniDBEdit
        Left = 105
        Top = 264
        Width = 179
        Height = 27
        DataField = 'oldcode'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 5
      end
      object UniDBLookupComboBox13: TUniDBLookupComboBox
        Left = 84
        Top = 231
        Width = 80
        Height = 27
        ListField = 'lang_name'
        ListSource = PatientLangDS
        KeyField = 'lang'
        ListFieldIndex = 0
        DataField = 'lang'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 6
        Color = clWindow
      end
      object UniLabel34: TUniLabel
        Left = 11
        Top = 235
        Width = 67
        Height = 19
        Caption = #3616#3634#3625#3634#3627#3621#3633#3585
        ParentFont = False
        Font.Height = -16
        TabOrder = 7
      end
      object UniLabel35: TUniLabel
        Left = 170
        Top = 235
        Width = 28
        Height = 19
        Caption = #3626#3637#3612#3636#3623
        ParentFont = False
        Font.Height = -16
        TabOrder = 8
      end
      object UniDBEdit19: TUniDBEdit
        Left = 126
        Top = 198
        Width = 158
        Height = 27
        DataField = 'passport_no'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 9
      end
      object UniLabel33: TUniLabel
        Left = 19
        Top = 203
        Width = 101
        Height = 19
        Caption = #3648#3621#3586#3607#3637#3656' Passport'
        ParentFont = False
        Font.Height = -16
        TabOrder = 10
      end
      object UniDBEdit18: TUniDBEdit
        Left = 70
        Top = 165
        Width = 214
        Height = 27
        DataField = 'email'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 11
      end
      object UniLabel32: TUniLabel
        Left = 19
        Top = 170
        Width = 45
        Height = 19
        Caption = 'E-mail'
        ParentFont = False
        Font.Height = -16
        TabOrder = 12
      end
      object UniLabel31: TUniLabel
        Left = 14
        Top = 136
        Width = 146
        Height = 19
        Caption = #3648#3610#3629#3619#3660#3650#3607#3619#3624#3633#3614#3607#3660#3607#3637#3656#3607#3635#3591#3634#3609
        ParentFont = False
        Font.Height = -16
        TabOrder = 13
      end
      object UniDBEdit17: TUniDBEdit
        Left = 166
        Top = 132
        Width = 118
        Height = 27
        DataField = 'worktel'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 14
      end
      object UniDBEdit16: TUniDBEdit
        Left = 53
        Top = 99
        Width = 231
        Height = 27
        DataField = 'mobile_phone_number'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 15
      end
      object UniLabel30: TUniLabel
        Left = 8
        Top = 103
        Width = 39
        Height = 19
        Caption = #3617#3639#3629#3606#3639#3629
        ParentFont = False
        Font.Height = -16
        TabOrder = 16
      end
      object UniLabel29: TUniLabel
        Left = 19
        Top = 69
        Width = 28
        Height = 19
        Caption = #3610#3657#3634#3609
        ParentFont = False
        Font.Height = -16
        TabOrder = 17
      end
      object UniDBEdit15: TUniDBEdit
        Left = 53
        Top = 66
        Width = 231
        Height = 27
        DataField = 'hometel'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 18
      end
      object UniDBCheckBox3: TUniDBCheckBox
        Left = 19
        Top = 11
        Width = 192
        Height = 24
        DataField = 'inregion'
        DataSource = PatientDS
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = #3629#3618#3641#3656#3651#3609#3648#3586#3605#3588#3623#3634#3617#3619#3633#3610#3612#3636#3604#3594#3629#3610
        ParentFont = False
        Font.Height = -16
        TabOrder = 19
        ParentColor = False
        Color = clBtnFace
      end
      object UniDBCheckBox4: TUniDBCheckBox
        Left = 19
        Top = 36
        Width = 185
        Height = 24
        DataField = 'legal_action'
        DataSource = PatientDS
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = #3612#3641#3657#3611#3656#3623#3618#3588#3604#3637#3588#3623#3634#3617
        ParentFont = False
        Font.Height = -16
        TabOrder = 20
        ParentColor = False
        Color = clBtnFace
      end
      object UniDBLookupComboBox14: TUniDBLookupComboBox
        Left = 204
        Top = 231
        Width = 80
        Height = 27
        ListField = 'patient_color_name'
        ListSource = PatientColorDS
        KeyField = 'patient_color_id'
        ListFieldIndex = 0
        DataField = 'patient_color_id'
        DataSource = PatientDS
        ParentFont = False
        Font.Height = -16
        TabOrder = 21
        Color = clWindow
      end
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 437
    Width = 744
    Height = 254
    ActivePage = UniTabSheet1
    TabOrder = 4
    object UniTabSheet1: TUniTabSheet
      Caption = #3586#3657#3629#3617#3641#3621#3597#3634#3605#3636
    end
    object UniTabSheet2: TUniTabSheet
      Caption = #3586#3657#3629#3617#3641#3621#3607#3634#3591#3626#3633#3591#3588#3617
      OnBeforeActivate = UniTabSheet2BeforeActivate
      OnBeforeFirstActivate = UniTabSheet2BeforeFirstActivate
    end
    object UniTabSheet3: TUniTabSheet
      Caption = #3611#3619#3632#3648#3616#3607#3610#3640#3588#3588#3621
      OnBeforeActivate = UniTabSheet3BeforeActivate
      OnBeforeFirstActivate = UniTabSheet3BeforeFirstActivate
    end
    object UniTabSheet4: TUniTabSheet
      Caption = #3610#3640#3588#3588#3621#3605#3656#3634#3591#3604#3657#3634#3623
      Font.Height = -16
      ParentFont = False
      OnBeforeActivate = UniTabSheet4BeforeActivate
      OnBeforeFirstActivate = UniTabSheet4BeforeFirstActivate
    end
    object UniTabSheet5: TUniTabSheet
      Caption = #3586#3657#3629#3617#3641#3621#3585#3634#3619#3648#3585#3636#3604
      OnBeforeActivate = UniTabSheet5BeforeActivate
      OnBeforeFirstActivate = UniTabSheet5BeforeFirstActivate
    end
    object UniTabSheet6: TUniTabSheet
      Caption = #3585#3634#3619#3648#3626#3637#3618#3594#3637#3623#3636#3605
      OnBeforeActivate = UniTabSheet6BeforeActivate
      OnBeforeFirstActivate = UniTabSheet6BeforeFirstActivate
    end
    object UniTabSheet7: TUniTabSheet
      Caption = #3594#3639#3656#3629#3616#3634#3625#3634#3629#3633#3591#3585#3620#3625
      object UniScrollBox2: TUniScrollBox
        Left = 0
        Top = 0
        Width = 736
        Height = 220
        Align = alClient
        TabOrder = 0
        ScrollHeight = 177
        ScrollWidth = 651
        object UniLabel39: TUniLabel
          Left = 15
          Top = 13
          Width = 40
          Height = 19
          Caption = 'Prefix'
          ParentFont = False
          Font.Height = -16
          TabOrder = 0
        end
        object UniDBComboBox2: TUniDBComboBox
          Left = 65
          Top = 9
          Width = 88
          Height = 27
          DataField = 'eng_pname'
          DataSource = PatientEngDS
          Items.Strings = (
            'Mr.'
            'Mrs.')
          ParentFont = False
          Font.Height = -16
          TabOrder = 1
          IconItems = <>
        end
        object UniLabel40: TUniLabel
          Left = 163
          Top = 13
          Width = 76
          Height = 19
          Caption = 'First Name'
          ParentFont = False
          Font.Height = -16
          TabOrder = 2
        end
        object UniDBEdit23: TUniDBEdit
          Left = 251
          Top = 9
          Width = 400
          Height = 27
          DataField = 'eng_fname'
          DataSource = PatientEngDS
          ParentFont = False
          Font.Height = -16
          TabOrder = 3
        end
        object UniLabel41: TUniLabel
          Left = 147
          Top = 46
          Width = 92
          Height = 19
          Caption = 'Middle Name'
          ParentFont = False
          Font.Height = -16
          TabOrder = 4
        end
        object UniDBEdit24: TUniDBEdit
          Left = 251
          Top = 42
          Width = 400
          Height = 27
          DataField = 'eng_mname'
          DataSource = PatientEngDS
          ParentFont = False
          Font.Height = -16
          TabOrder = 5
        end
        object UniLabel42: TUniLabel
          Left = 170
          Top = 76
          Width = 74
          Height = 19
          Caption = 'Last Name'
          ParentFont = False
          Font.Height = -16
          TabOrder = 6
        end
        object UniDBEdit25: TUniDBEdit
          Left = 251
          Top = 75
          Width = 400
          Height = 27
          DataField = 'eng_lname'
          DataSource = PatientEngDS
          ParentFont = False
          Font.Height = -16
          TabOrder = 7
        end
        object UniLabel45: TUniLabel
          Left = 15
          Top = 119
          Width = 57
          Height = 19
          Caption = 'Address'
          ParentFont = False
          Font.Height = -16
          TabOrder = 8
        end
        object UniDBEdit28: TUniDBEdit
          Left = 83
          Top = 116
          Width = 568
          Height = 27
          DataField = 'eng_full_address1'
          DataSource = PatientEngDS
          ParentFont = False
          Font.Height = -16
          TabOrder = 9
        end
        object UniDBEdit26: TUniDBEdit
          Left = 83
          Top = 150
          Width = 568
          Height = 27
          DataField = 'eng_full_address2'
          DataSource = PatientEngDS
          ParentFont = False
          Font.Height = -16
          TabOrder = 10
        end
      end
    end
  end
  object UniGroupBox5: TUniGroupBox
    Left = 910
    Top = -4
    Width = 180
    Height = 238
    Caption = #3621#3634#3618#3609#3636#3657#3623#3617#3639#3629
    TabOrder = 5
    object UniSimplePanel1: TUniSimplePanel
      Left = 2
      Top = 209
      Width = 176
      Height = 27
      ParentColor = False
      Align = alBottom
      TabOrder = 1
    end
    object UniDBImage2: TUniDBImage
      Left = 2
      Top = 21
      Width = 176
      Height = 188
      DataField = 'scan_image'
      DataSource = FingerDS
      Stretch = True
      Proportional = True
      Align = alClient
    end
  end
  object UniButton7: TUniButton
    Left = 753
    Top = 244
    Width = 144
    Height = 25
    Caption = #3629#3656#3634#3609#3610#3633#3605#3619#3611#3619#3632#3594#3634#3594#3609
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 6
    OnClick = UniButton7Click
  end
  object UniButton8: TUniButton
    Left = 903
    Top = 244
    Width = 184
    Height = 25
    Caption = #3592#3629#3591' '#3609#3633#3604' Online'
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 7
    OnClick = UniButton8Click
  end
  object PatientCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from patient limit 0'#13#10
    Params = <>
    AfterOpen = PatientCDSAfterOpen
    BeforePost = PatientCDSBeforePost
    OnNewRecord = PatientCDSNewRecord
    Left = 534
    Top = 13
    Data = {
      221A00009619E0BD010000001800000064000000000003000000221A08686F73
      5F677569640100490000000200055749445448020002002600064F524947494E
      02004980110070617469656E742E686F735F677569640002686E010049000000
      0200055749445448020002000900064F524947494E020049800B007061746965
      6E742E686E0005706E616D650100490000000200055749445448020002000F00
      064F524947494E020049800E0070617469656E742E706E616D650005666E616D
      650100490000000200055749445448020002001E00064F524947494E02004980
      0E0070617469656E742E666E616D6500056C6E616D6501004900000002000557
      49445448020002001E00064F524947494E020049800E0070617469656E742E6C
      6E616D65000A6F636375706174696F6E01004900000002000557494454480200
      02000400064F524947494E02004980130070617469656E742E6F636375706174
      696F6E000B636974697A656E7368697001004900000003000753554254595045
      020049000A0046697865644368617200055749445448020002000300064F5249
      47494E02004980140070617469656E742E636974697A656E7368697000086269
      7274686461790400060000000100064F524947494E0200498011007061746965
      6E742E6269727468646179000861646472706172740100490000000200055749
      445448020002003200064F524947494E02004980110070617469656E742E6164
      64727061727400076D6F6F706172740100490000000300075355425459504502
      0049000A0046697865644368617200055749445448020002000300064F524947
      494E02004980100070617469656E742E6D6F6F706172740007746D6270617274
      01004900000003000753554254595045020049000A0046697865644368617200
      055749445448020002000200064F524947494E02004980100070617469656E74
      2E746D62706172740007616D7070617274010049000000030007535542545950
      45020049000A0046697865644368617200055749445448020002000200064F52
      4947494E02004980100070617469656E742E616D707061727400076368777061
      727401004900000003000753554254595045020049000A004669786564436861
      7200055749445448020002000200064F524947494E0200498010007061746965
      6E742E636877706172740008626C6F6F64677270010049000000020005574944
      5448020002001400064F524947494E02004980110070617469656E742E626C6F
      6F646772700006636C696E696301004900000002000557494454480200020064
      00064F524947494E020049800F0070617469656E742E636C696E696300086465
      6174686461790400060000000100064F524947494E0200498011007061746965
      6E742E6465617468646179000B64727567616C6C657267790100490000000200
      05574944544802000200FA00064F524947494E02004980140070617469656E74
      2E64727567616C6C65726779000866616D696C796E6F0400010000000100064F
      524947494E02004980110070617469656E742E66616D696C796E6F000A666174
      6865726E616D650100490000000200055749445448020002003200064F524947
      494E02004980130070617469656E742E6661746865726E616D65000866697273
      746461790400060000000100064F524947494E02004980110070617469656E74
      2E66697273746461790007686F6D6574656C0100490000000200055749445448
      020002001400064F524947494E02004980100070617469656E742E686F6D6574
      656C000A696E666F726D61646472010049000000020005574944544802000200
      C800064F524947494E02004980130070617469656E742E696E666F726D616464
      72000A696E666F726D6E616D6501004900000002000557494454480200020032
      00064F524947494E02004980130070617469656E742E696E666F726D6E616D65
      000E696E666F726D72656C6174696F6E01004900000002000557494454480200
      02003200064F524947494E02004980170070617469656E742E696E666F726D72
      656C6174696F6E0009696E666F726D74656C0100490000000200055749445448
      020002001400064F524947494E02004980120070617469656E742E696E666F72
      6D74656C000B6D61727279737461747573010049000000030007535542545950
      45020049000A0046697865644368617200055749445448020002000100064F52
      4947494E02004980140070617469656E742E6D61727279737461747573000A6D
      61746865726E616D650100490000000200055749445448020002003200064F52
      4947494E02004980130070617469656E742E6D61746865726E616D650006686E
      5F696E740400010000000100064F524947494E020049800F0070617469656E74
      2E686E5F696E74000B6E6174696F6E616C697479010049000000030007535542
      54595045020049000A0046697865644368617200055749445448020002000300
      064F524947494E02004980140070617469656E742E6E6174696F6E616C697479
      000B6F70646C6F636174696F6E01004900000002000557494454480200020032
      00064F524947494E02004980140070617469656E742E6F70646C6F636174696F
      6E000670747479706501004900000003000753554254595045020049000A0046
      697865644368617200055749445448020002000200064F524947494E02004980
      0F0070617469656E742E707474797065000872656C6967696F6E010049000000
      03000753554254595045020049000A0046697865644368617200055749445448
      020002000200064F524947494E02004980110070617469656E742E72656C6967
      696F6E000373657801004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E020049800C
      0070617469656E742E73657800077370736E616D650100490000000200055749
      445448020002003200064F524947494E02004980100070617469656E742E7370
      736E616D65000C74727565626972746864617901004900000003000753554254
      595045020049000A004669786564436861720005574944544802000200010006
      4F524947494E02004980150070617469656E742E747275656269727468646179
      0008776F726B616464720100490000000200055749445448020002003200064F
      524947494E02004980110070617469656E742E776F726B616464720007776F72
      6B74656C0100490000000200055749445448020002001400064F524947494E02
      004980100070617469656E742E776F726B74656C000568636F64650100490000
      000200055749445448020002000500064F524947494E020049800E0070617469
      656E742E68636F64650003636964010049000000020005574944544802000200
      0D00064F524947494E020049800C0070617469656E742E636964000368696404
      00010000000100064F524947494E020049800C0070617469656E742E68696400
      076564756361746501004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E0200498010
      0070617469656E742E65647563617465000D66616D696C795F73746174757301
      004900000003000753554254595045020049000A004669786564436861720005
      5749445448020002000100064F524947494E02004980160070617469656E742E
      66616D696C795F737461747573000A6C61626F725F7479706501004900000003
      000753554254595045020049000A004669786564436861720005574944544802
      0002000100064F524947494E02004980130070617469656E742E6C61626F725F
      74797065000B6C6173745F7570646174650800080000000100064F524947494E
      02004980140070617469656E742E6C6173745F7570646174650009747970655F
      6172656101004900000003000753554254595045020049000A00466978656443
      68617200055749445448020002000100064F524947494E020049801200706174
      69656E742E747970655F617265610004726F6164010049000000020005574944
      5448020002003200064F524947494E020049800D0070617469656E742E726F61
      64000A6661746865725F6369640100490000000200055749445448020002000D
      00064F524947494E02004980130070617469656E742E6661746865725F636964
      000A6D6F746865725F6369640100490000000200055749445448020002000D00
      064F524947494E02004980130070617469656E742E6D6F746865725F63696400
      0A636F75706C655F6369640100490000000200055749445448020002000D0006
      4F524947494E02004980130070617469656E742E636F75706C655F636964000B
      706572736F6E5F7479706501004900000003000753554254595045020049000A
      0046697865644368617200055749445448020002000200064F524947494E0200
      4980140070617469656E742E706572736F6E5F74797065001370726976617465
      5F646F63746F725F6E616D650100490000000200055749445448020002004B00
      064F524947494E020049801C0070617469656E742E707269766174655F646F63
      746F725F6E616D65000C6C6567616C5F616374696F6E01004900000003000753
      554254595045020049000A004669786564436861720005574944544802000200
      0100064F524947494E02004980150070617469656E742E6C6567616C5F616374
      696F6E000D64656174685F636F64653530340100490000000300075355425459
      5045020049000A0046697865644368617200055749445448020002000200064F
      524947494E02004980160070617469656E742E64656174685F636F6465353034
      000A64656174685F646961670100490000000200055749445448020002000600
      064F524947494E02004980130070617469656E742E64656174685F6469616700
      076E6F64655F696401004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E0200498010
      0070617469656E742E6E6F64655F6964000561646D6974010049000000030007
      53554254595045020049000A0046697865644368617200055749445448020002
      000100064F524947494E020049800E0070617469656E742E61646D697400076D
      69646E616D650100490000000200055749445448020002001900064F52494749
      4E02004980100070617469656E742E6D69646E616D650007706F5F636F646501
      00490000000200055749445448020002000500064F524947494E020049801000
      70617469656E742E706F5F636F6465000B6661746865726C6E616D6501004900
      00000200055749445448020002001E00064F524947494E020049801400706174
      69656E742E6661746865726C6E616D65000B6D6F746865726C6E616D65010049
      0000000200055749445448020002001E00064F524947494E0200498014007061
      7469656E742E6D6F746865726C6E616D6500087370736C6E616D650100490000
      000200055749445448020002001E00064F524947494E02004980110070617469
      656E742E7370736C6E616D650007636F756E7472790100490000000300075355
      4254595045020049000A00466978656443686172000557494454480200020002
      00064F524947494E02004980100070617469656E742E636F756E747279000565
      6D61696C0100490000000200055749445448020002003200064F524947494E02
      0049800E0070617469656E742E656D61696C0009626972746874696D65040007
      0000000100064F524947494E02004980120070617469656E742E626972746874
      696D6500096D6F746865725F686E010049000000020005574944544802000200
      0900064F524947494E02004980120070617469656E742E6D6F746865725F686E
      000A6C6173745F76697369740400060000000100064F524947494E0200498013
      0070617469656E742E6C6173745F766973697400056465617468010049000000
      03000753554254595045020049000A0046697865644368617200055749445448
      020002000100064F524947494E020049800E0070617469656E742E6465617468
      00066865696768740400010000000100064F524947494E020049800F00706174
      69656E742E6865696768740008696E726567696F6E0100490000000300075355
      4254595045020049000A00466978656443686172000557494454480200020001
      00064F524947494E02004980110070617469656E742E696E726567696F6E0008
      7265675F74696D650400070000000100064F524947494E020049801100706174
      69656E742E7265675F74696D6500076F6C64636F646501004900000002000557
      49445448020002003200064F524947494E02004980100070617469656E742E6F
      6C64636F646500046C616E670100490000000300075355425459504502004900
      0A0046697865644368617200055749445448020002000200064F524947494E02
      0049800D0070617469656E742E6C616E67000E676F765F6368726F6E69635F69
      640100490000000200055749445448020002000A00064F524947494E02004980
      170070617469656E742E676F765F6368726F6E69635F69640007696E5F637570
      7301004900000003000753554254595045020049000A00466978656443686172
      00055749445448020002000100064F524947494E02004980100070617469656E
      742E696E5F63757073000F70617469656E745F747970655F6964010001000000
      0100064F524947494E02004980180070617469656E742E70617469656E745F74
      7970655F69640008616464725F736F6901004900000002000557494454480200
      02006400064F524947494E02004980110070617469656E742E616464725F736F
      690009776F726B5F61646472010049000000020005574944544802000200E600
      064F524947494E02004980120070617469656E742E776F726B5F616464720009
      6661746865725F686E0100490000000200055749445448020002000900064F52
      4947494E02004980120070617469656E742E6661746865725F686E000A616C69
      61735F6E616D650100490000000200055749445448020002006400064F524947
      494E02004980130070617469656E742E616C6961735F6E616D65000964657374
      726F79656401004900000003000753554254595045020049000A004669786564
      4368617200055749445448020002000100064F524947494E0200498012007061
      7469656E742E64657374726F79656400086F6C645F6164647201004900000002
      0005574944544802000200FA00064F524947494E02004980110070617469656E
      742E6F6C645F61646472000D666E616D655F736F756E64657801004900000002
      00055749445448020002003200064F524947494E02004980160070617469656E
      742E666E616D655F736F756E646578000D6C6E616D655F736F756E6465780100
      490000000200055749445448020002003200064F524947494E02004980160070
      617469656E742E6C6E616D655F736F756E646578000D626C6F6F6467726F7570
      5F72680100490000000200055749445448020002000500064F524947494E0200
      4980160070617469656E742E626C6F6F6467726F75705F7268000B7061737370
      6F72745F6E6F0100490000000200055749445448020002001900064F52494749
      4E02004980140070617469656E742E70617373706F72745F6E6F000961646472
      65737369640100490000000200055749445448020002000600064F524947494E
      02004980120070617469656E742E61646472657373696400136D6F62696C655F
      70686F6E655F6E756D6265720100490000000200055749445448020002001400
      064F524947494E020049801C0070617469656E742E6D6F62696C655F70686F6E
      655F6E756D6265720010616E6F6E796D6F75735F706572736F6E010049000000
      03000753554254595045020049000A0046697865644368617200055749445448
      020002000100064F524947494E02004980190070617469656E742E616E6F6E79
      6D6F75735F706572736F6E0016686F73706974616C5F6465706172746D656E74
      5F69640400010000000100064F524947494E020049801F0070617469656E742E
      686F73706974616C5F6465706172746D656E745F6964000D6D656D6265726361
      72645F6E6F0100490000000200055749445448020002000F00064F524947494E
      02004980160070617469656E742E6D656D626572636172645F6E6F000865635F
      666E616D650100490000000200055749445448020002003200064F524947494E
      02004980110070617469656E742E65635F666E616D65000865635F6C6E616D65
      0100490000000200055749445448020002003200064F524947494E0200498011
      0070617469656E742E65635F6C6E616D65001365635F72656C6174696F6E5F74
      7970655F69640400010000000100064F524947494E020049801C007061746965
      6E742E65635F72656C6174696F6E5F747970655F6964001070617469656E745F
      636F6C6F725F69640400010000000100064F524947494E020049801900706174
      69656E742E70617469656E745F636F6C6F725F696400136E756D6265725F6F66
      5F72656C6174697665730400010000000100064F524947494E020049801C0070
      617469656E742E6E756D6265725F6F665F72656C617469766573000B62697274
      685F6F726465720400010000000100064F524947494E02004980140070617469
      656E742E62697274685F6F726465720014706572736F6E5F6C61626F725F7479
      70655F69640400010000000100064F524947494E020049801D0070617469656E
      742E706572736F6E5F6C61626F725F747970655F6964000F69735F636172645F
      64657374726F7901004900000003000753554254595045020049000A00466978
      65644368617200055749445448020002000100064F524947494E020049801800
      70617469656E742E69735F636172645F64657374726F790011636172645F6465
      7374726F795F646174650400060000000100064F524947494E020049801A0070
      617469656E742E636172645F64657374726F795F646174650004673670640100
      4900000003000753554254595045020049000A00466978656443686172000557
      49445448020002000100064F524947494E020049800D0070617469656E742E67
      367064000000}
  end
  object PatientDS: TDataSource
    DataSet = PatientCDS
    Left = 619
    Top = 13
  end
  object PatientImageCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from patient_image limit 0'#13#10
    Params = <>
    BeforePost = PatientImageCDSBeforePost
    Left = 710
    Top = 25
  end
  object PatientImageDS: TDataSource
    DataSet = PatientImageCDS
    Left = 790
    Top = 24
  end
  object FingerCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = ' select * from finger_scan limit 0'#13#10
    Params = <>
    Left = 871
    Top = 18
    Data = {
      CC0000009619E0BD010000001800000003000000000003000000CC0002696404
      00010000000100064F524947494E020049800F0066696E6765725F7363616E2E
      6964000A7363616E5F696D61676504004B000000020007535542545950450200
      4900070042696E61727900064F524947494E02004980170066696E6765725F73
      63616E2E7363616E5F696D6167650008686F735F677569640100490000000200
      055749445448020002002600064F524947494E02004980150066696E6765725F
      7363616E2E686F735F67756964000000}
  end
  object FingerDS: TDataSource
    DataSet = FingerCDS
    Left = 931
    Top = 24
  end
  object UniFileUpload1: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = 'image/jpeg'
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = UniFileUpload1Completed
    Left = 628
    Top = 84
  end
  object PatientEngDS: TDataSource
    DataSet = PatientEngCDS
    Left = 984
    Top = 171
  end
  object PatientEngCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from patient_eng LIMIT 0'#13#10
    Params = <>
    BeforePost = PatientEngCDSBeforePost
    Left = 1048
    Top = 174
    Data = {
      DA0300009619E0BD01000000180000000E000000000003000000DA0302686E01
      00490000000200055749445448020002000900064F524947494E020049800F00
      70617469656E745F656E672E686E0009656E675F706E616D6501004900000002
      00055749445448020002003200064F524947494E02004980160070617469656E
      745F656E672E656E675F706E616D650009656E675F666E616D65010049000000
      0200055749445448020002006400064F524947494E0200498016007061746965
      6E745F656E672E656E675F666E616D650009656E675F6D6E616D650100490000
      000200055749445448020002006400064F524947494E02004980160070617469
      656E745F656E672E656E675F6D6E616D650009656E675F6C6E616D6501004900
      00000200055749445448020002006400064F524947494E020049801600706174
      69656E745F656E672E656E675F6C6E616D65000C656E675F6164647270617274
      0100490000000200055749445448020002006400064F524947494E0200498019
      0070617469656E745F656E672E656E675F6164647270617274000B656E675F6D
      6F6F706172740100490000000200055749445448020002003200064F52494749
      4E02004980180070617469656E745F656E672E656E675F6D6F6F706172740008
      656E675F726F61640100490000000200055749445448020002009600064F5249
      47494E02004980150070617469656E745F656E672E656E675F726F6164000C65
      6E675F70726F76696E6365010049000000020005574944544802000200640006
      4F524947494E02004980190070617469656E745F656E672E656E675F70726F76
      696E6365000C656E675F64697374726963740100490000000200055749445448
      020002006400064F524947494E02004980190070617469656E745F656E672E65
      6E675F6469737472696374000F656E675F737562646973747269637401004900
      00000200055749445448020002006400064F524947494E020049801C00706174
      69656E745F656E672E656E675F73756264697374726963740009656E675F7063
      6F64650100490000000200055749445448020002000A00064F524947494E0200
      4980160070617469656E745F656E672E656E675F70636F64650011656E675F66
      756C6C5F6164647265737331010049000000020005574944544802000200FA00
      064F524947494E020049801E0070617469656E745F656E672E656E675F66756C
      6C5F61646472657373310011656E675F66756C6C5F6164647265737332010049
      000000020005574944544802000200FA00064F524947494E020049801E007061
      7469656E745F656E672E656E675F66756C6C5F6164647265737332000000}
  end
  object PatientLangCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1048
    Top = 304
  end
  object PatientLangDS: TDataSource
    DataSet = PatientLangCDS
    Left = 1000
    Top = 304
  end
  object PatientColorDS: TDataSource
    DataSet = PatientColorCDS
    Left = 1000
    Top = 360
  end
  object PatientColorCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1048
    Top = 360
  end
  object MophICPopup: TUniPopupMenu
    Left = 130
    Top = 111
    object CheckMOPHIC1: TUniMenuItem
      Caption = 'Check MOPH-IC'
      OnClick = CheckMOPHIC1Click
    end
  end
  object PatientAddressCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from patient_address where 1<0'#13#10
    Params = <>
    OnNewRecord = PatientAddressCDSNewRecord
    Left = 304
    Top = 26
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
    Left = 398
    Top = 37
  end
end
