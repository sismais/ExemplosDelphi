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
  object Label4: TLabel
    Left = 216
    Top = 120
    Width = 34
    Height = 15
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 216
    Top = 99
    Width = 209
    Height = 15
    Caption = 'Seu plano atual '#233' (Channel Subscribed):'
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
    Width = 600
    Height = 217
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button1: TButton
    Left = 525
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Abrir Form'
    TabOrder = 2
    OnClick = Button1Click
  end
end
