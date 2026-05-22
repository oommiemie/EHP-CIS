object MOPHClaimPatientVisitEntryForm: TMOPHClaimPatientVisitEntryForm
  Left = 0
  Top = 0
  ClientHeight = 798
  ClientWidth = 1085
  Caption = 'MOPHClaimPatientVisitEntryForm'
  OldCreateOrder = False
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  ActiveControl = CIDEdit
  Font.Height = -16
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1085
    Height = 45
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    DesignSize = (
      1085
      45)
    object UniLabel1: TUniLabel
      Left = 18
      Top = 13
      Width = 374
      Height = 19
      Caption = #3586#3657#3629#3617#3641#3621#3651#3627#3657#3610#3619#3636#3585#3634#3619#3612#3641#3657#3619#3633#3610#3610#3619#3636#3585#3634#3619#3651#3609#3650#3588#3619#3591#3585#3634#3619' MOPH Claim'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-0'
    end
    object UniButton6: TUniButton
      Left = 889
      Top = 10
      Width = 106
      Height = 25
      Caption = #3649#3626#3604#3591' Lab'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = UniButton6Click
    end
    object UniButton8: TUniButton
      Left = 1004
      Top = 10
      Width = 75
      Height = 25
      Caption = #3621#3610#3586#3657#3629#3617#3641#3621
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      OnClick = UniButton8Click
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 751
    Width = 1085
    Height = 47
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      1085
      47)
    object UniButton1: TUniButton
      Left = 980
      Top = 9
      Width = 85
      Height = 28
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 885
      Top = 9
      Width = 89
      Height = 28
      Caption = #3610#3633#3609#3607#3638#3585
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 4
      OnClick = UniButton2Click
    end
    object SendUATCheck: TUniCheckBox
      Left = 15
      Top = 15
      Width = 259
      Height = 17
      Caption = #3626#3656#3591#3586#3657#3629#3617#3641#3621' DM/HT '#3648#3586#3657#3634' '#3619#3632#3610#3610#3607#3604#3626#3629#3610
      TabOrder = 3
    end
    object ShowPayloadCheck: TUniCheckBox
      Left = 297
      Top = 16
      Width = 153
      Height = 17
      Caption = 'Show Payload'
      TabOrder = 4
    end
  end
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 45
    Width = 1085
    Height = 92
    Caption = #3586#3657#3629#3617#3641#3621#3612#3641#3657#3619#3633#3610#3610#3619#3636#3585#3634#3619
    Align = alTop
    TabOrder = 2
    object UniLabel2: TUniLabel
      Left = 15
      Top = 44
      Width = 117
      Height = 19
      Caption = #3648#3621#3586#3611#3594#3594'. 13 '#3627#3621#3633#3585
      TabOrder = 1
    end
    object CIDEdit: TUniEdit
      Left = 140
      Top = 41
      Width = 153
      Height = 28
      Alignment = taCenter
      ParentFont = False
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
      OnChange = CIDEditChange
    end
    object UniButton3: TUniButton
      Left = 373
      Top = 41
      Width = 98
      Height = 28
      Caption = #3649#3626#3604#3591#3586#3657#3629#3617#3641#3621
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      OnClick = UniButton3Click
    end
    object UniLabel11: TUniLabel
      Left = 477
      Top = 45
      Width = 29
      Height = 19
      Caption = #3623#3633#3609#3607#3637#3656
      TabOrder = 4
    end
    object VisitDateEdit: TUniDateTimePicker
      Left = 518
      Top = 41
      Width = 120
      Height = 28
      DateTime = 43873.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 5
    end
    object UniLabel12: TUniLabel
      Left = 644
      Top = 44
      Width = 31
      Height = 19
      Caption = #3648#3623#3621#3634
      TabOrder = 6
    end
    object VisitTimeEdit: TUniEdit
      Left = 681
      Top = 41
      Width = 69
      Height = 28
      Alignment = taCenter
      TabOrder = 7
      InputMask.Mask = '99:99'
    end
    object HNSearchButton: TUniButton
      Left = 299
      Top = 41
      Width = 68
      Height = 28
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 8
      ImageIndex = 2
      OnClick = HNSearchButtonClick
    end
  end
  object UniGroupBox2: TUniGroupBox
    Left = 0
    Top = 137
    Width = 1085
    Height = 119
    Caption = #3586#3657#3629#3617#3641#3621#3607#3633#3656#3623#3652#3611
    Align = alTop
    TabOrder = 3
    object UniLabel3: TUniLabel
      Left = 26
      Top = 39
      Width = 22
      Height = 19
      Caption = 'HN'
      TabOrder = 1
    end
    object UniDBEdit1: TUniDBEdit
      Left = 58
      Top = 35
      Width = 152
      Height = 28
      DataField = 'hn'
      DataSource = PatientDS
      TabOrder = 2
    end
    object UniLabel4: TUniLabel
      Left = 222
      Top = 39
      Width = 36
      Height = 19
      Caption = #3588#3635#3609#3635
      TabOrder = 3
    end
    object UniDBEdit2: TUniDBEdit
      Left = 271
      Top = 35
      Width = 119
      Height = 28
      DataField = 'pname'
      DataSource = PatientDS
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 402
      Top = 39
      Width = 20
      Height = 19
      Caption = #3594#3639#3656#3629
      TabOrder = 5
    end
    object UniDBEdit3: TUniDBEdit
      Left = 432
      Top = 35
      Width = 189
      Height = 28
      DataField = 'fname'
      DataSource = PatientDS
      TabOrder = 6
    end
    object UniLabel6: TUniLabel
      Left = 627
      Top = 39
      Width = 57
      Height = 19
      Caption = #3609#3634#3617#3626#3585#3640#3621
      TabOrder = 7
    end
    object UniDBEdit4: TUniDBEdit
      Left = 694
      Top = 35
      Width = 189
      Height = 28
      DataField = 'lname'
      DataSource = PatientDS
      TabOrder = 8
    end
    object UniLabel7: TUniLabel
      Left = 9
      Top = 77
      Width = 42
      Height = 19
      Caption = #3623#3633#3609#3648#3585#3636#3604
      TabOrder = 9
    end
    object UniLabel8: TUniLabel
      Left = 222
      Top = 77
      Width = 64
      Height = 19
      Caption = #3610#3657#3634#3609#3648#3621#3586#3607#3637#3656
      TabOrder = 10
    end
    object UniDBEdit6: TUniDBEdit
      Left = 298
      Top = 73
      Width = 92
      Height = 28
      DataField = 'addrpart'
      DataSource = PatientDS
      TabOrder = 11
    end
    object UniLabel9: TUniLabel
      Left = 402
      Top = 77
      Width = 20
      Height = 19
      Caption = #3627#3617#3641#3656
      TabOrder = 12
    end
    object UniDBEdit7: TUniDBEdit
      Left = 443
      Top = 73
      Width = 66
      Height = 28
      DataField = 'moopart'
      DataSource = PatientDS
      TabOrder = 13
    end
    object UniLabel10: TUniLabel
      Left = 523
      Top = 77
      Width = 38
      Height = 19
      Caption = #3605#3635#3610#3621
      TabOrder = 14
    end
    object FullAddressEdit: TUniEdit
      Left = 577
      Top = 73
      Width = 306
      Height = 28
      TabOrder = 15
    end
    object BirthDateMaskEdit: TUniEdit
      Left = 58
      Top = 73
      Width = 152
      Height = 28
      Alignment = taCenter
      TabOrder = 16
      InputMask.Mask = '99/99/9999'
      InputMask.RemoveMaskChar = False
    end
    object UniLabel23: TUniLabel
      Left = 889
      Top = 39
      Width = 27
      Height = 19
      Caption = #3629#3634#3618#3640
      TabOrder = 17
    end
    object AgeEdit: TUniEdit
      Left = 922
      Top = 35
      Width = 143
      Height = 28
      TabOrder = 18
      OnEnter = AgeEditEnter
    end
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 256
    Width = 1085
    Height = 495
    ActivePage = UniTabSheet1
    Align = alClient
    TabOrder = 4
    ExplicitLeft = 15
    ExplicitTop = 395
    ExplicitWidth = 795
    ExplicitHeight = 479
    object UniTabSheet1: TUniTabSheet
      Caption = #3585#3634#3619#3619#3633#3610#3610#3619#3636#3585#3634#3619
      object VisitGroupBox: TUniGroupBox
        Left = 0
        Top = 0
        Width = 1077
        Height = 235
        Visible = False
        Caption = #3586#3657#3629#3617#3641#3621#3585#3634#3619#3619#3633#3610#3610#3619#3636#3585#3634#3619
        Align = alTop
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = -2
        object UniLabel13: TUniLabel
          Left = 35
          Top = 73
          Width = 38
          Height = 19
          Caption = #3649#3612#3609#3585
          TabOrder = 1
        end
        object UniDBEdit5: TUniDBEdit
          Left = 83
          Top = 71
          Width = 51
          Height = 28
          DataField = 'spclty'
          DataSource = OvstDS
          TabOrder = 2
        end
        object UniDBLookupComboBox1: TUniDBLookupComboBox
          Left = 140
          Top = 71
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
          Style = csDropDown
        end
        object UniLabel14: TUniLabel
          Left = 440
          Top = 73
          Width = 87
          Height = 19
          Caption = #3611#3619#3632#3648#3616#3607#3612#3641#3657#3611#3656#3623#3618
          TabOrder = 4
        end
        object UniDBLookupComboBox2: TUniDBLookupComboBox
          Left = 533
          Top = 71
          Width = 351
          Height = 28
          ListFormat = 'er_pt_type:name:er_pt_type:N'
          ListField = 'name'
          KeyField = 'er_pt_type'
          ListFieldIndex = 0
          DataField = 'er_pt_type'
          DataSource = OvstSEQDS
          AnyMatch = True
          TabOrder = 5
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel15: TUniLabel
          Left = 42
          Top = 107
          Width = 92
          Height = 19
          Caption = #3611#3619#3632#3648#3616#3607#3585#3634#3619#3617#3634
          TabOrder = 6
        end
        object UniDBLookupComboBox3: TUniDBLookupComboBox
          Left = 140
          Top = 105
          Width = 283
          Height = 28
          ListFormat = 'ovstist:name:ovstist:Y'
          ListField = 'name'
          KeyField = 'ovstist'
          ListFieldIndex = 0
          DataField = 'ovstist'
          DataSource = OvstDS
          AnyMatch = True
          TabOrder = 7
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel16: TUniLabel
          Left = 47
          Top = 141
          Width = 30
          Height = 19
          Caption = #3626#3636#3607#3608#3636
          TabOrder = 8
        end
        object UniDBEdit8: TUniDBEdit
          Left = 83
          Top = 139
          Width = 51
          Height = 28
          DataField = 'pttype'
          DataSource = VisitPttypeDS
          TabOrder = 9
        end
        object UniDBLookupComboBox4: TUniDBLookupComboBox
          Left = 140
          Top = 139
          Width = 422
          Height = 28
          ListFormat = 'pttype:name:pttype:Y'
          ListField = 'name'
          KeyField = 'pttype'
          ListFieldIndex = 0
          DataField = 'pttype'
          DataSource = VisitPttypeDS
          TabOrder = 10
          Color = clWindow
          RemoteQuery = True
          Style = csDropDown
          OnGetKeyValue = UniDBLookupComboBox4GetKeyValue
          OnRemoteQuery = UniDBLookupComboBox4RemoteQuery
        end
        object UniLabel17: TUniLabel
          Left = 435
          Top = 108
          Width = 88
          Height = 19
          Caption = #3611#3619#3632#3648#3616#3607#3588#3609#3652#3586#3657
          TabOrder = 11
        end
        object UniDBLookupComboBox5: TUniDBLookupComboBox
          Left = 533
          Top = 105
          Width = 351
          Height = 28
          ListFormat = 'pt_subtype:name:pt_subtype:N'
          ListField = 'name'
          KeyField = 'pt_subtype'
          ListFieldIndex = 0
          DataField = 'pt_subtype'
          DataSource = OvstDS
          AnyMatch = True
          TabOrder = 12
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel18: TUniLabel
          Left = 576
          Top = 141
          Width = 66
          Height = 19
          Caption = #3648#3621#3586#3607#3637#3656#3626#3636#3607#3608#3636
          TabOrder = 13
        end
        object UniDBEdit9: TUniDBEdit
          Left = 648
          Top = 139
          Width = 236
          Height = 28
          DataField = 'pttypeno'
          DataSource = VisitPttypeDS
          TabOrder = 14
        end
        object UniLabel22: TUniLabel
          Left = 55
          Top = 177
          Width = 75
          Height = 19
          Caption = 'Auth Code'
          TabOrder = 15
        end
        object UniDBEdit10: TUniDBEdit
          Left = 140
          Top = 173
          Width = 283
          Height = 28
          DataField = 'auth_code'
          DataSource = VisitPttypeDS
          TabOrder = 16
        end
        object UniButton4: TUniButton
          Left = 429
          Top = 173
          Width = 174
          Height = 28
          Caption = #3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636' '#3626#3611#3626#3594'.'
          ParentFont = False
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 17
          ImageIndex = 16
          OnClick = UniButton4Click
        end
        object UniButton5: TUniButton
          Left = 609
          Top = 173
          Width = 126
          Height = 28
          Caption = #3586#3629' Auth Code'
          ParentFont = False
          Font.Height = -13
          Font.Style = [fsBold]
          TabOrder = 18
          ImageIndex = 16
          OnClick = UniButton5Click
        end
        object UniLabel24: TUniLabel
          Left = 44
          Top = 36
          Width = 29
          Height = 19
          Caption = #3623#3633#3609#3607#3637#3656
          TabOrder = 19
        end
        object UniDBDateTimePicker1: TUniDBDateTimePicker
          Left = 83
          Top = 33
          Width = 131
          Height = 28
          DataField = 'vstdate'
          DataSource = OvstDS
          DateTime = 44923.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 20
        end
        object UniLabel25: TUniLabel
          Left = 219
          Top = 36
          Width = 31
          Height = 19
          Caption = #3648#3623#3621#3634
          TabOrder = 21
        end
        object VstTimeEdit: TUniEdit
          Left = 256
          Top = 33
          Width = 69
          Height = 28
          Alignment = taCenter
          TabOrder = 22
          InputMask.Mask = '99:99'
        end
      end
      object UniGroupBox3: TUniGroupBox
        Left = 0
        Top = 235
        Width = 1077
        Height = 226
        Caption = #3585#3634#3619#3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636' MOPH-Claim'
        Align = alClient
        TabOrder = 1
        DesignSize = (
          1077
          226)
        object UniDBGrid1: TUniDBGrid
          Left = 2
          Top = 21
          Width = 1073
          Height = 203
          DataSource = MophClaimNHSODS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
          ReadOnly = True
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          Align = alClient
          TabOrder = 1
          Columns = <
            item
              FieldName = 'xrow_number'
              Title.Caption = #3621#3635#3604#3633#3610
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 47
            end
            item
              FieldName = 'nhso_eligible_type_name'
              Title.Caption = #3611#3619#3632#3648#3616#3607
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 226
            end
            item
              FieldName = 'eligible_note'
              Title.Caption = 'eligible_note'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 341
            end
            item
              FieldName = 'claim_lab'
              Title.Caption = 'claim_lab'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'claim_icd10'
              Title.Caption = 'claim_icd10'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'eligible_check_datetime'
              Title.Caption = 'eligible_check_datetime'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'eligible_status'
              Title.Caption = 'eligible_status'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'claim_datetime'
              Title.Caption = 'claim_datetime'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'claim_status'
              Title.Caption = 'claim_status'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'claim_transaction_uid'
              Title.Caption = 'claim_transaction_uid'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'mohpromt_did_status'
              Title.Caption = 'mohpromt_did_status'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end
            item
              FieldName = 'mohpromt_did_check_datetime'
              Title.Caption = 'mohpromt_did_check_datetime'
              Title.Font.Height = -13
              Title.Font.Style = [fsBold]
              Width = 100
            end>
        end
        object UniButton7: TUniButton
          Left = 992
          Top = 4
          Width = 75
          Height = 19
          Caption = 'Refresh'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 2
          OnClick = UniButton7Click
        end
      end
    end
    object DiagTabSheet: TUniTabSheet
      Caption = #3585#3634#3619#3623#3636#3609#3636#3592#3593#3633#3618
      AutoScroll = True
    end
    object UniTabSheet2: TUniTabSheet
      Caption = #3612#3621#3605#3619#3623#3592#3607#3634#3591#3627#3657#3629#3591#3611#3599#3636#3610#3633#3605#3636#3585#3634#3619
      object HTGroupBox: TUniGroupBox
        Left = 0
        Top = 89
        Width = 1077
        Height = 130
        Caption = #3650#3588#3619#3591#3585#3634#3619' HT'
        Align = alTop
        TabOrder = 0
        object UniLabel20: TUniLabel
          Left = 22
          Top = 39
          Width = 71
          Height = 19
          Caption = 'Creatinine'
          TabOrder = 1
        end
        object UniLabel21: TUniLabel
          Left = 22
          Top = 77
          Width = 72
          Height = 19
          Caption = 'Potassium'
          TabOrder = 2
        end
        object LABCreatinineEdit: TUniEdit
          Left = 111
          Top = 35
          Width = 200
          Height = 28
          Alignment = taCenter
          TabOrder = 3
        end
        object LABPotassiumEdit: TUniEdit
          Left = 111
          Top = 74
          Width = 200
          Height = 28
          Alignment = taCenter
          TabOrder = 4
        end
        object NonDrugItemsCreatinineCheckLabel: TUniLabel
          Left = 324
          Top = 40
          Width = 337
          Height = 19
          Visible = False
          Caption = #3652#3617#3656#3614#3610#3586#3657#3629#3617#3641#3621#3588#3656#3634#3610#3619#3636#3585#3634#3619' '#3607#3637#3656' nhso_adp_code = 32103'
          ParentFont = False
          Font.Color = clRed
          Font.Height = -16
          TabOrder = 5
        end
        object NonDrugItemsPotassiumCheckLabel: TUniLabel
          Left = 324
          Top = 76
          Width = 337
          Height = 19
          Visible = False
          Caption = #3652#3617#3656#3614#3610#3586#3657#3629#3617#3641#3621#3588#3656#3634#3610#3619#3636#3585#3634#3619' '#3607#3637#3656' nhso_adp_code = 32202'
          ParentFont = False
          Font.Color = clRed
          Font.Height = -16
          TabOrder = 6
        end
      end
      object DMGroupBox: TUniGroupBox
        Left = 0
        Top = 0
        Width = 1077
        Height = 89
        Caption = #3650#3588#3619#3591#3585#3634#3619' DM'
        Align = alTop
        TabOrder = 1
        object UniLabel19: TUniLabel
          Left = 22
          Top = 39
          Width = 47
          Height = 19
          Caption = 'HbA1c'
          TabOrder = 1
        end
        object LABHbA1CEdit: TUniEdit
          Left = 111
          Top = 36
          Width = 200
          Height = 28
          Alignment = taCenter
          TabOrder = 2
        end
        object NonDrugItemsHba1cCheckLabel: TUniLabel
          Left = 324
          Top = 38
          Width = 337
          Height = 19
          Visible = False
          Caption = #3652#3617#3656#3614#3610#3586#3657#3629#3617#3641#3621#3588#3656#3634#3610#3619#3636#3585#3634#3619' '#3607#3637#3656' nhso_adp_code = 32401'
          ParentFont = False
          Font.Color = clRed
          Font.Height = -16
          TabOrder = 3
        end
      end
    end
    object VaccineTabSheet: TUniTabSheet
      Caption = #3585#3634#3619#3651#3627#3657#3623#3633#3588#3595#3637#3609
      OnBeforeFirstActivate = VaccineTabSheetBeforeFirstActivate
    end
  end
  object PatientCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from patient where 1<0'#13#10
    Params = <>
    Left = 534
    Top = 6
    Data = {
      221A00009619E0BD010000001800000064000000000003000000221A08686F73
      5F677569640100490000000200055749445448020002002600064F524947494E
      02004980110070617469656E742E686F735F677569640002686E010049000000
      0200055749445448020002000900064F524947494E020049800B007061746965
      6E742E686E0005706E616D650100490000000200055749445448020002001900
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
    Left = 617
    Top = 6
  end
  object OvstCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from ovst where 1<0'#13#10
    Params = <>
    BeforePost = OvstCDSBeforePost
    OnNewRecord = OvstCDSNewRecord
    Left = 747
    Top = 74
    Data = {
      340D00009619E0BD010000001800000035000000000003000000340D08686F73
      5F677569640100490000000200055749445448020002002600064F524947494E
      020049800E006F7673742E686F735F677569640002766E010049000000020005
      5749445448020002000D00064F524947494E0200498008006F7673742E766E00
      02686E0100490000000200055749445448020002000900064F524947494E0200
      498008006F7673742E686E0002616E0100490000000200055749445448020002
      000900064F524947494E0200498008006F7673742E616E000776737464617465
      0400060000000100064F524947494E020049800D006F7673742E767374646174
      65000776737474696D650400070000000100064F524947494E020049800D006F
      7673742E76737474696D650006646F63746F7201004900000002000557494454
      48020002000700064F524947494E020049800C006F7673742E646F63746F7200
      08686F73706D61696E0100490000000200055749445448020002000500064F52
      4947494E020049800E006F7673742E686F73706D61696E0007686F7370737562
      0100490000000200055749445448020002000500064F524947494E020049800D
      006F7673742E686F737073756200066F71756575650400010000000100064F52
      4947494E020049800C006F7673742E6F717565756500076F7673746973740100
      4900000003000753554254595045020049000A00466978656443686172000557
      49445448020002000200064F524947494E020049800D006F7673742E6F767374
      69737400076F7673746F73740100490000000200055749445448020002000400
      064F524947494E020049800D006F7673742E6F7673746F737400067074747970
      6501004900000003000753554254595045020049000A00466978656443686172
      00055749445448020002000200064F524947494E020049800C006F7673742E70
      747479706500087074747970656E6F0100490000000200055749445448020002
      003200064F524947494E020049800E006F7673742E7074747970656E6F000672
      667269637301004900000003000753554254595045020049000A004669786564
      4368617200055749445448020002000100064F524947494E020049800C006F76
      73742E7266726963730007726672696C63740100490000000200055749445448
      020002000500064F524947494E020049800D006F7673742E726672696C637400
      067266726F637301004900000003000753554254595045020049000A00466978
      65644368617200055749445448020002000100064F524947494E020049800C00
      6F7673742E7266726F637300077266726F6C6374010049000000020005574944
      5448020002000500064F524947494E020049800D006F7673742E7266726F6C63
      7400067370636C747901004900000003000753554254595045020049000A0046
      697865644368617200055749445448020002000200064F524947494E02004980
      0C006F7673742E7370636C7479000C726370745F646973656173650100490000
      000200055749445448020002006400064F524947494E0200498012006F767374
      2E726370745F64697365617365000568636F6465010049000000020005574944
      5448020002000500064F524947494E020049800B006F7673742E68636F646500
      076375725F64657001004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000300064F524947494E020049800D
      006F7673742E6375725F646570000C6375725F6465705F627573790100490000
      0003000753554254595045020049000A00466978656443686172000557494454
      48020002000100064F524947494E0200498012006F7673742E6375725F646570
      5F6275737900086C6173745F6465700100490000000300075355425459504502
      0049000A0046697865644368617200055749445448020002000300064F524947
      494E020049800E006F7673742E6C6173745F646570000C6375725F6465705F74
      696D650400070000000100064F524947494E0200498012006F7673742E637572
      5F6465705F74696D65000872785F71756575650400010000000100064F524947
      494E020049800E006F7673742E72785F71756575650009646961675F74657874
      010049000000020005574944544802000200FA00064F524947494E020049800F
      006F7673742E646961675F74657874000A70745F737562747970650100010000
      000100064F524947494E0200498010006F7673742E70745F7375627479706500
      086D61696E5F64657001004900000003000753554254595045020049000A0046
      697865644368617200055749445448020002000300064F524947494E02004980
      0E006F7673742E6D61696E5F646570000E6D61696E5F6465705F717565756504
      00010000000100064F524947494E0200498014006F7673742E6D61696E5F6465
      705F7175657565001466696E616E63655F73756D6D6172795F64617465040006
      0000000100064F524947494E020049801A006F7673742E66696E616E63655F73
      756D6D6172795F64617465000A76697369745F74797065010049000000030007
      53554254595045020049000A0046697865644368617200055749445448020002
      000100064F524947494E0200498010006F7673742E76697369745F7479706500
      076E6F64655F696401004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E020049800D
      006F7673742E6E6F64655F6964000B636F6E74726163745F6964040001000000
      0100064F524947494E0200498011006F7673742E636F6E74726163745F696400
      0777616974696E6701004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E020049800D
      006F7673742E77616974696E67000A726672695F696364313001004900000002
      00055749445448020002000600064F524947494E0200498010006F7673742E72
      6672695F6963643130000E6F5F72656665725F6E756D62657204000100000001
      00064F524947494E0200498014006F7673742E6F5F72656665725F6E756D6265
      72000D6861735F696E737572616E636501004900000003000753554254595045
      020049000A0046697865644368617200055749445448020002000100064F5249
      47494E0200498013006F7673742E6861735F696E737572616E6365000E695F72
      656665725F6E756D626572010049000000020005574944544802000200190006
      4F524947494E0200498014006F7673742E695F72656665725F6E756D62657200
      0A72656665725F7479706501004900000003000753554254595045020049000A
      0046697865644368617200055749445448020002000100064F524947494E0200
      498010006F7673742E72656665725F74797065000B6F5F72656665725F646570
      0100490000000200055749445448020002000500064F524947494E0200498011
      006F7673742E6F5F72656665725F646570000573746166660100490000000200
      055749445448020002001900064F524947494E020049800B006F7673742E7374
      616666000E636F6D6D616E645F646F63746F7201004900000002000557494454
      48020002000600064F524947494E0200498014006F7673742E636F6D6D616E64
      5F646F63746F72000B73656E645F706572736F6E010049000000020005574944
      5448020002009600064F524947494E0200498011006F7673742E73656E645F70
      6572736F6E000B70745F7072696F726974790400010000000100064F52494749
      4E0200498011006F7673742E70745F7072696F72697479000C66696E616E6365
      5F6C6F636B01004900000003000753554254595045020049000A004669786564
      4368617200055749445448020002000100064F524947494E0200498012006F76
      73742E66696E616E63655F6C6F636B00076F6C64636F64650100490000000200
      055749445448020002001400064F524947494E020049800D006F7673742E6F6C
      64636F6465000B7369676E5F646F63746F720100490000000200055749445448
      020002000A00064F524947494E0200498011006F7673742E7369676E5F646F63
      746F72000F616E6F6E796D6F75735F7669736974010049000000030007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      064F524947494E0200498015006F7673742E616E6F6E796D6F75735F76697369
      74000C616E6F6E796D6F75735F766E0100490000000200055749445448020002
      000C00064F524947494E0200498012006F7673742E616E6F6E796D6F75735F76
      6E001570745F6361706162696C6974795F747970655F69640400010000000100
      064F524947494E020049801B006F7673742E70745F6361706162696C6974795F
      747970655F6964000B61745F686F73706974616C010049000000030007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      064F524947494E0200498011006F7673742E61745F686F73706974616C00086F
      7673745F6B65790100490000000200055749445448020002002800064F524947
      494E020049800E006F7673742E6F7673745F6B6579000000}
  end
  object OvstDS: TDataSource
    DataSet = OvstCDS
    Left = 829
    Top = 75
  end
  object PatientAddressCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from patient_address where 1<0'#13#10
    Params = <>
    BeforePost = PatientAddressCDSBeforePost
    Left = 726
    Top = 19
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
  object VisitPttypeCDS: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from visit_pttype limit 0'#13#10
    Params = <>
    BeforePost = VisitPttypeCDSBeforePost
    Left = 825
    Top = 23
  end
  object VisitPttypeDS: TDataSource
    DataSet = VisitPttypeCDS
    Left = 927
    Top = 21
  end
  object OPDScreenCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from opdscreen limit 0'#13#10
    Params = <>
    BeforePost = OPDScreenCDSBeforePost
    Left = 327
    Top = 7
    Data = {
      462200009619E0BD01000000180000008B000000000003000000462208686F73
      5F6775696401004900000003000557494454480200020026000950524F56464C
      4147530400018007000000064F524947494E0200498013006F70647363726565
      6E2E686F735F677569640002766E010049000000020005574944544802000200
      0D00064F524947494E020049800D006F706473637265656E2E766E0002686E01
      00490000000200055749445448020002000900064F524947494E020049800D00
      6F706473637265656E2E686E0007767374646174650400060000000100064F52
      4947494E0200498012006F706473637265656E2E767374646174650007767374
      74696D650400070000000100064F524947494E0200498012006F706473637265
      656E2E76737474696D650009626567696E74696D650400070000000100064F52
      4947494E0200498014006F706473637265656E2E626567696E74696D6500076F
      757474696D650400070000000100064F524947494E0200498012006F70647363
      7265656E2E6F757474696D650007656E6474696D650400070000000100064F52
      4947494E0200498012006F706473637265656E2E656E6474696D650003627064
      0800040000000100064F524947494E020049800E006F706473637265656E2E62
      706400036270730800040000000100064F524947494E020049800E006F706473
      637265656E2E627073000262770800040000000100064F524947494E02004980
      0D006F706473637265656E2E62770002636304004B0000000200075355425459
      50450200490005005465787400064F524947494E020049800D006F7064736372
      65656E2E6363000268720800040000000100064F524947494E020049800D006F
      706473637265656E2E68720002706504004B0000000200075355425459504502
      00490005005465787400064F524947494E020049800D006F706473637265656E
      2E7065000570756C73650800040000000100064F524947494E0200498010006F
      706473637265656E2E70756C7365000B74656D70657261747572650800040000
      000100064F524947494E0200498016006F706473637265656E2E74656D706572
      617475726500046E6F746504004B000000020007535542545950450200490005
      005465787400064F524947494E020049800F006F706473637265656E2E6E6F74
      65000272720800040000000100064F524947494E020049800D006F7064736372
      65656E2E7272000D63635F626567696E5F646174650400060000000100064F52
      4947494E0200498018006F706473637265656E2E63635F626567696E5F646174
      65001163635F63617573655F6F665F7669736974010049000000020005574944
      544802000200FA00064F524947494E020049801C006F706473637265656E2E63
      635F63617573655F6F665F7669736974000763635F7369676E01004900000002
      0005574944544802000200FA00064F524947494E0200498012006F7064736372
      65656E2E63635F7369676E000B63635F6475726174696F6E0100490000000200
      055749445448020002009600064F524947494E0200498016006F706473637265
      656E2E63635F6475726174696F6E000B63635F706F736974696F6E0100490000
      00020005574944544802000200FA00064F524947494E0200498016006F706473
      637265656E2E63635F706F736974696F6E000763635F6E6F746504004B000000
      020007535542545950450200490005005465787400064F524947494E02004980
      12006F706473637265656E2E63635F6E6F7465000E6869735F626567696E5F64
      6174650400060000000100064F524947494E0200498019006F70647363726565
      6E2E6869735F626567696E5F64617465000D6869735F6672657175656E637901
      0049000000020005574944544802000200FA00064F524947494E020049801800
      6F706473637265656E2E6869735F6672657175656E6379000C6869735F736576
      6572697479010049000000020005574944544802000200FA00064F524947494E
      0200498017006F706473637265656E2E6869735F736576657269747900096869
      735F6361757365010049000000020005574944544802000200FA00064F524947
      494E0200498014006F706473637265656E2E6869735F6361757365000A686973
      5F657870616E64010049000000020005574944544802000200FA00064F524947
      494E0200498015006F706473637265656E2E6869735F657870616E6400126869
      735F63617573655F696E63726561736501004900000002000557494454480200
      0200FA00064F524947494E020049801D006F706473637265656E2E6869735F63
      617573655F696E63726561736500126869735F63617573655F64656372656173
      65010049000000020005574944544802000200FA00064F524947494E02004980
      1D006F706473637265656E2E6869735F63617573655F64656372656173650010
      6869735F72656C617465645F7369676E01004900000002000557494454480200
      0200FA00064F524947494E020049801B006F706473637265656E2E6869735F72
      656C617465645F7369676E00066865696768740400010000000100064F524947
      494E0200498011006F706473637265656E2E686569676874000A73637265656E
      5F64657001004900000003000753554254595045020049000A00466978656443
      68617200055749445448020002000300064F524947494E0200498015006F7064
      73637265656E2E73637265656E5F646570000777616974696E67010049000000
      03000753554254595045020049000A0046697865644368617200055749445448
      020002000100064F524947494E0200498012006F706473637265656E2E776169
      74696E6700036662730800040000000100064F524947494E020049800E006F70
      6473637265656E2E666273000568656C70310100490000000300075355425459
      5045020049000A0046697865644368617200055749445448020002000100064F
      524947494E0200498010006F706473637265656E2E68656C7031000568656C70
      3201004900000003000753554254595045020049000A00466978656443686172
      00055749445448020002000100064F524947494E0200498010006F7064736372
      65656E2E68656C7032000568656C703301004900000003000753554254595045
      020049000A0046697865644368617200055749445448020002000100064F5249
      47494E0200498010006F706473637265656E2E68656C7033000568656C703401
      004900000003000753554254595045020049000A004669786564436861720005
      5749445448020002000100064F524947494E0200498010006F70647363726565
      6E2E68656C7034000A68656C70315F74696D650400070000000100064F524947
      494E0200498015006F706473637265656E2E68656C70315F74696D6500096865
      6C70315F6270730400010000000100064F524947494E0200498014006F706473
      637265656E2E68656C70315F627073000968656C70315F627064040001000000
      0100064F524947494E0200498014006F706473637265656E2E68656C70315F62
      7064000A68656C70325F74696D650400070000000100064F524947494E020049
      8015006F706473637265656E2E68656C70325F74696D65000A68656C70325F74
      656D700800040000000100064F524947494E0200498015006F70647363726565
      6E2E68656C70325F74656D70000B68656C70335F69636F646501004900000002
      00055749445448020002006400064F524947494E0200498016006F7064736372
      65656E2E68656C70335F69636F6465000A68656C70335F74696D650400070000
      000100064F524947494E0200498015006F706473637265656E2E68656C70335F
      74696D65000968656C70335F7174790100010000000100064F524947494E0200
      498014006F706473637265656E2E68656C70335F717479000A68656C70345F6E
      6F746504004B000000020007535542545950450200490005005465787400064F
      524947494E0200498015006F706473637265656E2E68656C70345F6E6F746500
      076164766963653101004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E0200498012
      006F706473637265656E2E616476696365310007616476696365320100490000
      0003000753554254595045020049000A00466978656443686172000557494454
      48020002000100064F524947494E0200498012006F706473637265656E2E6164
      7669636532000761647669636533010049000000030007535542545950450200
      49000A0046697865644368617200055749445448020002000100064F52494749
      4E0200498012006F706473637265656E2E616476696365330007616476696365
      3401004900000003000753554254595045020049000A00466978656443686172
      00055749445448020002000100064F524947494E0200498012006F7064736372
      65656E2E61647669636534000761647669636535010049000000030007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      064F524947494E0200498012006F706473637265656E2E616476696365350007
      6164766963653601004900000003000753554254595045020049000A00466978
      65644368617200055749445448020002000100064F524947494E020049801200
      6F706473637265656E2E61647669636536000761647669636537010049000000
      03000753554254595045020049000A0046697865644368617200055749445448
      020002000100064F524947494E0200498012006F706473637265656E2E616476
      696365370006637261646C650100490000000300075355425459504502004900
      0A0046697865644368617200055749445448020002000100064F524947494E02
      00498011006F706473637265656E2E637261646C65000570655F676101004900
      000003000753554254595045020049000A004669786564436861720005574944
      5448020002000100064F524947494E0200498010006F706473637265656E2E70
      655F6761000870655F6865656E74010049000000030007535542545950450200
      49000A0046697865644368617200055749445448020002000100064F52494749
      4E0200498013006F706473637265656E2E70655F6865656E74000870655F6865
      61727401004900000003000753554254595045020049000A0046697865644368
      617200055749445448020002000100064F524947494E0200498013006F706473
      637265656E2E70655F6865617274000770655F6C756E67010049000000030007
      53554254595045020049000A0046697865644368617200055749445448020002
      000100064F524947494E0200498012006F706473637265656E2E70655F6C756E
      67000570655F616201004900000003000753554254595045020049000A004669
      7865644368617200055749445448020002000100064F524947494E0200498010
      006F706473637265656E2E70655F6162000670655F6578740100490000000300
      0753554254595045020049000A00466978656443686172000557494454480200
      02000100064F524947494E0200498011006F706473637265656E2E70655F6578
      74000870655F6E6575726F01004900000003000753554254595045020049000A
      0046697865644368617200055749445448020002000100064F524947494E0200
      498013006F706473637265656E2E70655F6E6575726F000A70655F67615F7465
      78740100490000000200055749445448020002009600064F524947494E020049
      8015006F706473637265656E2E70655F67615F74657874000D70655F6865656E
      745F746578740100490000000200055749445448020002009600064F52494749
      4E0200498018006F706473637265656E2E70655F6865656E745F74657874000D
      70655F68656172745F7465787401004900000002000557494454480200020096
      00064F524947494E0200498018006F706473637265656E2E70655F6865617274
      5F74657874000C70655F6C756E675F7465787401004900000002000557494454
      48020002009600064F524947494E0200498017006F706473637265656E2E7065
      5F6C756E675F74657874000A70655F61625F7465787401004900000002000557
      49445448020002009600064F524947494E0200498015006F706473637265656E
      2E70655F61625F74657874000D70655F6E6575726F5F74657874010049000000
      0200055749445448020002009600064F524947494E0200498018006F70647363
      7265656E2E70655F6E6575726F5F74657874000B70655F6578745F7465787401
      00490000000200055749445448020002009600064F524947494E020049801600
      6F706473637265656E2E70655F6578745F746578740003626D69080004000000
      0100064F524947494E020049800E006F706473637265656E2E626D6900027467
      0800040000000100064F524947494E020049800D006F706473637265656E2E74
      67000368646C0800040000000100064F524947494E020049800E006F70647363
      7265656E2E68646C0009676C75637572696E6501004900000003000753554254
      595045020049000A004669786564436861720005574944544802000200010006
      4F524947494E0200498014006F706473637265656E2E676C75637572696E6500
      06626C616E6B3101004900000003000753554254595045020049000A00466978
      65644368617200055749445448020002000100064F524947494E020049801100
      6F706473637265656E2E626C616E6B31000362756E0800040000000100064F52
      4947494E020049800E006F706473637265656E2E62756E000A6372656174696E
      696E650800040000000100064F524947494E0200498015006F70647363726565
      6E2E6372656174696E696E65000275610800040000000100064F524947494E02
      0049800D006F706473637265656E2E7561000568626131630800040000000100
      064F524947494E0200498010006F706473637265656E2E686261316300067269
      736B646D01004900000003000753554254595045020049000A00466978656443
      68617200055749445448020002000100064F524947494E0200498011006F7064
      73637265656E2E7269736B646D000A736B696E5F636F6C6F7201004900000002
      00055749445448020002001400064F524947494E0200498015006F7064736372
      65656E2E736B696E5F636F6C6F720011666F756E645F616D70686574616D696E
      6501004900000003000753554254595045020049000A00466978656443686172
      00055749445448020002000100064F524947494E020049801C006F7064736372
      65656E2E666F756E645F616D70686574616D696E650009707265676E616E6379
      01004900000003000753554254595045020049000A0046697865644368617200
      055749445448020002000100064F524947494E0200498014006F706473637265
      656E2E707265676E616E6379000C616476696365375F6E6F7465010049000000
      020005574944544802000200FA00064F524947494E0200498017006F70647363
      7265656E2E616476696365375F6E6F74650007636865636B7570010049000000
      03000753554254595045020049000A0046697865644368617200055749445448
      020002000100064F524947494E0200498012006F706473637265656E2E636865
      636B7570000765725F6E6F746504004B00000002000753554254595045020049
      0005005465787400064F524947494E0200498012006F706473637265656E2E65
      725F6E6F7465000D666F756E645F616C6C657267790100490000000300075355
      4254595045020049000A00466978656443686172000557494454480200020001
      00064F524947494E0200498018006F706473637265656E2E666F756E645F616C
      6C65726779000368706904004B00000002000753554254595045020049000500
      5465787400064F524947494E020049800E006F706473637265656E2E68706900
      03706D6804004B00000002000753554254595045020049000500546578740006
      4F524947494E020049800E006F706473637265656E2E706D680002666804004B
      000000020007535542545950450200490005005465787400064F524947494E02
      0049800D006F706473637265656E2E66680002736804004B0000000200075355
      42545950450200490005005465787400064F524947494E020049800D006F7064
      73637265656E2E73680003726F7304004B000000020007535542545950450200
      490005005465787400064F524947494E020049800E006F706473637265656E2E
      726F73000274630800040000000100064F524947494E020049800D006F706473
      637265656E2E746300036C646C0800040000000100064F524947494E02004980
      0E006F706473637265656E2E6C646C00036173740800040000000100064F5249
      47494E020049800E006F706473637265656E2E6173740003616C740800040000
      000100064F524947494E020049800E006F706473637265656E2E616C74000773
      796D70746F6D010049000000020005574944544802000200C800064F52494749
      4E0200498012006F706473637265656E2E73796D70746F6D000777616C6B5F69
      640400010000000100064F524947494E0200498012006F706473637265656E2E
      77616C6B5F696400097065616B5F666C6F770400010000000100064F52494749
      4E0200498014006F706473637265656E2E7065616B5F666C6F77000B63686F6C
      65737465726F6C0800040000000100064F524947494E0200498016006F706473
      637265656E2E63686F6C65737465726F6C000577616973740800040000000100
      064F524947494E0200498010006F706473637265656E2E776169737400076164
      766963653801004900000003000753554254595045020049000A004669786564
      4368617200055749445448020002000100064F524947494E0200498012006F70
      6473637265656E2E61647669636538000E6272656173745F66656564696E6701
      004900000003000753554254595045020049000A004669786564436861720005
      5749445448020002000100064F524947494E0200498019006F70647363726565
      6E2E6272656173745F66656564696E67000A637261646C655F6C696501004900
      000003000753554254595045020049000A004669786564436861720005574944
      5448020002000100064F524947494E0200498015006F706473637265656E2E63
      7261646C655F6C6965000A7061696E5F73636F72650400010000000100064F52
      4947494E0200498015006F706473637265656E2E7061696E5F73636F72650004
      706566720400010000000100064F524947494E020049800F006F706473637265
      656E2E7065667200196F706473637265656E5F70617469656E745F747970655F
      69640400010000000100064F524947494E0200498024006F706473637265656E
      2E6F706473637265656E5F70617469656E745F747970655F6964001963726561
      74696E696E655F6B69646E65795F70657263656E740800040000000100064F52
      4947494E0200498024006F706473637265656E2E6372656174696E696E655F6B
      69646E65795F70657263656E740006736F6469756D0800040000000100064F52
      4947494E0200498011006F706473637265656E2E736F6469756D000863686C6F
      726964650800040000000100064F524947494E0200498013006F706473637265
      656E2E63686C6F726964650009706F7461737369756D0800040000000100064F
      524947494E0200498014006F706473637265656E2E706F7461737369756D0004
      74636F320800040000000100064F524947494E020049800F006F706473637265
      656E2E74636F32000F736D6F6B696E675F747970655F69640400010000000100
      064F524947494E020049801A006F706473637265656E2E736D6F6B696E675F74
      7970655F696400106472696E6B696E675F747970655F69640400010000000100
      064F524947494E020049801B006F706473637265656E2E6472696E6B696E675F
      747970655F6964001870756C73655F726567756C6174696F6E5F747970655F69
      640400010000000100064F524947494E0200498023006F706473637265656E2E
      70756C73655F726567756C6174696F6E5F747970655F6964000473706F320800
      040000000100064F524947494E020049800F006F706473637265656E2E73706F
      32000D7572696E655F616C62756D696E0800040000000100064F524947494E02
      00498018006F706473637265656E2E7572696E655F616C62756D696E00107572
      696E655F6372656174696E696E650800040000000100064F524947494E020049
      801B006F706473637265656E2E7572696E655F6372656174696E696E65000C70
      6566725F70657263656E740800040000000100064F524947494E020049801700
      6F706473637265656E2E706566725F70657263656E74000D6D6163726F5F616C
      62756D696E0400010000000100064F524947494E0200498018006F7064736372
      65656E2E6D6163726F5F616C62756D696E000D6D6963726F5F616C62756D696E
      0400010000000100064F524947494E0200498018006F706473637265656E2E6D
      6963726F5F616C62756D696E0004656766720800040000000100064F52494749
      4E020049800F006F706473637265656E2E656766720002686208000400000001
      00064F524947494E020049800D006F706473637265656E2E6862000475706372
      0800040000000100064F524947494E020049800F006F706473637265656E2E75
      70637200066269636172620800040000000100064F524947494E020049801100
      6F706473637265656E2E626963617262000970686F7370686174650800040000
      000100064F524947494E0200498014006F706473637265656E2E70686F737068
      61746500037074680800040000000100064F524947494E020049800E006F7064
      73637265656E2E707468000570655F6779010049000000030007535542545950
      45020049000A0046697865644368617200055749445448020002000100064F52
      4947494E0200498010006F706473637265656E2E70655F6779000A70655F6779
      5F746578740100490000000200055749445448020002006400064F524947494E
      0200498015006F706473637265656E2E70655F67795F74657874000570655F67
      7501004900000003000753554254595045020049000A00466978656443686172
      00055749445448020002000100064F524947494E0200498010006F7064736372
      65656E2E70655F6775000A70655F67755F746578740100490000000200055749
      445448020002006400064F524947494E0200498015006F706473637265656E2E
      70655F67755F74657874000570655F6769010049000000030007535542545950
      45020049000A0046697865644368617200055749445448020002000100064F52
      4947494E0200498010006F706473637265656E2E70655F6769000A70655F6769
      5F746578740100490000000200055749445448020002006400064F524947494E
      0200498015006F706473637265656E2E70655F67695F74657874000362736108
      00040000000100064F524947494E020049800E006F706473637265656E2E6273
      61000770655F6865616401004900000003000753554254595045020049000A00
      46697865644368617200055749445448020002000100064F524947494E020049
      8012006F706473637265656E2E70655F68656164000C70655F686561645F7465
      78740100490000000200055749445448020002006400064F524947494E020049
      8017006F706473637265656E2E70655F686561645F74657874000770655F736B
      696E01004900000003000753554254595045020049000A004669786564436861
      7200055749445448020002000100064F524947494E0200498012006F70647363
      7265656E2E70655F736B696E000C70655F736B696E5F74657874010049000000
      0200055749445448020002006400064F524947494E0200498017006F70647363
      7265656E2E70655F736B696E5F746578740001000B5052494D4152595F4B4559
      02008200010000000100}
  end
  object OPDScreenDS: TDataSource
    DataSet = OPDScreenCDS
    Left = 411
    Top = 3
  end
  object OvstSEQCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 'select * from ovst_seq limit 0'#13#10
    Params = <>
    BeforePost = OvstSEQCDSBeforePost
    Left = 138
    Top = 4
    Data = {
      A40C00009619E0BD01000000180000002C000000000003000000A40C02766E01
      00490000000200055749445448020002000D00064F524947494E020049800C00
      6F7673745F7365712E766E00067365715F69640400010000000100064F524947
      494E0200498010006F7673745F7365712E7365715F6964000C7074747970655F
      636865636B01004900000003000753554254595045020049000A004669786564
      4368617200055749445448020002000100064F524947494E0200498016006F76
      73745F7365712E7074747970655F636865636B00157074747970655F63686563
      6B5F6461746574696D650800080000000100064F524947494E020049801F006F
      7673745F7365712E7074747970655F636865636B5F6461746574696D65001270
      74747970655F636865636B5F7374616666010049000000020005574944544802
      0002003200064F524947494E020049801C006F7673745F7365712E7074747970
      655F636865636B5F7374616666000D7063755F706572736F6E5F696401004900
      00000200055749445448020002000900064F524947494E0200498017006F7673
      745F7365712E7063755F706572736F6E5F696400146C6173745F6F7064636172
      645F646570636F64650100490000000200055749445448020002000300064F52
      4947494E020049801E006F7673745F7365712E6C6173745F6F7064636172645F
      646570636F6465001670726F746563745F73656E7369746976655F6461746101
      004900000003000753554254595045020049000A004669786564436861720005
      5749445448020002000100064F524947494E0200498020006F7673745F736571
      2E70726F746563745F73656E7369746976655F64617461000B72785F71756575
      655F6E6F0400010000000100064F524947494E0200498015006F7673745F7365
      712E72785F71756575655F6E6F001373746F636B5F6465706172746D656E745F
      69640400010000000100064F524947494E020049801D006F7673745F7365712E
      73746F636B5F6465706172746D656E745F6964001973746F636B5F6465706172
      746D656E745F71756575655F6E6F0400010000000100064F524947494E020049
      8023006F7673745F7365712E73746F636B5F6465706172746D656E745F717565
      75655F6E6F00186C6173745F73746F636B5F6465706172746D656E745F696404
      00010000000100064F524947494E0200498022006F7673745F7365712E6C6173
      745F73746F636B5F6465706172746D656E745F6964000B6E68736F5F7365715F
      69640400010000000100064F524947494E0200498015006F7673745F7365712E
      6E68736F5F7365715F6964000F7570646174655F6461746574696D6508000800
      00000100064F524947494E0200498019006F7673745F7365712E757064617465
      5F6461746574696D65000D70726F6D6F74655F76697369740100490000000300
      0753554254595045020049000A00466978656443686172000557494454480200
      02000100064F524947494E0200498017006F7673745F7365712E70726F6D6F74
      655F76697369740008686F735F67756964010049000000020005574944544802
      0002002600064F524947494E0200498012006F7673745F7365712E686F735F67
      756964000C736572766963655F636F73740800040000000100064F524947494E
      0200498016006F7673745F7365712E736572766963655F636F737400166C6173
      745F72785F6F70657261746F725F737461666601004900000002000557494454
      48020002001900064F524947494E0200498020006F7673745F7365712E6C6173
      745F72785F6F70657261746F725F737461666600136C6173745F636865636B5F
      6461746574696D650800080000000100064F524947494E020049801D006F7673
      745F7365712E6C6173745F636865636B5F6461746574696D6500167074747970
      655F636865636B5F7374617475735F69640400010000000100064F524947494E
      0200498020006F7673745F7365712E7074747970655F636865636B5F73746174
      75735F69640016686F73706974616C5F6465706172746D656E745F6964040001
      0000000100064F524947494E0200498020006F7673745F7365712E686F737069
      74616C5F6465706172746D656E745F6964001072656769737465725F64657063
      6F64650100490000000200055749445448020002000300064F524947494E0200
      49801A006F7673745F7365712E72656769737465725F646570636F6465001172
      656769737465725F636F6D707574657201004900000002000557494454480200
      02003200064F524947494E020049801B006F7673745F7365712E726567697374
      65725F636F6D70757465720010646F63746F725F6C6973745F74657874010049
      000000020005574944544802000200FA00064F524947494E020049801A006F76
      73745F7365712E646F63746F725F6C6973745F74657874000A65725F70745F74
      7970650400010000000100064F524947494E0200498014006F7673745F736571
      2E65725F70745F74797065001165725F656D657267656E63795F747970650400
      010000000100064F524947494E020049801B006F7673745F7365712E65725F65
      6D657267656E63795F74797065000D7375625F7370636C74795F696404000100
      00000100064F524947494E0200498017006F7673745F7365712E7375625F7370
      636C74795F69640016646F63746F725F70617469656E745F747970655F696404
      00010000000100064F524947494E0200498020006F7673745F7365712E646F63
      746F725F70617469656E745F747970655F6964001366696E616E63655F737461
      7475735F666C61670400010000000100064F524947494E020049801D006F7673
      745F7365712E66696E616E63655F7374617475735F666C6167000A6861735F61
      727265617201004900000003000753554254595045020049000A004669786564
      4368617200055749445448020002000100064F524947494E0200498014006F76
      73745F7365712E6861735F617272656172000572785F6F6B0100490000000300
      0753554254595045020049000A00466978656443686172000557494454480200
      02000100064F524947494E020049800F006F7673745F7365712E72785F6F6B00
      0C6861735F7363616E5F646F6301004900000003000753554254595045020049
      000A0046697865644368617200055749445448020002000100064F524947494E
      0200498016006F7673745F7365712E6861735F7363616E5F646F63000D72785F
      71756575655F6C6973740100490000000200055749445448020002001E00064F
      524947494E0200498017006F7673745F7365712E72785F71756575655F6C6973
      74000D72785F71756575655F74696D650800080000000100064F524947494E02
      00498017006F7673745F7365712E72785F71756575655F74696D65000C64785F
      746578745F6C697374010049000000020005574944544802000200FA00064F52
      4947494E0200498016006F7673745F7365712E64785F746578745F6C69737400
      0E6F70645F71735F736C6F745F69640400010000000100064F524947494E0200
      498018006F7673745F7365712E6F70645F71735F736C6F745F6964001172785F
      7472616E73616374696F6E5F69640400010000000100064F524947494E020049
      801B006F7673745F7365712E72785F7472616E73616374696F6E5F6964001364
      6F63746F725F64785F6C6973745F746578740100490000000200055749445448
      02000200FA00064F524947494E020049801D006F7673745F7365712E646F6374
      6F725F64785F6C6973745F746578740013646F63746F725F72785F6C6973745F
      74657874010049000000020005574944544802000200FA00064F524947494E02
      0049801D006F7673745F7365712E646F63746F725F72785F6C6973745F746578
      7400107074747970655F6C6973745F7465787401004900000002000557494454
      4802000200FA00064F524947494E020049801A006F7673745F7365712E707474
      7970655F6C6973745F746578740012686F73706D61696E5F6C6973745F746578
      740100490000000200055749445448020002006400064F524947494E02004980
      1C006F7673745F7365712E686F73706D61696E5F6C6973745F74657874001565
      64635F617070726F76655F6C6973745F74657874010049000000020005574944
      544802000200C800064F524947494E020049801F006F7673745F7365712E6564
      635F617070726F76655F6C6973745F74657874000E72785F7072696F72697479
      5F69640400010000000100064F524947494E0200498018006F7673745F736571
      2E72785F7072696F726974795F696400156F7673745F646F63746F725F6C6973
      745F74657874010049000000020005574944544802000200FA00064F52494749
      4E020049801F006F7673745F7365712E6F7673745F646F63746F725F6C697374
      5F74657874000000}
  end
  object OvstSEQDS: TDataSource
    DataSet = OvstSEQCDS
    Left = 210
    Top = 10
  end
  object MophClaimNHSOCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 297
    Top = 155
  end
  object MophClaimNHSODS: TDataSource
    DataSet = MophClaimNHSOCDS
    Left = 376
    Top = 165
  end
  object LabOrderCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 964
    Top = 96
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
    Left = 946
    Top = 157
  end
end
