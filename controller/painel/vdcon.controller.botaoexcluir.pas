unit vdcon.controller.botaoexcluir;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoExcluir }

  TControllerBotaoExcluir = class(TInterfacedObject, iControllerBotaoAcao)
    private
      FEvento : TNotifyEvent;
    public
      constructor Create(aValue: TNotifyEvent);
      destructor Destroy; override;
      class function New(aValue: TNotifyEvent): iControllerBotaoAcao;
      function Show: TObject;
  end;

implementation

uses vdcon.controller.botaopadrao.factory;

{ TControllerBotaoExcluir }

constructor TcontrollerbotaoExcluir.Create(aValue: TNotifyEvent);
begin
  FEvento := aValue;
end;

destructor TcontrollerbotaoExcluir.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoExcluir.New(aValue: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aValue);
end;

function TcontrollerbotaoExcluir.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnExcluir')
               .onClick(FEvento)
               .Caption('Excluir')
               .Imagem('trash')
               .Item;
end;

end.

