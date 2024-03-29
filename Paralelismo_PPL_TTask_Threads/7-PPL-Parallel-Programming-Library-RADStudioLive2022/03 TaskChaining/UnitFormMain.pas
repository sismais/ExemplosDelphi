unit UnitFormMain;

{ ===============================================================================
  CodeRage 9 - Demo for Task Chaining using WaitForAll

  This code shows how to chain Tasks together (Fork / Join pattern)

  Using the ITask interface you can let new Tasks wait for results from previous
  Tasks.

  Be careful when using Synchronize in a TTask.Run combined with a WaitForAll or
  WaitForAny in the main thread. These may cause a deadlock, because the Task
  is waiting for the main thread to perform the Synchronize and the main thread
  is waiting for the task to complete in WaitForAll or WaitForAny. It is safe to
  use Synchronize if you do the WaitForAll from inside the TTask.Run as in this
  example.

  Author: Danny Wind
  =============================================================================== }

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  System.Threading, FMX.Ani, FMX.Controls.Presentation;

type
  TFormMain = class(TForm)
    ButtonTask1: TButton;
    ButtonTask2: TButton;
    ButtonTask1Plus2: TButton;
    LabelTask1: TLabel;
    LabelTask2: TLabel;
    LabelTask1Plus2: TLabel;
    Button2: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonTask1Click(Sender: TObject);
    procedure ButtonTask2Click(Sender: TObject);
    procedure ButtonTask1Plus2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    AllTasks: array [0 .. 1] of ITask;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

procedure TFormMain.Button2Click(Sender: TObject);
begin
  AllTasks[0].Cancel;
end;

procedure TFormMain.ButtonTask1Click(Sender: TObject);
begin
  LabelTask1.Text := '--';
  AllTasks[0] := TTask.Run(
    procedure
    var
      lValue: Integer;
    begin
      Sleep(5000);
      if AllTasks[0].Status <> TTaskStatus.Canceled then
      begin
        lValue := Random(10);

        TThread.Synchronize(nil,
          procedure
          begin
            LabelTask1.Text := lValue.ToString;
          end);
      end;
    end);
end;

procedure TFormMain.ButtonTask2Click(Sender: TObject);
begin
  LabelTask2.Text := '--';
  AllTasks[1] := TTask.Run(
    procedure
    var
      lValue: Integer;
    begin
      Sleep(5000);
      if AllTasks[1].Status <> TTaskStatus.Canceled then
      begin
        lValue := Random(10);
        TThread.Synchronize(nil,
          procedure
          begin
            LabelTask2.Text := lValue.ToString;
          end);
      end;
    end);
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
  // Verifica status da Task1
  if Assigned(AllTasks[0]) then
  begin
    case AllTasks[0].Status of
      TTaskStatus.Created: Label1.Text := 'Task 1: Created';
      TTaskStatus.WaitingToRun: Label1.Text := 'Task 1: WaitingToRun';
      TTaskStatus.Running: Label1.Text := 'Task 1: Running';
      TTaskStatus.Completed: Label1.Text := 'Task 1: Completed';
      TTaskStatus.WaitingForChildren: Label1.Text := 'Task 1: WaitingForChildren';
      TTaskStatus.Canceled: Label1.Text := 'Task 1: Canceled';
      TTaskStatus.Exception: Label1.Text := 'Task 1: Exception';
    end;
  end
  else
  begin
    Label1.Text := 'Task 1: N�o iniciada';
  end;
  // Verifica status da Task2
  if Assigned(AllTasks[1]) then
  begin
    case AllTasks[1].Status of
      TTaskStatus.Created: Label2.Text := 'Task 2: Created';
      TTaskStatus.WaitingToRun: Label2.Text := 'Task 2: WaitingToRun';
      TTaskStatus.Running: Label2.Text := 'Task 2: Running';
      TTaskStatus.Completed: Label2.Text := 'Task 2: Completed';
      TTaskStatus.WaitingForChildren: Label2.Text := 'Task 2: WaitingForChildren';
      TTaskStatus.Canceled: Label2.Text := 'Task 2: Canceled';
      TTaskStatus.Exception: Label2.Text := 'Task 2: Exception';
    end;
  end
  else
  begin
    Label2.Text := 'Task 2: N�o iniciada';
  end;
end;

procedure TFormMain.ButtonTask1Plus2Click(Sender: TObject);
begin
  LabelTask1Plus2.Text := '--';
  TTask.Run(
    procedure
    begin
      TTask.WaitForAll(AllTasks);
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          LabelTask1Plus2.Text := LabelTask1.Text + ' + ' + LabelTask2.Text;
        end);
    end);
end;

initialization

ReportMemoryLeaksOnShutdown := True;

end.
