object frmSessaoUsuario: TfrmSessaoUsuario
  Left = 0
  Top = 0
  Caption = 'frmSessaoUsuario'
  ClientHeight = 204
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tmrSimulaAlteracaoCaixa: TTimer
    OnTimer = tmrSimulaAlteracaoCaixaTimer
    Left = 264
    Top = 72
  end
end
