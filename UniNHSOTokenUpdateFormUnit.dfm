object UniNHSOTokenUpdateForm: TUniNHSOTokenUpdateForm
  Left = 0
  Top = 0
  ClientHeight = 234
  ClientWidth = 617
  Caption = 'UniNHSOTokenUpdateForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 40
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object TitleLabel: TUniLabel
      Left = 12
      Top = 10
      Width = 326
      Height = 19
      Caption = ' Update '#3586#3657#3629#3617#3641#3621' Token '#3605#3619#3623#3592#3626#3629#3610#3626#3636#3607#3608#3636' '#3626#3611#3626#3594'.'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 187
    Width = 617
    Height = 47
    Align = alBottom
    ParentFont = False
    Font.Height = -13
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      617
      47)
    object CloseButton: TUniButton
      Left = 512
      Top = 7
      Width = 85
      Height = 30
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      ImageIndex = 3
      OnClick = CloseButtonClick
    end
    object OKButton: TUniButton
      Left = 414
      Top = 7
      Width = 89
      Height = 30
      Caption = #3605#3585#3621#3591
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      ImageIndex = 4
      OnClick = OKButtonClick
    end
  end
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 40
    Width = 617
    Height = 147
    Caption = 'Upload'
    Align = alClient
    TabOrder = 2
    object UniButton1: TUniButton
      Left = 363
      Top = 43
      Width = 172
      Height = 66
      Caption = 'Upload Token'
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      ImageIndex = 5
      OnClick = UniButton1Click
    end
    object UniLabel1: TUniLabel
      Left = 46
      Top = 46
      Width = 27
      Height = 19
      Caption = 'CID'
      TabOrder = 2
    end
    object TokenCIDEdit: TUniEdit
      Left = 86
      Top = 43
      Width = 252
      Height = 28
      TabOrder = 3
      ReadOnly = True
    end
    object UniLabel2: TUniLabel
      Left = 29
      Top = 85
      Width = 44
      Height = 19
      Caption = 'Token'
      TabOrder = 4
    end
    object TokenDataEdit: TUniEdit
      Left = 86
      Top = 81
      Width = 252
      Height = 28
      TabOrder = 5
      ReadOnly = True
    end
  end
  object UniFileUpload1: TUniFileUpload
    MaxAllowedSize = 5000
    Filter = '*/*'
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
    Overwrite = True
    OnCompleted = UniFileUpload1Completed
    Left = 321
    Top = 45
  end
end
