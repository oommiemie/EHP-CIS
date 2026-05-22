object UniPatientOPDCardInformationFrame2: TUniPatientOPDCardInformationFrame2
  Left = 0
  Top = 0
  Width = 882
  Height = 627
  Font.Height = -16
  TabOrder = 0
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 882
    Height = 47
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    object UniButton1: TUniButton
      Left = 12
      Top = 9
      Width = 89
      Height = 27
      Caption = #3648#3614#3636#3656#3617
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 9
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 107
      Top = 9
      Width = 89
      Height = 27
      Caption = #3649#3585#3657#3652#3586
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 10
      OnClick = UniButton2Click
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 47
    Width = 882
    Height = 580
    DataSource = ClinicMemberDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    LayoutConfig.Cls = 'opdcard-ncd-grid'
    Align = alClient
    TabOrder = 1
    Columns = <
      item
        FieldName = 'xrow_number'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 42
      end
      item
        FieldName = 'clinic_name'
        Title.Caption = #3650#3619#3588#3648#3619#3639#3657#3629#3619#3633#3591
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        FieldName = 'regdate'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3586#3638#3657#3609#3607#3632#3648#3610#3637#3618#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'clinic_subtype_name'
        Title.Caption = #3611#3619#3632#3648#3616#3607#3650#3619#3588
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        FieldName = 'begin_year'
        Title.Caption = #3611#3637#3607#3637#3656#3648#3619#3636#3656#3617#3648#3611#3655#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 104
      end
      item
        FieldName = 'dw_reg_hospital_name'
        Title.Caption = #3627#3609#3656#3623#3618#3651#3627#3657#3610#3619#3636#3585#3634#3619
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 144
      end
      item
        FieldName = 'dw_chronic_number'
        Title.Caption = #3648#3621#3586#3607#3632#3648#3610#3637#3618#3609#3585#3621#3634#3591
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 162
      end
      item
        FieldName = 'pt_number'
        Title.Caption = #3648#3621#3586#3607#3637#3656#3586#3638#3657#3609#3607#3632#3648#3610#3637#3618#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 168
      end
      item
        FieldName = 'number'
        Title.Caption = #3648#3621#3586#3607#3637#3656#3607#3632#3648#3610#3637#3618#3609'(2)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 164
      end
      item
        FieldName = 'new_case'
        Title.Caption = #3619#3634#3618#3651#3627#3617#3656
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 101
      end
      item
        FieldName = 'discharge'
        Title.Caption = #3592#3635#3627#3609#3656#3634#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 87
      end
      item
        FieldName = 'dchdate'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3592#3635#3627#3609#3656#3634#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 134
      end
      item
        FieldName = 'other_chronic_text'
        Title.Caption = #3650#3619#3588#3648#3619#3639#3657#3629#3619#3633#3591#3629#3639#3656#3609#3654
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 165
      end
      item
        FieldName = 'doctor_name'
        Title.Caption = #3649#3614#3607#3618#3660#3612#3641#3657#3604#3641#3649#3621#3611#3619#3632#3592#3635
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 205
      end
      item
        FieldName = 'clinic_member_status_name'
        Title.Caption = #3626#3606#3634#3609#3632#3611#3633#3592#3592#3640#3610#3633#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 190
      end
      item
        FieldName = 'note'
        Title.Caption = #3627#3617#3634#3618#3648#3627#3605#3640
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        FieldName = 'lastvisit'
        Title.Caption = #3617#3634#3619#3633#3610#3610#3619#3636#3585#3634#3619#3588#3619#3633#3657#3591#3626#3640#3604#3607#3657#3634#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 214
      end
      item
        FieldName = 'next_app_date'
        Title.Caption = #3623#3633#3609#3609#3633#3604#3606#3633#3604#3652#3611
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 113
      end
      item
        FieldName = 'send_pcu_hospital_name'
        Title.Caption = #3626#3656#3591#3605#3656#3629#3652#3611#3607#3637#3656
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 164
      end
      item
        FieldName = 'has_eye_cormobidity'
        Title.Caption = #3605#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 39
      end
      item
        FieldName = 'has_foot_cormobidity'
        Title.Caption = #3648#3607#3657#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 38
      end
      item
        FieldName = 'has_kidney_cormobidity'
        Title.Caption = #3652#3605
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 40
      end
      item
        FieldName = 'has_cardiovascular_cormobidity'
        Title.Caption = 'Cardio'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 38
      end
      item
        FieldName = 'has_cerebrovascular_cormobidity'
        Title.Caption = 'Cerebro'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 43
      end
      item
        FieldName = 'has_peripheralvascular_cormobidity'
        Title.Caption = 'Peripheral'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 44
      end
      item
        FieldName = 'has_dental_cormobidity'
        Title.Caption = #3611#3619#3636#3607#3633#3609#3605#3660
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 83
      end
      item
        FieldName = 'dchdate'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3592#3635#3627#3609#3656#3634#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 140
      end
      item
        FieldName = 'appointment_visit_frequency'
        Title.Caption = #3588#3623#3634#3617#3606#3637#3656' '#3609#3633#3604#3607#3640#3585' ('#3623#3633#3609')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 174
      end
      item
        FieldName = 'mo1_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3617'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 138
      end
      item
        FieldName = 'mo2_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3585'.'#3614'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 146
      end
      item
        FieldName = 'mo3_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3617#3637'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        FieldName = 'mo4_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3648#3617'.'#3618'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 148
      end
      item
        FieldName = 'mo5_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3614'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 131
      end
      item
        FieldName = 'mo6_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3617#3636'.'#3618'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 134
      end
      item
        FieldName = 'mo7_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3585'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 142
      end
      item
        FieldName = 'mo8_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3626'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 142
      end
      item
        FieldName = 'mo9_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3585'.'#3618'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 139
      end
      item
        FieldName = 'mo10_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3605'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 144
      end
      item
        FieldName = 'mo11_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3614'.'#3618'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 138
      end
      item
        FieldName = 'mo12_visit_date'
        Title.Caption = #3623#3633#3609#3607#3637#3656#3617#3634' ('#3608'.'#3588'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'last_cormobidity_screen_date'
        Title.Caption = #3588#3633#3604#3585#3619#3629#3591#3616#3634#3623#3632#3649#3607#3619#3585#3595#3657#3629#3609#3588#3619#3633#3657#3591#3626#3640#3604#3607#3657#3634#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 307
      end
      item
        FieldName = 'last_hba1c_date'
        Title.Caption = 'Last HbA1c'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 125
      end
      item
        FieldName = 'last_hba1c_value'
        Title.Caption = 'Last HbA1c Value'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 134
      end
      item
        FieldName = 'last_ua_date'
        Title.Caption = 'Last UA Date'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 126
      end
      item
        FieldName = 'last_ua_value'
        Title.Caption = 'Last UA Value'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 117
      end
      item
        FieldName = 'last_bp_date'
        Title.Caption = 'Last BP Date'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        FieldName = 'last_bp_bps_value'
        Title.Caption = 'Last BPS'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 83
      end
      item
        FieldName = 'last_bp_bpd_value'
        Title.Caption = 'Last BPD'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 83
      end
      item
        FieldName = 'lastupdate'
        Title.Caption = #3611#3619#3633#3610#3611#3619#3640#3591#3588#3619#3633#3657#3591#3626#3640#3604#3607#3657#3634#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 144
      end>
  end
  object ClinicMemberCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 339
    Top = 276
  end
  object ClinicMemberDS: TDataSource
    DataSet = ClinicMemberCDS
    Left = 429
    Top = 279
  end
end
