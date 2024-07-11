unit vdcon.model.entidades.venda.parcelacomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TPARCELACOMISSAO }

  TPARCELACOMISSAO = class
  private
    Fdtrec: Tdatetime;
    Fdtvenc: Tdatetime;
    Fpagar: Double;
    Fpago: Double;
    Fparcela: Integer;
    Fperiodo: Integer;
    Freceber: Double;
    Frecebido: Double;
    Fvenda: Integer;
    procedure Setdtrec(Avalue: Tdatetime);
    procedure Setdtvenc(Avalue: Tdatetime);
    procedure Setpagar(Avalue: Double);
    procedure Setpago(Avalue: Double);
    procedure Setparcela(Avalue: Integer);
    procedure Setperiodo(Avalue: Integer);
    procedure Setreceber(Avalue: Double);
    procedure Setrecebido(Avalue: Double);
    procedure Setvenda(Avalue: Integer);
  published
    property VENDA: Integer read FVENDA write SetVENDA;
    property PARCELA: Integer read FPARCELA write SetPARCELA;
    property DTVENC: TDateTime read FDTVENC write SetDTVENC;
    property PERIODO: Integer read FPERIODO write SetPERIODO;
    property RECEBER: Double read FRECEBER write SetRECEBER;
    property RECEBIDO: Double read FRECEBIDO write SetRECEBIDO;
    property PAGAR: Double read FPAGAR write SetPAGAR;
    property PAGO: Double read FPAGO write SetPAGO;
    property DTREC: TDateTime read FDTREC write SetDTREC;

  end;

implementation

const
  NOME_TABELA = 'PARCELAS';

{ TPARCELACOMISSAO }

procedure Tparcelacomissao.Setdtrec(Avalue: Tdatetime);
begin
  if Fdtrec=Avalue then Exit;
  Fdtrec:=Avalue;
end;

procedure Tparcelacomissao.Setdtvenc(Avalue: Tdatetime);
begin
  if Fdtvenc=Avalue then Exit;
  Fdtvenc:=Avalue;
end;

procedure Tparcelacomissao.Setpagar(Avalue: Double);
begin
  if Fpagar=Avalue then Exit;
  Fpagar:=Avalue;
end;

procedure Tparcelacomissao.Setpago(Avalue: Double);
begin
  if Fpago=Avalue then Exit;
  Fpago:=Avalue;
end;

procedure Tparcelacomissao.Setparcela(Avalue: Integer);
begin
  if Fparcela=Avalue then Exit;
  Fparcela:=Avalue;
end;

procedure Tparcelacomissao.Setperiodo(Avalue: Integer);
begin
  if Fperiodo=Avalue then Exit;
  Fperiodo:=Avalue;
end;

procedure Tparcelacomissao.Setreceber(Avalue: Double);
begin
  if Freceber=Avalue then Exit;
  Freceber:=Avalue;
end;

procedure Tparcelacomissao.Setrecebido(Avalue: Double);
begin
  if Frecebido=Avalue then Exit;
  Frecebido:=Avalue;
end;

procedure Tparcelacomissao.Setvenda(Avalue: Integer);
begin
  if Fvenda=Avalue then Exit;
  Fvenda:=Avalue;
end;

end.

