unit vdcon.controller;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.controller.interfaces, vdcon.controller.entidade,
  vdcon.model.conexao.factory, vdcon.model.interfaces, vdcon.controller.formularios,
  vdcon.model.conexao.parametrosconexao, Controls;

type

  { TController }

  TController = class (TInterfacedObject, iController, iControllerFactoryConexao)
    private
      FControllerEntidades : iControllerEntidades;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iController;
      function Entidades : iControllerEntidades;
      function Usuarios : iControllerEntidades;
      function Frames(aParent: TWinControl): iControllerFrames;
      function Formularios: iControllerFormularios;
      function Menus: iControllerPainelFactory;
      function Conexao: iModelConexao;
  end;

implementation

uses vdcon.controller.painel.factory, vdcon.controller.frames;

{ TController }

constructor Tcontroller.Create;
begin
  FControllerEntidades := TControllerEntidades.New(Self.Conexao);
end;

destructor Tcontroller.Destroy;
begin
  inherited Destroy;
end;

class function Tcontroller.New: Icontroller;
begin
  Result := Self.Create;
end;

function Tcontroller.Entidades: Icontrollerentidades;
begin
  Result := FControllerEntidades;
end;

function Tcontroller.Usuarios: Icontrollerentidades;
begin
  Result := FControllerEntidades;
end;

function Tcontroller.Frames(Aparent: Twincontrol): Icontrollerframes;
begin
  Result := TControllerFrames.New(Aparent);
end;

function Tcontroller.Formularios: Icontrollerformularios;
begin
  Result := TControllerFormularios.New;
end;

function Tcontroller.Menus: Icontrollerpainelfactory;
begin
  Result := TControllerPainelFactory.New;
end;

function Tcontroller.Conexao: Imodelconexao;
var
  VRegPar : TRegParametros;

begin
  VRegPar := TConexaoParametros.getParametros;
  Result := TModelConexaoFactory.New
               .ConexaoZeos
                 .Parametros
                   .Database(VRegPar.DataBase)
                   .DriverID(VRegPar.DriverId)
                   .Porta(VRegPar.Porta)
                   .Server(VRegPar.Server)
                   .UserName(VRegPar.UserName)
                   .Password(VRegPar.Password)
                 .EndParametros
               .Conectar;
end;

end.

