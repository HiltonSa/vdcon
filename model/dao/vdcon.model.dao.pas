unit vdcon.model.dao;

interface

uses
  Classes, Sysutils, vdcon.model.interfaces, vdcon.model.dao.interfaces, db;

type

  { TModelDAO }

  TModelDAO = class(TInterfacedObject,  iDAO)
  private
    FQuery : iModelDataSet;
    //function MapaParaEntidade(aMapa: TMapaValor): iEntidade;
    //function EntidadeParaMapa(aValue: iEntidade): TMapaValor;
  public
    constructor Create(aQuery : iModelDataSet);
    destructor Destroy; override;
    class function New(aQuery : iModelDataSet): iDAO;
    function Insert(aValue : iEntidade): iDAO;
    function Update(aValue : iEntidade): iDAO;
    function Delete(aValue : iEntidade): iDAO;
    function DataSource(var aDataSource: TDataSource) : iDao;
    function DataSet: TDataSet;
    function Find(aSQL : String): iDAO;
  end;

implementation

{ TModelDAO }

constructor Tmodeldao.Create(Aquery: Imodeldataset);
begin

  FQuery:=aQuery;

end;

destructor Tmodeldao.Destroy;
begin
  inherited Destroy;
end;

class function Tmodeldao.New(Aquery: Imodeldataset): Idao;
begin
  Result := Self.Create(aQuery);
end;

function Tmodeldao.Insert(Avalue: Ientidade): Idao;
begin
  Result := Self;
  FQuery.ExecSQL(Avalue.RetornaSQL(tsIncluir));
end;

function Tmodeldao.Update(Avalue: Ientidade): Idao;
begin
  Result := Self;
  FQuery.ExecSQL(Avalue.RetornaSQL(tsAlterar));
end;

function Tmodeldao.Delete(Avalue: Ientidade): Idao;
begin
  Result := Self;
  FQuery.ExecSQL(Avalue.RetornaSQL(tsExcluir));
end;

function Tmodeldao.Datasource(var Adatasource: Tdatasource): Idao;
begin
  Result := Self;
  Adatasource.DataSet := FQuery.DataSet;
end;

function Tmodeldao.Dataset: Tdataset;
begin
  Result := FQuery.DataSet;
end;

function Tmodeldao.Find(Asql: String): Idao;
begin
  Result := Self;
  FQuery.Open(Asql);
end;

end.

