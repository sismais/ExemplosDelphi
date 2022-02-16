unit Model.Parametro;

interface

type
  TParametro = class
  private
    FUsaTEF: Boolean;
    FNomePlanoDeContas: String;
    class var FInstance: TParametro;
    constructor Create;
  public
    class function GetInstance: TParametro; static;
    property UsaTEF: Boolean read FUsaTEF write FUsaTEF;
    property NomePlanoDeContas: String read FNomePlanoDeContas;
  end;

implementation

constructor TParametro.Create;
begin
  inherited;
end;

class function TParametro.GetInstance: TParametro;
begin
  If FInstance = nil Then
  begin
    FInstance := TParametro.Create();//objeto instanciado através do Finstance  (é criado uma única vez);
    FInstance.FNomePlanoDeContas := 'Teste 123';
  end;
  Result := FInstance;//retorna o objeto
end;

initialization
finalization
  if Assigned(TParametro.FInstance) then
    TParametro.FInstance.Free;



end.
