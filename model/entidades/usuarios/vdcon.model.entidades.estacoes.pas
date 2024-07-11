unit vdcon.model.entidades.estacoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.dao.interfaces;

type

  { TESTACOES }

  TESTACOES = class (TInterfacedObject, iEntidade)
  private
    Fcodigo: Integer;
    Fnome: String;
    Foperacaixa: Integer;
    Fporta: String;
    procedure Setcodigo(Avalue: Integer);
    procedure Setnome(Avalue: String);
    procedure Setoperacaixa(Avalue: Integer);
    procedure Setporta(Avalue: String);
  published
    property Codigo : Integer read FCodigo write SetCodigo;
    property Nome: String read FNome write SetNome;
    property OperaCaixa: Integer read FOperaCaixa write SetOperaCaixa;
    property Porta: string read FPorta write SetPorta;
  public
    Constructor Create(aCodigo: integer; aNome: string);
    function NomeTabela : String;
    function CampoChave : string;
    function RetornaSQL(aTipo: TTipoSql): String;
  end;

implementation

{ TESTACOES }

procedure Testacoes.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Testacoes.Setnome(Avalue: String);
begin
  if Fnome=Avalue then Exit;
  Fnome:=Avalue;
end;

procedure Testacoes.Setoperacaixa(Avalue: Integer);
begin
  if Foperacaixa=Avalue then Exit;
  Foperacaixa:=Avalue;
end;

procedure Testacoes.Setporta(Avalue: String);
begin
  if Fporta=Avalue then Exit;
  Fporta:=Avalue;
end;

constructor Testacoes.Create(Acodigo: Integer; Anome: String);
begin
  Fcodigo:=Acodigo;
  Fnome:=Anome;
end;

function Testacoes.Nometabela: String;
begin
  Result := 'ZZ_COMPUTADORES';
end;

function Testacoes.Campochave: String;
begin
  Result := 'CODIGO';
end;

function Testacoes.Retornasql(Atipo: Ttiposql): String;
const

  SQL_PROCEDURE = 'EXECUTE PROCEDURE MANTER_COMPUTADORES (%d, %d, %s, %d, %s)';


begin
  Result := Format(SQL_PROCEDURE,[Atipo,
                   Fcodigo,
                   QuotedStr(Fnome),
                   Foperacaixa,
                   QuotedStr(Fporta)]);
end;

end.

