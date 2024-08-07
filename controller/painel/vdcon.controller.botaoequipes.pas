unit vdcon.controller.botaoequipes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoEquipes }

  TControllerBotaoEquipes = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoEquipes }

constructor TcontrollerbotaoEquipes.Create;
begin

end;

destructor TcontrollerbotaoEquipes.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoEquipes.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoEquipes.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnEquipes')
               .onClick(@Clique)
               .Caption('Equipes')
               .Item;
end;

procedure TcontrollerbotaoEquipes.Clique(Sender: Tobject);
begin

end;

end.

