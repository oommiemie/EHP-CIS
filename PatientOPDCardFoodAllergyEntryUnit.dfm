object PatientOPDCardFoodAllergyEntryUniForm: TPatientOPDCardFoodAllergyEntryUniForm
  Left = 0
  Top = 0
  ClientHeight = 511
  ClientWidth = 704
  Caption = 'PatientOPDCardFoodAllergyEntryUniForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -16
  PixelsPerInch = 96
  TextHeight = 19
  object UniSimplePanel1: TUniPanel
    Left = 0
    Top = 466
    Width = 704
    Height = 45
    Align = alBottom
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    DesignSize = (
      704
      45)
    object UniButton1: TUniButton
      Left = 16
      Top = 8
      Width = 90
      Height = 28
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
      Left = 514
      Top = 8
      Width = 83
      Height = 28
      Caption = #3610#3633#3609#3607#3638#3585
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 1
      OnClick = UniButton2Click
    end
    object UniButton3: TUniButton
      Left = 603
      Top = 8
      Width = 85
      Height = 28
      Caption = #3611#3636#3604
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 3
      Images = UniMainModule.UniImageList1
      ImageIndex = 3
      OnClick = UniButton3Click
    end
  end
  object UniSimplePanel2: TUniSimplePanel
    Left = 0
    Top = 0
    Width = 704
    Height = 49
    ParentColor = False
    Color = 9452297
    Align = alTop
    TabOrder = 1
    LayoutConfig.BodyCls = 'panel-bms-header-bg-1'
    object UniLabel1: TUniLabel
      Left = 16
      Top = 16
      Width = 140
      Height = 19
      Caption = #3586#3657#3629#3617#3641#3621#3585#3634#3619#3649#3614#3657#3629#3634#3627#3634#3619
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 1
    end
  end
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 49
    Width = 704
    Height = 417
    Caption = #3585#3634#3619#3649#3614#3657#3629#3634#3627#3634#3619
    Align = alClient
    TabOrder = 2
    object UniLabel2: TUniLabel
      Left = 21
      Top = 33
      Width = 94
      Height = 19
      Caption = #3594#3639#3656#3629#3629#3634#3627#3634#3619#3607#3637#3656#3649#3614#3657
      TabOrder = 1
    end
    object UniLabel3: TUniLabel
      Left = 21
      Top = 98
      Width = 62
      Height = 19
      Caption = #3627#3617#3634#3618#3648#3627#3605#3640
      TabOrder = 2
    end
    object UniLabel4: TUniLabel
      Left = 21
      Top = 66
      Width = 73
      Height = 19
      Caption = #3629#3634#3585#3634#3619#3607#3637#3656#3649#3614#3657
      TabOrder = 3
    end
    object UniDBEdit1: TUniDBEdit
      Left = 121
      Top = 29
      Width = 567
      Height = 28
      DataField = 'agent'
      DataSource = FoodAllergyDS
      TabOrder = 4
    end
    object UniDBEdit2: TUniDBEdit
      Left = 121
      Top = 63
      Width = 567
      Height = 28
      DataField = 'symptom'
      DataSource = FoodAllergyDS
      TabOrder = 5
    end
    object UniDBMemo1: TUniDBMemo
      Left = 121
      Top = 99
      Width = 567
      Height = 295
      DataField = 'allergy_note'
      DataSource = FoodAllergyDS
      ScrollBars = ssVertical
      TabOrder = 6
    end
  end
  object FoodAllergyCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = FoodAllergyCDSBeforePost
    Left = 375
    Top = 270
  end
  object FoodAllergyDS: TDataSource
    DataSet = FoodAllergyCDS
    Left = 496
    Top = 288
  end
end
