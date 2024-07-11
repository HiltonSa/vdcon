unit datasiacon;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, IniFiles, Forms;

type

  { TdmScn }

  TdmScn = class(TDataModule)
    ageATIVO: TLongintField;
    ageCDEXTERNO: TStringField;
    ageCELULAR: TStringField;
    ageCODIGO: TLongintField;
    ageCPF: TStringField;
    ageDDD: TStringField;
    ageEQUIPE: TLongintField;
    ageNOME: TStringField;
    ageSUPERVISAO: TLongintField;
    movADMINIST: TFloatField;
    movCONTRATO: TStringField;
    movNOME: TStringField;
    movTIPO_MOV: TStringField;
    parCDPER: TLongintField;
    parCONTRATO: TLongintField;
    parDCPER: TStringField;
    parFIM: TDateTimeField;
    parINICIO: TDateTimeField;
    parPARCELA: TSmallintField;
    parSTATUS: TSmallintField;
    parVLDEV: TFloatField;
    ProCDBEM: TStringField;
    ProCGC_CPF: TStringField;
    ProCONTRATO: TLongintField;
    ProDCBEM: TStringField;
    ProDTVENDA: TDateTimeField;
    ProFIL: TStringField;
    ProNMVEN: TStringField;
    ProNOME: TStringField;
    ProREPRE: TStringField;
    ProSIT_REPR: TStringField;
    ProTELEFONE: TStringField;
    ProTP_REPRE: TStringField;
    ProVLBEM: TFloatField;
    siaBEM: TStringField;
    siaCGC_CPF: TStringField;
    Siacon: TZConnection;
    Pro: TZQuery;
    age: TZQuery;
    par: TZQuery;
    mov: TZQuery;
    sia: TZReadOnlyQuery;
    siaCONTRATO: TStringField;
    siaCOTA: TStringField;
    siaDT_VENDA: TDateTimeField;
    siaGRUPO: TStringField;
    siaLIN_MOD: TStringField;
    siaNOME: TStringField;
    siaPESS_F_J: TStringField;
    siaREPRES: TStringField;
    siaSEQ: TStringField;
    siaTELEFONE: TStringField;
    siaVAL_PARC: TFloatField;
    siaVAL_VEND: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ProAfterScroll(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
    function abrirSiacon: Boolean;
    procedure importarVendas;
    function incluirAgente(cod: Integer): Boolean;
    procedure incluirVendaSiacon;
    function importarVendaSiacon(contrato: Integer): Boolean;
    function abrirParcelas(contrato:Integer): Boolean;
    function abrirVendasProprias(dti: Tdate):Boolean;
    procedure incluirVendasProprias(dti: Tdate);
    function abrirPagSiacon(grupo, seq, cota: String; var pcl: Integer; var txadm: Double): Boolean;

  end;

var
  dmScn: TdmScn;

implementation

uses datavendas, datatabelas, vdcon.controller.util, dataprincipal;

{$R *.lfm}

{ TdmScn }


procedure TdmScn.DataModuleCreate(Sender: TObject);
var
  arqIni: TIniFile;
  arqNome, dbname, usrname, pass: string;
begin
  arqNome := ExtractFilePath(Application.ExeName)+'VdCon.ini';
  if FileExists(arqNome) { *Converted from FileExists* } then begin
    arqIni := TIniFile.Create(arqNome);
    try
       dbname := arqIni.ReadString('Siacon','DbSiacon','');
       usrname:=arqIni.ReadString('Siacon','UsSiacon','');
       pass:=arqIni.ReadString('Siacon','PwSiacon','');
    finally
      arqIni.Free;
    end;

    if dbname <> '' then begin
      try
         Siacon.Connected := False;
         Siacon.Database := dbname;
         Siacon.User:=usrname;
         Siacon.Password:=pass;
         Siacon.Connect;
      except
            MostraAviso('Sem conexão com o banco de dados Siacon!');
      end;
    end;
  end
  else begin
      MostraAviso('Configurador SIACON não encontrado!');
  end;

end;

procedure TdmScn.ProAfterScroll(DataSet: TDataSet);
begin
  abrirParcelas(ProCONTRATO.Value);
end;

function TdmScn.abrirSiacon: Boolean;
var
  stSql: String;
begin
  stSql:=Format('select c.contrato, c.dtvenda, c.nome, c.cdbem, c.dcbem,c.vlbem, '+
            'c.fil,c.repre,r.nome nmven, r.tp_repre, r.cgc_cpf, r.telefone, '+
            'r.sit_repr  from cmpro c '+
            'inner join acrep r on r.repres=c.repre '+
            'where c.dtvenda >= %s',[QuotedStr('01-dec-2016')]);
  with Pro do begin
    Close;
    SQL.Clear;
    SQL.Add(stSql);
    Open;
    Result:=not EOF;
  end;
end;

procedure TdmScn.importarVendas;
var
  linhas: TStringList;
begin
  try
     linhas := TStringList.Create;
     abrirSiacon;
     while not Pro.EOF do begin
       linhas.Add(Format('Contrato: %d Nome: %s',[ProCONTRATO.Value,ProNOME.Value]));
       incluirVendaSiacon;
       Pro.Next;
     end;
     MostraAviso('Fim de importação!');
  finally
    linhas.SaveToFile('imp.txt');
    linhas.Free;
  end;
  incluirVendasProprias(StrToDate('01/01/2017'));
end;

function TdmScn.incluirAgente(cod: Integer): Boolean;
begin
  with age do
  begin
    Close;
    ParamByName('cod').Value:=cod;
    Open;
    Result:= EOF;
  end;
end;

procedure TdmScn.incluirVendaSiacon;
var
  emp, ativo: Integer;
  pago: Double;
  ddd, fone: String;
begin
  if ProSIT_REPR.AsString='ATIVO'
  then ativo := 1
  else ativo := 0;
  getDDDFone(ddd,fone,ProTELEFONE.Value);
  if incluirAgente(ProREPRE.AsInteger)
  then DMTab.manterAgente(0,
                            ProREPRE.AsInteger,
                            ProFIL.AsInteger, 1,
                            ativo,
                            ProNMVEN.Value,
                            Copy(ProCGC_CPF.Value, 2, 9)+
                            Copy(ProCGC_CPF.Value, 15, 2),
                            ddd, fone,
                            ProREPRE.Value);
  if ProCONTRATO.Value>8000000
  then emp:=3
  else begin
    if Pos('CNF', ProCDBEM.Value)>0
    then emp:=5
    else if Pos('FIT', ProCDBEM.Value)>0
    then emp:=2
    else if Pos('FORD', ProCDBEM.Value)>0
    then emp:=5
    else if Pos('1111', ProCDBEM.Value)>0
    then emp:=5
    else if Pos('HOND', ProCDBEM.Value)>0
    then emp:=2
    else if Pos('FIAT', ProCDBEM.Value)>0
    then emp:=2
    else if Pos('KCC8', ProCDBEM.Value)>0
    then emp:=5
    else if Pos('BCD6', ProCDBEM.Value)>0
    then emp:=5
    else if Pos('RCJ7', ProCDBEM.Value)>0
    then emp:=5
    else emp:=0;
  end;

  DMVendas.manterVendas(0, 0, emp,
                                ProREPRE.AsInteger, 0, 1, 0, 0, 20,
                                ProCONTRATO.AsString,
                                ProCDBEM.AsString,
                                ProDCBEM.Value,
                                ProNOME.Value, '', '', '', '',
                                ProDTVENDA.AsDateTime, 0.0,
                                ProVLBEM.Value, 0);
  par.First;
  while not par.EOF do begin
    pago:=0;
    if parSTATUS.Value=1
    then pago := parVLDEV.Value;
    if DMVendas.acharParcela(emp,parCONTRATO.AsString,parPARCELA.Value)
    then DMVendas.manterParcelas(1,
                                   DMVendas.parVENDA.Value,
                                   DMVendas.parPARCELA.Value,
                                   DMVendas.parPERIODO.Value,
                                   DMVendas.parDTVENC.Value,
                                   DMVendas.parDTREC.Value,
                                   DMVendas.parRECEBER.Value,
                                   DMVendas.parRECEBIDO.Value,
                                   parVLDEV.Value,
                                   pago);
    par.Next;
  end;
end;

function TdmScn.importarVendaSiacon(contrato: Integer): Boolean;
var
  stSql: String;
begin
  stSql:=Format('select c.contrato, c.dtvenda, c.nome, c.cdbem, c.dcbem,c.vlbem, '+
            'c.fil,c.repre,r.nome nmven, r.tp_repre, r.cgc_cpf, r.telefone, '+
            'r.sit_repr  from cmpro c '+
            'inner join acrep r on r.repres=c.repre '+
            'where c.contrato = %d',[contrato]);
  with Pro do begin
    Close;
    SQL.Clear;
    SQL.Add(stSql);
    Open;
    Result:=not EOF;
  end;
end;

function TdmScn.abrirParcelas(contrato: Integer): Boolean;
begin
  with par do
  begin
    Close;
    ParamByName('c').Value:=contrato;
    Open;
    Result:=not EOF;
  end;
end;

function TdmScn.abrirVendasProprias(dti: Tdate): Boolean;
begin
  with sia do
  begin
    Close;
    ParamByName('DTI').Value:=dti;
    Open;
    Result:= not EOF;
  end;
end;

procedure TdmScn.incluirVendasProprias(dti: Tdate);
var
  sit, pes, pcl: Integer;
  cpfcgc, ddd, fone, contrato: String;
  pago: Double;
  dtrec: TDate;
  jaImportado: Boolean;
begin

  sia.First;

  while not sia.EOF do begin

    contrato:=IntToStr(siaCONTRATO.AsInteger);

    jaImportado:=DMPrincipal.executarSQL(Format(
          'select * from VENDAS where CONTRATO=%s',[QuotedStr(contrato)]));

    sit:=0;
    if siaSEQ.AsInteger=0
    then sit:=1
    else if siaSEQ.AsInteger <= 49
    then sit:=4;

    getDDDFone(ddd,fone,siaTELEFONE.Value);
    cpfcgc:=getCpfcnpjSiacon(siaPESS_F_J.Value,siaCGC_CPF.Value);
    if siaPESS_F_J.Value='F'
    then pes:=0
    else pes:=1;

    if not jaImportado then begin
      DMVendas.manterVendas(0,0,1,
                                siaREPRES.AsInteger,0,
                                sit,pes,
                                siaCOTA.AsInteger,20,
                                contrato,
                                siaBEM.Value,
                                siaLIN_MOD.Value,
                                siaNOME.Value,
                                ddd, fone,
                                cpfcgc,
                                siaGRUPO.Value,
                                siaDT_VENDA.Value,0,
                                siaVAL_VEND.Value,
                                siaVAL_PARC.Value);

      abrirParcelas(siaCONTRATO.AsInteger);

      while not par.EOF do begin
        if DMVendas.acharParcela(1,parCONTRATO.AsString,parPARCELA.Value)
        then begin
          pago:=0;
          dtrec:=DMVendas.parDTREC.Value;
          if parSTATUS.Value=1
          then begin
            pago := parVLDEV.Value;
            dtrec:=DMVendas.parDTVENC.Value;
          end;
          DMVendas.manterParcelas(1,
                                     DMVendas.parVENDA.Value,
                                     DMVendas.parPARCELA.Value,
                                     parCDPER.Value,
                                     DMVendas.parDTVENC.Value,
                                     dtrec,
                                     0.0,
                                     pago,
                                     parVLDEV.Value,
                                     pago);
          if not DMPrincipal.executarSQL(Format(
          'select * from PERIODO where CODIGO=%D',[parCDPER.Value]))
          then begin
            with DMPrincipal.sp do begin
              Close;
              StoredProcName:='MANTER_PERIODO';
              ParamByName('MODO').Value:=0;
              ParamByName('COD').Value:=parCDPER.Value;
              ParamByName('DESCRICAO').Value:=parDCPER.Value;
              ParamByName('INICIO').Value:=parINICIO.Value;
              ParamByName('FIM').Value:=parFIM.Value;
              ParamByName('CALCULO').Value:=parFIM.Value;
              ExecProc;
            end;
          end;

        end;
        par.Next;
      end;

    end
    else DMVendas.manterVendas(1,DMPrincipal.qry.FieldByName('CODIGO').AsInteger,1,
                                  siaREPRES.AsInteger,0,
                                  sit,pes,
                                  siaCOTA.AsInteger,20,
                                  contrato,
                                  siaBEM.Value,
                                  siaLIN_MOD.Value,
                                  siaNOME.Value,
                                  ddd, fone,
                                  cpfcgc,
                                  siaGRUPO.Value,
                                  siaDT_VENDA.Value,0,
                                  siaVAL_VEND.Value,
                                  siaVAL_PARC.Value);

    sia.Next;

  end;

  DMVendas.seg.Open;

  // baixa de segundas parcelas

  while not DMVendas.seg.EOF do begin
    pcl:=0;
    pago:=0;
    if abrirPagSiacon(DMVendas.segGRUPO.Value,'00',
       Format('%.3d',[DMVendas.segCOTA.Value]), pcl,pago) then begin
      if (movCONTRATO.AsInteger = DMVendas.segCONTRATO.AsInteger) and
         (movNOME.Value = DMVendas.segNOME.Value)
      then DMVendas.manterParcelas(1,DMVendas.segVENDA.Value,
                                  DMVendas.segPARCELA.Value,
                                  DMVendas.segPERIODO.Value,
                                  DMVendas.segDTVENC.Value,dti,
                                  DMVendas.segRECEBER.Value, pago,
                                  DMVendas.segPAGAR.Value,DMVendas.segPAGO.Value);
    end;
    DMVendas.seg.Next;
  end;

end;

function TdmScn.abrirPagSiacon(grupo, seq, cota: String; var pcl: Integer;
  var txadm: Double): Boolean;
begin
  pcl:=0;
  txadm:=0;
  with mov do  begin
    Close;
    ParamByName('g').Value:=grupo;
    ParamByName('s').Value:=seq;
    ParamByName('c').Value:=cota;
    Open;
    if EOF
    then Result := False
    else begin
      while not EOF do begin
        if Pos(movTIPO_MOV.Value,'01,05,09,11,08') > 0
        then pcl:=pcl+1;
        if Pos(movTIPO_MOV.Value,'A1,A5,A9,B1,A8') > 0
        then pcl:=pcl-1;
        txadm:=txadm+movADMINIST.Value;
        Next;
      end;
      Result:=True;
    end;
  end;
end;

end.

