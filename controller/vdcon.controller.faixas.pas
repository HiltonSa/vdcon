unit vdcon.controller.faixas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, db, vdcon.controller.interfaces, vdcon.model.interfaces,
  vdcon.model.dao, vdcon.model.dao.interfaces;

type

  { TControllerFaixas }

  TControllerFaixas = class(TInterfacedObject, iControllerFaixa)
     private
       FQuery: iModelDataSet;
     public
       constructor Create(AQuery: iModelDataSet);
       destructor Destroy; override;
       class function New(AQuery: iModelDataSet): iControllerFaixa;
       function Dao: iDao;
       function PesquisarCodigo(pCodigo: Integer): TDataSet;
       function PesquisarDescricao(pDescricao: String): TDataSet;
       function RetornaFaixasEmpresa(pEmpresa: Integer): TDataSet;
  end;

implementation

{ TControllerFaixas }

constructor Tcontrollerfaixas.Create(Aquery: Imodeldataset);
begin
  FQuery := Aquery;
end;

destructor Tcontrollerfaixas.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerfaixas.New(Aquery: Imodeldataset): Icontrollerfaixa;
begin
  Result := Self.Create(Aquery);
end;

function Tcontrollerfaixas.Dao: Idao;
begin
  Result := TModelDAO.New(FQuery) ;
end;

function Tcontrollerfaixas.Pesquisarcodigo(Pcodigo: Integer): Tdataset;
const
  SQL_CODIGO =
    'select * from FAIXAS where CODIGO=%d ';
begin
  Result :=
    FQuery
      .Open(Format(SQL_CODIGO,[Pcodigo]))
      .DataSet;
end;

function Tcontrollerfaixas.Pesquisardescricao(Pdescricao: String): Tdataset;
const
  SQL_DESCRICAO =
    'select * from FAIXAS where DESCRICAO like %s order by DESCRICAO';
begin
  Result :=
    FQuery
      .Open(Format(SQL_DESCRICAO,[QuotedStr(Pdescricao)]))
      .DataSet;
end;

function Tcontrollerfaixas.Retornafaixasempresa(Pempresa: Integer): Tdataset;
const
  SQL_FAIXAS =
    'select * from FAIXAS where EMPRESA = %d order by CODIGO';
begin
  Result :=
    FQuery
      .Open(Format(SQL_FAIXAS,[Pempresa]))
      .DataSet;
end;

end.

