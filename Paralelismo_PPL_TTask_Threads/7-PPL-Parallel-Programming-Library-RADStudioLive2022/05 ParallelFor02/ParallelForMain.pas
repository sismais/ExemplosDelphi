unit ParallelForMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Threading, System.Diagnostics,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TbtnParallelFor = class(TForm)
    btnFor: TButton;
    ListBox1: TListBox;
    btnParallelFor: TButton;
    btnAsyncParallelFor: TButton;
    btnParalleForBad: TButton;
    procedure btnForClick(Sender: TObject);
    procedure btnParallelForClick(Sender: TObject);
    procedure btnAsyncParallelForClick(Sender: TObject);
    procedure btnParalleForBadClick(Sender: TObject);
    procedure btnParallelForExceptionClick(Sender: TObject);
  private
    FParallelFuture: IFuture<Integer>;
    FStopwatch: TStopwatch;
    function ParallelCountPrimes: integer;
  public
  end;

var
  btnParallelFor: TbtnParallelFor;

implementation

uses
  System.SyncObjs;

{$R *.dfm}

const
  CHighestNumber = 10000000;

function IsPrime(value: integer): boolean;
var
  i: Integer;
begin
  Result := (value > 1);
  if Result then
    for i := 2 to Round(Sqrt(value)) do
      if (value mod i) = 0 then
        Exit(False);
end;

procedure TbtnParallelFor.btnForClick(Sender: TObject);
var
  count: Integer;
  i: Integer;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;
  count := 0;

  for i := 2 to CHighestNumber do
    if IsPrime(i) then
      Inc(count);

  sw.Stop;
  ListBox1.Items.Add('For: ' + count.ToString + ' primos. ' +
    'Total time: ' + sw.ElapsedMilliseconds.ToString);
end;

procedure TbtnParallelFor.btnParallelForClick(Sender: TObject);
var
  count: Integer;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;
  count := 0;

  TParallel.For(2, CHighestNumber,
    procedure (i: integer)
    begin
      if IsPrime(i) then
        TInterlocked.Increment(count);
    end);

  sw.Stop;
  ListBox1.Items.Add('Parallel.For (concorr�ncia): ' + count.ToString + ' primos. ' +
    'Tempo total: ' + sw.ElapsedMilliseconds.ToString);
end;

procedure TbtnParallelFor.btnParallelForExceptionClick(Sender: TObject);
var
  j: Integer;
begin
  ListBox1.Items.Clear;
  ListBox1.Items.Add('---');
  try
    TParallel.For(1, 10,
      procedure (i: integer)
      begin
        Sleep(100);
        raise Exception.Create('Exception in thread ' +
          TThread.Current.ThreadID.ToString);
      end);
  except
    on E: EAggregateException do
      for j := 0 to E.Count - 1 do
        if not assigned(E[j]) then
        begin
          ListBox1.Items.Add(j.ToString + ': nil')
        end
        else
        begin
          ListBox1.Items.Add(j.ToString + ': ' + E[j].ClassName + ': ' + E[j].Message);
        end;
    on E: Exception do
      ListBox1.Items.Add(E.ClassName + ': ' + E.Message);
  end;
end;

procedure TbtnParallelFor.btnParalleForBadClick(Sender: TObject);
var
  count: Integer;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;
  count := 0;

  TParallel.For(2, CHighestNumber,
    procedure (i: integer)
    begin
      if IsPrime(i) then
        Inc(count);
    end);

  sw.Stop;
  ListBox1.Items.Add('Parallel.For: ' + count.ToString + ' primos. ' +
    'Tempo total: ' + sw.ElapsedMilliseconds.ToString);
end;

function TbtnParallelFor.ParallelCountPrimes: integer;
var
  count: Integer;
begin
  count := 0;

  TParallel.For(1, CHighestNumber,
    procedure (i: integer)
    begin
      if IsPrime(i) then
        TInterlocked.Increment(count);
    end);

  Result := count;

  TThread.Queue(nil,
    procedure
    begin
      FStopwatch.Stop;
      ListBox1.Items.Add('Async Parallel.For: ' + FParallelFuture.Value.ToString +
        ' primes. Tempo total: ' + FStopwatch.ElapsedMilliseconds.ToString);
      FParallelFuture := nil;
    end);
end;

procedure TbtnParallelFor.btnAsyncParallelForClick(Sender: TObject);
begin
  FStopWatch := TStopwatch.StartNew;
  FParallelFuture := TTask.Future<Integer>(ParallelCountPrimes);
end;

end.
