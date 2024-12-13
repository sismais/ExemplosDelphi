unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, EventBus, PlanoU, Spring;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    [Subscribe(TThreadMode.Main)]
    procedure OnPlanoChanged(AEvent: IPlanoChanged);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}


procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  GlobalEventBus.SilentRegisterSubscriberForEvents(Self);
end;

procedure TForm2.OnPlanoChanged(AEvent: IPlanoChanged);
begin
  {Recuperando o plano que foi alterado, sem precisar ter acesso à propriedade "Plano" do form1.
  Ou seja, totalmente desacoplado.}
  Label1.Caption := TEnum.GetName<TPlano>(AEvent.Plano);
end;

end.
