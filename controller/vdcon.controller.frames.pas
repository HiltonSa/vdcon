unit vdcon.controller.frames;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, Forms, vdcon.controller.interfaces;

type

  { TControllerFrames }

  TControllerFrames = class (TInterfacedObject, iControllerFrames)
    private
      FParent: TWinControl;
      FFrame: TFrame;
    public
      constructor Create(aParent: TWinControl);
      destructor Destroy; override;
      class function New(aParent: TWinControl):iControllerFrames;
      function AplicarRestricoes: iControllerFrames;
      function VerificarRotinas: iControllerFrames;
      function Empresa: iControllerFrames;
      procedure MostrarFrame;
  end;

implementation

uses vdcon.view.frames.empresas;

{ TControllerFrames }

constructor Tcontrollerframes.Create(Aparent: TWinControl);
begin
  FParent:=Aparent;
end;

destructor Tcontrollerframes.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerframes.New(Aparent: TWinControl): Icontrollerframes;
begin
  Result := Self.Create(Aparent);
end;

function Tcontrollerframes.Aplicarrestricoes: Icontrollerframes;
begin
  Result := Self;
end;

function Tcontrollerframes.Verificarrotinas: Icontrollerframes;
begin
  Result := Self;
end;

function Tcontrollerframes.Empresa: Icontrollerframes;
begin
  Result := Self;
  FFrame:=TFrameEmpresas.Create(FParent);
end;

procedure Tcontrollerframes.Mostrarframe;
begin
  //if not Assigned(FFrame)
  //then FFrame:=TFrameEmpresas.Create(FParent);
  //FFrame.Parent := FParent;
end;

end.

