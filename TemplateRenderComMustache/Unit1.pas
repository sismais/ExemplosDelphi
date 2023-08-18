unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SynMustache, SynCommons, System.IOUtils, System.DateUtils, System.StrUtils;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  var html := TFile.ReadAllText('D:\Sismais\Fontes\maissimples\html\templates\email\email-transacional-base.html',
    TEncoding.UTF8);
  var mustache := TSynMustache.Parse(html); //variável "mustache" é liberada da memoria automaticamente.


  var doc := TDocVariant.New; //variavel é liberada da memoria automaticamente.

  doc.main_content := 'Conteúdo HTML restante';
  doc.url_site := 'https://gestaomaissimples.com.br';

  doc.ano := YearOf(Now);
  doc.nome := 'Sismais Tecnologia';
  doc.cnpj := '11.824.118/0001-50';
  doc.endereco := 'Endereço Sismais';
  doc.numero := 'NumeroSismais';
  doc.bairro := 'Bairro';
  doc.cidade := 'Caculé';
  doc.uf := 'BA';
  doc.cep := '46300-000';
  html := mustache.Render(doc);

  Memo1.Lines.Add(html);

  var filename := ChangeFileExt(TPath.GetTempFileName, '.html');

  TFile.WriteAllText(filename, html, TEncoding.UTF8);
  WebBrowser1.Navigate(filename);
end;

end.
