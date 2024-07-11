unit vdcon.model.conexao.factory.dataset;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.interfaces, vdcon.model.conexao.dataset.zeos;

type

  { TModelConexaoFactoryDataset }

  TModelConexaoFactoryDataset = class(TInterfacedObject, iModelFactoryDataSet)
    public
      Constructor Create;
      Destructor Destroy ; override;
      class function New: iModelFactoryDataSet;
      function DataSetZeos(Conexao: iModelConexao) : iModelDataSet;
  end;

implementation

{ TModelConexaoFactoryDataset }

constructor Tmodelconexaofactorydataset.Create;
begin

end;

destructor Tmodelconexaofactorydataset.Destroy;
begin
  inherited Destroy;
end;

class function Tmodelconexaofactorydataset.New: Imodelfactorydataset;
begin
  Result := Self.Create;
end;

function Tmodelconexaofactorydataset.Datasetzeos(Conexao: Imodelconexao): Imodeldataset;
begin
  Result := TModelConexoesDataSetZeos.New(Conexao);
end;

end.

