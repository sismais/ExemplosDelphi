unit Principal;

interface

uses
  Interfaces,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type



  TForm1 = class(TForm, ISismaisObserver)
    Button1: TButton;
    Label1: TLabel;
    lblCodCaixa: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    FInteiro: Integer;
    { Private declarations }
  public
    procedure Atualizar(ASender: TObject);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

uses
  SessaoUsuario, uForm3;

{$R *.dfm}

{É o seguinte! Senhor frmSessaoUsuario.CaixaAtual.CodigoCaixa.
Eu sou um anonimo, e preciso me conectar à você, para que, toda vez que eu seu valor mudar, eu faça um operação,
interna minha em conjunto. Você pode me notificar disso?

R: }

{ TForm1 }

procedure TForm1.Atualizar(ASender: TObject);
begin
  lblCodCaixa.Caption := TCaixaAtual(ASender).CodigoCaixa;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;

  FInteiro := 0;
end;

destructor TForm1.Destroy;
begin

  inherited;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  frmSessaoUsuario := TfrmSessaoUsuario.Create(Application);

  frmSessaoUsuario.CaixaAtual.AdicionarObserver(Self);

  Form3 := TForm3.Create(Self);
  Form3.Show;
end;

end.
