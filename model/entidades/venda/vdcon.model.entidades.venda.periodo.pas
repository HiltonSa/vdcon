unit vdcon.model.entidades.venda.periodo;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TPERIODO }

  TPERIODO = class
  private
    Fcodigo: Integer;
    Fdescricao: String;
    Fdtcal: Tdatetime;
    Fdtfim: Tdatetime;
    Fdtini: Tdatetime;
    procedure Setcodigo(Avalue: Integer);
    procedure Setdescricao(Avalue: String);
    procedure Setdtcal(Avalue: Tdatetime);
    procedure Setdtfim(Avalue: Tdatetime);
    procedure Setdtini(Avalue: Tdatetime);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
    property DTINI: TDateTime read FDTINI write SetDTINI;
    property DTFIM: TDateTime read FDTFIM write SetDTFIM;
    property DTCAL: TDateTime read FDTCAL write SetDTCAL;
  end;

implementation

const
  NOME_TABELA = 'PERIODO';

{ TPERIODO }

procedure Tperiodo.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tperiodo.Setdescricao(Avalue: String);
begin
  if Fdescricao=Avalue then Exit;
  Fdescricao:=Avalue;
end;

procedure Tperiodo.Setdtcal(Avalue: Tdatetime);
begin
  if Fdtcal=Avalue then Exit;
  Fdtcal:=Avalue;
end;

procedure Tperiodo.Setdtfim(Avalue: Tdatetime);
begin
  if Fdtfim=Avalue then Exit;
  Fdtfim:=Avalue;
end;

procedure Tperiodo.Setdtini(Avalue: Tdatetime);
begin
  if Fdtini=Avalue then Exit;
  Fdtini:=Avalue;
end;

end.

