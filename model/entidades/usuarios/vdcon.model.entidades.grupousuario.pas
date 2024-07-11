unit vdcon.model.entidades.grupousuario;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TGRUPOUSUARIO }

  TGRUPOUSUARIO = class
  private
    Fcodigo: Integer;
    Fdescricao: String;
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
  end;

implementation

const
  NOME_TABELA = 'ZZ_GRUSU';

{ TGRUPOUSUARIO }

procedure TGRUPOUSUARIO.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure TGRUPOUSUARIO.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

end.

