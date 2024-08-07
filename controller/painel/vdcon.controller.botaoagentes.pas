unit vdcon.controller.botaoagentes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoAgentes }

  TControllerBotaoAgentes = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoAgentes }

constructor TcontrollerbotaoAgentes.Create;
begin

end;

destructor TcontrollerbotaoAgentes.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoAgentes.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoAgentes.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnAgentes')
               .onClick(@Clique)
               .Caption('Agentes')
               .Item;
end;

procedure TcontrollerbotaoAgentes.Clique(Sender: Tobject);
begin

end;

end.

