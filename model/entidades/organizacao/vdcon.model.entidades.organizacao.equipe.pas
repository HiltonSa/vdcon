unit vdcon.model.entidades.organizacao.equipe;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TEQUIPE }

  TEQUIPE = class
  private
    Fcodigo: Integer;
    Fdescricao: String;
    Ffilial: Integer;
    Fsupervisor: Integer;
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setfilial(Avalue: Integer);
    procedure Setsupervisor(Avalue: Integer);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
    property FILIAL: Integer read FFILIAL write SetFILIAL;
    property SUPERVISOR: Integer read FSUPERVISOR write SetSUPERVISOR;
  end;

implementation

const
  NOME_TABELA = 'EQUIPES';

{ TEQUIPE }

procedure Tequipe.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tequipe.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Tequipe.Setfilial(Avalue: Integer);
begin
  if Ffilial=Avalue then Exit;
  Ffilial:=Avalue;
end;

procedure Tequipe.Setsupervisor(Avalue: Integer);
begin
  if Fsupervisor=Avalue then Exit;
  Fsupervisor:=Avalue;
end;

end.

