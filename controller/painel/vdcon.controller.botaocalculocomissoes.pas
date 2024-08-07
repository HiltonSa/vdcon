unit vdcon.controller.botaocalculocomissoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoCalculoComissoes }

  TControllerBotaoCalculoComissoes = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoCalculoComissoes }

constructor TcontrollerbotaoCalculoComissoes.Create;
begin

end;

destructor TcontrollerbotaoCalculoComissoes.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoCalculoComissoes.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoCalculoComissoes.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnCalculoComissoes')
               .onClick(@Clique)
               .Caption('Cálculo de Comissões')
               .Item;
end;

procedure TcontrollerbotaoCalculoComissoes.Clique(Sender: Tobject);
begin

end;

end.

