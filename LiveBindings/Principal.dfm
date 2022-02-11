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
    Width = 3
    Height = 13
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
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Tag = 1
    Left = 40
    Top = 144
    Width = 320
    Height = 120
    ColCount = 1
    FixedCols = 0
    RowCount = 201
    TabOrder = 1
    ColWidths = (
      64)
  end
  object AdapterBindSource1: TAdapterBindSource
    AutoActivate = True
    OnCreateAdapter = AdapterBindSource1CreateAdapter
    Adapter = DataGeneratorAdapter1
    ScopeMappings = <>
    Left = 352
    Top = 32
  end
  object DataGeneratorAdapter1: TDataGeneratorAdapter
    FieldDefs = <
      item
        Name = 'CodigoCaixa'
        ReadOnly = False
      end>
    Active = True
    AutoPost = False
    Options = [loptAllowInsert, loptAllowDelete, loptAllowModify]
    Left = 240
    Top = 16
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      FieldName = 'CodigoCaixa'
      Component = lblCodCaixa
      ComponentProperty = 'Caption'
    end
    object LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource1
      GridControl = StringGrid1
      Columns = <>
    end
  end
end
