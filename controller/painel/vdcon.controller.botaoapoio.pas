unit vdcon.controller.botaoapoio;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoApoio }

  TControllerBotaoApoio = class(TInterfacedObject, IControllerBotaoMenu)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IControllerBotaoMenu;
      function Exibir: TObject;
      procedure Clique(Sender: TObject);

  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller;

{ TControllerBotaoApoio }

constructor Tcontrollerbotaoapoio.Create;
begin

end;

destructor Tcontrollerbotaoapoio.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerbotaoapoio.New: Icontrollerbotaomenu;
begin
  Result := Self.Create;
end;

function Tcontrollerbotaoapoio.Exibir: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnApoio')
               .onClick(@Clique)
               .Caption('Apoio')
               .Imagem('settings')
               .Item;
end;

procedure Tcontrollerbotaoapoio.Clique(Sender: Tobject);
var
  vContainer: TComponent;
  vForm: TComponent;
  vParent: TWinControl;
begin
  vContainer := TControl(Sender).GetParentComponent;
  vForm:= TControl(vContainer.GetParentComponent).GetParentComponent;
  vParent := TWinControl(vForm.FindComponent('pnBackground'));
  TController.New.Menus.Apoio(TControl(Sender).GetParentComponent, vParent).Exibir;
end;

end.

