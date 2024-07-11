unit vdcon.controller.painel.cadastros;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerPainelCadastros }

  TControllerPainelCadastros = class (TInterfacedObject, iControllerPainelMenu )
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

{ TControllerPainelCadastros }

constructor TcontrollerpainelCadastros.Create(Container: Tcomponent; aParent: TWinControl);
begin
  FContainer := Container;
  FParent:=aParent;
end;

destructor TcontrollerpainelCadastros.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerpainelCadastros.New(Container: Tcomponent; aParent: TWinControl): Icontrollerpainelmenu;
begin
  Result := Self.Create(Container, aParent);
end;

procedure TcontrollerpainelCadastros.Exibir;
begin
  TControl(FContainer).Visible := False;
  TControllerPainelFactory.New
      .Menu(FContainer.GetParentComponent)
      .Name('mnCadastros')
      .AddOpcao(TControllerBotaoPadraoFactory.New.Agentes.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Equipes.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Filiais.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.RegrasComissao.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.FaixasComissao.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Empresa.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Voltar.Show)
      .Exibir;
end;

end.

