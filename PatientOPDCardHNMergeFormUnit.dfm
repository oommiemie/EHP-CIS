object PatientOPDCardHNMergeForm: TPatientOPDCardHNMergeForm
  Left = 0
  Top = 0
  ClientHeight = 652
  ClientWidth = 795
  Caption = 'PatientOPDCardHNMergeForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  FreeOnClose = False
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 45
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Color = 9452297
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 18
      Top = 13
      Width = 150
      Height = 19
      Caption = #3619#3623#3617#3586#3657#3629#3617#3641#3621#3648#3623#3594#3619#3632#3648#3610#3637#3618#3609
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
      LayoutConfig.Cls = 'font-bms-text-shadow-0'
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 608
    Width = 795
    Height = 44
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    DesignSize = (
      795
      44)
    object UniButton1: TUniButton
      Left = 707
      Top = 9
      Width = 75
      Height = 25
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
  end
  object SeSkinPanel1: TUniPanel
    Left = 0
    Top = 45
    Width = 795
    Height = 563
    Align = alClient
    TabOrder = 2
    object Label1: TUniLabel
      Left = 29
      Top = 29
      Width = 115
      Height = 19
      Caption = 'HN '#3607#3637#3656#3605#3657#3629#3591#3585#3634#3619#3619#3623#3617
      TabOrder = 9
    end
    object Label2: TUniLabel
      Left = 29
      Top = 72
      Width = 140
      Height = 19
      Caption = #3619#3623#3617#3652#3611#3652#3623#3657#3585#3633#3610#3627#3617#3634#3618#3648#3621#3586
      TabOrder = 10
    end
    object Label3: TUniLabel
      Left = 397
      Top = 72
      Width = 98
      Height = 19
      Visible = False
      Caption = #3617#3637' HN '#3609#3637#3657#3629#3618#3641#3656#3649#3621#3657#3623
      TabOrder = 11
    end
    object Label4: TUniLabel
      Left = 397
      Top = 29
      Width = 98
      Height = 19
      Visible = False
      Caption = #3617#3637' HN '#3609#3637#3657#3629#3618#3641#3656#3649#3621#3657#3623
      TabOrder = 12
    end
    object HNEdit1: TUniEdit
      Left = 180
      Top = 24
      Width = 145
      Height = 28
      TabOrder = 0
      ReadOnly = True
      OnChange = HNEdit1Change
    end
    object HNEdit2: TUniEdit
      Left = 180
      Top = 67
      Width = 145
      Height = 28
      TabOrder = 1
      OnChange = HNEdit2Change
    end
    object cxButton3: TUniButton
      Left = 374
      Top = 113
      Width = 181
      Height = 43
      Enabled = False
      Caption = #3619#3623#3617
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = cxButton3Click
    end
    object cxButton4: TUniButton
      Left = 329
      Top = 67
      Width = 62
      Height = 29
      Caption = #3588#3657#3609#3627#3634
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      OnClick = cxButton4Click
    end
    object cxButton5: TUniButton
      Left = 579
      Top = 113
      Width = 181
      Height = 43
      Enabled = False
      Visible = False
      Caption = #3618#3585#3648#3621#3636#3585#3585#3634#3619#3619#3623#3617
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxTextEdit1: TUniEdit
      Left = 518
      Top = 24
      Width = 242
      Height = 28
      TabOrder = 5
    end
    object cxTextEdit2: TUniEdit
      Left = 518
      Top = 67
      Width = 242
      Height = 28
      TabOrder = 6
    end
    object cxButton2: TUniButton
      Left = 180
      Top = 113
      Width = 181
      Height = 43
      Caption = #3648#3605#3619#3637#3618#3617#3585#3634#3619
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 7
      OnClick = cxButton2Click
    end
    object SPEdit: TUniMemo
      Left = 29
      Top = 169
      Width = 731
      Height = 323
      ReadOnly = True
      TabOrder = 13
    end
    object UniLabel2: TUniLabel
      Left = 29
      Top = 506
      Width = 345
      Height = 19
      Caption = #3585#3619#3640#3603#3634#3605#3619#3623#3592#3626#3629#3610' HN '#3607#3637#3656#3605#3657#3629#3591#3585#3634#3619#3619#3623#3617#3651#3627#3657#3604#3637#3585#3656#3629#3609#3604#3635#3648#3609#3636#3609#3585#3634#3619
      ParentFont = False
      Font.Color = 176
      Font.Height = -16
      TabOrder = 14
    end
  end
end
