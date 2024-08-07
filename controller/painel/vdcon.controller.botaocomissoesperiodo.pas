unit vdcon.controller.botaocomissoesperiodo;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoComissoesPeriodo }

  TControllerBotaoComissoesPeriodo = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoComissoesPeriodo }

constructor TcontrollerbotaoComissoesPeriodo.Create;
begin

end;

destructor TcontrollerbotaoComissoesPeriodo.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoComissoesPeriodo.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoComissoesPeriodo.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnComissoesPeriodo')
               .onClick(@Clique)
               .Caption('Comissões no Período')
               .Item;
end;

procedure TcontrollerbotaoComissoesPeriodo.Clique(Sender: Tobject);
begin

end;

end.

