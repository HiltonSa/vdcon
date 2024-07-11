unit formfparcela;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, FileUtil, DBDateTimePicker, Forms, LCLType,
  Controls, Graphics, Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls,
  datatabelas;

type

  { TFrmFParcela }

  TFrmFParcela = class(TForm)
    AL: TActionList;
    cboPer: TDBLookupComboBox;
    dsPer: TDataSource;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    edDtVenc: TDBDateTimePicker;
    edRecebido: TDBEdit;
    edDtRec: TDBDateTimePicker;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    ds: TDataSource;
    Label1: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    par: TBufDataset;
    Cancelar: TAction;
    Gravar: TAction;
    Panel2: TPanel;
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
  FrmFParcela: TFrmFParcela;

implementation

uses dataprincipal, datavendas, vdcon.controller.util;

{$R *.lfm}

{ TFrmFParcela }

procedure TFrmFParcela.FormCreate(Sender: TObject);
begin
  DMTab.AbrirPesquisa(DMTab.psqPer,'select * from PERIODO order by DTINI desc');
  par.CreateDataset;
  par.Append;
  parDtRec.Value:=DMVendas.psqParDTREC.Value;
  parDtVenc.Value:=DMVendas.psqParDTVENC.Value;
  parPagar.Value:=DMVendas.psqParPAGAR.Value;
  parPago.Value:=DMVendas.psqParPAGAR.Value;
  parPcl.Value:=DMVendas.psqParPARCELA.Value;
  parPer.Value:=DMVendas.psqParPERIODO.Value;
  parReceber.Value:=DMVendas.psqParRECEBER.Value;
  parRecebido.Value:=DMVendas.psqParRECEBIDO.Value;
  parVenda.Value:=DMVendas.psqParVENDA.Value;
end;

procedure TFrmFParcela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmFParcela.GravarExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a Gravação?') then begin
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

procedure TFrmFParcela.CancelarExecute(Sender: TObject);
begin
  par.Cancel;
  ModalResult:=mrCancel;
end;

end.

