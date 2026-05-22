object PatientVisitListFrame: TPatientVisitListFrame
  Left = 0
  Top = 0
  Width = 1453
  Height = 585
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1453
    Height = 57
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    DesignSize = (
      1453
      57)
    object UniLabel1: TUniLabel
      Left = 12
      Top = 8
      Width = 352
      Height = 23
      Caption = ' '#3619#3634#3618#3594#3639#3656#3629#3612#3641#3657#3611#3656#3623#3618#3607#3637#3656#3617#3634#3619#3633#3610#3610#3619#3636#3585#3634#3619#3651#3609#3649#3612#3609#3585' OPD'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-2'
    end
    object UniButton1: TUniButton
      Left = 645
      Top = 12
      Width = 104
      Height = 29
      Caption = #3626#3656#3591#3605#3619#3623#3592
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniImageList1
      ImageIndex = 1
      OnClick = UniButton1Click
    end
    object HNSearchButton: TUniButton
      Left = 753
      Top = 12
      Width = 79
      Height = 29
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniImageList1
      ImageIndex = 0
      OnClick = HNSearchButtonClick
    end
    object UniLabel4: TUniLabel
      Left = 469
      Top = 16
      Width = 24
      Height = 19
      Caption = 'HN'
      ParentFont = False
      Font.Color = clYellow
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object HNSearchEdit: TUniEdit
      Left = 503
      Top = 12
      Width = 136
      Height = 29
      TabOrder = 5
      OnKeyUp = HNSearchEditKeyUp
    end
    object UniButton3: TUniButton
      Left = 838
      Top = 12
      Width = 100
      Height = 29
      Caption = 'Refresh'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 6
      Images = UniImageList1
      ImageIndex = 2
      OnClick = UniButton3Click
    end
    object UniButton2: TUniButton
      Left = 1037
      Top = 12
      Width = 93
      Height = 29
      Caption = #3611#3636#3604
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 7
      Images = UniImageList1
      ImageIndex = 3
      OnClick = UniButton2Click
    end
    object HospitalNameLabel: TUniLabel
      Left = 20
      Top = 35
      Width = 121
      Height = 16
      Caption = 'HospitalNameLabel'
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -13
      Font.Style = [fsBold]
      ParentColor = False
      Color = clSilver
      TabOrder = 8
    end
    object UniButton6: TUniButton
      Left = 944
      Top = 12
      Width = 87
      Height = 29
      Caption = 'Excel'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 9
      Images = UniImageList1
      ImageIndex = 4
      OnClick = UniButton6Click
    end
    object UniMenuButton1: TUniMenuButton
      Left = 1360
      Top = 13
      Width = 75
      Height = 28
      DropdownMenu = UniPopupMenu1
      Caption = 'Task'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 10
    end
    object pg: TUniProgressBar
      Left = 1204
      Top = 12
      Width = 150
      Visible = False
      Anchors = [akTop, akRight]
      Text = 'pg'
      TabOrder = 11
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 57
    Width = 1453
    Height = 81
    Align = alTop
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    object UniLabel2: TUniLabel
      Left = 15
      Top = 12
      Width = 55
      Height = 19
      Caption = #3594#3656#3623#3591#3623#3633#3609#3607#3637#3656
      TabOrder = 1
    end
    object UniDateTimePicker1: TUniDateTimePicker
      Left = 115
      Top = 8
      Width = 120
      Height = 27
      DateTime = 44171.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 240
      Top = 12
      Width = 46
      Height = 19
      Caption = #3606#3638#3591#3623#3633#3609#3607#3637#3656
      TabOrder = 3
    end
    object UniDateTimePicker2: TUniDateTimePicker
      Left = 293
      Top = 8
      Width = 120
      Height = 27
      DateTime = 44171.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 450
      Top = 11
      Width = 38
      Height = 19
      Caption = #3649#3612#3609#3585
      TabOrder = 5
    end
    object SpcltyCombobox: TUniComboBox
      Left = 496
      Top = 8
      Width = 299
      Height = 27
      TabOrder = 6
      RemoteQuery = True
      RemoteQueryDelay = 100
      IconItems = <>
      OnRemoteQuery = SpcltyComboboxRemoteQuery
    end
    object UniLabel6: TUniLabel
      Left = 38
      Top = 44
      Width = 40
      Height = 19
      Caption = #3649#3614#3607#3618#3660
      TabOrder = 7
    end
    object DoctorNameCombobox: TUniComboBox
      Left = 84
      Top = 41
      Width = 360
      Height = 27
      TabOrder = 8
      RemoteQuery = True
      RemoteQueryDelay = 100
      IconItems = <>
      OnRemoteQuery = DoctorNameComboboxRemoteQuery
    end
    object UniLabel7: TUniLabel
      Left = 450
      Top = 44
      Width = 36
      Height = 19
      Caption = #3626#3634#3586#3634
      TabOrder = 9
    end
    object HospitalDepartmentCombobox: TUniComboBox
      Left = 496
      Top = 41
      Width = 145
      Height = 27
      Style = csDropDownList
      TabOrder = 10
      IconItems = <>
    end
    object DepartmentNameCombobox: TUniComboBox
      Left = 695
      Top = 41
      Width = 289
      Height = 27
      TabOrder = 11
      RemoteQueryDelay = 100
      IconItems = <>
      OnRemoteQuery = DepartmentNameComboboxRemoteQuery
    end
    object UniLabel8: TUniLabel
      Left = 649
      Top = 44
      Width = 28
      Height = 19
      Caption = #3627#3657#3629#3591
      TabOrder = 12
    end
    object ShowLastHourCheck: TUniCheckBox
      Left = 812
      Top = 11
      Width = 160
      Height = 17
      Checked = True
      Caption = #3649#3626#3604#3591#3586#3657#3629#3617#3641#3621#3618#3657#3629#3609#3627#3621#3633#3591
      TabOrder = 13
    end
    object HourEdit: TUniSpinEdit
      Left = 972
      Top = 6
      Width = 39
      Height = 26
      Value = 3
      TabOrder = 14
      Alignment = taCenter
      ParentFont = False
      Font.Height = -13
    end
    object UniLabel9: TUniLabel
      Left = 1017
      Top = 11
      Width = 44
      Height = 19
      Caption = #3594#3633#3656#3623#3650#3617#3591
      TabOrder = 15
    end
    object RefreshLabel: TUniLabel
      Left = 1030
      Top = 48
      Width = 74
      Height = 16
      Caption = 'RefreshLabel'
      ParentFont = False
      Font.Height = -13
      TabOrder = 16
    end
    object UniButton4: TUniButton
      Left = 81
      Top = 8
      Width = 28
      Height = 27
      Caption = '<'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 17
      OnClick = UniButton4Click
    end
    object UniButton5: TUniButton
      Left = 416
      Top = 8
      Width = 28
      Height = 27
      Caption = '>'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 18
      OnClick = UniButton5Click
    end
    object OKLabel: TUniLabel
      Left = 990
      Top = 48
      Width = 34
      Height = 16
      Visible = False
      Caption = '<OK>'
      ParentFont = False
      Font.Height = -13
      TabOrder = 19
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 138
    Width = 1453
    Height = 447
    TitleFont.Height = -13
    TitleFont.Style = [fsBold]
    DataSource = VisitListDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.PageSize = 23
    LoadMask.Message = 'Loading data...'
    LayoutConfig.Cls = 'patient-visit-list-grid'
    Align = alClient
    TabOrder = 2
    OnMouseUp = UniDBGrid1MouseUp
    OnDblClick = UniDBGrid1DblClick
    Columns = <
      item
        FieldName = 'row_no'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 40
      end
      item
        FieldName = 'hospital_department_name'
        Title.Caption = #3626#3634#3586#3634#3607#3637#3656#3626#3656#3591#3605#3619#3623#3592
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'vstdate'
        Title.Caption = #3623#3633#3609#3607#3637#3656
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 94
        Alignment = taCenter
      end
      item
        FieldName = 'vsttime'
        Title.Caption = #3648#3623#3621#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
        Alignment = taCenter
      end
      item
        FieldName = 'oqueue'
        Title.Caption = 'Queue'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 40
        Alignment = taCenter
      end
      item
        FieldName = 'cid'
        Title.Caption = 'CID'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
        Alignment = taCenter
      end
      item
        FieldName = 'hn'
        Title.Caption = 'HN'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
        Alignment = taCenter
      end
      item
        FieldName = 'ptname'
        Title.Caption = #3594#3639#3656#3629#3612#3641#3657#3619#3633#3610#3610#3619#3636#3585#3634#3619
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 250
      end
      item
        FieldName = 'visit_type_name'
        Title.Caption = #3648#3623#3621#3634#3607#3635#3585#3634#3619
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'pttype_check_status_name'
        Title.Caption = #3585#3634#3619#3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'ovstist_name'
        Title.Caption = #3611#3619#3632#3648#3616#3607#3585#3634#3619#3617#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'pt_priority_name'
        Title.Caption = #3588#3623#3634#3617#3648#3619#3656#3591#3604#3656#3623#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'pt_walk_name'
        Title.Caption = #3611#3619#3632#3648#3616#3607
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'pttype_name'
        Title.Caption = #3626#3636#3607#3608#3636#3585#3634#3619#3619#3633#3585#3625#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 250
      end
      item
        FieldName = 'pttypeno'
        Title.Caption = #3648#3621#3586#3607#3637#3656#3626#3636#3607#3608#3636
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 125
      end
      item
        FieldName = 'age_y'
        Title.Caption = #3629#3634#3618#3640' ('#3611#3637')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
        Alignment = taCenter
      end
      item
        FieldName = 'age_m'
        Title.Caption = #3629#3634#3618#3640' ('#3648#3604#3639#3629#3609')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
        Alignment = taCenter
      end
      item
        FieldName = 'age_d'
        Title.Caption = #3629#3634#3618#3640' ('#3623#3633#3609')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
        Alignment = taCenter
      end
      item
        FieldName = 'cc'
        Title.Caption = #3629#3634#3585#3634#3619#3626#3635#3588#3633#3597
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'doctor_list_text'
        Title.Caption = #3649#3614#3607#3618#3660#3612#3641#3657#3605#3619#3623#3592
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'count_in_day'
        Title.Caption = #3617#3634#3588#3619#3633#3657#3591#3607#3637#3656' ('#3651#3609#3623#3633#3609')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 75
        Alignment = taCenter
      end
      item
        FieldName = 'count_in_month'
        Title.Caption = #3617#3634#3588#3619#3633#3657#3591#3607#3637#3656' ('#3651#3609#3648#3604#3639#3629#3609')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 75
        Alignment = taCenter
      end
      item
        FieldName = 'count_in_year'
        Title.Caption = #3617#3634#3588#3619#3633#3657#3591#3607#3637#3656' ('#3651#3609#3611#3637')'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 75
        Alignment = taCenter
      end
      item
        FieldName = 'pdx'
        Title.Caption = 'Primary Dx.'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'pdx_name'
        Title.Caption = #3612#3621#3585#3634#3619#3623#3636#3609#3636#3592#3593#3633#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 200
      end
      item
        FieldName = 'dx_text_list'
        Title.Caption = 'Diag Text'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'register_department_name'
        Title.Caption = #3626#3656#3591#3605#3619#3623#3592#3607#3637#3656#3627#3657#3629#3591
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'spclty_name'
        Title.Caption = #3649#3612#3609#3585
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        FieldName = 'sub_spclty_name'
        Title.Caption = #3626#3634#3586#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'department_name'
        Title.Caption = #3592#3640#3604#3619#3633#3610#3610#3619#3636#3585#3634#3619#3611#3633#3592#3592#3640#3610#3633#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'ost_name'
        Title.Caption = #3626#3606#3634#3609#3632#3616#3634#3614
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'pt_subtype_name'
        Title.Caption = #3611#3619#3632#3648#3616#3607#3588#3609#3652#3586#3657
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'main_department_name'
        Title.Caption = #3592#3640#3604#3619#3633#3610#3610#3619#3636#3585#3634#3619#3649#3619#3585
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'bps'
        Title.Alignment = taCenter
        Title.Caption = 'BPs'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'bpd'
        Title.Alignment = taCenter
        Title.Caption = 'BPd'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'temperature'
        Title.Alignment = taCenter
        Title.Caption = #3629#3640#3603#3627#3616#3641#3617#3636
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'bw'
        Title.Alignment = taCenter
        Title.Caption = #3609#3657#3635#3627#3609#3633#3585
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'an'
        Title.Caption = 'AN (Admit)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'staff_name'
        Title.Caption = #3648#3592#3657#3634#3627#3609#3657#3634#3607#3637#3656#3626#3656#3591#3605#3619#3623#3592
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'income'
        Title.Alignment = taRightJustify
        Title.Caption = #3588#3656#3634#3651#3594#3657#3592#3656#3634#3618#3607#3633#3657#3591#3627#3617#3604
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'paid_money'
        Title.Alignment = taRightJustify
        Title.Caption = #3605#3657#3629#3591#3594#3635#3619#3632#3648#3591#3636#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'rcpt_money'
        Title.Alignment = taRightJustify
        Title.Caption = #3629#3629#3585#3651#3610#3648#3626#3619#3655#3592#3619#3633#3610#3648#3591#3636#3609
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'auth_code'
        Title.Caption = 'Auth code ('#3626#3611#3626#3594'.)'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'nhso_fee_schedule_list_text'
        Title.Caption = 'NHSO Fee Schedule'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end>
  end
  object VisitListCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select o.vstdate,p.cid,oq.seq_id,o.hn,o.vsttime,o.vn,concat(p.pn' +
      'ame,p.fname," ",p.lname) as ptname  ,'#13#10'     t.name as pttype_nam' +
      'e ,o.pttypeno,v.pdx,'#13#10'     i.name as pdx_name  ,s.name as spclty' +
      '_name,'#13#10'     sti.name as ovstist_name , k.department as departme' +
      'nt_name,'#13#10'     st.name as ost_name  ,v.income,oo1.data_ok,oo1.se' +
      'nd_done,oo1.reply_error,oo1.nhso_error_code,oq.promote_visit'#13#10'  ' +
      '   , hd.name as hospital_department_name ,k2.department as regis' +
      'ter_department_name,oq.doctor_list_text,'#13#10'     ssp.sub_spclty_na' +
      'me,pw.name as pt_walk_name,o.oqueue,vt.visit_type_name ,v.age_y,' +
      'v.age_m,v.age_d,i3.an'#13#10'    ,ou.name as staff_name,o.pt_priority,' +
      ' p3.name as pt_priority_name'#13#10'     from ovst o'#13#10' left outer join' +
      ' vn_stat v  on v.vn = o.vn'#13#10'     left outer join opdscreen oc on' +
      ' oc.vn = o.vn'#13#10'     left outer join patient p  on p.hn = o.hn'#13#10' ' +
      '    left outer join pttype t on t.pttype = o.pttype'#13#10#13#10'     left' +
      ' outer join icd101 i on i.code = v.main_pdx'#13#10'     left outer joi' +
      'n spclty s on s.spclty = o.spclty'#13#10'     left outer join ovstist ' +
      'sti on sti.ovstist = o.ovstist'#13#10'     left outer join ovstost st ' +
      'on st.ovstost = o.ovstost'#13#10'     left outer join ovst_seq oq on o' +
      'q.vn = o.vn'#13#10'     left outer join ovst_nhso_send oo1 on oo1.vn =' +
      ' o.vn'#13#10'     left outer join kskdepartment k on k.depcode = o.cur' +
      '_dep'#13#10'     left outer join kskdepartment k2 on k2.depcode = oq.r' +
      'egister_depcode'#13#10'     left outer join hospital_department hd on ' +
      'hd.id = oq.hospital_department_id'#13#10'     left outer join sub_spcl' +
      'ty ssp on ssp.sub_spclty_id = oq.sub_spclty_id'#13#10'     left outer ' +
      'join pt_walk pw on pw.walk_id = oc.walk_id'#13#10'     left outer join' +
      ' visit_type vt on vt.visit_type = o.visit_type'#13#10'     left outer ' +
      'join ipt i3  on i3.vn = o.vn'#13#10'     left outer join opduser ou on' +
      ' ou.loginname = o.staff'#13#10'     left outer join pt_priority p3 on ' +
      'p3.id = o.pt_priority'#13#10#13#10'     where 1<0'#13#10
    Params = <>
    Left = 204
    Top = 221
    Data = {
      730700009619E0BD010000001800000023000000000003000000730707767374
      646174650400060000000100064F524947494E020049800A006F2E7673746461
      746500036369640100490000000200055749445448020002000D00064F524947
      494E020049800600702E63696400067365715F69640400010000000100064F52
      4947494E020049800A006F712E7365715F69640002686E010049000000020005
      5749445448020002000900064F524947494E0200498005006F2E686E00077673
      7474696D650400070000000100064F524947494E020049800A006F2E76737474
      696D650002766E0100490000000200055749445448020002000D00064F524947
      494E0200498005006F2E766E000670746E616D65010049000000020005574944
      5448020002004C00064F524947494E02004980070070746E616D65000B707474
      7970655F6E616D65010049000000020005574944544802000200FA00064F5249
      47494E020049800700742E6E616D6500087074747970656E6F01004900000002
      00055749445448020002003200064F524947494E020049800B006F2E70747479
      70656E6F00037064780100490000000200055749445448020002000600064F52
      4947494E020049800600762E70647800087064785F6E616D6501004900000002
      0005574944544802000200C800064F524947494E020049800700692E6E616D65
      000B7370636C74795F6E616D6501004900000002000557494454480200020096
      00064F524947494E020049800700732E6E616D65000C6F7673746973745F6E61
      6D650100490000000200055749445448020002003200064F524947494E020049
      8009007374692E6E616D65000F6465706172746D656E745F6E616D6501004900
      00000200055749445448020002009600064F524947494E020049800D006B2E64
      65706172746D656E7400086F73745F6E616D6501004900000002000557494454
      4802000200C800064F524947494E02004980080073742E6E616D650006696E63
      6F6D650800040000000100064F524947494E020049800900762E696E636F6D65
      0007646174615F6F6B01004900000003000753554254595045020049000A0046
      697865644368617200055749445448020002000100064F524947494E02004980
      0C006F6F312E646174615F6F6B000973656E645F646F6E650100490000000300
      0753554254595045020049000A00466978656443686172000557494454480200
      02000100064F524947494E020049800E006F6F312E73656E645F646F6E65000B
      7265706C795F6572726F7201004900000003000753554254595045020049000A
      0046697865644368617200055749445448020002000100064F524947494E0200
      498010006F6F312E7265706C795F6572726F72000F6E68736F5F6572726F725F
      636F64650100490000000200055749445448020002006400064F524947494E02
      00498014006F6F312E6E68736F5F6572726F725F636F6465000D70726F6D6F74
      655F766973697401004900000003000753554254595045020049000A00466978
      65644368617200055749445448020002000100064F524947494E020049801100
      6F712E70726F6D6F74655F76697369740018686F73706974616C5F6465706172
      746D656E745F6E616D65010049000000020005574944544802000200C800064F
      524947494E02004980080068642E6E616D65001872656769737465725F646570
      6172746D656E745F6E616D650100490000000200055749445448020002009600
      064F524947494E020049800E006B322E6465706172746D656E740010646F6374
      6F725F6C6973745F74657874010049000000020005574944544802000200FA00
      064F524947494E0200498014006F712E646F63746F725F6C6973745F74657874
      000F7375625F7370636C74795F6E616D65010049000000020005574944544802
      000200C800064F524947494E0200498014007373702E7375625F7370636C7479
      5F6E616D65000C70745F77616C6B5F6E616D6501004900000002000557494454
      48020002006400064F524947494E02004980080070772E6E616D6500066F7175
      6575650400010000000100064F524947494E0200498009006F2E6F7175657565
      000F76697369745F747970655F6E616D65010049000000020005574944544802
      0002009600064F524947494E02004980130076742E76697369745F747970655F
      6E616D6500056167655F790200010000000100064F524947494E020049800800
      762E6167655F7900056167655F6D0200010000000100064F524947494E020049
      800800762E6167655F6D00056167655F640200010000000100064F524947494E
      020049800800762E6167655F640002616E010049000000020005574944544802
      0002000900064F524947494E02004980060069332E616E000A73746166665F6E
      616D65010049000000020005574944544802000200FA00064F524947494E0200
      498008006F752E6E616D65000B70745F7072696F726974790400010000000100
      064F524947494E020049800E006F2E70745F7072696F72697479001070745F70
      72696F726974795F6E616D650100490000000200055749445448020002006400
      064F524947494E02004980080070332E6E616D65000000}
  end
  object VisitListDS: TDataSource
    DataSet = VisitListCDS
    Left = 276
    Top = 222
  end
  object UniTimer1: TUniTimer
    Interval = 5000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    Left = 439
    Top = 207
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 1128
    Top = 248
    object AuthCodeCheck: TUniMenuItem
      Caption = #3605#3619#3623#3592#3626#3629#3610#3619#3627#3633#3626' Auth Code'
      OnClick = AuthCodeCheckClick
    end
    object FDHCheck: TUniMenuItem
      Caption = #3605#3619#3623#3592#3626#3629#3610#3626#3606#3634#3609#3632' Claim FDH'
      Visible = False
    end
  end
  object UniImageList1: TUniImageList
    Left = 488
    Top = 304
    Bitmap = {
      494C0101050008003C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001919191A4646464D61636180626F61B3467444E600000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000587158CB3776
      35F72F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF687468AA687468AA6874
      68AA687468AA687267A200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF2F7A
      2BFF2F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF4DAF49FF4DAF49FF4DAF
      49FF4DAF49FF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF5092
      4DFF52934FFF2F7A2BFF569653FF4B8F48FF2F7A2BFFFFFFFFFF8ACA88FFFFFF
      FFFFFFFFFFFF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF5E9B
      5BFFEBF2EBFF4A8E47FFF1F6F0FF549451FF2F7A2BFF8ACA88FF60B85DFF8ACA
      88FF8ACA88FF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF2F7A
      2BFF9DC19BFFEDF3ECFF9BBF99FF2F7A2BFF2F7A2BFFC5E5C4FF73C170FFC5E5
      C4FFC5E5C4FF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF2F7A
      2BFF9EC19CFFF1F6F0FF92BA90FF2F7A2BFF2F7A2BFFC5E5C4FF73C170FFC5E5
      C4FFC5E5C4FF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF468C
      43FFF4F8F4FF629D5FFFECF3EBFF468C43FF2F7A2BFF8ACA88FF60B85DFF8ACA
      88FF8ACA88FF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF5192
      4DFF639E60FF2F7A2BFF5C9A59FF52934EFF2F7A2BFFFFFFFFFF8ACA88FFFFFF
      FFFFFFFFFFFF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F7A2BFF2F7A
      2BFF2F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF4DAF49FF4DAF49FF4DAF
      49FF4DAF49FF4DAF49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000597058CA3975
      36F52F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF2F7A2BFF667B65BB667B65BB667B
      65BB667B65BB687667AD00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      0203262626274B4C4B5562656284626F62B14C724ADF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005F5F657D60606780000000000C0C0C0D6161627D646465856464
      6585646465856464658564646585646465856464658564646585656465846160
      607A414141470303030400000000000000000000000000000000000000000000
      00000000003F010602A00B2B0CDE144810FB16450BFB0C2504DD0105009E0000
      003C000000000000000000000000000000000000000000000000000000000000
      000025252526636267806A6780B36157B0E66157B0E66A6780B3636267802525
      2526000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005E5E62791818E2FF1818E2FF606067805D5D5E7479DDECFF7AECF8FF7AEC
      F8FF7AECF8FF7AECF8FF7AECF8FF7AECF8FF78D0E0FC79747ADFCFB16CF9F5D7
      6CFFC4A668F477696AC61D1D1D1E00000000000000000000000000000014020B
      05B1167932FE23A93EFF29A42CFF2E9F1DFF309B16FF309513FF318C0DFF235C
      03FE030800AE0000001300000000000000000000000000000000000000015B5B
      5D705E50CAF65C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5E50
      CAF65B5B5D700000000100000000000000000000000000000000000000000000
      0000181818194545454D5E5E5E7E5757576A3333333606060607000000005D5D
      62781818E2FF1818E2FF1818E2FF5E5E637B6463648379E7F3FF7AECF8FF7AEC
      F8FF7AECF8FF7AECF8FF7AECF8FF7AECF8FF77757CDEFEE16CFFCAAE67F6816B
      6FE4F5D66BFFFBDE6CFF746B6BB7000000000000000000000017052514D81AB3
      57FF24B341FF31A91BFF35A70FFF35A70FFF35A70FFF35A70FFF34A311FF3294
      0EFF318003FF0A1900D7000000160000000000000000000000016A6782B55C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6A6782B5000000010000000000000000000000000A0A0A0B6161
      6195000000FE232323FF545454FF404040FF0D0D0DFF2B2B2BE5626269931818
      E2FF1818E2FF1818E2FF5E5E637A000000006160617C79E3F1FF7AECF8FF7AEC
      F8FF7AECF8FF7AECF8FF7AECF8FF77CADCFDB79D6EF3BCA268F1896868EC7494
      A6F5947468ECD7BA69F8A18768E8101010110000000101130BBD15C16BFF21BB
      4CFF2FAE22FF33AB23FF88C475FFB8D7A9FF40B231FF2FAE22FF2FAE22FF2FAE
      22FF309A15FF328203FF050B00BB00000000000000005B5B5D705C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5B5B5D7000000000000000001A1A1A1B373737DC3E3E
      3EFFCCC8DBFFD4CFE6FFD1CBE5FFD2CCE5FFD5D0E9FF9C9AA2FF0D0D0DFF0A0A
      66FF1818E2FF5F5F657E00000000000000002929292B6E8797E57AECF8FF7AEC
      F8FF7AECF8FF6F9FB6F26C728BE16D7493F1E5C36AFF8D766AE478808BEA78C6
      D7FC797A87EBA78D69ECC3A468F52828282A0000004F0DA163FF17CB6EFF29B5
      35FF2CB435FFC4E4C2FFFEFEFEFFD7F1DBFF3FBC4AFF29B434FF29B434FF29B4
      34FF29B433FF309414FF276603FF0000004F252525265E50CAF65C4CE0FF5C4C
      E0FF6454E1FFB4ACF0FF6152E1FF5C4CE0FF5C4CE0FF6152E1FFB4ACF0FF6454
      E1FF5C4CE0FF5C4CE0FF5E50CAF62525252600000000575757B85F5F5FFFCFC7
      E9FFE4E2EBFFFEFEFEFFFFFFFFFFFFFFFFFFF9F9F9FFD1CCE4FFD0CCDFFF0D0D
      0DFF6262699400000000000000000000000000000000414141476E6F7AC571A6
      B7F37098ADF0656BA5F0638EE4FF6573B5F596836FE9FFE36CFFB39668F1747B
      94F6EDCD6AFFFFE36CFF8E7768DB0606060700110BB10FDB8FFF1DC45CFF24BA
      45FF70D085FFFFFFFFFF7DD693FF24BA45FF24BA45FF24B945FF88D394FF61C8
      74FF24BA45FF28AC34FF318D0DFF040B00B1636267805C4CE0FF5C4CE0FF5C4C
      E0FFB4ACF0FFFFFFFFFFD2CEF6FF6152E1FF6152E1FFD2CEF6FFFFFFFFFFB4AC
      F0FF5C4CE0FF5C4CE0FF5C4CE0FF6261667F5050505D1A1A1AFFD1CBE6FFEFEE
      F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CCE4FF9C9A
      A2FF2B2B2BE50606060700000000000000000000000000000000000000003030
      30336A676C9E666AA5F26571B1F6656DADF770626CC6EACA69FDF7DA6BFFD9B5
      69FFFDE06CFFD7BB6AF96B67689500000000034E35E90CE199FF3BCA71FFBFE9
      CCFFC2ECD0FFF1FBF5FFA9E3BBFF6BD38EFF1FBF55FF9FE1B4FFFFFFFFFFF9FD
      FAFF60CF86FF20BC4FFF2F9316FF103105EA6A6780B35C4CE0FF5C4CE0FF5C4C
      E0FF6152E1FFD2CEF6FFFFFFFFFFD4D0F7FFD3D0F6FFFFFFFFFFD2CEF6FF6152
      E1FF5C4CE0FF5C4CE0FF5C4CE0FF6A6780B35F5F5FA6818181FFD1CBE4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFD5D0
      E9FF0F0F0FFF3333333600000000000000000000000000000000000000000000
      00004343434A68618AE4647BCFFF666594EA585758696A676891897569D69D84
      67E5857168D56B6768960303030400000000037352FE09E7A3FF35CD79FFEBFA
      F2FFFFFFFFFFFFFFFFFFFDFEFEFF69D99BFF81DEA9FFFFFFFFFFFEFEFEFFFEFE
      FEFFF8FDFAFF42CD7BFF2C9920FF16490CFE6157B0E65C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6152E1FFD4D0F7FFFFFFFFFFFFFFFFFFD3D0F6FF6152E1FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF6157B0E6393939DAB0ACBEFFE5E3EAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2CC
      E5FF454545FF5757576A00000000000000000000000000000000000000000000
      00016C6672BA638EE4FF638EE4FF638EE4FF6C6577C703030304000000001010
      101101010102000000000000000000000000056E4CFE06EDADFF14D079FF3FD3
      8BFFECFBF4FFFDFEFEFF74E0ABFF16CA70FF4DD794FF81E4B5FFF2FCF7FFABEC
      CCFF94E7BFFF2DC871FF299F2AFF154810FD6157B0E65C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6152E1FFD3D0F6FFFFFFFFFFFFFFFFFFD4D0F7FF6152E1FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF6157B0E61D1D1DEEBDB7D0FFEDEDEDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0CB
      E5FF5A5A5AFF5E5E5E7E00000000000000000000000000000000000000006865
      6990637CC8FC638EE4FF638EE4FF638EE4FF6582D4FE6A676EA6000000000000
      000000000000000000000000000000000000083D20EA04F3B7FF0CDF96FF13CE
      7BFF38D691FF55DCA2FF13CE7BFF12CE7BFF18D68AFF98EECDFFFEFEFEFF53DB
      A0FF13CE7BFF1BBB5BFF26A534FF0E2E08E96A6780B35C4CE0FF5C4CE0FF5C4C
      E0FF6152E1FFD2CEF6FFFFFFFFFFD3D0F6FFD4D0F7FFFFFFFFFFD2CEF6FF6152
      E1FF5C4CE0FF5C4CE0FF5C4CE0FF6A6780B3545454BD99989BFFD7D3E6FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFD0CA
      E6FF262626FF4545454D00000000000000000000000000000000000000006C65
      71B96479BFF7638EE4FF638EE4FF638EE4FF6381CFFD6B5F72CC000000000000
      000000000000000000000000000000000000040800B10ADF9EFF04F1B5FF0FD6
      8CFF11D185FF11D185FF11D185FF32DA9AFFF3FEFBFFFEFEFEFF97EBCAFF11D1
      85FF13CD7DFF20B24BFF25A135FF040800B0636267805C4CE0FF5C4CE0FF5C4C
      E0FFB4ACF0FFFFFFFFFFD2CEF6FF6152E1FF6152E1FFD2CEF6FFFFFFFFFFB4AC
      F0FF5C4CE0FF5C4CE0FF5C4CE0FF6261667F616161884B4B4BFFCEC8E5FFFBFB
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E1EBFFC9C4
      DCFF000000FE1818181900000000000000000000000000000000000000005E5E
      5F77676593E86471B0F3655278EA6482D3FF676798EB5E5D5E75000000000000
      0000000000000000000000000000000000000000004F177735FF02F7BEFF05EF
      B2FF0DD893FF0ED48DFF0ED48DFF18D592FF82E8C4FF49DEA9FF0ED48DFF10D1
      86FF1ABF62FF1EB651FF1E671AFF0000004F252525265E50CAF65C4CE0FF5C4C
      E0FF6454E1FFB4ACF0FF6152E1FF5C4CE0FF5C4CE0FF6152E1FFB4ACF0FF6454
      E1FF5C4CE0FF5C4CE0FF5E50CAF62525252617171718212121ECACAAB4FFCEC9
      E3FFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEF1FFCDC6E8FF3E3E
      3EFF616161950000000000000000000000000000000000000000000000006865
      6A9864597CE163597CE14D5493F45C5682E8655579E66663678B000000000000
      00000000000000000000000000000000000000000000030B01BC17A95BFF02F7
      BFFF04F2B6FF09E4A3FF0CDA97FF0DD793FF0DD691FF0ED58FFF10D285FF16CA
      71FF19C265FF219437FF030B01BC00000000000000005B5B5D705C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF5C4CE0FF5B5B5D7000000000000000004C4C4C57111111FFACAA
      B4FFCFC9E5FFD7D3E6FFEDEDEDFFE4E2E9FFD0CAE4FFD0CAE5FF5F5F5FFF3737
      37DC0A0A0A0B0000000000000000000000000000000000000000000000004E4E
      4E59495395F53A56AEFF3956AFFF3956AFFF4451A1FD56565767000000000000
      0000000000000000000000000000000000000000000000000016061906D718A4
      55FF06E9ABFF04F3B7FF06EDADFF09E7A3FF0CE199FF0FDB8FFF11D585FF15C8
      73FF1C9A45FF061A07D8000000160000000000000000000000016A6782B55C4C
      E0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4C
      E0FF5C4CE0FF6A6782B5000000010000000000000000000000004C4C4C572121
      21EC4B4B4BFF99989BFFBDB7D0FFB0ACBEFF818181FF1A1A1AFF575757B81A1A
      1A1B000000000000000000000000000000000000000000000000000000000000
      000068656A9652518AF03D52A9FF4A5194F76A646EB404040405000000000000
      0000000000000000000000000000000000000000000000000000000000130209
      03AF11733AFE0FC983FF08E4A3FF06EDAFFF07EAAAFF0CDC96FF12C579FF1175
      3DFE020904B00000001300000000000000000000000000000000000000015B5B
      5D705E50CAF65C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5C4CE0FF5E50
      CAF65B5B5D700000000100000000000000000000000000000000000000001717
      171861616188545454BD1D1D1DEE393939DA5F5F5FA65050505D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002A2A2A2C5D5C5D733C3C3C400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000003D0007049F023927DD017056FB007157FB023A29DD0008049F0000
      003D000000000000000000000000000000000000000000000000000000000000
      000025252526636267806A6780B36157B0E66157B0E66A6780B3636267802525
      252600000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      F07F000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000E07F000000000000
      FFFF000000000000FFFF000000000000FFF900000000F00FFFF000000000C003
      F020000000008001C00100000000800180030000000000008007000000000000
      0003000000000000000300000000000000030000000000000003000000000000
      0003000000000000000300000000000000070000000080018007000000008001
      C00F00000000C003E03F00000000F00F00000000000000000000000000000000
      000000000000}
  end
  object UniPopupMenu2: TUniPopupMenu
    Left = 600
    Top = 256
    object body1: TUniMenuItem
      Caption = #3618#3585#3648#3621#3636#3585#3585#3634#3619#3626#3656#3591#3605#3619#3623#3592
      OnClick = body1Click
    end
  end
end
