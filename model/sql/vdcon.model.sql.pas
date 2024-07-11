unit vdcon.model.sql;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.sql.interfaces, vdcon.model.rtti, fgl;

Type
  generic TSQL<T : class> = class(TInterfacedObject, specialize iSQL<T>)
    private
      FInstance : T;
      FFields : String;
      FWhere : String;
      FOrderBy : String;
      FGroupBy : String;
      FJoin : String;
    public
      constructor Create(aInstance : T);
      destructor Destroy; override;
      class function New(aInstance : T) : specialize iSQL<T>;
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

{ TSQL<T> }

constructor TSQL.Create(aInstance : T);
begin
  FInstance := aInstance;
end;

function TSQL.Delete(var aSQL: String): specialize iSQL<T>;
var
  aClassName, aWhere : String;
begin
  Result := Self;

  //TRTTI<T>.New(FInstance)
  //  .ClassName(aClassName)
  //  .Where(aWhere);
  //
  aSQL := aSQL + 'DELETE FROM ' + aClassName;
  aSQL := aSQL + ' WHERE ' + aWhere;

end;

destructor TSQL.Destroy;
begin

  inherited;
end;

function TSQL.Fields(aSQL: String): specialize iSQL<T>;
begin
  Result := Self;
  FFields := aSQL;
end;

function TSQL.GroupBy(aSQL: String): specialize iSQL<T>;
begin
  Result := Self;
  FGroupBy := aSQL;
end;

function TSQL.Insert(var aSQL: String): specialize iSQL<T>;
var
  aClassName, aFields, aParam : String;
begin
  Result := Self;

    //TRTTI<T>.New(FInstance)
    //  .ClassName(aClassName)
    //  .FieldsInsert(aFields)
    //  .Param(aParam);

    aSQL := aSQL + 'INSERT INTO ' + aClassName;
    aSQL := aSQL + ' (' + aFields + ') ';
    aSQL := aSQL + ' VALUES (' + aParam + ');';
end;

function TSQL.Join(aSQL: String): specialize iSQL<T>;
begin
  Result := Self;
  FJoin := aSQL;
end;

class function TSQL.New(aInstance : T): specialize iSQL<T>;
begin
  Result := Self.Create(aInstance);
end;

function TSQL.OrderBy(aSQL: String): specialize iSQL<T>;
begin
  Result := Self;
  FOrderBy := aSQL;
end;

function TSQL.Select (var aSQL : String) : specialize iSQL<T>;
var
  aFields, aClassName : String;
begin
  Result := Self;

  //TRTTI<T>.New(nil)
  //  .Fields(aFields)
  //  .ClassName(aClassName);

  if FFields <> '' then
    aSQL := aSQL + ' SELECT ' + FFields
  else
    aSQL := aSQL + ' SELECT ' + aFields;

  aSQL := aSQL + ' FROM ' + aClassName;

  if FJoin <> '' then
    aSQL := aSQL + ' ' + FJoin + ' ';

  if FWhere <> '' then
    aSQL := aSQL + ' WHERE ' + FWhere;

  if FGroupBy <> '' then
    aSQL := aSQL + ' GROUP BY ' + FGroupBy;

  if FOrderBy <> '' then
    aSQL := aSQL + ' ORDER BY ' + FOrderBy;

end;

function TSQL.SelectId(var aSQL: String): specialize iSQL<T>;
var
  aFields, aClassName, aWhere : String;
begin
  Result := Self;

  //TRTTI<T>.New(FInstance)
  //  .Fields(aFields)
  //  .ClassName(aClassName)
  //  .Where(aWhere);
  if FWhere <> '' then
    aSQL := aSQL + ' WHERE ' + FWhere;

  aSQL := aSQL + ' SELECT ' + aFields;
  aSQL := aSQL + ' FROM ' + aClassName;
  aSQL := aSQL + ' WHERE ' + aWhere;
end;

function TSQL.Update(var aSQL: String): specialize iSQL<T>;
var
  aClassName, aUpdate, aWhere : String;
begin
  Result := Self;

  //TRTTI<T>.New(FInstance)
  //  .ClassName(aClassName)
  //  .Update(aUpdate)
  //  .Where(aWhere);

  aSQL := aSQL + 'UPDATE ' + aClassName;
  aSQL := aSQL + ' SET ' + aUpdate;
  aSQL := aSQL + ' WHERE ' + aWhere;

end;

function TSQL.Where(aSQL: String): specialize iSQL<T>;
begin
  Result := Self;
  FWhere := aSQL;
end;

end.

