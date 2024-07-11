unit vdcon.controller.painel.operacoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerPainelOperacoes }

  TControllerPainelOperacoes = class (TInterfacedObject, iControllerPainelMenu )
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

{ TControllerPainelOperacoes }

constructor Tcontrollerpaineloperacoes.Create(Container: Tcomponent; aParent: TWinControl);
begin
  FContainer := Container;
  FParent:=aParent;
end;

destructor Tcontrollerpaineloperacoes.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerpaineloperacoes.New(Container: Tcomponent; aParent: TWinControl): Icontrollerpainelmenu;
begin
  Result := Self.Create(Container, aParent);
end;

procedure Tcontrollerpaineloperacoes.Exibir;
begin
  TControl(FContainer).Visible := False;
  TControllerPainelFactory.New
      .Menu(FContainer.GetParentComponent)
      .Name('mnOperacoes')
      .AddOpcao(TControllerBotaoPadraoFactory.New.ImportarSiacon.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.RecebimentoAutomatico.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.RecebimentoManual.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.CalculoComissoes.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Voltar.Show)
      .Exibir;
end;

end.

