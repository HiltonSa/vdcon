unit vdcon.model.rtti;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.sql.interfaces, fgl, db, typinfo;

Type
  generic TRTTI<T : class> = class(TInterfacedObject, specialize iRTTI<T>)
    private
      FInstance : T;
      function __FloatFormat( aValue : String ) : Currency;
    public
      constructor Create( aInstance : T );
      destructor Destroy; override;
      class function New( aInstance : T ) : specialize iRTTI<T>;
      function Fields (var aFields : String) : specialize iRTTI<T>;
      function FieldsInsert (var aFields : String) : specialize iRTTI<T>;
      function Param (var aParam : String) : specialize iRTTI<T>;
      function Where (var aWhere : String) : specialize iRTTI<T>;
      function Update(var aUpdate : String) : specialize iRTTI<T>;
      function DictionaryFields(var aDictionary : specialize TFPGMap<string, variant>) : specialize iRTTI<T>;
      function ListFields (var List : specialize TFPGList<String>) : specialize iRTTI<T>;
      function ClassName (var aClassName : String) : specialize iRTTI<T>;
      function DataSetToEntityList (aDataSet : TDataSet; var aList : specialize TFPGObjectList<T>) : specialize iRTTI<T>;
      function DataSetToEntity (aDataSet : TDataSet; var aEntity : T) : specialize iRTTI<T>;
  end;

implementation

{ TRTTI }

function TRTTI.__FloatFormat( aValue : String ) : Currency;
begin
  while Pos('.', aValue) > 0 do
    delete(aValue,Pos('.', aValue),1);

  Result := StrToCurr(aValue);
end;

function TRTTI.ClassName (var aClassName : String) : specialize iRTTI<T>;
//var
//  Info      : PTypeInfo;
//  ctxRtti   : TRttiContext;
//  typRtti   : TRttiType;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  aClassName := T.ta
  //finally
  //  ctxRtti.Free;
  //end;
end;

constructor TRTTI.Create( aInstance : T );
begin
  FInstance := aInstance;
end;

function TRTTI.DataSetToEntity(aDataSet: TDataSet;
  var aEntity: T): specialize iRTTI<T>;
var
  Field : TField;
  teste: string;
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  //Value : TValue;
begin
  Result := Self;
  aDataSet.First;
  while not aDataSet.Eof do
  begin
    Info := System.TypeInfo(T);
  //  ctxRtti := TRttiContext.Create;
  //  try
  //    for Field in aDataSet.Fields do
  //    begin
  //        typRtti := ctxRtti.GetType(Info);
  //        for prpRtti in typRtti.GetProperties do
  //        begin
  //          if prpRtti.Name = Field.DisplayName then
  //          begin
  //            case prpRtti.PropertyType.TypeKind of
  //              tkUnknown: Value := Field.AsString;
  //              tkInteger: Value := Field.AsInteger;
  //              tkChar: ;
  //              tkEnumeration: ;
  //              tkFloat: Value := Field.AsFloat;
  //              tkString: Value := Field.AsString;
  //              tkSet: ;
  //              tkClass: ;
  //              tkMethod: ;
  //              tkWChar:  Value := Field.AsString;
  //              tkLString: Value := Field.AsString;
  //              tkWString: Value := Field.AsString;
  //              tkVariant: ;
  //              tkArray: ;
  //              tkRecord: ;
  //              tkInterface: ;
  //              tkInt64: Value := Field.AsInteger;
  //              tkDynArray: ;
  //              tkUString: Value := Field.AsString;
  //              tkClassRef: ;
  //              tkPointer: ;
  //              tkProcedure: ;
  //            end;
  //            prpRtti.SetValue(Pointer(aEntity), Value);
  //          end;
  //        end;
  //    end;
  //  finally
  //    ctxRtti.Free;
  //  end;
    aDataSet.Next;
  end;
  aDataSet.First;
end;

function TRTTI.DataSetToEntityList(aDataSet: TDataSet;
  var aList: specialize TfpgObjectList<T>): specialize iRTTI<T>;
var
  Field : TField;
  teste: string;
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  //Info     : PTypeInfo;
  //Value : TValue;
begin
  Result := Self;
  //while not aDataSet.Eof do
  //begin
  //  aList.Add(T.Create);
  //  Info := System.TypeInfo(T);
  //  ctxRtti := TRttiContext.Create;
  //  try
  //    for Field in aDataSet.Fields do
  //    begin
  //        typRtti := ctxRtti.GetType(Info);
  //        for prpRtti in typRtti.GetProperties do
  //        begin
  //          if prpRtti.Name = Field.DisplayName then
  //          begin
  //            case prpRtti.PropertyType.TypeKind of
  //              tkUnknown: Value := Field.AsString;
  //              tkInteger: Value := Field.AsInteger;
  //              tkChar: ;
  //              tkEnumeration: ;
  //              tkFloat: Value := Field.AsFloat;
  //              tkString: Value := Field.AsString;
  //              tkSet: ;
  //              tkClass: ;
  //              tkMethod: ;
  //              tkWChar:  Value := Field.AsString;
  //              tkLString: Value := Field.AsString;
  //              tkWString: Value := Field.AsString;
  //              tkVariant: ;
  //              tkArray: ;
  //              tkRecord: ;
  //              tkInterface: ;
  //              tkInt64: Value := Field.AsInteger;
  //              tkDynArray: ;
  //              tkUString: Value := Field.AsString;
  //              tkClassRef: ;
  //              tkPointer: ;
  //              tkProcedure: ;
  //            end;
  //            prpRtti.SetValue(Pointer(aList[Pred(aList.Count)]), Value);
  //          end;
  //        end;
  //    end;
  //  finally
  //    ctxRtti.Free;
  //  end;
  //  aDataSet.Next;
  //end;
  //aDataSet.First;
end;

destructor TRTTI.Destroy;
begin

  inherited;
end;

function TRTTI.DictionaryFields(var aDictionary : specialize TFPGMap<string, variant>) : specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  Aux : String;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //    case prpRtti.PropertyType.TypeKind of
  //        tkInt64,
  //        tkInteger     : aDictionary.Add(prpRtti.Name, prpRtti.GetValue(Pointer(FInstance)).AsInteger);
  //        tkFloat       :
  //        begin
  //          if CompareText('TDateTime',prpRtti.PropertyType.Name)=0 then
  //            aDictionary.Add(prpRtti.Name, StrToDateTime(prpRtti.GetValue(Pointer(FInstance)).ToString))
  //          else
  //            aDictionary.Add(prpRtti.Name, __FloatFormat(prpRtti.GetValue(Pointer(FInstance)).ToString));
  //        end;
  //        tkWChar,
  //        tkLString,
  //        tkWString,
  //        tkUString,
  //        tkString      : aDictionary.Add(prpRtti.Name, prpRtti.GetValue(Pointer(FInstance)).AsString);
  //        tkVariant     : aDictionary.Add(prpRtti.Name, prpRtti.GetValue(Pointer(FInstance)).AsVariant);
  //        else
  //          aDictionary.Add(prpRtti.Name, prpRtti.GetValue(Pointer(FInstance)).AsString);
  //    end;
  //  end;
  //finally
  //  ctxRtti.Free;
  //end;
end;

function TRTTI.Fields (var aFields : String) : specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  vIgnore : Boolean;
  //Attribute: TCustomAttribute;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //    vIgnore := false;
  //    for Attribute in prpRtti.GetAttributes do
  //    begin
  //      if Attribute is Ignore then
  //        vIgnore := True;
  //    end;
  //    if not vIgnore then
  //      aFields := aFields + prpRtti.Name + ', ';
  //  end;
  //finally
  //  aFields := Copy(aFields, 0, Length(aFields) - 2) + ' ';
  //  ctxRtti.Free;
  //end;
end;

function TRTTI.FieldsInsert(var aFields: String): specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  vIgnore : Boolean;
  //Attribute: TCustomAttribute;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //    vIgnore := false;
  //    for Attribute in prpRtti.GetAttributes do
  //    begin
  //      if Attribute is AutoInc then
  //        vIgnore := True;
  //    end;
  //    if not vIgnore then
  //      aFields := aFields + prpRtti.Name + ', ';
  //  end;
  //finally
  //  aFields := Copy(aFields, 0, Length(aFields) - 2) + ' ';
  //  ctxRtti.Free;
  //end;
end;

function TRTTI.ListFields(var List: specialize TFPGList<String>): specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
begin
  Result := Self;
  //if not Assigned(List) then
  //  List := TList<string>.Create;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //      List.Add(prpRtti.Name);
  //  end;
  //finally
  //  ctxRtti.Free;
  //end;

end;

class function TRTTI.New( aInstance : T ): specialize iRTTI<T>;
begin
  Result := Self.Create(aInstance);
end;

function TRTTI.Param (var aParam : String) : specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  vIgnore : Boolean;
  //Attribute: TCustomAttribute;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //    vIgnore := false;
  //    for Attribute in prpRtti.GetAttributes do
  //    begin
  //      if Attribute is Ignore then
  //        vIgnore := True;
  //
  //      if Attribute is AutoInc then
  //        vIgnore := True;
  //    end;
  //    if not vIgnore then
  //      aParam  := aParam + ':' + prpRtti.Name + ', ';
  //  end;
  //finally
  //  aParam := Copy(aParam, 0, Length(aParam) - 2) + ' ';
  //  ctxRtti.Free;
  //end;

end;

function TRTTI.Update(var aUpdate : String) : specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  vIgnore : Boolean;
  //Attribute: TCustomAttribute;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //    vIgnore := false;
  //    for Attribute in prpRtti.GetAttributes do
  //    begin
  //      if Attribute is Ignore then
  //        vIgnore := True;
  //    end;
  //    if not vIgnore then
  //      aUpdate := aUpdate + prpRtti.Name + ' = :' + prpRtti.Name + ', ';
  //  end;
  //finally
  //  aUpdate := Copy(aUpdate, 0, Length(aUpdate) - 2) + ' ';
  //  ctxRtti.Free;
  //end;
end;

function TRTTI.Where (var aWhere : String) : specialize iRTTI<T>;
var
  //ctxRtti   : TRttiContext;
  //typRtti   : TRttiType;
  //prpRtti   : TRttiProperty;
  Info     : PTypeInfo;
  //Attribute: TCustomAttribute;
begin
  Result := Self;
  //Info := System.TypeInfo(T);
  //ctxRtti := TRttiContext.Create;
  //try
  //  typRtti := ctxRtti.GetType(Info);
  //  for prpRtti in typRtti.GetProperties do
  //  begin
  //    for Attribute in prpRtti.GetAttributes do
  //    begin
  //      if Attribute is PK then
  //        aWhere := aWhere + prpRtti.Name + ' = :' + prpRtti.Name + ' AND ';
  //    end;
  //  end;
  //finally
  //  aWhere := Copy(aWhere, 0, Length(aWhere) - 4) + ' ';
  //  ctxRtti.Free;
  //end;
end;

end.

