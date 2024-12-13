object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 302
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 72
    Width = 31
    Height = 13
    Caption = 'Caixa:'
  end
  object lblCodCaixa: TLabel
    Left = 120
    Top = 72
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 80
    Top = 112
    Width = 96
    Height = 13
    Caption = 'Outro Lugar. Caixa:'
  end
  object Label3: TLabel
    Left = 192
    Top = 112
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 80
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 16
    Top = 160
    Width = 521
    Height = 121
    Lines.Strings = (
      'Artigos de Refer'#234'ncia:'
      'https://www.andrecelestino.com/delphi-design-patterns-observer/')
    TabOrder = 1
  end
end
