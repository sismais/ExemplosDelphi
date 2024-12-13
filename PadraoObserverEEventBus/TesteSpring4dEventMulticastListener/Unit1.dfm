object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 120
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 16
    Top = 99
    Width = 93
    Height = 15
    Caption = 'Seu plano atual '#233':'
  end
  object Label3: TLabel
    Left = 16
    Top = 195
    Width = 123
    Height = 15
    Caption = 'Hist'#243'rico de altera'#231#245'es:'
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 56
    Width = 209
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Memo1: TMemo
    Left = 16
    Top = 216
    Width = 585
    Height = 217
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
