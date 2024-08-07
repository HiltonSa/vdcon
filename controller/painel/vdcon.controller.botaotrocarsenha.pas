unit vdcon.controller.botaotrocarsenha;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoTrocarSenha }

  TControllerBotaoTrocarSenha = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoTrocarSenha }

constructor TcontrollerbotaoTrocarSenha.Create;
begin

end;

destructor TcontrollerbotaoTrocarSenha.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoTrocarSenha.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoTrocarSenha.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnTrocarSenha')
               .onClick(@Clique)
               .Caption('Trocar Senha')
               .Item;
end;

procedure TcontrollerbotaoTrocarSenha.Clique(Sender: Tobject);
begin

end;

end.

