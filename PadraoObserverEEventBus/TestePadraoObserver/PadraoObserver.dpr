program PadraoObserver;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  SessaoUsuario in 'SessaoUsuario.pas' {frmSessaoUsuario},
  uForm3 in 'uForm3.pas' {Form3},
  Interfaces in 'Interfaces.pas',
  Observer.Classes in 'Observer.Classes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
