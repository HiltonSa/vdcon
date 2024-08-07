unit vdcon.controller.botaousuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Buttons, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoUsuario }

  TControllerBotaoUsuario = class (TInterfacedObject, iControllerBotaoForm)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoForm;
      function Show: TObject;
      procedure onClick(Sender: TObject);
  end;

implementation

uses vdcon.controller.botaopadrao.factory;

{ TControllerBotaoUsuario }

constructor Tcontrollerbotaousuario.Create;
begin

end;

destructor Tcontrollerbotaousuario.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerbotaousuario.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function Tcontrollerbotaousuario.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnUsuario')
               .Caption('Usuários')
               .Imagem('user')
               .LayoutBotao(TButtonLayout.blGlyphLeft)
               .onClick(@onClick)
               .Item;
end;

procedure Tcontrollerbotaousuario.onClick(Sender: Tobject);
begin

end;

end.

