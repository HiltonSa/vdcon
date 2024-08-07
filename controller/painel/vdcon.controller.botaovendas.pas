unit vdcon.controller.botaovendas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoVendas }

  TControllerBotaoVendas = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoVendas }

constructor TcontrollerbotaoVendas.Create;
begin

end;

destructor TcontrollerbotaoVendas.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoVendas.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoVendas.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnVendas')
               .onClick(@Clique)
               .Caption('Vendas')
               .Item;
end;

procedure TcontrollerbotaoVendas.Clique(Sender: Tobject);
begin

end;

end.

