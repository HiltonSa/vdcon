unit vdcon.controller.painel.relatorios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerPainelRelatorios }

  TControllerPainelRelatorios = class (TInterfacedObject, iControllerPainelMenu )
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

{ TControllerPainelRelatorios }

constructor TcontrollerpainelRelatorios.Create(Container: Tcomponent; aParent: TWinControl);
begin
  FContainer := Container;
  FParent:= aParent;
end;

destructor TcontrollerpainelRelatorios.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerpainelRelatorios.New(Container: Tcomponent; aParent: TWinControl): Icontrollerpainelmenu;
begin
  Result := Self.Create(Container, aParent);
end;

procedure TcontrollerpainelRelatorios.Exibir;
begin
  TControl(FContainer).Visible := False;
  TControllerPainelFactory.New
      .Menu(FContainer.GetParentComponent)
      .Name('mnRelatorios')
      .AddOpcao(TControllerBotaoPadraoFactory.New.ResumoVendas.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.VendasAgente.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.CancelamentoPeriodo.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.ProducaoVendas.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.ComissoesPeriodo.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.ParcelasPendentes.Show)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Voltar.Show)
      .Exibir;
end;

end.

