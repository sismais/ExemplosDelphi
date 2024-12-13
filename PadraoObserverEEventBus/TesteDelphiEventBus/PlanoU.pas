unit PlanoU;

interface

uses
  EventBus, Spring;

type

  TPlano = (Gratuito, Starter, Pro, Plus, Trial);
  TStatusPessoa = (stGratuito, stAtivo, stBloqueado);

{OPÇÃO 1: Usar apenas uma string como nome do "canal" a ser observado/postado.
         }
const
  EVENT_PLANO_CHANGED = 'PLANO_CHANGED';

{OPÇÃO 2: Uso de interface e classe permitndo a passagem de valores entre os eventos
          (mesmo em threads diferentes e de modo assincrono)}
type
  IPlanoChanged = interface
    ['{A6EBABF3-ACA0-414C-B857-51466D4F3A7E}']
    function Plano: TPlano;
    function StatusPessoa: TStatusPessoa;
  end;
  TPlanoChanged = class (TInterfacedObject, IPlanoChanged)
    FPlano: TPlano;
    FStatus: TStatusPessoa;
  public
    class function New(APlano: TPlano; AStatus: TStatusPessoa): IPlanoChanged;
    function Plano: TPlano;
    function StatusPessoa: TStatusPessoa;
  end;


implementation

{ TPlanoChanged }

class function TPlanoChanged.New(APlano: TPlano; AStatus: TStatusPessoa): IPlanoChanged;
begin
  Result := Self.Create;
  TPlanoChanged(Result).FPlano := APlano;
  TPlanoChanged(Result).FStatus := AStatus;
end;

function TPlanoChanged.Plano: TPlano;
begin
  Result := FPlano;
end;

function TPlanoChanged.StatusPessoa: TStatusPessoa;
begin
  Result := FStatus;
end;

end.
