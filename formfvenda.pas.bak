unit formfvenda;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, DBDateTimePicker, Forms, LCLType,
  Controls, Graphics, Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls;

type

  { TFrmFVenda }

  TFrmFVenda = class(TForm)
    AL: TActionList;
    cboVen: TDBLookupComboBox;
    cboPes: TComboBox;
    cboSit: TDBLookupComboBox;
    dsSit: TDataSource;
    dsAge: TDataSource;
    edDiaVen: TDBEdit;
    edVlrPago: TDBEdit;
    edFone: TDBEdit;
    edGru: TDBEdit;
    edCota: TDBEdit;
    edDDD: TDBEdit;
    edNome: TDBEdit;
    edCpfCnpj: TDBEdit;
    edVenda: TDBDateTimePicker;
    dsEmp: TDataSource;
    cboEmp: TDBLookupComboBox;
    edVal: TDBEdit;
    edDcBem: TDBEdit;
    edCon: TDBEdit;
    edCod: TDBEdit;
    edCdBem: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    ven: TBufDataset;
    Cancelar: TAction;
    ds: TDataSource;
    Gravar: TAction;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    venAgente: TLongintField;
    venCdBen: TStringField;
    venCod: TLongintField;
    venCota: TLongintField;
    venCpfCnpj: TStringField;
    venCtrato: TStringField;
    venDcBem: TStringField;
    venDDD: TStringField;
    venDiaVen: TLongintField;
    venDtCon: TDateField;
    venEmp: TLongintField;
    venFone: TStringField;
    venGrupo: TStringField;
    venNome: TStringField;
    venPer: TLongintField;
    venSit: TLongintField;
    venTpPes: TLongintField;
    venValor: TFloatField;
    venVenda: TDateField;
    venVlrPago: TFloatField;
    procedure CancelarExecute(Sender: TObject);
    procedure cboPesSelect(Sender: TObject);
    procedure edCdBemExit(Sender: TObject);
    procedure edConExit(Sender: TObject);
    procedure edDiaVenChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GravarExecute(Sender: TObject);
    procedure venCpfCnpjGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure venFoneGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
  private
    Fatualizando: Boolean;
    procedure Setatualizando(AValue: Boolean);
    { private declarations }
  public
    { public declarations }
    property atualizando: Boolean read Fatualizando write Setatualizando;
  end;

var
  FrmFVenda: TFrmFVenda;

implementation

uses dataprincipal, datavendas, datatabelas, util;

{$R *.lfm}

{ TFrmFVenda }

procedure TFrmFVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmFVenda.GravarExecute(Sender: TObject);
var
  msg: string;
begin
  if venSit.Value=4
  then msg:='Confirma o CANCELAMENTO da venda?'
  else msg:='Confirma a Gravação?';
  if venEmp.Value <= 0 then begin
    MostraAviso('EMPREESA deve ser informada!');
    cboEmp.SetFocus;
  end
  else if venCtrato.IsNull then begin
    MostraAviso('CONTRATO deve ser informado!');
    edCon.SetFocus;
  end
  else if venVenda.IsNull then begin
    MostraAviso('DATA DA VENDA deve ser informada!');
    edVenda.SetFocus;
  end
  else if venVlrPago.Value = 0 then begin
    MostraAviso('VALOR PAGO PELO CLIENTE deve ser informado!');
    edVlrPago.SetFocus;
  end
  else if venAgente.Value <=0 then begin
    MostraAviso('VENDEDOR dev ser informado');
    cboVen.SetFocus;
  end
  else if venCdBen.IsNull then begin
    MostraAviso('CÓD. BEM deve ser informado!');
    edCdBem.SetFocus;
  end
  else if venDcBem.IsNull then begin
    MostraAviso('DESCRIÇÃO DO BEM deve ser informada!');
    edDcBem.SetFocus;
  end
  else if venValor.Value <= 0 then begin
    MostraAviso('VALOR BEM deve ser informado!');
    edVal.SetFocus;
  end
  else if ConfirmaMensagem(msg) then begin
    venTpPes.Value:=cboPes.ItemIndex;
    if Fatualizando
    then DMVendas.manterVendas(1,
                                 venCod.Value,
                                 venEmp.Value,
                                 venAgente.Value,
                                 venPer.Value,
                                 venSit.Value,
                                 venTpPes.Value,
                                 venCota.Value,
                                 venDiaVen.Value,
                                 venCtrato.Value,
                                 venCdBen.Value,
                                 venDcBem.Value,
                                 venNome.Value,
                                 venDDD.Value,
                                 venFone.Value,
                                 venCpfCnpj.Value,
                                 venGrupo.Value,
                                 venVenda.Value,
                                 venDtCon.Value,
                                 venValor.Value,
                                 venVlrPago.Value)
    else DMVendas.manterVendas(0,0,
                                 venEmp.Value,
                                 venAgente.Value,
                                 venPer.Value,
                                 venSit.Value,
                                 venTpPes.Value,
                                 venCota.Value,
                                 venDiaVen.Value,
                                 venCtrato.Value,
                                 venCdBen.Value,
                                 venDcBem.Value,
                                 venNome.Value,
                                 venDDD.Value,
                                 venFone.Value,
                                 venCpfCnpj.Value,
                                 venGrupo.Value,
                                 venVenda.Value,
                                 venDtCon.Value,
                                 venValor.Value,
                                 venVlrPago.Value);
    ven.Close;
    ModalResult:=mrOK;
  end;
end;

procedure TFrmFVenda.venCpfCnpjGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  if venTpPes.AsInteger=0
  then aText:=RetornarFormatado(venCpfCnpj.AsString,tfCpf)
  else aText:=RetornarFormatado(venCpfCnpj.AsString,tfCnpj);
end;

procedure TFrmFVenda.venFoneGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText:=RetornarFormatado(venFone.AsString,tfCelular);
end;

procedure TFrmFVenda.CancelarExecute(Sender: TObject);
begin
  ven.Cancel;
  ModalResult:=mrCancel;
end;

procedure TFrmFVenda.cboPesSelect(Sender: TObject);
begin
  venTpPes.Value:=cboPes.ItemIndex;
end;

procedure TFrmFVenda.edCdBemExit(Sender: TObject);
begin
  if (not Fatualizando) and (DMTab.posicionarBens(venEmp.Value, venCdBen.Value))
  then begin
    venDcBem.Value:=DMTab.psqBensDCBEM.Value;
    venValor.Value:=DMTab.psqBensVALOR.Value;
  end;

end;

procedure TFrmFVenda.edConExit(Sender: TObject);
begin
  if not (venCtrato.IsNull) then begin
    if DMPrincipal.executarSQL(Format(
            'select * from VENDAS where EMPRESA = %d and CONTRATO = %s',
            [venEmp.Value,venCtrato.Value])) then begin
      if DMPrincipal.qry.FieldByName('CODIGO').Value <> venCod.Value then begin
        MostraAviso('CONTRATO já informado!');
        edCon.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmFVenda.edDiaVenChange(Sender: TObject);
begin

end;

procedure TFrmFVenda.FormCreate(Sender: TObject);
begin
  if DMPrincipal.Filial = 0
  then DMTab.AbrirPesquisa(DMTab.psqAgentes,
             'select A.* from AGENTES A where A.ATIVO=1 order by A.NOME')
  else DMTab.AbrirPesquisa(DMTab.psqAgentes,Format(
                   'select A.* from AGENTES A '+
                   'inner join EQUIPES E on E.CODIGO=A.EQUIPE and E.FILIAL=%d '+
                   'where A.ATIVO=1 order by A.NOME', [DMPrincipal.Filial]));
end;

procedure TFrmFVenda.Setatualizando(AValue: Boolean);
begin
  ven.CreateDataset;
  ven.Append;
  Fatualizando:=AValue;
  if Fatualizando then begin
    DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp, 'select * from EMPRESA order by NOMEFANTASIA');
    Caption:='Atualizando Venda';
    DMTab.AbrirPesquisa(DMTab.psqSit,'select * from SITCON order by DESCRICAO');
    venAgente.Value:=DMVendas.psqVendasAGENTE.Value;
    venCdBen.Value:=DMVendas.psqVendasCDBEM.Value;
    venCod.Value:=DMVendas.psqVendasCODIGO.Value;
    venCota.Value:=DMVendas.psqVendasCOTA.Value;
    venCtrato.Value:=DMVendas.psqVendasCONTRATO.Value;
    venDcBem.Value:=DMVendas.psqVendasDCBEM.Value;
    venDDD.Value:=DMVendas.psqVendasDDD.Value;
    venDtCon.Value:=DMVendas.psqVendasDTCON.Value;
    venEmp.Value:=DMVendas.psqVendasEMPRESA.Value;
    venFone.Value:=DMVendas.psqVendasFONE.Value;
    venGrupo.Value:=DMVendas.psqVendasGRUPO.Value;
    venNome.Value:=DMVendas.psqVendasNOME.Value;
    venPer.Value:=DMVendas.psqVendasPERIODO.Value;
    venSit.Value:=DMVendas.psqVendasSITUACAO.Value;
    venTpPes.Value:=DMVendas.psqVendasTPPES.Value;
    venCpfCnpj.Value:=DMVendas.psqVendasCPFCNPJ.Value;
    venValor.Value:=DMVendas.psqVendasVALOR.Value;
    venVenda.Value:=DMVendas.psqVendasDTVENDA.Value;
    venDiaVen.Value:=DMVendas.psqVendasDIAVENC.Value;
    venVlrPago.Value:=DMVendas.psqVendasVLRPAGO.Value;
    cboPes.ItemIndex:=venTpPes.AsInteger;
    Gravar.Enabled:=DMVendas.psqVendasSITUACAO.Value <> 4;
  end
  else  begin
    Caption:='Incluindo Venda';
    if DMPrincipal.Filial=0
    then DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp, 'select * from EMPRESA order by NOMEFANTASIA')
    else DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp, 'select * from EMPRESA where codigo>1 order by NOMEFANTASIA');
    cboPes.ItemIndex:=0;
    venVenda.Value:=Date;
    DMTab.AbrirPesquisa(DMTab.psqSit,'select * from SITCON where CODIGO < 3 order by DESCRICAO');
    Gravar.Enabled:=True;
  end;
end;

end.

