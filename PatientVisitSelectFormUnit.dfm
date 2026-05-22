object PatientVisitSelectForm: TPatientVisitSelectForm
  Left = 0
  Top = 0
  ClientHeight = 577
  ClientWidth = 881
  Caption = 'PatientVisitSelectForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 45
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 11
      Top = 13
      Width = 121
      Height = 19
      Caption = #3648#3621#3639#3629#3585#3585#3634#3619#3626#3656#3591#3605#3619#3623#3592
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 519
    Width = 881
    Height = 58
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      881
      58)
    object UniButton1: TUniButton
      Left = 745
      Top = 15
      Width = 116
      Height = 30
      Caption = #3626#3656#3591#3605#3619#3623#3592#3651#3627#3617#3656
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 0
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 604
      Top = 15
      Width = 135
      Height = 30
      Caption = #3648#3621#3639#3629#3585#3619#3634#3618#3585#3634#3619#3648#3604#3636#3617
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 10
      OnClick = UniButton2Click
    end
    object CloseButton: TUniButton
      Left = 11
      Top = 15
      Width = 85
      Height = 30
      Caption = #3611#3636#3604
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = CloseButtonClick
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 45
    Width = 881
    Height = 474
    TitleFont.Height = -13
    DataSource = HistoryDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 2
    Columns = <
      item
        FieldName = 'rowid'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'vstdate'
        Title.Caption = #3623#3633#3609#3607#3637#3656
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 110
        Alignment = taCenter
      end
      item
        FieldName = 'vsttime'
        Title.Caption = #3648#3623#3621#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 94
        Alignment = taCenter
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
        FieldName = 'spclty_name'
        Title.Caption = #3649#3612#3609#3585
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 200
      end
      item
        FieldName = 'current_dep_name'
        Title.Caption = #3627#3657#3629#3591#3605#3619#3623#3592
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'doctor_name'
        Title.Caption = #3612#3641#3657#3605#3619#3623#3592
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 200
      end
      item
        FieldName = 'diagnosis_name'
        Title.Caption = #3612#3621#3585#3634#3619#3623#3636#3609#3636#3592#3593#3633#3618
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 300
      end
      item
        FieldName = 'income'
        Title.Caption = #3588#3656#3634#3610#3619#3636#3585#3634#3619
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 75
      end>
  end
  object HistoryCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select 0 as rowid,o.vn,o.vstdate,o.vsttime,v.age_y,s.name as spc' +
      'lty_name,o.staff,d.name as doctor_name ,'#13#10'     i.name as diagnos' +
      'is_name ,v.income,k.department as current_dep_name '#13#10'    from ov' +
      'st o '#13#10'     left outer join spclty s on s.spclty = o.spclty '#13#10'  ' +
      '  left outer join vn_stat v on v.vn = o.vn '#13#10'    left outer join' +
      ' doctor d on d.code = v.dx_doctor '#13#10'    left outer join kskdepar' +
      'tment k on k.depcode = o.cur_dep '#13#10#13#10'    left outer join icd101 ' +
      'i on i.code = v.main_pdx '#13#10' '#13#10' '#13#10' limit 5'#13#10
    Params = <>
    Left = 330
    Top = 107
    Data = {
      2C0300009619E0BD01000000180000000B0005000000030000003A0205726F77
      69640800010000000100064F524947494E020049800600726F7769640002766E
      0100490000000200055749445448020002000D00064F524947494E0200498008
      006F7673742E766E0007767374646174650400060000000100064F524947494E
      020049800D006F7673742E76737464617465000776737474696D650400070000
      000100064F524947494E020049800D006F7673742E76737474696D6500056167
      655F790200010000000100064F524947494E020049800E00766E5F737461742E
      6167655F79000B7370636C74795F6E616D650100490000000200055749445448
      020002009600064F524947494E020049800C007370636C74792E6E616D650005
      73746166660100490000000200055749445448020002000F00064F524947494E
      020049800B006F7673742E7374616666000B646F63746F725F6E616D65010049
      0000000200055749445448020002009600064F524947494E020049800C00646F
      63746F722E6E616D65000E646961676E6F7369735F6E616D6501004900000002
      0005574944544802000200C800064F524947494E020049800C00696364313031
      2E6E616D650006696E636F6D650800040000000100064F524947494E02004980
      0F00766E5F737461742E696E636F6D65001063757272656E745F6465705F6E61
      6D650100490000000200055749445448020002009600064F524947494E020049
      8019006B736B6465706172746D656E742E6465706172746D656E740000000000
      451500000000000000000C303931323232313435353539F34C0E00184C340304
      373030380000450500000000000000000C303831323234313234333435884B0E
      006028BB0204373030380DB5D6A1BCD9E9BBE8C7C2E3B9320000450500000000
      000000000C303730323235313033313178EC480E00D8FC410204373030380DB5
      D6A1BCD9E9BBE8C7C2E3B9320000450500000000000000000C30373032323131
      3334333039E8480E00C89DF10204373030380DB5D6A1BCD9E9BBE8C7C2E3B932
      0000441100000000000000000C393031313132303030303030AF310E00000000
      002B0204333030370000000000000000}
  end
  object HistoryDS: TDataSource
    DataSet = HistoryCDS
    Left = 384
    Top = 108
  end
end
