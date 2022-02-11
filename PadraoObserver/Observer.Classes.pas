unit Observer.Classes;

interface

uses
  Interfaces,
  SysUtils, Classes, Generics.Collections;


type
  TSismaisObservable = class abstract (TInterfacedObject, ISismaisObservable)
  private
    FObservers: TList<ISismaisObserver>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarObserver(AObserver: ISismaisObserver);
    procedure RemoverObserver(AObserver: ISismaisObserver);
    procedure Notificar;
  end;

implementation

{ TSismaisObservable }

{$REGION 'Métodos do Observer'}
procedure TSismaisObservable.AdicionarObserver(AObserver: ISismaisObserver);
begin
  inherited;
  FObservers.Add(AObserver);
end;

constructor TSismaisObservable.Create;
begin
  FObservers := TList<ISismaisObserver>.Create;
end;

destructor TSismaisObservable.Destroy;
begin
  if Assigned(FObservers) then
    FreeAndNil(FObservers);
  inherited;
end;

procedure TSismaisObservable.Notificar;
var
  observador: ISismaisObserver;
begin
  for observador in FObservers do
    observador.Atualizar(Self);
end;

procedure TSismaisObservable.RemoverObserver(AObserver: ISismaisObserver);
begin
  FObservers.Remove(AObserver);
end;
{$ENDREGION}

end.
