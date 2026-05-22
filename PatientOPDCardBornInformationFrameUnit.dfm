object PatientOPDCardBornInformationFrame: TPatientOPDCardBornInformationFrame
  Left = 0
  Top = 0
  Width = 806
  Height = 281
  Font.Height = -16
  TabOrder = 0
  ParentFont = False
  object UniGroupBox1: TUniGroupBox
    Left = 0
    Top = 0
    Width = 806
    Height = 281
    Caption = #3586#3657#3629#3617#3641#3621#3585#3634#3619#3648#3585#3636#3604
    Align = alClient
    TabOrder = 0
    object UniLabel1: TUniLabel
      Left = 375
      Top = 33
      Width = 96
      Height = 19
      Caption = #3609#3657#3635#3627#3609#3633#3585#3649#3619#3585#3648#3585#3636#3604
      ParentFont = False
      Font.Height = -16
      TabOrder = 1
    end
    object UniDBNumberEdit1: TUniDBNumberEdit
      Left = 480
      Top = 29
      Width = 129
      Height = 28
      RTL = True
      ParentRTL = False
      DataField = 'birth_weight'
      DataSource = bornDS
      TabOrder = 2
      DecimalSeparator = '.'
    end
    object UniLabel2: TUniLabel
      Left = 615
      Top = 33
      Width = 26
      Height = 19
      Caption = #3585#3619#3633#3617
      ParentFont = False
      Font.Height = -16
      TabOrder = 3
    end
    object UniLabel3: TUniLabel
      Left = 39
      Top = 33
      Width = 69
      Height = 19
      Caption = #3612#3641#3657#3607#3635#3588#3621#3629#3604
      ParentFont = False
      Font.Height = -16
      TabOrder = 4
    end
    object UniEdit3: TUniEdit
      Left = 112
      Top = 29
      Width = 221
      Height = 28
      RTL = True
      ParentRTL = False
      TabOrder = 5
    end
    object UniLabel4: TUniLabel
      Left = 39
      Top = 67
      Width = 136
      Height = 19
      Caption = 'Apgar Score 1 Min.'
      ParentFont = False
      Font.Height = -16
      TabOrder = 6
    end
    object UniDBNumberEdit2: TUniDBNumberEdit
      Left = 181
      Top = 63
      Width = 44
      Height = 28
      RTL = True
      ParentRTL = False
      DataField = 'apgar1'
      DataSource = bornDS
      TabOrder = 7
      DecimalSeparator = '.'
    end
    object UniLabel5: TUniLabel
      Left = 239
      Top = 67
      Width = 44
      Height = 19
      Caption = '5 Min.'
      ParentFont = False
      Font.Height = -16
      TabOrder = 8
    end
    object UniDBNumberEdit3: TUniDBNumberEdit
      Left = 289
      Top = 63
      Width = 44
      Height = 28
      RTL = True
      ParentRTL = False
      DataField = 'apgar2'
      DataSource = bornDS
      TabOrder = 9
      DecimalSeparator = '.'
    end
  end
  object bornCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 449
    Top = 45
  end
  object bornDS: TDataSource
    DataSet = bornCDS
    Left = 672
    Top = 34
  end
  object PatientDS: TDataSource
    DataSet = PatientCDS
    Left = 523
    Top = 48
  end
  object PatientCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 43
  end
end
