object PatientOPDCardNonDisclosureEntryForm: TPatientOPDCardNonDisclosureEntryForm
  Left = 0
  Top = 0
  ClientHeight = 380
  ClientWidth = 620
  Caption = 'PatientOPDCardNonDisclosureEntryForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 45
    Align = alTop
    TabOrder = 0
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 12
      Top = 11
      Width = 93
      Height = 23
      Caption = #3586#3657#3629#3617#3641#3621#3611#3585#3611#3636#3604
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      TabOrder = 1
    end
  end
  object UniPanel4: TUniPanel
    Left = 0
    Top = 336
    Width = 620
    Height = 44
    Align = alBottom
    TabOrder = 1
    object UniButton1: TUniButton
      Left = 448
      Top = 8
      Width = 75
      Height = 27
      Caption = #3610#3633#3609#3607#3638#3585
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 1
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 529
      Top = 8
      Width = 75
      Height = 27
      Caption = #3611#3636#3604
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
    end
    object UniButton3: TUniButton
      Left = 12
      Top = 8
      Width = 84
      Height = 27
      Caption = #3621#3610
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 7
      OnClick = UniButton3Click
    end
  end
  object UniDBMemo1: TUniDBMemo
    Left = 0
    Top = 45
    Width = 620
    Height = 291
    DataField = 'non_disclosure_text'
    DataSource = PatientNondisclosureDS
    Align = alClient
    TabOrder = 2
  end
  object PatientNondisclosureCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    BeforePost = PatientNondisclosureCDSBeforePost
    Left = 160
    Top = 168
    Data = {
      E50000009619E0BD010000001800000005000100000003000000AD0019706174
      69656E745F6E6F6E5F646973636C6F737572655F696404000100000000000268
      6E01004900000001000557494454480200020009000A6F6666696365725F6964
      0400010000000000136E6F6E5F646973636C6F737572655F7465787404004B00
      00000100075355425459504502004900050054657874000F7570646174655F64
      61746574696D6508000800000000000000000000040000000930303030303030
      30321B0C000017000000C1D5A1D2C3BBE8C7C2B7D2A7A8D4B5E0C5E7A1B9E9CD
      C200782689A8F9CC42}
  end
  object PatientNondisclosureDS: TDataSource
    DataSet = PatientNondisclosureCDS
    Left = 427
    Top = 173
  end
end
