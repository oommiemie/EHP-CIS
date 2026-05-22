object PatientOPDCardFoodAllergyListUniFrame: TPatientOPDCardFoodAllergyListUniFrame
  Left = 0
  Top = 0
  Width = 963
  Height = 522
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 47
    Width = 963
    Height = 475
    DataSource = FoodAllergyDS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    LayoutConfig.Cls = 'opdcard-food-allergy-grid'
    Align = alClient
    Font.Height = -16
    ParentFont = False
    TabOrder = 0
    OnDblClick = UniDBGrid1DblClick
    Columns = <
      item
        FieldName = 'food_allergy_id'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        FieldName = 'agent'
        Title.Caption = #3629#3634#3627#3634#3619#3607#3637#3656#3649#3614#3657
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 200
      end
      item
        FieldName = 'symptom'
        Title.Caption = #3629#3634#3585#3634#3619
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 200
      end
      item
        FieldName = 'allergy_note'
        Title.Caption = #3627#3617#3634#3618#3648#3627#3605#3640
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 148
        DisplayMemo = True
      end
      item
        FieldName = 'name'
        Title.Caption = #3612#3641#3657#3610#3633#3609#3607#3638#3585
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 132
      end
      item
        FieldName = 'update_datetime'
        Title.Caption = #3623#3633#3609#3607#3637#3656'/'#3648#3623#3621#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 150
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 47
    Align = alTop
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    object UniButton1: TUniButton
      Left = 12
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
      OnClick = UniButton1Click
    end
    object UniButton2: TUniButton
      Left = 107
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
      OnClick = UniButton2Click
    end
  end
  object FoodAllergyDS: TDataSource
    DataSet = FoodAllergyCDS
    Left = 496
    Top = 288
  end
  object FoodAllergyCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 405
    Top = 280
  end
end
