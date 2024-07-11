unit vdcon.controller.botaopesquisar;
{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoPesquisar }

  TControllerBotaoPesquisar = class(TInterfacedObject, iControllerBotaoAcao)
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

{ TControllerBotaoPesquisar }

constructor TcontrollerbotaoPesquisar.Create(aValue: TNotifyEvent);
begin
  FEvento := aValue;
end;

destructor TcontrollerbotaoPesquisar.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoPesquisar.New(aValue: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aValue);
end;

function TcontrollerbotaoPesquisar.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnPesquisar')
               .onClick(FEvento)
               .Caption('Pesquisar')
               .Imagem('search')
               .Item;
end;


end.

