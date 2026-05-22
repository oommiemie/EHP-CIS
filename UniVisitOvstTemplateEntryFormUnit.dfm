object UniVisitOvstTemplateEntryForm: TUniVisitOvstTemplateEntryForm
  Left = 0
  Top = 0
  ClientHeight = 477
  ClientWidth = 721
  Caption = 'UniVisitOvstTemplateEntryForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 85
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    DesignSize = (
      721
      85)
    object UniLabel1: TUniLabel
      Left = 13
      Top = 12
      Width = 257
      Height = 23
      Caption = ' '#3586#3657#3629#3617#3641#3621' Template '#3585#3634#3619#3626#3656#3591#3605#3619#3623#3592
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object LogButton: TUniButton
      Left = 634
      Top = 12
      Width = 75
      Height = 29
      Caption = 'Log'
      Anchors = [akTop, akRight]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 12
      OnClick = LogButtonClick
    end
    object UniDBText1: TUniDBText
      Left = 23
      Top = 46
      Width = 84
      Height = 19
      DataField = 'ovst_template_id'
      DataSource = OvstTemplateDS
      ParentFont = False
      Font.Color = 16777088
      Font.Height = -16
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 420
    Width = 721
    Height = 57
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      721
      57)
    object UniButton1: TUniButton
      Left = 13
      Top = 16
      Width = 78
      Height = 27
      Caption = #3621#3610
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 7
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 634
      Top = 16
      Width = 75
      Height = 27
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton2Click
    end
    object UniButton3: TUniButton
      Left = 548
      Top = 16
      Width = 80
      Height = 27
      Caption = #3610#3633#3609#3607#3638#3585
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 1
      OnClick = UniButton3Click
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 85
    Width = 721
    Height = 335
    Align = alClient
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    ExplicitTop = 98
    ExplicitWidth = 686
    ExplicitHeight = 286
    object UniLabel2: TUniLabel
      Left = 14
      Top = 47
      Width = 38
      Height = 19
      Caption = #3649#3612#3609#3585
      TabOrder = 1
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 141
      Top = 47
      Width = 543
      Height = 28
      ListField = 'name'
      ListSource = UniMainModule.SpcltyDS
      KeyField = 'spclty'
      ListFieldIndex = 0
      DataField = 'spclty'
      DataSource = OvstTemplateDS
      AnyMatch = True
      TabOrder = 2
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel3: TUniLabel
      Left = 14
      Top = 81
      Width = 36
      Height = 19
      Caption = #3626#3634#3586#3634
      TabOrder = 3
    end
    object UniDBLookupComboBox2: TUniDBLookupComboBox
      Left = 141
      Top = 81
      Width = 543
      Height = 28
      ListField = 'sub_spclty_name'
      ListSource = UniMainModule.SubSpcltyDS
      KeyField = 'sub_spclty_id'
      ListFieldIndex = 0
      DataField = 'sub_spclty_id'
      DataSource = OvstTemplateDS
      AnyMatch = True
      TabOrder = 4
      Color = clWindow
      Style = csDropDown
    end
    object UniDBLookupComboBox3: TUniDBLookupComboBox
      Left = 141
      Top = 115
      Width = 216
      Height = 28
      ListField = 'name'
      ListSource = UniMainModule.ERPtTypeDS
      KeyField = 'er_pt_type'
      ListFieldIndex = 0
      DataField = 'er_pt_type'
      DataSource = OvstTemplateDS
      TabOrder = 5
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel4: TUniLabel
      Left = 14
      Top = 115
      Width = 87
      Height = 19
      Caption = #3611#3619#3632#3648#3616#3607#3612#3641#3657#3611#3656#3623#3618
      TabOrder = 6
    end
    object UniDBLookupComboBox4: TUniDBLookupComboBox
      Left = 461
      Top = 115
      Width = 223
      Height = 28
      ListField = 'name'
      ListSource = UniMainModule.OvstIstDS
      KeyField = 'ovstist'
      ListFieldIndex = 0
      DataField = 'ovstist'
      DataSource = OvstTemplateDS
      TabOrder = 7
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel5: TUniLabel
      Left = 363
      Top = 118
      Width = 92
      Height = 19
      Caption = #3611#3619#3632#3648#3616#3607#3585#3634#3619#3617#3634
      TabOrder = 8
    end
    object UniLabel6: TUniLabel
      Left = 14
      Top = 151
      Width = 84
      Height = 19
      Caption = #3588#3623#3634#3617#3648#3619#3656#3591#3604#3656#3623#3609
      TabOrder = 9
    end
    object UniDBLookupComboBox5: TUniDBLookupComboBox
      Left = 141
      Top = 149
      Width = 216
      Height = 28
      ListField = 'name'
      ListSource = UniMainModule.PtPriorityDS
      KeyField = 'id'
      ListFieldIndex = 0
      DataField = 'pt_priority'
      DataSource = OvstTemplateDS
      TabOrder = 10
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel7: TUniLabel
      Left = 14
      Top = 185
      Width = 69
      Height = 19
      Caption = #3626#3656#3591#3648#3586#3657#3634#3627#3657#3629#3591
      TabOrder = 11
    end
    object UniDBLookupComboBox6: TUniDBLookupComboBox
      Left = 141
      Top = 183
      Width = 543
      Height = 28
      ListField = 'department'
      ListSource = UniMainModule.Kskdepartmentds
      KeyField = 'depcode'
      ListFieldIndex = 0
      DataField = 'cur_dep'
      DataSource = OvstTemplateDS
      AnyMatch = True
      TabOrder = 12
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel8: TUniLabel
      Left = 368
      Top = 151
      Width = 74
      Height = 19
      Caption = #3648#3623#3621#3634#3607#3635#3585#3634#3619
      TabOrder = 13
    end
    object UniDBLookupComboBox7: TUniDBLookupComboBox
      Left = 461
      Top = 149
      Width = 223
      Height = 28
      ListField = 'visit_type_name'
      ListSource = UniMainModule.VisitTypeDS
      KeyField = 'visit_type'
      ListFieldIndex = 0
      DataField = 'visit_type'
      DataSource = OvstTemplateDS
      TabOrder = 14
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel9: TUniLabel
      Left = 14
      Top = 219
      Width = 88
      Height = 19
      Caption = #3611#3619#3632#3648#3616#3607#3588#3609#3652#3586#3657
      TabOrder = 15
    end
    object UniDBLookupComboBox8: TUniDBLookupComboBox
      Left = 141
      Top = 217
      Width = 216
      Height = 28
      ListField = 'name'
      ListSource = UniMainModule.PtSubTypeDS
      KeyField = 'pt_subtype'
      ListFieldIndex = 0
      DataField = 'pt_subtype'
      DataSource = OvstTemplateDS
      TabOrder = 16
      Color = clWindow
    end
    object UniLabel10: TUniLabel
      Left = 13
      Top = 251
      Width = 119
      Height = 19
      Caption = #3648#3611#3655#3609#3588#3609#3652#3586#3657#3586#3629#3591#3627#3657#3629#3591
      TabOrder = 17
    end
    object UniDBLookupComboBox9: TUniDBLookupComboBox
      Left = 141
      Top = 251
      Width = 543
      Height = 28
      ListField = 'department'
      ListSource = UniMainModule.Kskdepartmentds
      KeyField = 'depcode'
      ListFieldIndex = 0
      DataField = 'main_dep'
      DataSource = OvstTemplateDS
      AnyMatch = True
      TabOrder = 18
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel11: TUniLabel
      Left = 17
      Top = 287
      Width = 90
      Height = 19
      Caption = #3626#3636#3607#3608#3636#3585#3634#3619#3619#3633#3585#3625#3634
      TabOrder = 19
    end
    object UniDBLookupComboBox10: TUniDBLookupComboBox
      Left = 141
      Top = 285
      Width = 543
      Height = 28
      ListField = 'name'
      ListSource = UniMainModule.PttypeLookupDS
      KeyField = 'pttype'
      ListFieldIndex = 0
      DataField = 'pttype'
      DataSource = OvstTemplateDS
      AnyMatch = True
      TabOrder = 20
      Color = clWindow
      Style = csDropDown
    end
    object UniLabel12: TUniLabel
      Left = 14
      Top = 12
      Width = 91
      Height = 19
      Caption = #3594#3639#3656#3629' Template'
      TabOrder = 21
    end
    object UniDBEdit1: TUniDBEdit
      Left = 141
      Top = 11
      Width = 543
      Height = 28
      DataField = 'template_name'
      DataSource = OvstTemplateDS
      TabOrder = 22
    end
  end
  object OvstTemplateCDS: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = ' select * from ovst_template where 1<0'#13#10
    Params = <>
    BeforePost = OvstTemplateCDSBeforePost
    Left = 350
    Top = 5
    Data = {
      220400009619E0BD01000000180000000E0000000000030000002204106F7673
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
      797065000000}
  end
  object OvstTemplateDS: TDataSource
    DataSet = OvstTemplateCDS
    Left = 416
    Top = 6
  end
end
