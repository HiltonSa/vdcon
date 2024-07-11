unit vdcon.model.sql.interfaces;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, fgl, db;

type

    generic iRTTI<T : class> = interface
    ['{EEC49F47-24AC-4D82-9BEE-C259330A8993}']
    function ClassName (var aClassName : String) : specialize iRTTI<T>;
    function DictionaryFields(var aDictionary : specialize TFPGMap<string, variant>) : specialize  iRTTI<T>;
    function ListFields (var List : specialize TFPGList<String>) : specialize iRTTI<T>;
    function Update (var aUpdate : String) : specialize iRTTI<T>;
    function Where (var aWhere : String) : specialize iRTTI<T>;
    function Fields (var aFields : String) : specialize iRTTI<T>;
    function FieldsInsert (var aFields : String) : specialize iRTTI<T>;
    function Param (var aParam : String) : specialize iRTTI<T>;
    function DataSetToEntityList (aDataSet : TDataSet; var aList : specialize TFPGObjectList<T>) : specialize iRTTI<T>;
    function DataSetToEntity (aDataSet : TDataSet; var aEntity : T) : specialize iRTTI<T>;
  end;

  generic iSQL<T: class> = interface
    ['{1590A7C6-6E32-4579-9E60-38C966C1EB49}']
    function Insert (var aSQL : String) : specialize iSQL<T>;
    function Update (var aSQL : String) : specialize iSQL<T>;
    function Delete (var aSQL : String) : specialize iSQL<T>;
    function Select (var aSQL : String) : specialize iSQL<T>;
    function SelectId(var aSQL: String): specialize iSQL<T>;
    function Fields (aSQL : String) : specialize iSQL<T>;
    function Where (aSQL : String) : specialize iSQL<T>;
    function OrderBy (aSQL : String) : specialize iSQL<T>;
    function GroupBy (aSQL : String) : specialize iSQL<T>;
    function Join (aSQL : String) : specialize iSQL<T>;
  end;

implementation

end.

