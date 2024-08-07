unit vdcon.controller.botaooperacoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoOperacoes }

  TControllerBotaoOperacoes = class(TInterfacedObject, IControllerBotaoMenu)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IControllerBotaoMenu;
      procedure Clique(Sender: TObject);
      function Exibir: TObject;

  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller;

{ TControllerBotaoOperacoes }

constructor Tcontrollerbotaooperacoes.Create;
begin

end;

destructor Tcontrollerbotaooperacoes.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerbotaooperacoes.New: Icontrollerbotaomenu;
begin
  Result := Self.Create;
end;

function Tcontrollerbotaooperacoes.Exibir: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnOperacoes')
               .onClick(@Clique)
               .Imagem('fire')
               .Caption('Operações')
               .Item;
end;

procedure Tcontrollerbotaooperacoes.Clique(Sender: Tobject);
var
  vContainer: TComponent;
  vForm: TComponent;
  vParent: TWinControl;
begin
  vContainer := TControl(Sender).GetParentComponent;
  vForm:= TControl(vContainer.GetParentComponent).GetParentComponent;
  vParent := TWinControl(vForm.FindComponent('pnBackground'));
  TController.New.Menus.Operacoes(TControl(Sender).GetParentComponent, vParent).Exibir;
end;


end.

