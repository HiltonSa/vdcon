unit vdcon.controller.painel.factory;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces, vdcon.controller.painel;

type

  { TControllerPainelFactory }

  TControllerPainelFactory = class (TInterfacedObject, iControllerPainelFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerPainelFactory;
      function Menu(Container:TComponent): iControllerPainel;
      function Apoio(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
      function Principal(Container:TComponent): iControllerPainelMenu;
      function Cadastros(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
      function Operacoes(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
      function Relatorio(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
      function MenuCrud(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
  end;

implementation

uses vdcon.controller.painel.apoio, vdcon.controller.painel.principal,
  vdcon.controller.painel.cadastros, vdcon.controller.painel.operacoes,
  vdcon.controller.painel.relatorios, vdcon.controller.painel.menucrud;

{ TControllerPainelFactory }

constructor Tcontrollerpainelfactory.Create;
begin

end;

destructor Tcontrollerpainelfactory.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerpainelfactory.New: Icontrollerpainelfactory;
begin
  Result := Self.Create;
end;

function Tcontrollerpainelfactory.Menu(Container: Tcomponent): Icontrollerpainel;
begin
  Result := TControllerPainel.New(Container);
end;

function Tcontrollerpainelfactory.Apoio(Container: Tcomponent; Aparent: Twincontrol): Icontrollerpainelmenu;
begin
  Result := TControllerPainelApoio.New(Container, aParent);
end;

function Tcontrollerpainelfactory.Principal(Container: Tcomponent): Icontrollerpainelmenu;
begin
  Result := TControllerPainelPrincipal.New(Container);
end;

function Tcontrollerpainelfactory.Cadastros(Container: Tcomponent; Aparent: Twincontrol): Icontrollerpainelmenu;
begin
  Result := TControllerPainelCadastros.New(Container, aParent);
end;

function Tcontrollerpainelfactory.Operacoes(Container: Tcomponent; Aparent: Twincontrol): Icontrollerpainelmenu;
begin
  Result := TControllerPainelOperacoes.New(Container, aParent);
end;

function Tcontrollerpainelfactory.Relatorio(Container: Tcomponent; Aparent: Twincontrol): Icontrollerpainelmenu;
begin
  Result := TControllerPainelRelatorios.New(Container, aParent);
end;

function Tcontrollerpainelfactory.Menucrud(Container: Tcomponent; Aparent: Twincontrol): Icontrollerpainelmenu;
begin
  Result := TControllerPainelMenuCrud.New(Container, aParent);
end;

end.

