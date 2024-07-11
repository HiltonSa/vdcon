unit vdcon.controller.painel;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, ExtCtrls, Controls, Buttons, Forms, vdcon.controller.interfaces;

type

  { TControllerPainel }

  TControllerPainel = class (TInterfacedObject, iControllerPainel)
    private
      FContainer: TComponent;
      FPanel: TPanel;
    public
      constructor Create(Container: TComponent);
      destructor Destroy; override;
      class function New(Container: TComponent) : iControllerPainel;
      function Name(Value: string): iControllerPainel;
      function Align(Value: TAlign): iControllerPainel;
      function Largura(Value: Integer): iControllerPainel;
      function AddOpcao(Value: TObject): iControllerPainel;
      function Item: TObject;
      procedure Exibir;
  end;

implementation

{ TControllerPainel }

constructor Tcontrollerpainel.Create(Container: Tcomponent);
begin
  FContainer := Container;
  FPanel:=TPanel.Create(nil);
  FPanel.BevelOuter:=TPanelBevel.bvNone;
  FPanel.Name := 'MenuPadrao';
  FPanel.Width:=80;
  FPanel.Align:=TAlign.alClient;
end;

destructor Tcontrollerpainel.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerpainel.New(Container: Tcomponent): Icontrollerpainel;
begin
  Result := Self.Create(Container);
end;

function Tcontrollerpainel.Name(Value: String): Icontrollerpainel;
begin
  Result := Self;
  FPanel.Name := Value;
end;

function Tcontrollerpainel.Align(Value: Talign): Icontrollerpainel;
begin
  Result:=Self;
  FPanel.Align:=Value;
end;

function Tcontrollerpainel.Largura(Value: Integer): Icontrollerpainel;
begin
  Result := Self;
  FPanel.Width:=Value;
end;

function Tcontrollerpainel.Addopcao(Value: Tobject): Icontrollerpainel;
begin
  Result:= Self;
  //FPanel.InsertComponent(TComponent(Value));
  TWinControl(Value).Parent := FPanel ;
end;

function Tcontrollerpainel.Item: Tobject;
begin
  Result:=FPanel;
end;

procedure Tcontrollerpainel.Exibir;
begin
  //FContainer.InsertComponent(FPanel);
  FPanel.Caption:='';
  FPanel.Parent:= TWinControl(FContainer);
  (FContainer as TControl).Visible := True;
end;

end.

