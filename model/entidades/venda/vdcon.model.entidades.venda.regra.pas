unit vdcon.model.entidades.venda.regra;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TREGRACOMISSAO }

  TREGRACOMISSAO = class
  private
    Fempresa: Integer;
    Ffaixa: Integer;
    Fparcela: Integer;
    Fpclib: Integer;
    Fpercentual: Double;
    procedure Setempresa(Avalue: Integer);
    procedure Setfaixa(Avalue: Integer);
    procedure Setparcela(Avalue: Integer);
    procedure Setpclib(Avalue: Integer);
    procedure Setpercentual(Avalue: Double);
  published
    property EMPRESA: integer read FEMPRESA write SetEMPRESA;
    property PARCELA: integer read FPARCELA write SetPARCELA;
    property FAIXA: integer read FFAIXA write SetFAIXA;
    property PCLIB: integer read FPCLIB write SetPCLIB;
    property PERCENTUAL: Double read FPERCENTUAL write SetPERCENTUAL;
  end;

implementation

const
  NOME_TABELA = 'REGRAS';

{ TREGRACOMISSAO }

procedure Tregracomissao.Setempresa(Avalue: Integer);
begin
  if Fempresa=Avalue then Exit;
  Fempresa:=Avalue;
end;

procedure Tregracomissao.Setfaixa(Avalue: Integer);
begin
  if Ffaixa=Avalue then Exit;
  Ffaixa:=Avalue;
end;

procedure Tregracomissao.Setparcela(Avalue: Integer);
begin
  if Fparcela=Avalue then Exit;
  Fparcela:=Avalue;
end;

procedure Tregracomissao.Setpclib(Avalue: Integer);
begin
  if Fpclib=Avalue then Exit;
  Fpclib:=Avalue;
end;

procedure Tregracomissao.Setpercentual(Avalue: Double);
begin
  if Fpercentual=Avalue then Exit;
  Fpercentual:=Avalue;
end;

end.

