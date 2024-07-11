unit vdcon.model.entidades.usuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.dao.interfaces, db;

type

  { TUSUARIO }


  TUSUARIO = class (TInterfacedObject, iEntidade)
  private
    Fativo: Integer;
    Fcodigo: Integer;
    Ffilial: Integer;
    Fgrusu: Integer;
    Fimagem: String;
    Fsenha: String;
    Fusuario: String;
    procedure Setativo(Avalue: Integer);
    procedure Setcodigo(Avalue: Integer);
    procedure Setfilial(Avalue: Integer);
    procedure Setgrusu(Avalue: Integer);
    procedure Setimagem(Avalue: String);
    procedure Setsenha(Avalue: String);
    procedure Setusuario(Avalue: String);
  published
    property CODIGO : Integer read FCODIGO write SetCODIGO;
    property USUARIO : String read FUSUARIO write SetUSUARIO;
    property SENHA: String read FSENHA write SetSENHA;
    property GRUSU: Integer read FGRUSU write SetGRUSU;
    property IMAGEM: String read FIMAGEM write SetIMAGEM;
    property ATIVO: Integer read FATIVO write SetATIVO;
    property FILIAL: Integer read FFILIAL write SetFILIAL;
  public
    Constructor Create;
    function DataSetParaEntidade(aDataSet: TDataSet): iEntidade;
    function NomeTabela : String;
    function CampoChave : string;
    function RetornaSQL(aTipo: TTipoSql): String;
  end;


implementation

const
  NOME_TABELA = 'ZZ_USUARIOS';


{ TUSUARIO }

procedure Tusuario.Setativo(Avalue: Integer);
begin
  if Fativo=Avalue then Exit;
  Fativo:=Avalue;
end;

procedure Tusuario.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tusuario.Setfilial(Avalue: Integer);
begin
  if Ffilial=Avalue then Exit;
  Ffilial:=Avalue;
end;

procedure Tusuario.Setgrusu(Avalue: Integer);
begin
  if Fgrusu=Avalue then Exit;
  Fgrusu:=Avalue;
end;

procedure Tusuario.Setimagem(Avalue: String);
begin
  if Fimagem=Avalue then Exit;
  Fimagem:=Avalue;
end;

procedure Tusuario.Setsenha(Avalue: String);
begin
  if Fsenha=Avalue then Exit;
  Fsenha:=Avalue;
end;

procedure Tusuario.Setusuario(Avalue: String);
begin
  if Fusuario=Avalue then Exit;
  Fusuario:=Avalue;
end;

constructor Tusuario.Create;
begin

end;

function Tusuario.Datasetparaentidade(Adataset: Tdataset): Ientidade;
begin
  Fcodigo:=Adataset.FieldByName('CODIGO').AsInteger;
  Fusuario:=Adataset.FieldByName('USUARIO').AsString ;
  Fsenha:=Adataset.FieldByName('SENHA').AsString ;
  Fgrusu:=Adataset.FieldByName('GRUSU').AsInteger;
  Fimagem:=Adataset.FieldByName('IMAGEM').AsString ;
  Fativo:=Adataset.FieldByName('ATIVO').AsInteger;
  Ffilial:=Adataset.FieldByName('FILIAL').AsInteger;
  Result := Self;
end;

function Tusuario.Nometabela: String;
begin
  Result := NOME_TABELA;
end;

function Tusuario.Campochave: String;
begin
  Result := 'CODIGO';
end;

function Tusuario.Retornasql(Atipo: Ttiposql): String;
const
  SQL_PROCEDURE = 'EXECUTE PROCEDURE MANTER_USUARIOS(%d, %d, %s, %s, %d, %s, %d, %d)';
begin
  Result := Format(SQL_PROCEDURE,
                  [Atipo, Fcodigo,
                      QuotedStr(Fusuario),
                      QuotedStr(Fsenha),
                      Fgrusu,
                      QuotedStr(Fimagem),
                      Fativo,
                      Ffilial]) ;;
end;

end.

