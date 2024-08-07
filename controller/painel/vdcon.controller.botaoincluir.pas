unit vdcon.controller.botaoincluir;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoIncluir }

  TControllerBotaoIncluir = class(TInterfacedObject, iControllerBotaoAcao)
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

{ TControllerBotaoIncluir }

constructor TcontrollerbotaoIncluir.Create(aoClicar: TNotifyEvent);
begin
  FClicar := aoClicar;
end;

destructor TcontrollerbotaoIncluir.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoIncluir.New(aoClicar: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aoClicar);
end;

function TcontrollerbotaoIncluir.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnIncluir')
               .onClick(FClicar)
               .Caption('Incluir')
               .Imagem('bulb')
               .Item;
end;


end.

