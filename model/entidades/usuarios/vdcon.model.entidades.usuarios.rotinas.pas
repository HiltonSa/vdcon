unit vdcon.model.entidades.usuarios.rotinas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TROTINAS }

  TROTINAS = class
  private
    Facao: Integer;
    Fcodigo: Integer;
    Fdescricao: String;
    Fformulario: String;
    procedure Setacao(Avalue: Integer);
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setformulario(Avalue: String);
  published
    property CODIGO : Integer read FCODIGO write SetCODIGO;
    property DESCRICAO : String read FDESCRICAO write SetDESCRICAO;
    property FORMULARIO: String read FFORMULARIO write SetFORMULARIO;
    property ACAO: Integer read FACAO write SetACAO;
  end;

implementation

const
  NOME_TABELA = 'ZZ_ROTINAS';

{ TROTINAS }

procedure Trotinas.Setacao(Avalue: Integer);
begin
  if Facao=Avalue then Exit;
  Facao:=Avalue;
end;

procedure Trotinas.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Trotinas.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Trotinas.Setformulario(Avalue: String);
begin
  if Fformulario=Avalue then Exit;
  Fformulario:=Avalue;
end;

end.

