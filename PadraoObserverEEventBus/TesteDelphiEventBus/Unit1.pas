unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Spring, PlanoU, EventBus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FPlano: TPlano;
    FStatusPessoa: TStatusPessoa;
    procedure SetPlano(const Value: TPlano);
    { Private declarations }
  public
    { Public declarations }
    [Subscribe(TThreadMode.Main)]
    procedure OnPlanoChanged(AEvent: IPlanoChanged);
    [Subscribe(TThreadMode.Main)]
    procedure OnPlanoChangedForTMemo(AEvent: IPlanoChanged);
    [Channel(EVENT_PLANO_CHANGED, TThreadMode.Main)]
    procedure OnPlanoChangedWithChannel(AMsg: string);

    property Plano: TPlano read FPlano write SetPlano;
    property StatusPessoa: TStatusPessoa read FStatusPessoa write FStatusPessoa;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TForm2.Create(Self).Show;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Plano := TEnum.Parse<TPlano>(ComboBox1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  var itens := TEnum.GetNames<TPlano>;
  Combobox1.Clear;
  for var i := Low(itens) to High(itens) do
    ComboBox1.Items.Add(itens[i]);

  Combobox1.ItemIndex := 0;
  Memo1.Lines.Clear;


  {Registra como "Observador" para ser notificado de todos os eventos/metodos
  em que o custom attribute "Subscribe" é usado.}
  GlobalEventBus.RegisterSubscriberForEvents(Self);

  {Registra como "Observador" para ser notificado em todos os eventos/metodos usando
  a notifcação por string (usando o custom atttribute "Channel('NomeDoEvento')"}
  GlobalEventBus.RegisterSubscriberForChannels(Self);


  //Altera o plano (já acionando o envio das mensagens)
  FPlano := Pro;
  SetPlano(Gratuito);
end;

procedure TForm1.OnPlanoChanged(AEvent: IPlanoChanged);
begin
  Label1.Caption := TEnum.GetName<TPlano>(AEvent.Plano);
end;

procedure TForm1.OnPlanoChangedForTMemo(AEvent: IPlanoChanged);
begin
  Memo1.Lines.Add(DateTimeToStr(Now) + ' - ' + TEnum.GetName<TPlano>(AEvent.Plano));
end;

procedure TForm1.OnPlanoChangedWithChannel(AMsg: string);
begin
  Label4.Caption := TEnum.GetName<TPlano>(Self.Plano);
end;

procedure TForm1.SetPlano(const Value: TPlano);
begin
  if Value <> FPlano then
  begin
    FPlano := Value;
    //Posta a mensagem no Event Bus, enviando a instancia do evento (interface)
    GlobalEventBus.Post(TPlanoChanged.New(FPlano, FStatusPessoa));

    //Posta a mensagem no Event Bus, usando o método de Channel (notificação via string)
    GlobalEventBus.Post(EVENT_PLANO_CHANGED, 'Mensagem Qualquer a Ser passada!')
  end;
end;

end.
