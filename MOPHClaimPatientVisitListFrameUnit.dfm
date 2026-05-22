object MOPHClaimPatientVisitListFrame: TMOPHClaimPatientVisitListFrame
  Left = 0
  Top = 0
  Width = 1259
  Height = 585
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 1259
    Height = 63
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 18
      Top = 13
      Width = 301
      Height = 19
      Caption = ' '#3619#3634#3618#3594#3639#3656#3629#3612#3641#3657#3611#3656#3623#3618#3607#3637#3656#3617#3634#3619#3633#3610#3610#3619#3636#3585#3634#3619' MOPH Claim'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-0'
    end
    object UniButton1: TUniButton
      Left = 645
      Top = 12
      Width = 118
      Height = 28
      Caption = #3610#3633#3609#3607#3638#3585#3651#3627#3657#3610#3619#3636#3585#3634#3619
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 0
      OnClick = UniButton1Click
    end
    object HNSearchButton: TUniButton
      Left = 769
      Top = 12
      Width = 79
      Height = 28
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 2
      OnClick = HNSearchButtonClick
    end
    object HNSearchEdit: TUniEdit
      Left = 503
      Top = 12
      Width = 136
      Height = 29
      TabOrder = 4
      OnKeyUp = HNSearchEditKeyUp
    end
    object UniButton3: TUniButton
      Left = 854
      Top = 12
      Width = 100
      Height = 28
      Caption = 'Refresh'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 5
      Images = UniMainModule.UniImageList1
      ImageIndex = 12
      OnClick = UniButton3Click
    end
    object UniButton2: TUniButton
      Left = 1053
      Top = 12
      Width = 93
      Height = 28
      Caption = #3611#3636#3604
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 6
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton2Click
    end
    object UniButton6: TUniButton
      Left = 960
      Top = 12
      Width = 87
      Height = 28
      Caption = 'Excel'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 7
      Images = UniMainModule.UniImageList1
      ImageIndex = 15
      OnClick = UniButton6Click
    end
    object HospitalNameLabel: TUniLabel
      Left = 24
      Top = 35
      Width = 121
      Height = 16
      Caption = 'HospitalNameLabel'
      ParentFont = False
      Font.Color = 8454016
      Font.Height = -13
      Font.Style = [fsBold]
      ParentColor = False
      Color = clSilver
      TabOrder = 8
    end
    object UniLabel4: TUniLabel
      Left = 469
      Top = 16
      Width = 22
      Height = 19
      Caption = 'HN'
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -16
      TabOrder = 9
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 63
    Width = 1259
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
      Left = 990
      Top = 47
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
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 144
    Width = 1259
    Height = 441
    DataSource = VisitListDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.PageSize = 23
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
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
end
