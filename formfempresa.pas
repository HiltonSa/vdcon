unit formfempresa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, FileUtil, DBDateTimePicker, Forms,
  Controls, Graphics, Dialogs, LCLType, ActnList, ExtCtrls, Buttons, StdCtrls,
  DbCtrls;

type

  { TFrmFEmpresa }

  TFrmFEmpresa = class(TForm)
    AL: TActionList;
    cboFaixa: TDBLookupComboBox;
    cboUnidade: TComboBox;
    dsFai: TDataSource;
    edVigencia: TDBDateTimePicker;
    ds: TDataSource;
    edCpf1: TDBEdit;
    edCpf2: TDBEdit;
    edRazao: TDBEdit;
    emp: TBufDataset;
    Cancelar: TAction;
    DBEdit1: TDBEdit;
    edCpf: TDBEdit;
    edCpf3: TDBEdit;
    edNome: TDBEdit;
    empAcerto: TLongintField;
    empCnpj: TStringField;
    empCod: TLongintField;
    empFantasia: TStringField;
    empMesPer: TLongintField;
    empPcEntrega: TFloatField;
    empPcPer: TFloatField;
    empRazao: TStringField;
    empUltFaixa: TLongintField;
    empUnidade: TLongintField;
    empVigencia: TDateField;
    Gravar: TAction;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure CancelarExecute(Sender: TObject);
    procedure empCnpjGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GravarExecute(Sender: TObject);
  private
    Fatualizando: Boolean;
    procedure Setatualizando(AValue: Boolean);
    { private declarations }
  public
    { public declarations }
    property atualizando: Boolean read Fatualizando write Setatualizando;
  end;

var
  FrmFEmpresa: TFrmFEmpresa;

implementation

uses dataprincipal, util;

{$R *.lfm}

{ TFrmFEmpresa }

procedure TFrmFEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmFEmpresa.GravarExecute(Sender: TObject);
begin
  if edNome.Text = '' then begin
    MostraAviso('Precisa informar NOME FANTASIA!');
    edNome.SetFocus;
  end
  else if empRazao.Value = '' then begin
    MostraAviso('Precisa informar RAZÃO SOCIAL!');
    edRazao.SetFocus;
  end
  else if empVigencia.IsNull then begin
     MostraAviso('Precisa informar VIGENCIA!');
     edVigencia.SetFocus;
  end
  else if ConfirmaMensagem('Confirma a gravação?') then begin
     empUnidade.Value:=cboUnidade.ItemIndex;
     if Fatualizando
     then DMPrincipal.manterEmpresa(1,
              empCod.Value,
              empUnidade.Value,
              empMesPer.Value,
              empAcerto.Value,
              empUltFaixa.Value,
              empFantasia.Value,
              empRazao.Value,
              empCnpj.Value,
              empPcEntrega.Value,
              empPcPer.Value,
              empVigencia.Value)
     else DMPrincipal.manterEmpresa(0, 0,
               empUnidade.Value,
               empMesPer.Value,
               empAcerto.Value,
               empUltFaixa.Value,
               empFantasia.Value,
               empRazao.Value,
               empCnpj.Value,
               empPcEntrega.Value,
               empPcPer.Value,
               empVigencia.Value);
     emp.Cancel;
     ModalResult := mrOk;
  end;
end;

procedure TFrmFEmpresa.empCnpjGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText:=RetornarFormatado(empCnpj.AsString, tfCnpj);
end;

procedure TFrmFEmpresa.CancelarExecute(Sender: TObject);
begin
  emp.Cancel;
  ModalResult:=mrCancel;
end;

procedure TFrmFEmpresa.Setatualizando(AValue: Boolean);
begin
  Fatualizando:=AValue;
  emp.CreateDataset;
  emp.Append;
  if Fatualizando then begin
    Caption:='Alterando Empresa';
    DMPrincipal.posicionarFaixas(DMPrincipal.psqEmpCODIGO.Value);
    empCnpj.Value:=DMPrincipal.psqEmpCNPJ.Value;
    empFantasia.Value:=DMPrincipal.psqEmpNOMEFANTASIA.Value;
    empMesPer.Value:=DMPrincipal.psqEmpMESPER.Value;
    empPcEntrega.Value:=DMPrincipal.psqEmpPCENTREGA.Value;
    empPcPer.Value:=DMPrincipal.psqEmpPCPER.Value;
    empRazao.Value:=DMPrincipal.psqEmpRAZAOSOCIAL.Value;
    empUnidade.Value:=DMPrincipal.psqEmpUNIDADE.Value;
    empVigencia.Value:=DMPrincipal.psqEmpVIGENCIA.Value;
    empCod.Value:=DMPrincipal.psqEmpCODIGO.Value;
    empAcerto.Value:=DMPrincipal.psqEmpACERTO.Value;
    empUltFaixa.Value:=DMPrincipal.psqEmpULTFAIXA.Value;
    cboUnidade.ItemIndex:=DMPrincipal.psqEmpUNIDADE.Value;
    cboFaixa.Enabled:=True;
  end
  else begin
    Caption:='Incluindo Empresa';
    cboUnidade.ItemIndex:=0;
    cboFaixa.Enabled:=False;
  end;
end;

end.

