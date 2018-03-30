unit datatabelas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, ZDataset;

type

  { TDMTab }

  TDMTab = class(TDataModule)
    FilCod: TLongintField;
    FilCodExterno: TStringField;
    FilDescricao: TStringField;
    FilResponsavel: TLongintField;
    psqAgentesATIVO: TLongintField;
    psqAgentesCDEXTERNO: TStringField;
    psqAgentesCELULAR: TStringField;
    psqAgentesCODIGO: TLongintField;
    psqAgentesCPF: TStringField;
    psqAgentesDDD: TStringField;
    psqAgentesEQUIPE: TLongintField;
    psqAgentesNOME: TStringField;
    psqAgentesSUPERVISAO: TLongintField;
    psqBensCDBEM: TStringField;
    psqBensDCBEM: TStringField;
    psqBensEMPRESA: TLongintField;
    psqBensQTD: TLongintField;
    psqBensVALOR: TFloatField;
    psqEqpeCODIGO: TLongintField;
    psqEqpeDESCRICAO: TStringField;
    psqEqpeFILIAL: TLongintField;
    psqEqpeSUPERVISOR: TLongintField;
    psqFiliaisCODEXTERNO: TStringField;
    psqFiliaisCODIGO: TLongintField;
    psqFiliaisDESCRICAO: TStringField;
    psqFiliaisRESPONSAVEL: TLongintField;
    psqPerCODIGO: TLongintField;
    psqPerDESCRICAO: TStringField;
    psqPerDTCAL: TDateField;
    psqPerDTFIM: TDateField;
    psqPerDTINI: TDateField;
    psqSitCODIGO: TLongintField;
    psqSitDESCRICAO: TStringField;
    psqSuperCODIGO: TLongintField;
    psqSuperDESCRICAO: TStringField;
    psqSuperVDPROPRIA: TLongintField;
    qryPsqFil: TZQuery;
    qryPsqFilCODEXTERNO: TStringField;
    qryPsqFilCODIGO: TLongintField;
    qryPsqFilDESCRICAO: TStringField;
    qryPsqFilRESPONSAVEL: TLongintField;
    psqAgentes: TZQuery;
    psqSuper: TZQuery;
    psqEqpe: TZQuery;
    psqFiliais: TZQuery;
    psqBens: TZQuery;
    psqSit: TZQuery;
    psqPer: TZQuery;
    procedure psqAgentesATIVOGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
  private
    { private declarations }
  public
    { public declarations }
    function AbrirPesquisa(cds: TZQuery; stSql: string): Boolean;
    procedure manterAgente(modo,cod,equipe,supervisao,ativo: Integer; nome,cpf,ddd,celular,cdext: String);
    procedure manterFilial(modo,cod,resp: Integer; desc,ext:String);
    procedure manterEquipe(modo,cod,fil,super: Integer; desc: String);
    function posicionarBens(emp: Integer; bem: String): Boolean;
  end;

var
  DMTab: TDMTab;

implementation

uses dataprincipal;

{$R *.lfm}

{ TDMTab }

procedure TDMTab.psqAgentesATIVOGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if (Sender as TLongintField).Value = 0
  then aText:='Inativo'
  else aText:='Ativo';
end;

function TDMTab.AbrirPesquisa(cds: TZQuery; stSql: string): Boolean;
begin
  with cds do
  begin
    Close;
    SQL.Clear;
    SQL.Add(stSql);
    Open;
    Result := not EOF;
  end;
end;

procedure TDMTab.manterAgente(modo, cod, equipe, supervisao, ativo: Integer;
  nome, cpf, ddd, celular, cdext: String);
begin
  with DMPrincipal.sp do begin
    Close;
    StoredProcName:='MANTER_AGENTES';
    ParamByName('MODO').Value:=modo;
    ParamByName('CODIGO').Value:=cod;
    ParamByName('EQUIPE').Value:=equipe;
    ParamByName('SUPERVISAO').Value:=supervisao;
    ParamByName('NOME').Value:=nome;
    ParamByName('CPF').Value:=cpf;
    ParamByName('DDD').Value:=ddd;
    ParamByName('CELULAR').Value:=celular;
    ParamByName('CDEXTERNO').Value:=cdext;
    ParamByName('ATIVO').Value:=ativo;
    ExecProc;
  end;
end;

procedure TDMTab.manterFilial(modo, cod, resp: Integer; desc, ext: String);
begin
  with DMPrincipal.sp do begin
    Close;
    StoredProcName:='MANTER_FILIAIS';
    ParamByName('MODO').Value:=modo;
    ParamByName('COD').Value:=cod;
    ParamByName('RESP').Value:=resp;
    ParamByName('EXT').Value:=ext;
    ParamByName('DESCRICAO').Value:=desc;
    ExecProc;
  end;
end;

procedure TDMTab.manterEquipe(modo, cod, fil, super: Integer; desc: String);
begin
  with DMPrincipal.sp do begin
    Close;
    StoredProcName:='MANTER_EQUIPES';
    ParamByName('MODO').Value:=modo;
    ParamByName('COD').Value:=cod;
    ParamByName('FIL').Value:=fil;
    ParamByName('SUPER').Value:=super;
    ParamByName('DESCRICAO').Value:=desc;
    ExecProc;
  end;
end;

function TDMTab.posicionarBens(emp: Integer; bem: String): Boolean;
begin
  with psqBens do
  begin
    Close;
    Params[0].Value:=emp;
    Params[1].Value:=bem;
    Open;
    Result := not EOF;
  end;
end;

end.

