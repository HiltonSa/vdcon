unit vdcon.controller.entidade;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.controller.interfaces,
  vdcon.model.conexao.factory.dataset,
  vdcon.model.interfaces,
  vdcon.controller.usuarios;

type

  { TControllerEntidades }

  TControllerEntidades = class (TInterfacedObject, iControllerEntidades)
    private
      FUsuario : iControllerUsuario;
      FConexao : iModelConexao;
      FQuery   : iModelDataSet;
    public
      constructor Create(Conexao: iModelConexao);
      destructor Destroy; override;
      class function New(Conexao: iModelConexao): iControllerEntidades;
      function Usuarios : iControllerUsuario;
      function Empresas: iControllerEmpresa;
      function Faixas: iControllerFaixa;
  end;

implementation

uses vdcon.controller.empresas, vdcon.controller.faixas;

{ TControllerEntidades }

constructor Tcontrollerentidades.Create(Conexao: Imodelconexao);
begin
  FConexao := Conexao;
  FQuery   := TModelConexaoFactoryDataset.New.DataSetZeos(FConexao);
end;

destructor Tcontrollerentidades.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerentidades.New(Conexao: Imodelconexao): Icontrollerentidades;
begin
  Result := Self.Create(Conexao);
end;

function Tcontrollerentidades.Usuarios: Icontrollerusuario;
begin

  Result := TControllerUsuarios.New(FQuery);

end;

function Tcontrollerentidades.Empresas: Icontrollerempresa;
begin
  Result := TControllerEmpresas.New(FQuery);
end;

function Tcontrollerentidades.Faixas: Icontrollerfaixa;
begin
  Result := TControllerFaixas.New(FQuery);
end;


end.

