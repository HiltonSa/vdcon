unit vdcon.controller.botaorelatorios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoRelatorios }

  TControllerBotaoRelatorios = class(TInterfacedObject, IControllerBotaoMenu)
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

{ TControllerBotaoRelatorios }

constructor TcontrollerbotaoRelatorios.Create;
begin

end;

destructor TcontrollerbotaoRelatorios.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoRelatorios.New: IControllerBotaoMenu;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoRelatorios.Exibir: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnRelatorios')
               .onClick(@Clique)
               .Imagem('note')
               .Caption('Relatórios')
               .Item;
end;

procedure TcontrollerbotaoRelatorios.Clique(Sender: Tobject);
var
  vContainer: TComponent;
  vForm: TComponent;
  vParent: TWinControl;
begin
  vContainer := TControl(Sender).GetParentComponent;
  vForm:= TControl(vContainer.GetParentComponent).GetParentComponent;
  vParent := TWinControl(vForm.FindComponent('pnBackground'));
  TController.New.Menus.Relatorio(TControl(Sender).GetParentComponent, vParent).Exibir;
end;

end.

