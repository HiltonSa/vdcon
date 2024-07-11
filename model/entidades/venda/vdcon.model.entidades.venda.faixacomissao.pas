unit vdcon.model.entidades.venda.faixacomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, db;

type

  { TFAIXACOMISSAO }

  TFAIXACOMISSAO = class
  private
    Fcodigo: Integer;
    Fdescricao: String;
    Fempresa: Integer;
    Fmaximo: Double;
    Fminimo: Double;
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setempresa(Avalue: Integer);
    procedure Setmaximo(Avalue: Double);
    procedure Setminimo(Avalue: Double);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property EMPRESA: Integer read FEMPRESA write SetEMPRESA;
    property DESCRICAO: string read FDESCRICAO write SetDESCRICAO;
    property MINIMO: Double read FMINIMO write SetMINIMO;
    property MAXIMO: Double read FMAXIMO write SetMAXIMO;
  public
    constructor Create;
    function DataSetParaEntidade(aDataSet: TDataSet): iEntidade;
    function NomeTabela : String;
    function CampoChave : string;
    function RetornaSQL(aTipo: TTipoSql): String;
  end;

implementation

const
  NOME_TABELA = 'FAIXAS';

{ TFAIXACOMISSAO }

procedure Tfaixacomissao.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tfaixacomissao.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Tfaixacomissao.Setempresa(Avalue: Integer);
begin
  if Fempresa=Avalue then Exit;
  Fempresa:=Avalue;
end;

procedure Tfaixacomissao.Setmaximo(Avalue: Double);
begin
  if Fmaximo=Avalue then Exit;
  Fmaximo:=Avalue;
end;

procedure Tfaixacomissao.Setminimo(Avalue: Double);
begin
  if Fminimo=Avalue then Exit;
  Fminimo:=Avalue;
end;

constructor Tfaixacomissao.Create;
begin

end;

function Tfaixacomissao.Datasetparaentidade(Adataset: Tdataset): Ientidade;
begin
  Setcodigo(Adataset.FieldByName('CODIGO').AsInteger);
  Setempresa(Adataset.FieldByName('EMPRESA').AsInteger);
  Setdescricao(Adataset.FieldByName('DESCRICAO').AsString);
  Setminimo(Adataset.FieldByName('MINIMO').AsFloat);
  Setmaximo(Adataset.FieldByName('MAXIMO').AsFloat);
  Result := Self;
end;

function Tfaixacomissao.Nometabela: String;
begin
  Result := 'FAIXAS';
end;

function Tfaixacomissao.Campochave: String;
begin
  Result := 'CODIGO';
end;

function Tfaixacomissao.Retornasql(Atipo: Ttiposql): String;
const
    SQL_PROCEDURE = 'EXECUTE PROCEDURE MANTER_FAIXAS(%d, %d, %d, %s, %f, %f)';

begin
  Result := Format(SQL_PROCEDURE,
                  [Atipo,
                   Fempresa,
                   Fcodigo,
                   QuotedStr(Fdescricao),
                   Fminimo,
                   Fmaximo]) ;
end;

end.

