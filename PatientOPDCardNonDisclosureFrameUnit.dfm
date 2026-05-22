object PatientOPDCardNonDisclosureFrame: TPatientOPDCardNonDisclosureFrame
  Left = 0
  Top = 0
  Width = 695
  Height = 438
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 695
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
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 47
    Width = 695
    Height = 391
    TitleFont.Height = -13
    TitleFont.Style = [fsBold]
    DataSource = PatientNondisclosureDS
    LoadMask.Message = 'Loading data...'
    LayoutConfig.Cls = 'opdcard-patient-non-disclosure-grid'
    Align = alClient
    TabOrder = 1
    OnDrawColumnCell = UniDBGrid1DrawColumnCell
    Columns = <
      item
        FieldName = 'patient_non_disclosure_id'
        Title.Caption = #3621#3635#3604#3633#3610
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 49
      end
      item
        FieldName = 'update_datetime'
        Title.Caption = ' '#3623#3633#3609#3607#3637#3656'/'#3648#3623#3621#3634
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 157
      end
      item
        FieldName = 'non_disclosure_text'
        Title.Caption = ' '#3619#3634#3618#3621#3632#3648#3629#3637#3618#3604
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Width = 336
        DisplayMemo = True
      end>
  end
  object PatientNondisclosureDS: TDataSource
    DataSet = PatientNondisclosureCDS
    Left = 368
    Top = 232
  end
  object PatientNondisclosureCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 209
  end
end
