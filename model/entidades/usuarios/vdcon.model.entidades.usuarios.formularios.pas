unit vdcon.model.entidades.usuarios.formularios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TFORMULARIOS }

  TFORMULARIOS = class
  private
    Fcodigo: Integer;
    Fdescricao: String;
    Fformulario: String;
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setformulario(Avalue: String);
  published
    property CODIGO : Integer read FCODIGO write SetCODIGO;
    property FORMULARIO: String read FFORMULARIO write SetFORMULARIO;
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
  end;

implementation

const
  NOME_TABELA = 'ZZ_FORMULARIOS';

{ TFORMULARIOS }

procedure Tformularios.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tformularios.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Tformularios.Setformulario(Avalue: String);
begin
  if Fformulario=Avalue then Exit;
  Fformulario:=Avalue;
end;

end.

