unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Model.Parametro;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage(TParametro.GetInstance.NomePlanoDeContas);

  //ShowMessage(TParametro.GetInstance.ClassName);

  //D� erro na compila��o: [dcc32 Error] Unit1.pas(33): E2233 Property 'UsaTEF' inaccessible here
  //ShowMessage(TParametro.UsaTEF);

  //Usando o convencional (criando a inst�ncia na hora)
//  parametro := TParametro.Create;
//  ShowMessage(parametro.UsaTEF.ToString);

  //######################################################################################################

//  //Usando o Singleton
//  parametro := TParametro.GetInstance;
//  parametro.NomePlanoDeContas := 'Despesas';
//
//  parametro2 := TParametro.GetInstance; //� a mesma inst�ncia do c�digo acima;
//  parametro2 := parametro;
//  parametro2.NomePlanoDeContas := 'Receitas';
//
//  ShowMessage(parametro.NomePlanoDeContas);
//  ShowMessage(parametro2.NomePlanoDeContas);
//
//  //######################################################################################################
//
//  {No uso recomendado do padr�o. n�o se tem vari�veis do objecto. Ele � sempre acessado atrab�s do m�todo de classe.
//  GetInstance, ou de uma propriedade de classe "Instance" que tem como getter o "GetInstance"}
//  ShowMessage(TParametro.GetInstance.NomePlanoDecontas);

  //Ainda n�o tem nenhum valor associado, mas j� foi inicializada.
  //ShowMessage(QuotedStr(TParametro.NomeSistema));

//  TParametro.NomeSistema := 'Maxpr� ERP';
////  ShowMessage(QuotedStr(TParametro.NomeSistema));
//
//  p1 := TParametro.Create; //Fugindo do Singleton
//  p1.NomeSistema := 'SismaisNF';
//  ShowMessage(p1.NomeSistema); //SimaisNF
//
//  parametro2 := TParametro.GetInstance;
//  ShowMessage(parametro2.NomeSistema); //SismaisNF
//
//  ShowMessage(TParametro.GetInstance.NomeSistema); //SismaisNF
//
//
//  ShowMessage(TParametro.NomeSistema);  //Erikles: Maxpr� ERP, S�rgio: N�o sabe.

  {No Delphi qualq1uer forma que eu use para acessar uma vari�vel de classe (class var), sempre estarei apontando para
  a classe global dentro da inst�ncia}
end;

end.
