unit SessaoUsuario;

interface

uses
  Observer.Classes,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  System.Generics.Collections;

type
  /// <summary>
  ///  #NS-10 - Record para guardar informações do caixa atual em operação pelo usuário. Usado no login automático no caixa.
  /// </summary>
  TCaixaAtual = class(TSismaisObservable)
  private
    FCodigoCaixa: String;
    FUsuarioLogin: String;
    FUsuarioSenha: String;
    procedure SetCodigoCaixa(const Value: String);
    procedure SetUsuarioLogin(const Value: String);
  public
    /// <summary> Código do caixa em operação atualmente. </summary>
    property CodigoCaixa: String read FCodigoCaixa write SetCodigoCaixa;
    /// <summary> Login do usuáro que está operando o caixa atualmente.</summary>
    property UsuarioLogin: String read FUsuarioLogin write SetUsuarioLogin;
    /// <summary> Senha do usuário que está operando o caixa atualmente (senha descriptografada). </summary>
    property UsuarioSenha: String read FUsuarioSenha write FUsuarioSenha;
  end;


  TfrmSessaoUsuario = class(TForm)
    tmrSimulaAlteracaoCaixa: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tmrSimulaAlteracaoCaixaTimer(Sender: TObject);
  private
    FCaixaAtual: TCaixaAtual;
    FInteiro: Integer;
    { Private declarations }
  public
    { Public declarations }
    property CaixaAtual: TCaixaAtual read FCaixaAtual write FCaixaAtual;
  end;

var
  frmSessaoUsuario: TfrmSessaoUsuario;

implementation

{$R *.dfm}

procedure TfrmSessaoUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FCaixaAtual) then
    CaixaAtual.Free;
end;

procedure TfrmSessaoUsuario.FormCreate(Sender: TObject);
begin
  FCaixaAtual := TCaixaAtual.Create;
  FInteiro := 0;
end;

procedure TfrmSessaoUsuario.tmrSimulaAlteracaoCaixaTimer(Sender: TObject);
begin
  inc(FInteiro);
  if FCaixaAtual.CodigoCaixa = '' then
    FCaixaAtual.CodigoCaixa :=  Format('%6.6d',[FInteiro]); // resulta '00123';
  FCaixaAtual.UsuarioLogin := 'Usuário ' + FInteiro.ToString;
end;

{ TCaixaAtual }

procedure TCaixaAtual.SetCodigoCaixa(const Value: String);
begin
  FCodigoCaixa := Value;
  Notificar;
end;

procedure TCaixaAtual.SetUsuarioLogin(const Value: String);
begin
  FUsuarioLogin := Value;
  Notificar;
end;

end.
