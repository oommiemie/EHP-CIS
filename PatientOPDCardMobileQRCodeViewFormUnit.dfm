object PatientOPDCardMobileQRCodeViewForm: TPatientOPDCardMobileQRCodeViewForm
  Left = 0
  Top = 0
  ClientHeight = 701
  ClientWidth = 723
  Caption = 'PatientOPDCardMobileQRCodeViewForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 44
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 11
      Top = 11
      Width = 239
      Height = 23
      Caption = 'Mobile QR Code Register'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 655
    Width = 723
    Height = 46
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      723
      46)
    object UniButton2: TUniButton
      Left = 635
      Top = 9
      Width = 75
      Height = 27
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton2Click
    end
  end
  object UniPanel3: TUniPanel
    Left = 0
    Top = 44
    Width = 723
    Height = 611
    Align = alClient
    TabOrder = 2
    BorderStyle = ubsNone
    object UniPanel4: TUniPanel
      Left = 0
      Top = 0
      Width = 723
      Height = 43
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Color = clWhite
    end
    object UniImage1: TUniImage
      Left = 43
      Top = 43
      Width = 637
      Height = 525
      Align = alClient
      LayoutConfig.Cls = 'imgPhoto'
    end
    object UniPanel5: TUniPanel
      Left = 0
      Top = 568
      Width = 723
      Height = 43
      Align = alBottom
      TabOrder = 3
      BorderStyle = ubsNone
      Color = clWhite
    end
    object UniPanel6: TUniPanel
      Left = 0
      Top = 43
      Width = 43
      Height = 525
      Align = alLeft
      TabOrder = 4
      BorderStyle = ubsNone
      Color = clWhite
    end
    object UniPanel7: TUniPanel
      Left = 680
      Top = 43
      Width = 43
      Height = 525
      Align = alRight
      TabOrder = 5
      BorderStyle = ubsNone
      Color = clWhite
    end
  end
end
