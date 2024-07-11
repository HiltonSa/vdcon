unit vdcon.model.conexao.dataset.zeos;

{$mode objfpc}{$H+}

interface

uses vdcon.model.interfaces, DB, ZAbstractRODataset, ZAbstractDataset, SysUtils,
  Classes, ZDataset, ZConnection;

type

  { TModelConexoesDataSetZeos }

  TModelConexoesDataSetZeos = class (TInterfacedObject, iModelDataSet)

  private
    FQuery : TZQuery;
    FConection : TZConnection;
    FParams : TParams;

  public

    constructor Create(Conexao: iModelConexao);
    destructor Destroy; override;
    class function New(Conexao: iModelConexao): iModelDataSet;

    function SQL : TStrings;
    function Params : TParams;
    function ExecSQL(Asql: String) : iModelDataSet;
    function DataSet : TDataSet;
    function Open(aSQL : String) : iModelDataSet; overload;
    function Open : iModelDataSet; overload;

end;

implementation

{ TModelConexoesDataSetZeos }


constructor Tmodelconexoesdatasetzeos.Create(Conexao: Imodelconexao);
begin
  FQuery := TZQuery.Create(nil);
  FConection := (Conexao.EndConexao as TZConnection);
  FQuery.Connection := FConection;
end;

destructor Tmodelconexoesdatasetzeos.Destroy;
begin
  FreeAndNil(FQuery);
  if Assigned(FParams) then
     FreeAndNil(FParams);
  inherited;
end;

class function Tmodelconexoesdatasetzeos.New(Conexao: Imodelconexao): Imodeldataset;
begin
  Result := Self.Create(Conexao);
end;

function Tmodelconexoesdatasetzeos.Sql: Tstrings;
begin
  Result := FQuery.SQL;
end;

function Tmodelconexoesdatasetzeos.Params: Tparams;
begin
  if not Assigned(FParams) then
  begin
    FParams := TParams.Create(nil);
    FParams.Assign(FQuery.Params);
  end;
  Result := FParams;
end;

function Tmodelconexoesdatasetzeos.Execsql(Asql: String): Imodeldataset;
var
  a: string;
begin
  Result := Self;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  FQuery.ExecSQL;
end;

function Tmodelconexoesdatasetzeos.Dataset: Tdataset;
begin
  Result := TDataSet(FQuery);
end;

function Tmodelconexoesdatasetzeos.Open(Asql: String): Imodeldataset;
begin
  Result := Self;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(aSQL);
  FQuery.Open;
end;

function Tmodelconexoesdatasetzeos.Open: Imodeldataset;
begin
  Result := Self;
  FQuery.Close;

  if Assigned(FParams) then
    FQuery.Params.Assign(FParams);

  FQuery.Prepare;
  FQuery.Open;

  if Assigned(FParams) then
    FreeAndNil(FParams);
end;


end.

