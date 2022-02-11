program LiveBindings;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  uForm3 in 'uForm3.pas' {Form3},
  unModuloUsuario in 'unModuloUsuario.pas' {FModuloUsuario: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
