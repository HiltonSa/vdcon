unit vdcon.model.entidades.venda.vendaconsorcio;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils;

type

  { TVENDACONSORCIO }

  TVENDACONSORCIO = class
  private
    Fagente: Integer;
    Fcdbem: String;
    Fcodigo: Integer;
    Fcontrato: String;
    Fcota: Integer;
    Fcpfcnpj: String;
    Fdcbem: String;
    Fddd: String;
    Fdiavenc: Integer;
    Fdtcon: Tdatetime;
    Fdtvenda: Tdatetime;
    Fempresa: Integer;
    Ffone: String;
    Fgrupo: String;
    Fnome: String;
    Fperiodo: Integer;
    Fsituacao: Integer;
    Ftptpes: Integer;
    Fvalor: Double;
    Fvlrpago: Double;
    procedure Setagente(Avalue: Integer);
    procedure Setcdbem(Avalue: String);
    procedure Setcodigo(Avalue: Integer);
    procedure Setcontrato(Avalue: String);
    procedure Setcota(Avalue: Integer);
    procedure Setcpfcnpj(Avalue: String);
    procedure Setdcbem(Avalue: String);
    procedure Setddd(Avalue: String);
    procedure Setdiavenc(Avalue: Integer);
    procedure Setdtcon(Avalue: Tdatetime);
    procedure Setdtvenda(Avalue: Tdatetime);
    procedure Setempresa(Avalue: Integer);
    procedure Setfone(Avalue: String);
    procedure Setgrupo(Avalue: String);
    procedure Setnome(Avalue: String);
    procedure Setperiodo(Avalue: Integer);
    procedure Setsituacao(Avalue: Integer);
    procedure Settptpes(Avalue: Integer);
    procedure Setvalor(Avalue: Double);
    procedure Setvlrpago(Avalue: Double);
  published
    property CODIGO: Integer read FCODIGO write SetCODIGO;
    property EMPRESA: Integer read FEMPRESA write SetEMPRESA;
    property CONTRATO: String read FCONTRATO write SetCONTRATO;
    property AGENTE: Integer read FAGENTE write SetAGENTE;
    property DTVENDA: TDateTime read FDTVENDA write SetDTVENDA;
    property PERIODO: Integer read FPERIODO write SetPERIODO;
    property CDBEM: String read FCDBEM write SetCDBEM;
    property DCBEM: String read FDCBEM write SetDCBEM;
    property VALOR: Double read FVALOR write SetVALOR;
    property SITUACAO: Integer read FSITUACAO write SetSITUACAO;
    property DTCON: TDateTime read FDTCON write SetDTCON;
    property NOME: String read FNOME write SetNOME;
    property DDD: String read FDDD write SetDDD;
    property FONE: String read FFONE write SetFONE;
    property TPTPES: Integer read FTPTPES write SetTPTPES;
    property CPFCNPJ: String read FCPFCNPJ write SetCPFCNPJ;
    property GRUPO: String read FGRUPO write SetGRUPO;
    property COTA: Integer read FCOTA write SetCOTA;
    property DIAVENC: Integer read FDIAVENC write SetDIAVENC;
    property VLRPAGO: Double read FVLRPAGO write SetVLRPAGO;
  end;

implementation

const
  NOME_TABELA = 'VENDAS';

{ TVENDACONSORCIO }

procedure Tvendaconsorcio.Setagente(Avalue: Integer);
begin
  if Fagente=Avalue then Exit;
  Fagente:=Avalue;
end;

procedure Tvendaconsorcio.Setcdbem(Avalue: String);
begin
  if Fcdbem=Avalue then Exit;
  Fcdbem:=Avalue;
end;

procedure Tvendaconsorcio.Setcodigo(Avalue: Integer);
begin
  if Fcodigo=Avalue then Exit;
  Fcodigo:=Avalue;
end;

procedure Tvendaconsorcio.Setcontrato(Avalue: String);
begin
  if Fcontrato=Avalue then Exit;
  Fcontrato:=Avalue;
end;

procedure Tvendaconsorcio.Setcota(Avalue: Integer);
begin
  if Fcota=Avalue then Exit;
  Fcota:=Avalue;
end;

procedure Tvendaconsorcio.Setcpfcnpj(Avalue: String);
begin
  if Fcpfcnpj=Avalue then Exit;
  Fcpfcnpj:=Avalue;
end;

procedure Tvendaconsorcio.Setdcbem(Avalue: String);
begin
  if Fdcbem=Avalue then Exit;
  Fdcbem:=Avalue;
end;

procedure Tvendaconsorcio.Setddd(Avalue: String);
begin
  if Fddd=Avalue then Exit;
  Fddd:=Avalue;
end;

procedure Tvendaconsorcio.Setdiavenc(Avalue: Integer);
begin
  if Fdiavenc=Avalue then Exit;
  Fdiavenc:=Avalue;
end;

procedure Tvendaconsorcio.Setdtcon(Avalue: Tdatetime);
begin
  if Fdtcon=Avalue then Exit;
  Fdtcon:=Avalue;
end;

procedure Tvendaconsorcio.Setdtvenda(Avalue: Tdatetime);
begin
  if Fdtvenda=Avalue then Exit;
  Fdtvenda:=Avalue;
end;

procedure Tvendaconsorcio.Setempresa(Avalue: Integer);
begin
  if Fempresa=Avalue then Exit;
  Fempresa:=Avalue;
end;

procedure Tvendaconsorcio.Setfone(Avalue: String);
begin
  if Ffone=Avalue then Exit;
  Ffone:=Avalue;
end;

procedure Tvendaconsorcio.Setgrupo(Avalue: String);
begin
  if Fgrupo=Avalue then Exit;
  Fgrupo:=Avalue;
end;

procedure Tvendaconsorcio.Setnome(Avalue: String);
begin
  if Fnome=Avalue then Exit;
  Fnome:=Avalue;
end;

procedure Tvendaconsorcio.Setperiodo(Avalue: Integer);
begin
  if Fperiodo=Avalue then Exit;
  Fperiodo:=Avalue;
end;

procedure Tvendaconsorcio.Setsituacao(Avalue: Integer);
begin
  if Fsituacao=Avalue then Exit;
  Fsituacao:=Avalue;
end;

procedure Tvendaconsorcio.Settptpes(Avalue: Integer);
begin
  if Ftptpes=Avalue then Exit;
  Ftptpes:=Avalue;
end;

procedure Tvendaconsorcio.Setvalor(Avalue: Double);
begin
  if Fvalor=Avalue then Exit;
  Fvalor:=Avalue;
end;

procedure Tvendaconsorcio.Setvlrpago(Avalue: Double);
begin
  if Fvlrpago=Avalue then Exit;
  Fvlrpago:=Avalue;
end;

end.

