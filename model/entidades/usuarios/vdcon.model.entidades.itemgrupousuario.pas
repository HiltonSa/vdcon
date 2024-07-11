unit vdcon.model.entidades.itensgrupousuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TITEMGRUPOUSUARIO }

  TITEMGRUPOUSUARIO = class
  private
    Fformulario: String;
    Fgrusu: Integer;
    Fprivil: Integer;
    Frotina: Integer;
    procedure Setformulario(Avalue: String);
    procedure Setgrusu(Avalue: Integer);
    procedure Setprivil(Avalue: Integer);
    procedure Setrotina(Avalue: Integer);
  published
    property GRUSU : Integer read FGRUSU write SetGRUSU;
    property ROTINA : Integer read FROTINA write SetROTINA;
    property PRIVIL : Integer read FPRIVIL write SetPRIVIL;
    property FORMULARIO: String read FFORMULARIO write SetFORMULARIO;
  end;

implementation

const
  NOME_TABELA = 'ZZ_ITGRU';

{ TITEMGRUPOUSUARIO }

procedure TITEMGRUPOUSUARIO.Setformulario(Avalue: String);
begin
  if Fformulario=Avalue then Exit;
  Fformulario:=Avalue;
end;

procedure TITEMGRUPOUSUARIO.Setgrusu(Avalue: Integer);
begin
  if Fgrusu=Avalue then Exit;
  Fgrusu:=Avalue;
end;

procedure TITEMGRUPOUSUARIO.Setprivil(Avalue: Integer);
begin
  if Fprivil=Avalue then Exit;
  Fprivil:=Avalue;
end;

procedure TITEMGRUPOUSUARIO.Setrotina(Avalue: Integer);
begin
  if Frotina=Avalue then Exit;
  Frotina:=Avalue;
end;

end.

