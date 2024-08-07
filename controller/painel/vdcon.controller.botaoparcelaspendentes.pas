unit vdcon.controller.botaoparcelaspendentes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoParcelasPendentes }

  TControllerBotaoParcelasPendentes = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoParcelasPendentes }

constructor TcontrollerbotaoParcelasPendentes.Create;
begin

end;

destructor TcontrollerbotaoParcelasPendentes.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoParcelasPendentes.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoParcelasPendentes.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnParcelasPendentes')
               .onClick(@Clique)
               .Caption('Parcelas Pendentes')
               .Item;
end;

procedure TcontrollerbotaoParcelasPendentes.Clique(Sender: Tobject);
begin

end;

end.

