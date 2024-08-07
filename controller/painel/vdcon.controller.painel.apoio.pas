unit vdcon.controller.painel.apoio;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerPainelApoio }

  TControllerPainelApoio = class (TInterfacedObject, iControllerPainelMenu )
    private
      FContainer: TComponent;
      FParent: TWinControl;
    public
      constructor Create(Container: TComponent; aParent: TWinControl);
      destructor Destroy; override;
      class function New(Container: TComponent; aParent: TWinControl): iControllerPainelMenu;
      procedure Exibir;
  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller.painel.factory;

{ TControllerPainelApoio }

constructor Tcontrollerpainelapoio.Create(Container: Tcomponent; aParent: TWinControl);
begin
  FContainer := Container;
  FParent:=aParent;
end;

destructor Tcontrollerpainelapoio.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerpainelapoio.New(Container: Tcomponent; aParent: TWinControl): Icontrollerpainelmenu;
begin
  Result := Self.Create(Container, aParent);
end;

procedure Tcontrollerpainelapoio.Exibir;
begin
  TControl(FContainer).Visible := False;
  TControllerPainelFactory.New
      .Menu(FContainer.GetParentComponent)
      .Name('mnApoio')
      .AddOpcao(TControllerBotaoPadraoFactory.New.Sobre.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Usuario.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.GrupoUsuarios.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.TrocarSenha.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.TrocarUsuario.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Voltar.Show)
      .Exibir;
end;

end.

