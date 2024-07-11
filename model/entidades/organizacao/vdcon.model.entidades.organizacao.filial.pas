unit vdcon.model.entidades.organizacao.filial;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TFILIAL }

  TFILIAL = class
  private
    Fcodexterno: String;
    Fcodigo: Integer;
    Fdescricao: String;
    Fresponsavel: Integer;
    procedure Setcodexterno(Avalue: String);
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setresponsavel(Avalue: Integer);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property DESCRICAO: string read FDESCRICAO write SetDESCRICAO;
    property RESPONSAVEL: Integer read FRESPONSAVEL write SetRESPONSAVEL;
    property CODEXTERNO: string read FCODEXTERNO write SetCODEXTERNO;
  end;

implementation

const
  NOME_TABELA = 'FILIAIS';

{ TFILIAL }

procedure Tfilial.Setcodexterno(Avalue: String);
begin
  if Fcodexterno=Avalue then Exit;
  Fcodexterno:=Avalue;
end;

procedure Tfilial.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tfilial.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Tfilial.Setresponsavel(Avalue: Integer);
begin
  if Fresponsavel=Avalue then Exit;
  Fresponsavel:=Avalue;
end;

end.

