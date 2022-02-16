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

  //Dá erro na compilação: [dcc32 Error] Unit1.pas(33): E2233 Property 'UsaTEF' inaccessible here
  //ShowMessage(TParametro.UsaTEF);

  //Usando o convencional (criando a instância na hora)
//  parametro := TParametro.Create;
//  ShowMessage(parametro.UsaTEF.ToString);

  //######################################################################################################

//  //Usando o Singleton
//  parametro := TParametro.GetInstance;
//  parametro.NomePlanoDeContas := 'Despesas';
//
//  parametro2 := TParametro.GetInstance; //É a mesma instância do código acima;
//  parametro2 := parametro;
//  parametro2.NomePlanoDeContas := 'Receitas';
//
//  ShowMessage(parametro.NomePlanoDeContas);
//  ShowMessage(parametro2.NomePlanoDeContas);
//
//  //######################################################################################################
//
//  {No uso recomendado do padrão. não se tem variáveis do objecto. Ele é sempre acessado atrabés do método de classe.
//  GetInstance, ou de uma propriedade de classe "Instance" que tem como getter o "GetInstance"}
//  ShowMessage(TParametro.GetInstance.NomePlanoDecontas);

  //Ainda não tem nenhum valor associado, mas já foi inicializada.
  //ShowMessage(QuotedStr(TParametro.NomeSistema));

//  TParametro.NomeSistema := 'Maxpró ERP';
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
//  ShowMessage(TParametro.NomeSistema);  //Erikles: Maxpró ERP, Sérgio: Não sabe.

  {No Delphi qualq1uer forma que eu use para acessar uma variável de classe (class var), sempre estarei apontando para
  a classe global dentro da instância}
end;

end.
