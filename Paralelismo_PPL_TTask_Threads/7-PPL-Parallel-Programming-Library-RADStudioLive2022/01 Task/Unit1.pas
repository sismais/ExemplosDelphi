unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses System.Threading;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Sleep(10000); // 10s
  Label1.Caption := DateTimeToStr(Now);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Button2.Enabled := False;
  ProgressBar1.Style := TProgressBarStyle.pbstMarquee;
  TTask.Run(procedure
  begin
    Sleep(5000); // 5s
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      Label1.Caption := DateTimeToStr(Now);
      ProgressBar1.Style := TProgressBarStyle.pbstNormal;
      Button2.Enabled := True;
    end);
  end);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  t2: ITask;
begin
  Button3.Enabled := False;
  ProgressBar1.Style := TProgressBarStyle.pbstMarquee;
  t2 := TTask.Create(procedure
  begin
    Sleep(5000); // 5s
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      Label1.Caption := DateTimeToStr(Now);
      ProgressBar1.Style := TProgressBarStyle.pbstNormal;
      Button3.Enabled := True;
    end);
  end);
  t2.Start;
end;

end.
