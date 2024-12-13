unit uPlano;

interface

uses
  System.SysUtils, System.Classes, Spring;

type

  TPlano = (Gratuito, Starter, Pro, Plus, Trial);
  TStatusPessoa = (stGratuito, stAtivo, stBloqueado);

  TDadosLicenca = class
  private
    class var FDadosLicenca: TDadosLicenca;
  private
    FPlano: TPlano;
    FOnPlanoChanged: Event<TNotifyProc>;
    procedure SetPlano(const Value: TPlano);
    function GetOnPlanoChanged: IEvent<TNotifyProc>;
    class function GetDadosLicenca: TDadosLicenca; static;
  public
    class property Instance: TDadosLicenca read GetDadosLicenca;
    property Plano: TPlano read FPlano write SetPlano;
    property OnPlanoChanged: IEvent<TNotifyProc> read GetOnPlanoChanged;
  end;


implementation

{ TDadosLicenca }
class function TDadosLicenca.GetDadosLicenca: TDadosLicenca;
begin
  if not Assigned(FDadosLicenca) then
    FDadosLicenca := TDadosLicenca.Create;
  Result := FDadosLicenca;
end;

function TDadosLicenca.GetOnPlanoChanged: IEvent<TNotifyProc>;
begin
  Result := FOnPlanoChanged;
end;

procedure TDadosLicenca.SetPlano(const Value: TPlano);
begin
  if Value <> FPlano then
  begin
    FPlano := Value;
    //if FOnPlanoChanged.CanInvoke then
      FOnPlanoChanged.Invoke(Self);
  end;
end;

initialization

finalization
  if Assigned(TDadosLicenca.FDadosLicenca) then
    FreeAndNil(TDadosLicenca.FDadosLicenca);


end.
