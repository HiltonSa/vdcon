unit vdcon.controller.botaocadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoCadastro }

  TControllerBotaoCadastro = class(TInterfacedObject, IControllerBotaoMenu)
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

{ TControllerBotaoCadastro }

constructor TcontrollerbotaoCadastro.Create;
begin

end;

destructor TcontrollerbotaoCadastro.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoCadastro.New: IControllerBotaoMenu;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoCadastro.Exibir: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnCadastro')
               .onClick(@Clique)
               .Imagem('data')
               .Caption('Cadastro')
               .Item;
end;

procedure TcontrollerbotaoCadastro.Clique(Sender: Tobject);
var
  vContainer: TComponent;
  vForm: TComponent;
  vParent: TWinControl;
begin
  vContainer := TControl(Sender).GetParentComponent;
  vForm:= TControl(vContainer.GetParentComponent).GetParentComponent;
  vParent := TWinControl(vForm.FindComponent('pnBackground'));
  TController.New.Menus.Cadastros(vContainer, vParent).Exibir;
end;

end.

