unit vdcon.controller.botaovendasagente;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoVendasAgente }

  TControllerBotaoVendasAgente = class(TInterfacedObject, iControllerBotaoForm)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoForm;
      function Show: TObject;
      procedure Clique(Sender: TObject);

  end;

implementation

uses vdcon.controller.botaopadrao.factory;

{ TControllerBotaoVendasAgente }

constructor TcontrollerbotaoVendasAgente.Create;
begin

end;

destructor TcontrollerbotaoVendasAgente.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoVendasAgente.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoVendasAgente.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnVendasAgente')
               .onClick(@Clique)
               .Caption('Vendas do Agente')
               .Item;
end;

procedure TcontrollerbotaoVendasAgente.Clique(Sender: Tobject);
begin

end;

end.

