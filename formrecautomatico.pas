unit formrecautomatico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, LCLType,
  fpspreadsheet, fpstypes, fpsallformats ;

type

  { TFrmRecAutomatico }

  TFrmRecAutomatico = class(TForm)
    abrir: TAction;
    imp: TAction;
    AL: TActionList;
    lin: TBufDataset;
    cboEmp: TComboBox;
    ds: TDataSource;
    edArq: TEdit;
    Fechar: TAction;
    grPesq: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    linBem: TStringField;
    linComissao: TFloatField;
    linContrato: TStringField;
    linCota: TLongintField;
    linDtPag: TDateField;
    linGrupo: TStringField;
    linNome: TStringField;
    linobs: TStringField;
    linPcl: TLongintField;
    linValor: TFloatField;
    nvPesq: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure abrirExecute(Sender: TObject);
    procedure cboEmpEnter(Sender: TObject);
    procedure cboEmpSelect(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure impExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure importarPlanilha(tab: TsWorksheet);
    procedure baixarComissoes;
    procedure tratarParcela(var estorno: Boolean; incluir: Boolean);
    procedure gravarLin(msg: String;par:Integer);
  end;

var
  FrmRecAutomatico: TFrmRecAutomatico;
  empresa: Integer;

implementation

uses dataprincipal, util, datavendas, relbaixacomissao, datasiacon;

{$R *.lfm}

{ TFrmRecAutomatico }

procedure TFrmRecAutomatico.FormCreate(Sender: TObject);
begin
  empresa:=0;
  DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp,
          'select * from EMPRESA where CODIGO <> 1 order by NOMEFANTASIA');
  cboEmp.Clear;
  while not DMPrincipal.psqEmp.EOF do begin
    cboEmp.AddItem(Format('%-200s%.4d',[
                  DMPrincipal.psqEmpNOMEFANTASIA.Value,
                  DMPrincipal.psqEmpCODIGO.Value]),nil);
    DMPrincipal.psqEmp.Next;
  end;
  cboEmp.ItemIndex:=0;
end;

procedure TFrmRecAutomatico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   //VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmRecAutomatico.impExecute(Sender: TObject);
begin
  FrmRelBaixaComissao := TFrmRelBaixaComissao.Create(nil);
  try
     FrmRelBaixaComissao.lbEmpRel.Caption:=Trim(copy(cboEmp.Text,1,200));
     FrmRelBaixaComissao.RP.PreviewModal;
  finally
    FrmRelBaixaComissao.Free;
  end;
end;

procedure TFrmRecAutomatico.importarPlanilha(tab: TsWorksheet);
var
  dtpag: TDate;
  linha: Cardinal;
  ttlin, pcl: Integer;
  grc: String;
begin
  ttlin:=tab.GetLastRowIndex;
  linha:=0;

  while linha < ttlin do begin

    if tab.ReadAsText(linha,0)='PARC' then begin

      linha:=linha+1;
      pcl:=trunc(tab.ReadAsNumber(linha,0));

      while pcl=trunc(tab.ReadAsNumber(linha,0)) do begin
        lin.Append;
        linPcl.Value:=pcl;
        linDtPag.AsDateTime:=StrToDate(tab.ReadAsText(linha,1));
        linBem.Value:=tab.ReadAsText(linha,4);
        linContrato.Value:=tab.ReadAsText(linha,5);
        linNome.Value:=tab.ReadAsText(linha,6);
        grc := tab.ReadAsText(linha,7);
        linGrupo.Value:=Copy(grc,0,6);
        linCota.Value:=StrToInt(Copy(grc,10,4));
        linValor.Value:=tab.ReadAsNumber(linha,8);
        linComissao.Value:=tab.ReadAsNumber(linha,9);
        lin.Post;
        linha:=linha+1;
      end;
    end
    else linha:=linha+1;
  end;

end;

procedure TFrmRecAutomatico.baixarComissoes;
var
  estorno: Boolean;
  msg: String;
  par: Integer;
begin
   estorno:=False;
   lin.First;
   while not lin.EOF do begin

     msg:='';
     estorno:=(linComissao.Value < 0);

     if estorno
     then par:=99
     else par:=linPcl.Value;

     if DMVendas.acharParcela(empresa,linContrato.Value,linPcl.Value)
     then tratarParcela(estorno, False)
     else begin

       if DMVendas.obterVenda(0,linContrato.Value)
       then tratarParcela(estorno, True)
       else begin
         if (DMPrincipal.temSiacon) and
            (dmScn.importarVendaSiacon(linContrato.AsInteger)) then begin
           dmScn.incluirVendaSiacon;
           msg:='Venda importada!';
           Continue;
         end
         else begin
           msg:='Parcela/Venda não encontrada!';
         end;
       end;
     end;

     if (msg<>'') or (par=99)
     then gravarLin(msg,par);

     if (linGrupo.Value <> DMVendas.parGRUPO.Value) or
        (linCota.Value <> DMVendas.parCOTA.Value) then begin
       if DMVendas.obterVenda(DMVendas.parVENDA.Value,'')
       then DMVendas.manterVendas(1,
                               DMVendas.venCod.Value,
                               DMVendas.venEmp.Value,
                               DMVendas.venAgente.Value,
                               DMVendas.venPer.Value,
                               DMVendas.venSit.Value,
                               DMVendas.venTpPes.Value,
                               linCota.Value,
                               DMVendas.venDiaVen.Value,
                               DMVendas.venCtrato.Value,
                               DMVendas.venCdBen.Value,
                               DMVendas.venDcBem.Value,
                               DMVendas.venNome.Value,
                               DMVendas.venDDD.Value,
                               DMVendas.venFone.Value,
                               DMVendas.venCpfCnpj.Value,
                               linGrupo.Value,
                               DMVendas.venVenda.Value,
                               DMVendas.venDtCon.Value,
                               DMVendas.venValor.Value,
                               DMVendas.venVlrPago.Value);
     end;
     lin.Next;
   end;
   imp.Enabled:=True;
   lin.IndexFieldNames:='PCL';
   MostraAviso('Fim de atualização!');
end;

procedure TFrmRecAutomatico.tratarParcela(var estorno: Boolean; incluir: Boolean);
begin

  if not estorno then begin
    if incluir
    then  DMVendas.manterParcelas(0,
                                 DMVendas.venCod.Value,
                                 linPcl.Value,
                                 0,linDtPag.Value,
                                 linDtPag.Value,
                                 linComissao.Value,
                                 linComissao.Value,
                                 0,0)

    else DMVendas.manterParcelas(1,
                                 DMVendas.parVENDA.Value,
                                 linPcl.Value,
                                 DMVendas.parPERIODO.Value,
                                 DMVendas.parDTVENC.Value,
                                 linDtPag.Value,
                                 DMVendas.parRECEBER.Value,
                                 linComissao.Value,
                                 DMVendas.parPAGAR.Value,
                                 DMVendas.parPAGO.Value)

  end
  else begin        // estorno
    // cancelar a venda
    DMPrincipal.executarComando(Format(
           'update VENDAS set SITUACAO=4 where CODIGO=%d',
                   [DMVendas.parVENDA.Value]));
    // excluir parcelas a receber
    DMPrincipal.executarComando(Format(
           'delete from PARCELAS where VENDA=%d and (RECEBIDO+PAGO)<=0',
                  [DMVendas.parVENDA.Value]));
    // lançar parcela de estorno
    DMVendas.manterParcelas(0,
                              DMVendas.parVENDA.Value,
                              99,
                              DMVendas.parPERIODO.Value,
                              linDtPag.Value,
                              linDtPag.Value,
                              linComissao.Value,
                              linComissao.Value, 0.00, 0.00);
  end;
end;

procedure TFrmRecAutomatico.gravarLin(msg: String; par: Integer);
begin
  lin.Edit;
  linobs.Value:=msg;
  linPcl.Value:=par;
  lin.Post;
end;

procedure TFrmRecAutomatico.FecharExecute(Sender: TObject);
begin
  if lin.Active
  then lin.Close;
  Close;
end;

procedure TFrmRecAutomatico.cboEmpEnter(Sender: TObject);
begin
  edArq.Clear;
end;

procedure TFrmRecAutomatico.cboEmpSelect(Sender: TObject);
begin
  empresa:=StrToInt(Copy(cboEmp.Text,201,4));
end;

procedure TFrmRecAutomatico.abrirExecute(Sender: TObject);
var
  planilha: TsWorkbook;
  tab: TsWorksheet;
begin
  if cboEmp.ItemIndex >= 0 then begin

    if DMPrincipal.AbreArq.Execute then begin

      edArq.Text:=DMPrincipal.AbreArq.FileName;

      if lin.Active
      then lin.Close;
      lin.IndexFieldNames:='';
      imp.Enabled:=False;
      lin.CreateDataset;

      planilha := TsWorkbook.Create;
      try
         try
            planilha.ReadFromFile(DMPrincipal.AbreArq.FileName);
            tab := planilha.GetWorksheetByIndex(0);
         except
               on E: Exception do
               MostraErro('Erro lendo a planilha! Abra com OpenOffice, salve como ods ou xls e tente novamente');
         end;

         importarPlanilha(tab);

         if ConfirmaMensagem('Planilha importada. Confirma a baixa de comissões?')
         then baixarComissoes;

      finally
             planilha.Free;
      end;
    end;
  end
  else begin
    MostraAviso('Escolha a empresa que vai receber a importação');
    cboEmp.SetFocus;
  end;

end;

end.

