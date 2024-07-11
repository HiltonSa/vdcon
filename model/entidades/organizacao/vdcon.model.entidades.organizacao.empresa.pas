unit vdcon.model.entidades.organizacao.empresa;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.dao.interfaces, db;

type

  { TEMPRESA }

  TEMPRESA = class (TInterfacedObject, iEntidade)
  private
    Facerto: Integer;
    Fcnpj: String;
    Fcodigo: Integer;
    Fmesper: Integer;
    Fnomefantasia: String;
    Fpcentrega: Double;
    Fpcper: Double;
    Frazaosocial: String;
    Fultfaixa: Integer;
    Funidade: Integer;
    Fvigencia: Tdatetime;
    procedure Setacerto(Avalue: Integer);
    procedure Setcnpj(Avalue: String);
    procedure Setcodigo(Avalue: Integer);
    procedure Setmesper(Avalue: Integer);
    procedure Setnomefantasia(Avalue: String);
    procedure Setpcentrega(Avalue: Double);
    procedure Setpcper(Avalue: Double);
    procedure Setrazaosocial(Avalue: String);
    procedure Setultfaixa(Avalue: Integer);
    procedure Setunidade(Avalue: Integer);
    procedure Setvigencia(Avalue: Tdatetime);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property NOMEFANTASIA: String read FNOMEFANTASIA write SetNOMEFANTASIA;
    property RAZAOSOCIAL: String read FRAZAOSOCIAL write SetRAZAOSOCIAL;
    property CNPJ: String read FCNPJ write SetCNPJ;
    property VIGENCIA: TDateTime read FVIGENCIA write SetVIGENCIA;
    property UNIDADE: Integer read FUNIDADE write SetUNIDADE;
    property PCENTREGA: Double read FPCENTREGA write SetPCENTREGA;
    property MESPER: Integer read FMESPER write SetMESPER;
    property PCPER: Double read FPCPER write SetPCPER;
    property ACERTO: Integer read FACERTO write SetACERTO;
    property ULTFAIXA: Integer read FULTFAIXA write SetULTFAIXA;
  public
    constructor Create;
    function DataSetParaEntidade(aDataSet: TDataSet): iEntidade;
    function NomeTabela : String;
    function CampoChave : string;
    function RetornaSQL(aTipo: TTipoSql): String;
  end;

implementation

uses vdcon.controller.util;

const
  NOME_TABELA = 'EMPRESA';

  { TEMPRESA }

procedure Tempresa.Setacerto(Avalue: Integer);
begin
  if Facerto=Avalue then Exit;
  Facerto:=Avalue;
end;

procedure Tempresa.Setcnpj(Avalue: String);
begin
  if Fcnpj=Avalue then Exit;
  Fcnpj:=Avalue;
end;

procedure Tempresa.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tempresa.Setmesper(Avalue: Integer);
begin
  if Fmesper=Avalue then Exit;
  Fmesper:=Avalue;
end;

procedure Tempresa.Setnomefantasia(Avalue: String);
begin
  if Fnomefantasia=Avalue then Exit;
  Fnomefantasia:=Avalue;
end;

procedure Tempresa.Setpcentrega(Avalue: Double);
begin
  if Fpcentrega=Avalue then Exit;
  Fpcentrega:=Avalue;
end;

procedure Tempresa.Setpcper(Avalue: Double);
begin
  if Fpcper=Avalue then Exit;
  Fpcper:=Avalue;
end;

procedure Tempresa.Setrazaosocial(Avalue: String);
begin
  if Frazaosocial=Avalue then Exit;
  Frazaosocial:=Avalue;
end;

procedure Tempresa.Setultfaixa(Avalue: Integer);
begin
  if Fultfaixa=Avalue then Exit;
  Fultfaixa:=Avalue;
end;

procedure Tempresa.Setunidade(Avalue: Integer);
begin
  if Funidade=Avalue then Exit;
  Funidade:=Avalue;
end;

procedure Tempresa.Setvigencia(Avalue: Tdatetime);
begin
  if Fvigencia=Avalue then Exit;
  Fvigencia:=Avalue;
end;

constructor Tempresa.Create;
begin

end;

function Tempresa.Datasetparaentidade(Adataset: Tdataset): Ientidade;
begin
  Fcodigo:=Adataset.FieldByName('CODIGO').AsInteger;
  Fnomefantasia:=Adataset.FieldByName('NOMEFANTASIA').AsString ;
  Frazaosocial:=Adataset.FieldByName('RAZAOSOCIAL').AsString ;
  Fcnpj:=Adataset.FieldByName('CNPJ').AsString;
  Fvigencia:=Adataset.FieldByName('VIGENCIA').AsDateTime ;
  Funidade:=Adataset.FieldByName('UNIDADE').AsInteger ;
  Fpcentrega:=Adataset.FieldByName('PCENTREGA').AsFloat;
  Fmesper:=Adataset.FieldByName('MESPER').AsInteger;
  Fpcper:=Adataset.FieldByName('PCPER').AsFloat;
  Facerto:=Adataset.FieldByName('ACERTO').AsInteger;
  Fultfaixa:=Adataset.FieldByName('ULTFAIXA').AsInteger;
  Result := Self;
end;

function Tempresa.Nometabela: String;
begin
  Result := NOME_TABELA;
end;

function Tempresa.Campochave: String;
begin
  Result := 'CODIGO';
end;

function Tempresa.Retornasql(Atipo: Ttiposql): String;
const
    SQL_PROCEDURE = 'EXECUTE PROCEDURE MANTER_EMPRESA(%d, %s, %s, %s, %s, %d, %d, %f, %d, %f, %d, %d)';

begin
  Result := Format(SQL_PROCEDURE,
                  [Atipo,
                      QuotedStr(Fnomefantasia),
                      QuotedStr(Frazaosocial),
                      QuotedStr(Fcnpj),
                      QuotedStr(RetornaDataSql(Fvigencia)),
                      Funidade,
                      Fcodigo,
                      Fpcentrega,
                      Fmesper,
                      Fpcper,
                      Facerto,
                      Fultfaixa]) ;
end;

end.

