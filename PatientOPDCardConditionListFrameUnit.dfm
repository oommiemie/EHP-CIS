object PatientOPDCardConditionListFrame: TPatientOPDCardConditionListFrame
  Left = 0
  Top = 0
  Width = 782
  Height = 494
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 47
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    object UniButton1: TUniButton
      Left = 12
      Top = 9
      Width = 89
      Height = 27
      Caption = #3648#3614#3636#3656#3617
      ParentFont = False
      Font.Charset = ANSI_CHARSET
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
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Style = [fsBold]
      TabOrder = 2
      Images = UniMainModule.UniImageList1
      ImageIndex = 10
      OnClick = UniButton2Click
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 47
    Width = 782
    Height = 447
    DataSource = PatientConditionDS
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    LayoutConfig.Cls = 'opdcard-patient-condition-grid'
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Height = -16
    ParentFont = False
    TabOrder = 1
    Columns = <
      item
        FieldName = 'patient_condition_id'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 64
        Font.Charset = ANSI_CHARSET
      end
      item
        FieldName = 'patient_condition_type_name'
        Title.Caption = #3626#3606#3634#3609#3632
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 250
        Font.Charset = ANSI_CHARSET
      end
      item
        FieldName = 'condition_note'
        Title.Caption = ' '#3627#3617#3634#3618#3648#3627#3605#3640
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 250
        Font.Charset = ANSI_CHARSET
        DisplayMemo = True
      end>
  end
  object PatientConditionDS: TDataSource
    DataSet = PatientConditionCDS
    Left = 392
    Top = 8
  end
  object PatientConditionCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 8
  end
end
