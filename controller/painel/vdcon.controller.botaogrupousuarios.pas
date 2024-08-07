unit vdcon.controller.botaogrupousuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoGrupoUsuarios }

  TControllerBotaoGrupoUsuarios = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoGrupoUsuarios }

constructor TcontrollerbotaoGrupoUsuarios.Create;
begin

end;

destructor TcontrollerbotaoGrupoUsuarios.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoGrupoUsuarios.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoGrupoUsuarios.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnGrupoUsuarios')
               .onClick(@Clique)
               .Caption('Grupo de Usuários')
               .Item;
end;

procedure TcontrollerbotaoGrupoUsuarios.Clique(Sender: Tobject);
begin

end;

end.

