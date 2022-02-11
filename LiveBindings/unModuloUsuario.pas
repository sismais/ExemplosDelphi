unit unModuloUsuario;

interface

uses
  System.SysUtils, System.Classes, Vcl.ExtCtrls;

type
  /// <summary>
  ///  #NS-10 - Record para guardar informa��es do caixa atual em opera��o pelo usu�rio. Usado no login autom�tico no caixa.
  /// </summary>
  TCaixaAtual = class(TObject)
  private
    FCodigoCaixa: String;
    FUsuarioLogin: String;
    FUsuarioSenha: String;
  public
    /// <summary> C�digo do caixa em opera��o atualmente. </summary>
    property CodigoCaixa: String read FCodigoCaixa write FCodigoCaixa;
    /// <summary> Login do usu�ro que est� operando o caixa atualmente.</summary>
    property UsuarioLogin: String read FUsuarioLogin write FUsuarioLogin;
    /// <summary> Senha do usu�rio que est� operando o caixa atualmente (senha descriptografada). </summary>
    property UsuarioSenha: String read FUsuarioSenha write FUsuarioSenha;
  end;

  TFModuloUsuario = class(TDataModule)
    tmrSimulaAlteracaoCaixa: TTimer;
    procedure tmrSimulaAlteracaoCaixaTimer(Sender: TObject);
  private
    FCaixaAtual: TCaixaAtual;

    { Private declarations }
  public
    { Public declarations }
     FInteiro: Integer;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property CaixaAtual: TCaixaAtual read FCaixaAtual write FCaixaAtual;
  end;

var
  FModuloUsuario: TFModuloUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TFModuloUsuario.Create;
begin
  inherited;
  FCaixaAtual := TCaixaAtual.Create;
  FInteiro := 0;
end;

destructor TFModuloUsuario.Destroy;
begin
  FCaixaAtual.Free;
  inherited;
end;

procedure TFModuloUsuario.tmrSimulaAlteracaoCaixaTimer(Sender: TObject);
begin
  inc(FInteiro);
  FCaixaAtual.CodigoCaixa :=  Format('%6.6d',[FInteiro]); // resulta '00123';
  FCaixaAtual.UsuarioLogin := 'Usu�rio ' + FInteiro.ToString;
end;

end.
