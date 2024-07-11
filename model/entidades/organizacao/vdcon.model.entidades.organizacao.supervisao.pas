unit vdcon.model.entidades.organizacao.supervisao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TSUPERVISAO }

  TSUPERVISAO = class
  private
    Fcodigo: Integer;
    Fdescricao: String;
    Fvdpropria: Integer;
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setvdpropria(Avalue: Integer);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
    property VDPROPRIA: Integer read FVDPROPRIA write SetVDPROPRIA;
  end;

implementation

const
  NOME_TABELA = 'SUPERVISAO';

{ TSUPERVISAO }

procedure Tsupervisao.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tsupervisao.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Tsupervisao.Setvdpropria(Avalue: Integer);
begin
  if Fvdpropria=Avalue then Exit;
  Fvdpropria:=Avalue;
end;

end.

