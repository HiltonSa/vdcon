unit vdcon.controller.botaogravar;

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoGravar }

  TControllerBotaoGravar = class(TInterfacedObject, iControllerBotaoAcao)
    private
      FClicar: TNotifyEvent;
    public
      constructor Create(aoClicar: TNotifyEvent);
      destructor Destroy; override;
      class function New(aoClicar: TNotifyEvent): iControllerBotaoAcao;
      function Show: TObject;

  end;

implementation

uses vdcon.controller.botaopadrao.factory;

{ TControllerBotaoGravar }

constructor TcontrollerbotaoGravar.Create(aoClicar: TNotifyEvent);
begin
  FClicar := aoClicar;
end;

destructor TcontrollerbotaoGravar.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoGravar.New(aoClicar: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aoClicar);
end;

function TcontrollerbotaoGravar.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnGravar')
               .onClick(FClicar)
               .Align(TAlign.alBottom)
               .Caption('Gravar')
               .Imagem('like')
               .Item;
end;


end.

