unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Spring, uPlano;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure QualquerUma(Sender: TObject);
begin
  Form1.Memo1.Lines.Add(TEnum.GetName<TPlano>(TDadosLicenca(Sender).Plano));
end;

procedure QualquerDuas(Sender: TObject);
begin
  Form1.Label1.Caption := TEnum.GetName<TPlano>(TDadosLicenca(Sender).Plano);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  TDadosLicenca.Instance.Plano := TEnum.Parse<TPlano>(ComboBOx1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  var itens := TEnum.GetNames<TPlano>;
  Combobox1.Clear;
  for var i := Low(itens) to High(itens) do
    ComboBox1.Items.Add(itens[i]);

  Combobox1.ItemIndex := 0;
  Memo1.Lines.Clear;

  TDadosLicenca.Instance.OnPlanoChanged.Add(QualquerUma);
  TDadosLicenca.Instance.OnPlanoChanged.Add(QualquerDuas);

  //Seta estado inicial
  TDadosLicenca.Instance.Plano := Gratuito;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    //TDadosLicenca.Instance.OnPlanoChanged.Remove(QualquerUma);
    //TDadosLicenca.Instance.OnPlanoChanged.Remove(QualquerDuas);
end;

end.
