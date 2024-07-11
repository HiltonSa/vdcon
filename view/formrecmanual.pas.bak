unit formrecmanual;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, ComCtrls, LCLType, ZAbstractRODataset;

type

  { TFrmRecManual }

  TFrmRecManual = class(TForm)
    AL: TActionList;
    receber: TAction;
    btPesq: TSpeedButton;
    cboCampo: TComboBox;
    ds: TDataSource;
    edtPesq: TEdit;
    imprimir: TAction;
    Fechar: TAction;
    grPesq: TDBGrid;
    altPar: TAction;
    Label1: TLabel;
    Label2: TLabel;
    nvPesq: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Pesq: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    stBar: TStatusBar;
    procedure altParExecute(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grPesqTitleClick(Column: TColumn);
    procedure imprimirExecute(Sender: TObject);
    procedure PesqExecute(Sender: TObject);
    procedure receberExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function abrirVenda: TModalResult;
  end;

var
  FrmRecManual: TFrmRecManual;

implementation

uses dataprincipal, datavendas, formfvenda, formreceberparcela, formparcelas,
  util;

{$R *.lfm}

{ TFrmRecManual }

procedure TFrmRecManual.FecharExecute(Sender: TObject);
begin
    Close;
end;

procedure TFrmRecManual.dsStateChange(Sender: TObject);
begin
  altPar.Enabled:=(ds.State = dsBrowse);
  receber.Enabled:=altPar.Enabled;
  imprimir.Enabled:=altPar.Enabled;
end;

procedure TFrmRecManual.altParExecute(Sender: TObject);
begin
  if abrirVenda = mrOK
  then ds.DataSet.Refresh;
end;

procedure TFrmRecManual.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  DMVendas.pnd.Close;
end;

procedure TFrmRecManual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmRecManual.grPesqTitleClick(Column: TColumn);
begin
  if DMVendas.pnd.SortedFields=Column.FieldName then begin
    if DMVendas.pnd.SortType=stAscending
    then DMVendas.pnd.SortType:=stDescending
    else DMVendas.pnd.SortType:=stAscending;
  end
  else begin
    DMVendas.pnd.SortedFields:=Column.FieldName;
    DMVendas.pnd.SortType:=stAscending;
  end;
end;

procedure TFrmRecManual.imprimirExecute(Sender: TObject);
begin
  DMVendas.imprimirParcelasPendentes;
end;

procedure TFrmRecManual.PesqExecute(Sender: TObject);
begin
    if DMVendas.abrirPendenciaComissao(cboCampo.ItemIndex, edtPesq.Text)
    then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
           [DMVendas.pnd.RecordCount,edtPesq.Text])
    else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);
end;

procedure TFrmRecManual.receberExecute(Sender: TObject);
begin
    if DMVendas.pndRECEBIDO.Value = 0 then begin
      FrmReceberParcela := TFrmReceberParcela.Create(nil);
      try
        if FrmReceberParcela.ShowModal=mrOK
        then ds.DataSet.Refresh;
      finally
        FrmReceberParcela.Free;
      end;
    end
    else if ConfirmaMensagem('Parcela já RECEBIDA! Deseja anular o recebimento?') then begin
      DMVendas.manterParcelas(1, DMVendas.pndVENDA.Value,
                                 DMVendas.pndPARCELA.Value,
                                 DMVendas.pndPERIODO.Value,
                                 DMVendas.pndDTVENC.Value,
                                 0,
                                 DMVendas.pndRECEBER.Value,
                                 0.0,
                                 DMVendas.pndPAGAR.Value,
                                 DMVendas.pndPAGO.Value);
      ds.DataSet.Refresh;
    end;
end;

function TFrmRecManual.abrirVenda: TModalResult;
var
  ven: TVenda;
begin
  DMVendas.abrirPsqVendas(0,DMVendas.pndCDVEN.AsString);
  //FrmFVenda := TFrmFVenda.Create(nil);
  //try
  //  FrmFVenda.atualizando:=True;
  //  Result:=FrmFVenda.ShowModal;
  //finally
  //  FrmFVenda.Free;
  //end;
  FrmParcelas := TFrmParcelas.Create(nil);
  try
    DMPrincipal.VerificarRotinas(FrmParcelas);
    DMPrincipal.AplicarRestricoes(FrmParcelas);
    with ven do begin
      codigo:=DMVendas.psqVendasCODIGO.Value;
      contrato:=DMVendas.psqVendasCONTRATO.Value;
      dcBem:=DMVendas.psqVendasDCBEM.Value;
      dtVen:=DMVendas.psqVendasDTVENDA.Value;
      empresa:=DMVendas.psqVendasNMEMP.Value;
      nmCli:=DMVendas.psqVendasNOME.Value;
      nmVen:=DMVendas.psqVendasNMAGE.Value;
      vlBem:=DMVendas.psqVendasVALOR.Value;
    end;
    FrmParcelas.venda:=ven;
    FrmParcelas.ShowModal;
  finally
    FrmParcelas.Free;
  end;
end;

end.

