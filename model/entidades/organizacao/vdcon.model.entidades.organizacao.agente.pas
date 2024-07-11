unit vdcon.model.entidades.organizacao.agente;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TAGENTE }

  TAGENTE = class
  private
    Fativo: Integer;
    Fcdexterno: String;
    Fcelular: String;
    Fcodigo: Integer;
    Fcpf: String;
    Fddd: String;
    Fequipe: Integer;
    Fnome: String;
    Fsupervisao: Integer;
    procedure Setativo(Avalue: Integer);
    procedure Setcdexterno(Avalue: String);
    procedure Setcelular(Avalue: String);
    procedure Setcodigo(Avalue: Integer);
    procedure Setcpf(Avalue: String);
    procedure Setddd(Avalue: String);
    procedure Setequipe(Avalue: Integer);
    procedure Setnome(Avalue: String);
    procedure Setsupervisao(Avalue: Integer);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property NOME: string read FNOME write SetNOME;
    property CPF: string read FCPF write SetCPF;
    property DDD: string read FDDD write SetDDD;
    property CELULAR: string read FCELULAR write SetCELULAR;
    property EQUIPE: Integer read FEQUIPE write SetEQUIPE;
    property SUPERVISAO: Integer read FSUPERVISAO write SetSUPERVISAO;
    property ATIVO: Integer read FATIVO write SetATIVO;
    property CDEXTERNO: string read FCDEXTERNO write SetCDEXTERNO;
  end;

implementation

const
  NOME_TABELA = 'AGENTES';

{ TAGENTE }

procedure Tagente.Setativo(Avalue: Integer);
begin
  if Fativo=Avalue then Exit;
  Fativo:=Avalue;
end;

procedure Tagente.Setcdexterno(Avalue: String);
begin
  if Fcdexterno=Avalue then Exit;
  Fcdexterno:=Avalue;
end;

procedure Tagente.Setcelular(Avalue: String);
begin
  if Fcelular=Avalue then Exit;
  Fcelular:=Avalue;
end;

procedure Tagente.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tagente.Setcpf(Avalue: String);
begin
  if Fcpf=Avalue then Exit;
  Fcpf:=Avalue;
end;

procedure Tagente.Setddd(Avalue: String);
begin
  if Fddd=Avalue then Exit;
  Fddd:=Avalue;
end;

procedure Tagente.Setequipe(Avalue: Integer);
begin
  if Fequipe=Avalue then Exit;
  Fequipe:=Avalue;
end;

procedure Tagente.Setnome(Avalue: String);
begin
  if Fnome=Avalue then Exit;
  Fnome:=Avalue;
end;

procedure Tagente.Setsupervisao(Avalue: Integer);
begin
  if Fsupervisao=Avalue then Exit;
  Fsupervisao:=Avalue;
end;

end.

