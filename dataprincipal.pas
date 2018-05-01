unit dataprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ExtDlgs, Controls, Dialogs, Menus,Forms,
  RLPDFFilter, RLXLSFilter, RLXLSXFilter, RLPreviewForm, ZConnection, ZDataset,
  ZStoredProcedure, IniFiles, ActnList, formlogin, windows, dateutils;

type

  { TDMPrincipal }

  TDMPrincipal = class(TDataModule)
    AbrirFig: TOpenPictureDialog;
    calc: TCalculatorDialog;
    cdsEmpACERTO: TLongintField;
    cdsEmpCNPJ: TStringField;
    cdsEmpCODIGO: TLongintField;
    cdsEmpMESPER: TLongintField;
    cdsEmpNOMEFANTASIA: TStringField;
    cdsEmpPCENTREGA: TFloatField;
    cdsEmpPCPER: TFloatField;
    cdsEmpRAZAOSOCIAL: TStringField;
    cdsEmpULTFAIXA: TLongintField;
    cdsEmpUNIDADE: TLongintField;
    cdsEmpVIGENCIA: TDateField;
    cdsItGruDCFORM: TStringField;
    cdsItGruDESCRICAO: TStringField;
    cdsItGruFORMULARIO: TStringField;
    cdsItGruGRUSU: TLongintField;
    cdsItGruPRIVIL: TLongintField;
    cdsItGruROTINA: TLongintField;
    cdsPesqUsuATIVO: TLongintField;
    cdsPesqUsuCODIGO: TLongintField;
    cdsPesqUsuFILIAL: TLongintField;
    cdsPesqUsuGRUSU: TLongintField;
    cdsPesqUsuIMAGEM: TStringField;
    cdsPesqUsuSENHA: TStringField;
    cdsPesqUsuUSUARIO: TStringField;
    cdsPsqGrUsuCODIGO: TLongintField;
    cdsPsqGrUsuDESCRICAO: TStringField;
    cdsRotACAO: TLongintField;
    cdsRotCODIGO: TLongintField;
    cdsRotDESCRICAO: TStringField;
    cdsRotFORMULARIO: TStringField;
    cdsUsuATIVO: TLongintField;
    cdsUsuCODIGO: TLongintField;
    cdsUsuFILIAL: TLongintField;
    cdsUsuGRUSU: TLongintField;
    cdsUsuIMAGEM: TStringField;
    cdsUsuSENHA: TStringField;
    cdsUsuUSUARIO: TStringField;
    IL: TImageList;
    AbreArq: TOpenDialog;
    PDFFlt: TRLPDFFilter;
    PrvwStp: TRLPreviewSetup;
    psqEmpACERTO: TLongintField;
    psqEmpCNPJ: TStringField;
    psqEmpCODIGO: TLongintField;
    psqEmpMESPER: TLongintField;
    psqEmpNOMEFANTASIA: TStringField;
    psqEmpPCENTREGA: TFloatField;
    psqEmpPCPER: TFloatField;
    psqEmpRAZAOSOCIAL: TStringField;
    psqEmpULTFAIXA: TLongintField;
    psqEmpUNIDADE: TLongintField;
    psqEmpVIGENCIA: TDateField;
    psqFaixaCODIGO: TLongintField;
    psqFaixaDESCRICAO: TStringField;
    psqFaixaEMPRESA: TLongintField;
    psqFaixaMAXIMO: TFloatField;
    psqFaixaMINIMO: TFloatField;
    psqRegraEMPRESA: TLongintField;
    psqRegraFAIXA: TLongintField;
    psqRegraPARCELA: TLongintField;
    psqRegraPCLIB: TLongintField;
    psqRegraPERCENTUAL: TFloatField;
    qryFrmCODIGO: TLongintField;
    qryFrmDESCRICAO: TStringField;
    qryFrmFORMULARIO: TStringField;
    qryRotACAO: TLongintField;
    qryRotPRIVIL: TLongintField;
    XLSXFlt: TRLXLSXFilter;
    XLSFlt: TRLXLSFilter;
    zCon: TZConnection;
    sqlCom: TZQuery;
    sp: TZStoredProc;
    qry: TZQuery;
    cdsRot: TZQuery;
    qryRot: TZQuery;
    cdsEmp: TZQuery;
    cdsUsu: TZQuery;
    cdsItGru: TZQuery;
    cdsPesqUsu: TZQuery;
    cdsPsqGrUsu: TZQuery;
    qryFrm: TZQuery;
    psqEmp: TZQuery;
    psqRegra: TZQuery;
    psqFaixa: TZQuery;
    procedure cdsItGruPRIVILGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure cdsPesqUsuAfterScroll(DataSet: TDataSet);
    procedure cdsPesqUsuATIVOGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure cdsUsuATIVOGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    UsuCod: integer;
    UsuNom: string;
    UsuFig: string;
    UsuEmp: string;
    UsuFil: String;
    UsuGru: Integer;
    Filial: Integer;
    PerCod: Integer;
    PerNom: String;
    Protocolo: String;
    ImpNom: String;
    procedure executarComando(strSQL: String);
    function executarSQL(strSQL: String): Boolean;
    procedure AplicarRestricoes(Frm: TForm);
    procedure VerificarRotinas(Frm: TForm);
    procedure IncluirRotinas(modo,GrUsu: Integer);
    function CriaForm(frmClass: TFormClass; out Obj): TModalResult;
    procedure CriaFormFilho(frmClass: TFormClass; out Obj);
    procedure SetUsu;
    procedure SetComp;
    procedure SetPeriodo;
    procedure incluirFormulario(nome, descricao: String);
    procedure manterRotina(modo,cod:integer; descricao, formulario: String; acao:Integer);
    function NomeComputadorExiste(nome: String): Integer;
    function NomeComputadorAtual: String;
    function PosicionarDataset(Cds: TZQuery; Cod: Integer): Boolean;
    function AbrirPesquisa(cds: TZQuery; stSql: string): Boolean;
    function LogarUsuario: Boolean;
    function ValidarUsuario(Nome, Senha: string): Boolean;
    function SenhaCorreta(Senha: string): Boolean;
    procedure GravarImagem;
    procedure MostrarCalc;
    procedure AlterarSenha(Senha: string);
    function RetornarFilal: String;
    function RetornarEmpresa: String;
    function PosicionarItGru(GrUsu: Integer; Frm: string): Boolean;
    procedure manterGrUsu(modo, grusu: Integer; descricao: String);
    procedure manterUsuario(modo, cod, grusu, ativo, fil: Integer; usuario,senha, img: String);
    procedure manterEmpresa(modo, cod, unidade, mesper, acerto, ultfaixa: Integer; fantasia, razao, cnpj: String; entrega, pcper: Double; vigencia: TDate);
    procedure posicionarRegras(emp, fai: Integer);
    procedure posicionarFaixas(emp: Integer);
    function regraExiste(emp, par, fai: Integer): Boolean;
    procedure manterRegras(modo, emp, pcl, lib, fai: Integer; perc: Double);
    procedure manterFaixas(modo, cod, emp: Integer; desc: String; min, max: Double);
    function Autorizar: Boolean;
    function temSiacon: Boolean;
    function retornarPeriodoInicioAno: Integer;
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

uses formautor, datasiacon;

{$R *.lfm}

{ TDMPrincipal }

procedure TDMPrincipal.DataModuleCreate(Sender: TObject);
var
  arqIni: TIniFile;
  arqNome: string;
begin
  arqNome := ExtractFilePath(Application.ExeName)+'VdCon.ini';
  if FileExists(arqNome) { *Converted from FileExists* } then begin
    zCon.Connected := False;
    arqIni := TIniFile.Create(arqNome);
    try
       ZCon.HostName := arqIni.ReadString('IBX','Servidor','');
       ZCon.Database := arqIni.ReadString('IBX','BD','');
       zCon.Port := arqIni.ReadInteger('IBX','Porta',0);
       zCon.Protocol:=arqIni.ReadString('IBX','Protocolo','');
       zCon.User:=arqIni.ReadString('IBX','Resu','');
       zCon.Password:=arqIni.ReadString('IBX','Ssap','');
       Filial := arqIni.ReadInteger('IBX','Filial',0);
    finally
      arqIni.Free;
    end;

    try
       ZCon.Connect;
    except
         ShowMessage('Sem conexão com o banco de dados!');
         Application.Terminate;
    end;
    Protocolo:=zCon.Protocol;
    cdsEmp.Open;
  end
  else begin
      ShowMessage('Configurador não encontrado!');
      Application.Terminate;
  end;

end;

procedure TDMPrincipal.cdsUsuATIVOGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if (Sender as TLongintField).Value = 0
  then aText := 'Inativo'
  else aText := 'Ativo';
end;

procedure TDMPrincipal.cdsItGruPRIVILGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if (Sender as TLongintField).Value = 0
  then aText := 'Não'
  else aText := 'Sim';
end;

procedure TDMPrincipal.cdsPesqUsuAfterScroll(DataSet: TDataSet);
begin
  PosicionarDataset(cdsUsu,cdsPesqUsuCODIGO.Value);
end;

procedure TDMPrincipal.cdsPesqUsuATIVOGetText(Sender: TField;
  var aText: string; DisplayText: Boolean);
begin
  if (Sender as TLongintField).Value = 0
  then aText := 'Inativo'
  else aText := 'Ativo';
end;

procedure TDMPrincipal.executarComando(strSQL: String);
begin
  with sqlCom do begin
    Close;
    SQL.Clear;
    SQL.Add(strSQL);
    ExecSQL;
  end;
end;

function TDMPrincipal.executarSQL(strSQL: String): Boolean;
begin
  with qry do begin
    Close;
    SQL.Clear;
    SQL.Add(strSql);
    Open;
    Result := not Eof;
  end;
end;

procedure TDMPrincipal.AplicarRestricoes(Frm: TForm);
var
   I: Integer;
begin
  with qryRot do begin
    Close;
    Params[0].Value := UsuGru;
    Params[1].Value := Frm.Name;
    Open;
  end;
  for I := 0 to Frm.ComponentCount - 1 do
    if (Frm.Components[I] is TActionList) then begin
      while not qryRot.eof do begin
        try
           TAction(TActionList(Frm.Components[I]).Actions[qryRotACAO.Value]).Visible
                              := (qryRotPRIVIL.Value = 1);
           TAction(TActionList(Frm.Components[I]).Actions[qryRotACAO.Value]).Enabled
                              := (qryRotPRIVIL.Value = 1);
        except

        end;
        qryRot.Next;
      end;
    end;
end;

procedure TDMPrincipal.VerificarRotinas(Frm: TForm);
var
  Ac, I: Integer;
  TemRot: Boolean;
  stAcao: String;

begin

  if not (executarSQL('select * from ZZ_FORMULARIOS where FORMULARIO='+
                                     QuotedStr(Frm.Name)))
  then incluirFormulario(Frm.Name,Frm.Caption);

  for I := 0 to Frm.ComponentCount - 1 do begin
    if (Frm.Components[I] is TActionList) then begin
      for Ac:=0 to TActionList(Frm.Components[I]).ActionCount-1 do begin
        stAcao := TAction(TActionList(Frm.Components[I]).Actions[ac]).Hint;
        if AbrirPesquisa(cdsRot, Format(
            'select * from ZZ_ROTINAS where ACAO=%d and FORMULARIO=%s',
             [ac, QuotedStr(Frm.Name)])) then begin       // existe rotina
          if stAcao=''           // se nÃ£o tem hint apaga a rotina acesso garantido a todos
          then manterRotina(2, cdsRotCODIGO.Value,stAcao,Frm.Name, ac)
          else begin
            if cdsRotDESCRICAO.Value <> stAcao then begin
              manterRotina(1, cdsRotCODIGO.Value, stAcao, Frm.Name, ac);
              cdsRot.Refresh;
            end;
          end;
        end
        else begin  // nÃ£o existe a rotina
          if stAcao<>''
          then begin          // acao informada, entao incluir
            manterRotina(0,0,stAcao,Frm.Name,ac);
            cdsRot.Refresh;
          end;
        end;
      end;
    end;
  end;

end;

procedure TDMPrincipal.IncluirRotinas(modo,GrUsu: Integer);
begin
  with sp do begin
    Close;
    StoredProcName:='ATUALIZAR_ITGRU';
    ParamByName('GRUSU').Value:=GrUsu;
    ParamByName('MODO').Value:=modo;
    ExecProc;
  end;
  cdsItGru.Open;
end;

function TDMPrincipal.CriaForm(frmClass: TFormClass; out Obj): TModalResult;
begin
  try
     TForm(Obj) := frmClass.Create(Self);
     VerificarRotinas(TForm(Obj));
     AplicarRestricoes(TForm(Obj));
     Result := TForm(Obj).ShowModal;
  finally
         FreeAndNil(Obj);
  end;
end;

procedure TDMPrincipal.CriaFormFilho(frmClass: TFormClass; out Obj);
begin
  try
     TForm(Obj) := frmClass.Create(Self);
     VerificarRotinas(TForm(Obj));
     AplicarRestricoes(TForm(Obj));
     TForm(Obj).Show;

  finally
    FreeAndNil(Obj);
  end;
end;

procedure TDMPrincipal.SetUsu;
begin
  UsuCod := cdsUsuCODIGO.Value;
  UsuNom := cdsUsuUSUARIO.Value;
  UsuFig := cdsUsuIMAGEM.Value;
  UsuGru := cdsUsuGRUSU.Value;
  Filial := cdsUsuFILIAL.Value;
  ImpNom := NomeComputadorAtual;
  UsuEmp := Trim(RetornarEmpresa);
  UsuFil := Trim(RetornarFilal);
  SetComp;
  SetPeriodo;
end;

procedure TDMPrincipal.SetComp;
begin
  //ImpNom:=NomeComputadorAtual;
  // if PosicionarDataset(qryComp, NomeComputadorExiste(ImpNom)) then begin
  //   if qryCompOPERACAIXA.Value=1
  //   then ImpPor:=qryCompPORTA.Value
  //   else ImpPor:='';
  // end
  // else begin
  //   qryComp.Append;
  //   qryCompCODIGO.Value:=ProximoCodigo('COMPUTADORES');
  //   qryCompNOME.Value:=ImpNom;
  //   qryCompOPERACAIXA.Value:=0;
  //   qryCompPORTA.Value:='';
  //   qryComp.Post;
  //   qryComp.ApplyUpdates;
  //   ImpPor:='';
  // end;
end;

procedure TDMPrincipal.SetPeriodo;
begin
  with sp do begin
    Close;
    StoredProcName:='PERIODO_ATUAL';
    ExecProc;
    PerCod:=ParamByName('CDPER').AsInteger;
    PerNom:=ParamByName('DCPER').AsString;
  end;
end;

procedure TDMPrincipal.incluirFormulario(nome, descricao: String);
begin
  with sp do begin
    Close;
    StoredProcName:='INCLUIR_FORMULARIOS';
    ParamByName('FORMULARIO').Value:=nome;
    ParamByName('DESCRICAO').Value:=descricao;
    ExecProc;
  end;
end;

procedure TDMPrincipal.manterRotina(modo, cod: integer; descricao,
  formulario: String; acao: Integer);
begin
  with sp do begin
    Close;
    StoredProcName:='INCLUIR_ROTINAS';
    ParamByName('FORMULARIO').Value:=formulario;
    ParamByName('DESCRICAO').Value:=descricao;
    ParamByName('COD').Value:=cod;
    ParamByName('ACAO').Value:=acao;
    ParamByName('MODO').Value:=modo;
    ExecProc;
  end;
end;

function TDMPrincipal.NomeComputadorExiste(nome: String): Integer;
begin
  if AbrirPesquisa(sqlCom,
    Format('select codigo from COMPUTADORES where nome  = %s',[QuotedStr(nome)]))
  then Result := sqlCom.FieldByName('codigo').AsInteger
  else Result := 0;
end;

function TDMPrincipal.NomeComputadorAtual: String;
var
  ipbuffer : string;
  nsize : dword;
begin
  nsize:=255;
  SetLength(ipbuffer,nsize);
  if GetComputerName(PChar(ipbuffer),nsize)
  then Result := Trim(PChar(ipbuffer))
  else Result :='Não Determinado!';

end;

function TDMPrincipal.PosicionarDataset(Cds: TZQuery;
  Cod: Integer): Boolean;
begin
  with Cds do begin
    Close;
    Params[0].Value := Cod;
    Open;
    Result := not Eof;
  end;
end;

function TDMPrincipal.AbrirPesquisa(cds: TZQuery; stSql: string): Boolean;
begin
  with cds do begin
    Close;
    SQL.Clear;
    SQL.Add(stSql);
    Open;
    Result := not Eof;
  end;
end;

function TDMPrincipal.LogarUsuario: Boolean;
begin
  FrmLogin := TFrmLogin.Create(nil);
  try
     Result := FrmLogin.ShowModal=mrOk;
  finally
    FrmLogin.Free;
  end;
end;

function TDMPrincipal.ValidarUsuario(Nome, Senha: string): Boolean;
begin
  if AbrirPesquisa(cdsPesqUsu,'select * from ZZ_USUARIOS where USUARIO='+
               QuotedStr(Nome))
  then begin
    if cdsPesqUsuATIVO.Value=1 then begin
      SetUsu;
      Result := SenhaCorreta(Senha);
    end else Result := False;
  end
  else Result := False;
end;

function TDMPrincipal.SenhaCorreta(Senha: string): Boolean;
begin
  if PosicionarDataset(cdsUsu,UsuCod)
  then Result := (cdsUsuSENHA.Value = Senha)
  else Result := False;
end;

procedure TDMPrincipal.GravarImagem;
begin
  if PosicionarDataset(cdsUsu,UsuCod) then begin
    cdsUsu.Edit;
    cdsUsuIMAGEM.Value := UsuFig;
    cdsUsu.Post;
    cdsUsu.ApplyUpdates;
  end;
end;

procedure TDMPrincipal.MostrarCalc;
begin
  calc.Execute;
end;

procedure TDMPrincipal.AlterarSenha(Senha: string);
begin
  manterUsuario(1, UsuCod, 0, 1, 0, '', Senha, '');
end;

function TDMPrincipal.RetornarFilal: String;
begin
  if Filial = 0
  then Result := 'Todas'
  else begin
    if executarSQL('select descricao from FILIAIS where CODIGO ='+IntToStr(Filial))
    then Result := qry.FieldByName('DESCRICAO').AsString
    else Result := 'Não encontrado!';
  end;
end;

function TDMPrincipal.RetornarEmpresa: String;
begin
  if executarSQL('select RAZAOSOCIAL from EMPRESA where CODIGO =1')
  then Result := qry.FieldByName('RAZAOSOCIAL').AsString
  else Result := 'Não encontrado!';
end;

function TDMPrincipal.PosicionarItGru(GrUsu: Integer; Frm: string): Boolean;
begin
  with cdsItGru do begin
    Close;
    Params[0].Value := GrUsu;
    Params[1].Value := Frm;
    Open;
    Result := not Eof;
  end;
end;

procedure TDMPrincipal.manterGrUsu(modo, grusu: Integer; descricao: String);
begin
  with sp do begin
    Close;
    StoredProcName:='MANTER_GRUSU';
    ParamByName('MODO').Value:=modo;
    ParamByName('COD').Value:=grusu;
    ParamByName('DESCRICAO').Value:=descricao;
    ExecProc;
  end;
end;

procedure TDMPrincipal.manterUsuario(modo, cod, grusu, ativo, fil: Integer;
  usuario, senha, img: String);
begin
  with sp do begin
    Close;
    StoredProcName:='MANTER_USUARIOS';
    ParamByName('MODO').Value:=modo;
    ParamByName('COD').Value:=cod;
    ParamByName('USUARIO').Value:=usuario;
    ParamByName('SENHA').Value:=senha;
    ParamByName('GRUSU').Value:=grusu;
    ParamByName('IMAGEM').Value:=img;
    ParamByName('ATIVO').Value:=ativo;
    ParamByName('FILIAL').Value:=fil;
    ExecProc;
  end;
end;

procedure TDMPrincipal.manterEmpresa(modo, cod, unidade, mesper, acerto,
  ultfaixa: Integer; fantasia, razao, cnpj: String; entrega, pcper: Double;
  vigencia: TDate);
begin
  with sp do begin
    Close;
    StoredProcName:='MANTER_EMPRESA';
    ParamByName('MODO').Value:=modo;
    ParamByName('CODIGO').Value:=cod;
    ParamByName('UNIDADE').Value:=unidade;
    ParamByName('MESPER').Value:=mesper;
    ParamByName('FANTASIA').Value:=fantasia;
    ParamByName('RAZAO').Value:=razao;
    ParamByName('CNPJ').Value:=cnpj;
    ParamByName('ENTREGA').Value:=entrega;
    ParamByName('PCPER').Value:=pcper;
    ParamByName('VIGENCIA').Value:=vigencia;
    ParamByName('ACERTO').Value:=acerto;
    ParamByName('ULTFAIXA').Value:=ultfaixa;
    ExecProc;
  end;
end;

procedure TDMPrincipal.posicionarRegras(emp, fai: Integer);
begin
  with psqRegra do
  begin
    Close;
    Params[0].Value:=emp;
    Params[1].Value:=fai;
    Open;
  end;
end;

procedure TDMPrincipal.posicionarFaixas(emp: Integer);
begin
  with psqFaixa do begin
    Close;
    Params[0].Value:=emp;
    Open;
  end;
end;

function TDMPrincipal.regraExiste(emp, par, fai: Integer): Boolean;
var
  strSql: String;
begin
  strSql:=Format(
     'select * from REGRAS where EMPRESA = %d and PARCELA = %d and FAIXA = %d ',
                    [emp,par,fai]);
  Result := executarSQL(strSql);
end;

procedure TDMPrincipal.manterRegras(modo, emp, pcl, lib, fai: Integer;
  perc: Double);
begin
  with sp do begin
    Close;
    StoredProcName:='MANTER_REGRAS';
    ParamByName('MODO').Value:=modo;
    ParamByName('EMP').Value:=emp;
    ParamByName('PCL').Value:=pcl;
    ParamByName('LIB').Value:=lib;
    ParamByName('FAI').Value:=fai;
    ParamByName('PERC').Value:=perc;
    ExecProc;
  end;
end;

procedure TDMPrincipal.manterFaixas(modo, cod, emp: Integer; desc: String; min,
  max: Double);
begin
  with sp do begin
    Close;
    StoredProcName:='MANTER_FAIXAS';
    ParamByName('MODO').Value:=modo;
    ParamByName('EMPRESA').Value:=emp;
    ParamByName('CODIGO').Value:=cod;
    ParamByName('DESCRICAO').Value:=desc;
    ParamByName('MAXIMO').Value:=max;
    ParamByName('MINIMO').Value:=min;
    ExecProc;
  end;
end;

function TDMPrincipal.Autorizar: Boolean;
begin

  FrmAutor := TFrmAutor.Create(nil);
  try
     Result := (FrmAutor.ShowModal = mrOk);
  finally
    FrmAutor.Free;
  end;

end;

function TDMPrincipal.temSiacon: Boolean;
begin
  Result:=dmScn.Siacon.Connected;
end;

function TDMPrincipal.retornarPeriodoInicioAno: Integer;
var
  ano: Integer;
  dti,dtf: string;
begin
  ano:=YearOf(Now);
  dti:=Format('01-jan-%.4d',[ano]);
  dtf:=Format('31-jan-%.4d',[ano]);
  if executarSQL(Format(
     'select CODIGO from PERIODO where DTFIM between %s and %s',
     [QuotedStr(dti), QuotedStr(dtf)]))
  then Result:=qry.FieldByName('CODIGO').AsInteger
  else Result:=0;
end;


end.

