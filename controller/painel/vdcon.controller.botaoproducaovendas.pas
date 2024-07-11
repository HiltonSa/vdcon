unit vdcon.controller.botaoproducaovendas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoProducaoVendas }

  TControllerBotaoProducaoVendas = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoProducaoVendas }

constructor TcontrollerbotaoProducaoVendas.Create;
begin

end;

destructor TcontrollerbotaoProducaoVendas.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoProducaoVendas.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoProducaoVendas.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnProducaoVendas')
               .onClick(@Clique)
               .Caption('Produção de Vendas')
               .Item;
end;

procedure TcontrollerbotaoProducaoVendas.Clique(Sender: Tobject);
begin

end;

end.

