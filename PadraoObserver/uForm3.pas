unit uForm3;

interface

uses
  Interfaces,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm, ISismaisObserver)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Atualizar(ASender: TObject);

  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  SessaoUsuario;

{$R *.dfm}

{ TForm3 }

procedure TForm3.Atualizar(ASender: TObject);
begin
  Edit1.Text := TCaixaAtual(ASender).UsuarioLogin;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  if Assigned(frmSessaoUsuario) then
    frmSessaoUsuario.CaixaAtual.AdicionarObserver(Self);
end;

end.
