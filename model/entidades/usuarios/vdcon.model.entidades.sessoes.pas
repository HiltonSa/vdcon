unit vdcon.model.entidades.sessoes;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.dao.interfaces;

type

  { TSESSAO }

  TSESSAO = class (TInterfacedObject, iEntidade)
  private
    Fabertura: Tdatetime;
    Fcodigo: Integer;
    Fencerramento: Tdatetime;
    Festacao: Integer;
    Fusuario: Integer;
    procedure Setabertura(Avalue: Tdatetime);
    procedure Setcodigo(Avalue: Integer);
    procedure Setencerramento(Avalue: Tdatetime);
    procedure Setestacao(Avalue: Integer);
    procedure Setusuario(Avalue: Integer);
  public
    Constructor Create(aCodigo, aUsuario, aEstacao: Integer);
    function NomeTabela : String;
    function CampoChave : string;
    function RetornaSQL(aTipo: TTipoSql): String;
  published
    property Codigo: Integer read FCodigo write SetCodigo;
    property Usuario: Integer read FUsuario write SetUsuario;
    property Estacao: Integer read FEstacao write SetEstacao;
    property Abertura: TDateTime read FAbertura write SetAbertura;
    property Encerramento: TDateTime read FEncerramento write SetEncerramento;
  end;

implementation

{ TSESSAO }

procedure Tsessao.Setabertura(Avalue: Tdatetime);
begin
  if Fabertura=Avalue then Exit;
  Fabertura:=Avalue;
end;

procedure Tsessao.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tsessao.Setencerramento(Avalue: Tdatetime);
begin
  if Fencerramento=Avalue then Exit;
  Fencerramento:=Avalue;
end;

procedure Tsessao.Setestacao(Avalue: Integer);
begin
  if Festacao=Avalue then Exit;
  Festacao:=Avalue;
end;

procedure Tsessao.Setusuario(Avalue: Integer);
begin
  if Fusuario=Avalue then Exit;
  Fusuario:=Avalue;
end;

constructor Tsessao.Create(Acodigo, Ausuario, Aestacao: Integer);
begin
  Fcodigo:=aCodigo;
  Fusuario:=aUsuario;
  Festacao:=aEstacao;
end;

function Tsessao.Nometabela: String;
begin
  Result := 'ZZ_SESSOES';
end;

function Tsessao.Campochave: String;
begin
  Result := 'CODIGO';
end;

function Tsessao.Retornasql(Atipo: Ttiposql): String;
const

  SQL_PROCEDURE = 'EXECUTE PROCEDURE MANTER_SESSAO (%d, %d, %d, %d)';

begin
  Result := Format(SQL_PROCEDURE,[
                   Atipo,
                   Fcodigo,
                   Fusuario,
                   FEstacao]);
end;

end.

