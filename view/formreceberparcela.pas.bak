unit formreceberparcela;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, FileUtil, DBDateTimePicker, Forms, LCLType,
  Controls, Graphics, Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls;

type

  { TFrmReceberParcela }

  TFrmReceberParcela = class(TForm)
    AL: TActionList;
    Cancelar: TAction;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ds: TDataSource;
    edDtRec: TDBDateTimePicker;
    edRecebido: TDBEdit;
    Gravar: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    par: TBufDataset;
    parDtRec: TDateField;
    parDtVenc: TDateField;
    parPagar: TFloatField;
    parPago: TFloatField;
    parPcl: TLongintField;
    parPer: TLongintField;
    parReceber: TFloatField;
    parRecebido: TFloatField;
    parVenda: TLongintField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure CancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GravarExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmReceberParcela: TFrmReceberParcela;

implementation

uses dataprincipal, datavendas, util;

{$R *.lfm}

{ TFrmReceberParcela }

procedure TFrmReceberParcela.FormCreate(Sender: TObject);
begin
  par.CreateDataset;
  par.Append;
  parDtRec.Value:=Date;
  parDtVenc.Value:=DMVendas.pndDTVENC.Value;
  parPagar.Value:=DMVendas.pndPAGAR.Value;
  parPago.Value:=DMVendas.pndPAGO.Value;
  parPcl.Value:=DMVendas.pndPARCELA.Value;
  parPer.Value:=DMVendas.pndPERIODO.Value;
  parReceber.Value:=DMVendas.pndRECEBER.Value;
  parRecebido.Value:=DMVendas.pndRECEBIDO.Value;
  parVenda.Value:=DMVendas.pndVENDA.Value;
end;

procedure TFrmReceberParcela.CancelarExecute(Sender: TObject);
begin
  par.Cancel;
  ModalResult:=mrCancel;
end;

procedure TFrmReceberParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmReceberParcela.GravarExecute(Sender: TObject);
begin
  if parDtRec.IsNull then begin
    MostraAviso('Precisa informar DATA DE RECEBIMENTO!');
    edDtRec.SetFocus;
  end
  else if parRecebido.Value = 0 then begin
    MostraAviso('Precisa informar VALOR RECEBIDO!');
    edRecebido.SetFocus;
  end
  else if ConfirmaMensagem('Confirma o Recebimento?') then begin
    DMVendas.manterParcelas(1,
                              parVenda.Value,
                              parPcl.Value,
                              parPer.Value,
                              parDtVenc.Value,
                              parDtRec.Value,
                              parReceber.Value,
                              parRecebido.Value,
                              parPagar.Value,
                              parPago.Value);
    par.Cancel;
    ModalResult:=mrOK;
  end;
end;

end.

