unit Interfaces;

interface

type

  /// <summary>
  ///   Interface que implementa os métodos a serem implementados pelos "Observadores". Ex: Carros, Janelas do Winodws
  /// </summary>
  ISismaisObserver = interface
    procedure Atualizar(ASender: TObject);
  end;

  /// <summary>
  ///   Interface que implementa os métodos a serem implementados pelos "Observáveis". Ex: Semaforos, Diretório do Windows
  /// </summary>
  ISismaisObservable = interface
    procedure AdicionarObserver(AObserver: ISismaisObserver);
    procedure RemoverObserver(AObserver: ISismaisObserver);
    procedure Notificar;
  end;

implementation

end.
