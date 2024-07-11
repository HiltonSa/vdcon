unit vdcon.model.entidades.organizacao.situacaovenda;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TSITUACAOVENDA }

  TSITUACAOVENDA = class
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
  NOME_TABELA = 'SITCON';

{ TSITUACAOVENDA }

procedure Tsituacaovenda.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tsituacaovenda.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

end.

