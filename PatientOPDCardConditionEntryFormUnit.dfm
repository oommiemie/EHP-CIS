object PatientOPDCardConditionEntryForm: TPatientOPDCardConditionEntryForm
  Left = 0
  Top = 0
  ClientHeight = 356
  ClientWidth = 534
  Caption = 'PatientOPDCardConditionEntryForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -16
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 50
    Align = alTop
    TabOrder = 0
    Color = 9452297
    object UniLabel1: TUniLabel
      Left = 16
      Top = 17
      Width = 132
      Height = 19
      Caption = #3626#3606#3634#3609#3632#3614#3636#3648#3624#3625#3612#3641#3657#3611#3656#3623#3618
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      ParentColor = False
      Color = clMedGray
      TabOrder = 1
      LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    end
  end
  object UniPanel2: TUniPanel
    Left = 0
    Top = 316
    Width = 534
    Height = 40
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      534
      40)
    object UniButton1: TUniButton
      Left = 440
      Top = 8
      Width = 75
      Height = 25
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 1
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = #3621#3610
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = UniButton2Click
    end
    object UniButton3: TUniButton
      Left = 359
      Top = 8
      Width = 75
      Height = 25
      Caption = #3610#3633#3609#3607#3638#3585
      Anchors = [akTop, akRight, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      OnClick = UniButton3Click
    end
  end
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 50
    Width = 534
    Height = 266
    Caption = #3586#3657#3629#3617#3641#3621#3626#3606#3634#3609#3632#3614#3636#3648#3624#3625
    Align = alClient
    TabOrder = 2
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -16
    ExplicitTop = 52
    ExplicitWidth = 589
    ExplicitHeight = 250
    object UniLabel2: TUniLabel
      Left = 46
      Top = 35
      Width = 82
      Height = 19
      Caption = #3626#3606#3634#3609#3632#3614#3636#3648#3624#3625
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 66
      Top = 61
      Width = 62
      Height = 19
      Caption = #3627#3617#3634#3618#3648#3627#3605#3640
      TabOrder = 2
    end
    object UniDBLookupComboBox1: TUniDBLookupComboBox
      Left = 136
      Top = 30
      Width = 369
      Height = 28
      ListField = 'patient_condition_type_name'
      ListSource = ConditionTypeDS
      KeyField = 'patient_condition_type_id'
      ListFieldIndex = 0
      DataField = 'patient_condition_type_id'
      DataSource = PatientConditionDS
      TabOrder = 3
      Color = clWindow
    end
    object UniDBMemo1: TUniDBMemo
      Left = 136
      Top = 64
      Width = 369
      Height = 177
      DataField = 'condition_note'
      DataSource = PatientConditionDS
      ScrollBars = ssVertical
      TabOrder = 4
    end
  end
  object ConditionTypeDS: TDataSource
    DataSet = ConditionTypeCDS
    Left = 176
    Top = 8
  end
  object ConditionTypeCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 8
  end
  object PatientConditionCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = PatientConditionCDSBeforePost
    Left = 456
    Top = 8
  end
  object PatientConditionDS: TDataSource
    DataSet = PatientConditionCDS
    Left = 368
    Top = 8
  end
end
