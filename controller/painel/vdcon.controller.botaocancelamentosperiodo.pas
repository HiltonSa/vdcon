unit vdcon.controller.botaocancelamentosperiodo;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoCancelamentosPeriodo }

  TControllerBotaoCancelamentosPeriodo = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoCancelamentosPeriodo }

constructor TControllerBotaoCancelamentosPeriodo.Create;
begin

end;

destructor TControllerBotaoCancelamentosPeriodo.Destroy;
begin
  inherited Destroy;
end;

class function TControllerBotaoCancelamentosPeriodo.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TControllerBotaoCancelamentosPeriodo.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnCancelamentosPeriodo')
               .onClick(@Clique)
               .Caption('Cancelamentos no Período')
               .Item;
end;

procedure TControllerBotaoCancelamentosPeriodo.Clique(Sender: Tobject);
begin

end;

end.

