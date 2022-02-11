unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Bind.ObjectScope, Data.Bind.Components, Data.Bind.DBScope,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Vcl.Bind.Grid,
  Data.Bind.Grid, Vcl.Grids;

type



  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    lblCodCaixa: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    AdapterBindSource1: TAdapterBindSource;
    DataGeneratorAdapter1: TDataGeneratorAdapter;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceAdapterBindSource1: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
    procedure AdapterBindSource1CreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

uses
  unModuloUsuario, uForm3;

{$R *.dfm}

{É o seguinte! Senhor frmSessaoUsuario.CaixaAtual.CodigoCaixa.
Eu sou um anonimo, e preciso me conectar à você, para que, toda vez que eu seu valor mudar, eu faça um operação,
interna minha em conjunto. Você pode me notificar disso?

R: }

{ TForm1 }

procedure TForm1.AdapterBindSource1CreateAdapter(Sender: TObject; var ABindSourceAdapter: TBindSourceAdapter);
begin
  FModuloUsuario := TFModuloUsuario.Create(Application);
  ABindSourceAdapter := TObjectBindSourceAdapter<TCaixaAtual>.Create(Self, FModuloUsuario.CaixaAtual, False);

  FModuloUsuario.CaixaAtual.CodigoCaixa := 'AAA';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FModuloUsuario.FInteiro := FModuloUsuario.FInteiro + 1;
  FModuloUsuario.CaixaAtual.CodigoCaixa :=  FModuloUsuario.FInteiro.ToString;

  ShowMessage(FModuloUsuario.CaixaAtual.CodigoCaixa);
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TForm1.Destroy;
begin

  inherited;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form3 := TForm3.Create(Self);
  Form3.Show;
end;

end.
