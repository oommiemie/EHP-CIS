object UniVisitOvstTemplateListForm: TUniVisitOvstTemplateListForm
  Left = 0
  Top = 0
  ClientHeight = 656
  ClientWidth = 1362
  Caption = 'UniVisitOvstTemplateListForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  OnCreate = UniFrameCreate
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 609
    Width = 1362
    Height = 47
    Align = alBottom
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    DesignSize = (
      1362
      47)
    object AddButton: TUniButton
      Left = 13
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
      OnClick = AddButtonClick
    end
    object EditButton: TUniButton
      Left = 108
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
      OnClick = EditButtonClick
    end
    object UniButton1: TUniButton
      Left = 1258
      Top = 9
      Width = 89
      Height = 27
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 1163
      Top = 9
      Width = 89
      Height = 27
      Caption = #3605#3585#3621#3591
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 4
      Images = UniMainModule.UniImageList1
      ImageIndex = 4
      OnClick = UniButton2Click
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 99
    Width = 1362
    Height = 510
    DataSource = OvstTemplateListDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    OnDblClick = EditButtonClick
    Columns = <
      item
        FieldName = 'ovst_template_id'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'template_name'
        Title.Caption = #3594#3639#3656#3629' Template'
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 200
      end
      item
        FieldName = 'spclty_name'
        Title.Caption = #3649#3612#3609#3585
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'sub_spclty_name'
        Title.Caption = #3626#3634#3586#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'er_pt_type_name'
        Title.Caption = #3611#3619#3632#3648#3616#3607#3612#3641#3657#3611#3656#3623#3618
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
        Width = 100
      end
      item
        FieldName = 'cur_dep_name'
        Title.Caption = #3626#3656#3591#3605#3656#3629#3652#3611#3607#3637#3656#3627#3657#3629#3591
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        FieldName = 'visit_type_name'
        Title.Caption = #3648#3623#3621#3634#3607#3635#3585#3634#3619
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 75
      end
      item
        FieldName = 'pt_subtype_name'
        Title.Caption = #3611#3619#3632#3648#3616#3607#3588#3609#3652#3586#3657
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'main_dep_name'
        Title.Caption = #3648#3611#3655#3609#3588#3609#3652#3586#3657#3586#3629#3591#3627#3657#3629#3591
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        FieldName = 'pttype_name'
        Title.Caption = #3626#3636#3607#3608#3636#3585#3634#3619#3619#3633#3585#3625#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end>
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 0
    Width = 1362
    Height = 99
    Align = alTop
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 13
      Top = 12
      Width = 267
      Height = 23
      Caption = #3619#3634#3618#3585#3634#3619' Template '#3585#3634#3619#3626#3656#3591#3605#3619#3623#3592
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-1'
    end
    object UniLabel2: TUniLabel
      Left = 24
      Top = 56
      Width = 38
      Height = 19
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Color = 8453888
      Font.Height = -16
      TabOrder = 2
    end
    object SearchEdit: TUniEdit
      Left = 73
      Top = 54
      Width = 243
      Height = 27
      TabOrder = 3
    end
    object RefreshButton: TUniButton
      Left = 322
      Top = 54
      Width = 75
      Height = 27
      Caption = #3649#3626#3604#3591
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 4
      Images = UniMainModule.UniImageList1
      ImageIndex = 12
      OnClick = RefreshButtonClick
    end
  end
  object OvstTemplateListCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'select o.*,s1.name as spclty_name ,s2.sub_spclty_name,e1.name as' +
      ' er_pt_type_name ,'#13#10'o2.name as ovstist_name,p1.name as pt_priori' +
      'ty_name ,k1.department as cur_dep_name ,'#13#10'v1.visit_type_name,p2.' +
      'name as pt_subtype_name ,k2.department as main_dep_name ,'#13#10'p3.na' +
      'me as pttype_name'#13#10'from ovst_template o'#13#10'left outer join spclty ' +
      's1 on s1.spclty = o.spclty'#13#10'left outer join sub_spclty s2 on s2.' +
      'sub_spclty_id = o.sub_spclty_id'#13#10'left outer join er_pt_type e1 o' +
      'n e1.er_pt_type = o.er_pt_type'#13#10'left outer join ovstist o2 on o2' +
      '.ovstist = o.ovstist'#13#10'left outer join pt_priority p1 on p1.id = ' +
      'o.pt_priority'#13#10'left outer join kskdepartment k1 on k1.depcode = ' +
      'o.cur_dep'#13#10'left outer join visit_type v1 on v1.visit_type = o.vi' +
      'sit_type'#13#10'left outer join pt_subtype p2 on p2.pt_subtype = o.pt_' +
      'subtype'#13#10'left outer join kskdepartment k2 on k2.depcode = o.main' +
      '_dep'#13#10'left outer join pttype p3 on p3.pttype = o.pttype'#13#10'where 1' +
      '<0'#13#10
    Params = <>
    ReadOnly = True
    Left = 446
    Top = 214
    Data = {
      BB0600009619E0BD010000001800000018000000000003000000BB06106F7673
      745F74656D706C6174655F69640400010000000100064F524947494E02004980
      1F006F7673745F74656D706C6174652E6F7673745F74656D706C6174655F6964
      000D74656D706C6174655F6E616D650100490000000200055749445448020002
      00C800064F524947494E020049801C006F7673745F74656D706C6174652E7465
      6D706C6174655F6E616D65000573746166660100490000000200055749445448
      020002003200064F524947494E0200498014006F7673745F74656D706C617465
      2E7374616666000F7570646174655F6461746574696D65080008000000010006
      4F524947494E020049801E006F7673745F74656D706C6174652E757064617465
      5F6461746574696D6500067370636C7479010049000000030007535542545950
      45020049000A0046697865644368617200055749445448020002000200064F52
      4947494E0200498015006F7673745F74656D706C6174652E7370636C7479000D
      7375625F7370636C74795F69640400010000000100064F524947494E02004980
      1C006F7673745F74656D706C6174652E7375625F7370636C74795F6964000A65
      725F70745F747970650400010000000100064F524947494E0200498019006F76
      73745F74656D706C6174652E65725F70745F7479706500076F76737469737401
      004900000003000753554254595045020049000A004669786564436861720005
      5749445448020002000200064F524947494E0200498016006F7673745F74656D
      706C6174652E6F767374697374000B70745F7072696F72697479040001000000
      0100064F524947494E020049801A006F7673745F74656D706C6174652E70745F
      7072696F7269747900076375725F646570010049000000030007535542545950
      45020049000A0046697865644368617200055749445448020002000300064F52
      4947494E0200498016006F7673745F74656D706C6174652E6375725F64657000
      0A76697369745F7479706501004900000003000753554254595045020049000A
      0046697865644368617200055749445448020002000100064F524947494E0200
      498019006F7673745F74656D706C6174652E76697369745F74797065000A7074
      5F737562747970650400010000000100064F524947494E0200498019006F7673
      745F74656D706C6174652E70745F7375627479706500086D61696E5F64657001
      004900000003000753554254595045020049000A004669786564436861720005
      5749445448020002000300064F524947494E0200498017006F7673745F74656D
      706C6174652E6D61696E5F646570000670747479706501004900000003000753
      554254595045020049000A004669786564436861720005574944544802000200
      0200064F524947494E0200498015006F7673745F74656D706C6174652E707474
      797065000B7370636C74795F6E616D6501004900000002000557494454480200
      02009600064F524947494E020049800C007370636C74792E6E616D65000F7375
      625F7370636C74795F6E616D65010049000000020005574944544802000200C8
      00064F524947494E020049801B007375625F7370636C74792E7375625F737063
      6C74795F6E616D65000F65725F70745F747970655F6E616D6501004900000002
      00055749445448020002003200064F524947494E02004980100065725F70745F
      747970652E6E616D65000C6F7673746973745F6E616D65010049000000020005
      5749445448020002003200064F524947494E020049800D006F7673746973742E
      6E616D65001070745F7072696F726974795F6E616D6501004900000002000557
      49445448020002006400064F524947494E02004980110070745F7072696F7269
      74792E6E616D65000C6375725F6465705F6E616D650100490000000200055749
      445448020002009600064F524947494E0200498019006B736B6465706172746D
      656E742E6465706172746D656E74000F76697369745F747970655F6E616D6501
      00490000000200055749445448020002009600064F524947494E020049801B00
      76697369745F747970652E76697369745F747970655F6E616D65000F70745F73
      7562747970655F6E616D65010049000000020005574944544802000200C80006
      4F524947494E02004980100070745F737562747970652E6E616D65000D6D6169
      6E5F6465705F6E616D650100490000000200055749445448020002009600064F
      524947494E0200498019006B736B6465706172746D656E742E6465706172746D
      656E74000B7074747970655F6E616D6501004900000002000557494454480200
      0200FA00064F524947494E020049800C007074747970652E6E616D65000000}
  end
  object OvstTemplateListDS: TDataSource
    DataSet = OvstTemplateListCDS
    Left = 538
    Top = 220
  end
end
