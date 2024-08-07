unit vdcon.controller.painel.principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerPainelPrincipal }

  TControllerPainelPrincipal = class (TInterfacedObject, iControllerPainelMenu )
    private
      FContainer: TComponent;
    public
      constructor Create(Container: TComponent);
      destructor Destroy; override;
      class function New(Container: TComponent): iControllerPainelMenu;
      procedure Exibir;
  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller.painel.factory;

{ TControllerPainelPrincipal }

constructor TcontrollerpainelPrincipal.Create(Container: Tcomponent);
begin
  FContainer := Container;
end;

destructor TcontrollerpainelPrincipal.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerpainelPrincipal.New(Container: Tcomponent): Icontrollerpainelmenu;
begin
  Result := Self.Create(Container);
end;

procedure TcontrollerpainelPrincipal.Exibir;
begin
  TControllerPainelFactory.New
      .Menu(FContainer)
      .Name('mnPrincipal')
      .AddOpcao(TControllerBotaoPadraoFactory.New.Apoio.Exibir)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Relatorios.Exibir)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Operacoes.Exibir)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Cadastro.Exibir)
      .AddOpcao(TControllerBotaoPadraoFactory.New.Sair.Show)
      .Exibir;
end;

end.

