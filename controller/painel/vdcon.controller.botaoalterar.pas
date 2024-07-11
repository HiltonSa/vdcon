unit vdcon.controller.botaoalterar;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoAlterar }

  TControllerBotaoAlterar = class(TInterfacedObject, iControllerBotaoAcao)
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

{ TControllerBotaoAlterar }

constructor TcontrollerbotaoAlterar.Create(aValue: TNotifyEvent);
begin
  FEvento := aValue;
end;

destructor TcontrollerbotaoAlterar.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoAlterar.New(aValue: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aValue);
end;

function TcontrollerbotaoAlterar.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnAlterar')
               .onClick(FEvento)
               .Caption('Alterar')
               .Imagem('pen')
               .Item;
end;

end.

