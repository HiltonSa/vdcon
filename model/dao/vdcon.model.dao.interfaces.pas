unit vdcon.model.dao.interfaces;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, db, fgl;

type

  TMapaValor = specialize TFPGMap<String, Variant>;
  TTipoSql = (tsIncluir, tsAlterar, tsExcluir);


  iEntidade = interface
    ['{3929F4C7-FCB1-407E-9C64-7D920D5F261B}']
    function NomeTabela : String;
    function CampoChave : string;
    function RetornaSQL(aTipo: TTipoSql): String;
  end;

   generic iModelDAO<T: iEntidade> = interface
    ['{364F2A94-0866-4AC7-9035-E205E9B14B73}']
    function Insert(aValue : T) : specialize iModelDAO<T>;
    function Update(aValue : T) : specialize iModelDAO<T>;
    function Delete(aValue : T) : specialize iModelDAO<T>;
    function DataSource( aDataSource : TDataSource) : specialize iModelDAO<T>;
    function Find(aSQL : String): specialize iModelDAO<T>;
    function Entidade: T;
  end;

  iDAO = interface
   ['{C1CA5256-DA84-40BB-8F18-B047D05A5ED8}']
   function Insert(aValue : iEntidade): iDAO;
   function Update(aValue : iEntidade): iDAO;
   function Delete(aValue : iEntidade): iDAO;
   function DataSource(var aDataSource: TDataSource) : iDao;
   function DataSet: TDataSet;
   function Find(aSQL : String): iDAO;
  end;




implementation

end.

