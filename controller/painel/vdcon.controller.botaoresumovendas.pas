unit vdcon.controller.botaoResumoVendas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoResumoVendas }

  TControllerBotaoResumoVendas = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoResumoVendas }

constructor TcontrollerbotaoResumoVendas.Create;
begin

end;

destructor TcontrollerbotaoResumoVendas.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoResumoVendas.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoResumoVendas.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnResumoVendas')
               .onClick(@Clique)
               .Caption('Resumo de Vendas no Período')
               .Item;
end;

procedure TcontrollerbotaoResumoVendas.Clique(Sender: Tobject);
begin

end;

end.

