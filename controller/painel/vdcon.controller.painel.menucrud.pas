unit vdcon.controller.painel.menucrud;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerPainelMenuCrud }

  TControllerPainelMenuCrud = class (TInterfacedObject, iControllerPainelMenu )
    private
      FContainer: TComponent;
    public
      constructor Create(Container: TComponent; aParent: TWinControl);
      destructor Destroy; override;
      class function New(Container: TComponent; aParent: TWinControl): iControllerPainelMenu;
      procedure Exibir;
  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller.painel.factory;

{ TControllerPainelMenuCrud }

constructor TcontrollerpainelMenuCrud.Create(Container: Tcomponent; aParent: TWinControl);
begin
  FContainer := Container;
end;

destructor TcontrollerpainelMenuCrud.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerpainelMenuCrud.New(Container: Tcomponent; aParent: TWinControl): Icontrollerpainelmenu;
begin
  Result := Self.Create(Container, aParent);
end;

procedure TcontrollerpainelMenuCrud.Exibir;
begin
  //TControl(FContainer).Visible := False;
  //TControllerPainelFactory.New
  //    .Menu(FContainer)
  //    .Name('mnCrud')
  //    .AddOpcao(TControllerBotaoPadraoFactory.New.Fechar.Show)
  //    .AddOpcao(TControllerBotaoPadraoFactory.New.Excluir.Show)
  //    .AddOpcao(TControllerBotaoPadraoFactory.New.Alterar.Show)
  //    .AddOpcao(TControllerBotaoPadraoFactory.New.Incluir(nil).Show)
  //    .AddOpcao(TControllerBotaoPadraoFactory.New.Pesquisar.Show)
  //    .Exibir;
end;

end.

