unit vdcon.model.conexao.factory;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.interfaces, vdcon.model.conexao.zeos;

type

  { TModelConexaoFactory }

  TModelConexaoFactory = class (TInterfacedObject, iModelFactoryConexao)
    public
      Constructor Create;
      Destructor Destroy ; override;
      class function New : iModelFactoryConexao;
      function ConexaoZeos : iModelConexao;
  end;

implementation

{ TModelConexaoFactory }

constructor Tmodelconexaofactory.Create;
begin

end;

destructor Tmodelconexaofactory.Destroy;
begin
  inherited Destroy;
end;

class function Tmodelconexaofactory.New: Imodelfactoryconexao;
begin
  Result := Self.Create;
end;

function Tmodelconexaofactory.Conexaozeos: Imodelconexao;
begin
  Result := TModelConexaoZeos.New;
end;

end.

