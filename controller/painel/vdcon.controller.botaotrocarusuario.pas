unit vdcon.controller.botaotrocarusuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoTrocarUsuario }

  TControllerBotaoTrocarUsuario = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoTrocarUsuario }

constructor TcontrollerbotaoTrocarUsuario.Create;
begin

end;

destructor TcontrollerbotaoTrocarUsuario.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoTrocarUsuario.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoTrocarUsuario.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnTrocarUsuario')
               .onClick(@Clique)
               .Caption('Trocar Usuário')
               .Item;
end;

procedure TcontrollerbotaoTrocarUsuario.Clique(Sender: Tobject);
begin

end;

end.

