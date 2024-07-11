unit formvendas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, LCLType, ZAbstractRODataset;

type

  { TFrmVendas }

  TFrmVendas = class(TForm)
    parcela: TAction;
    AL: TActionList;
    Alterar: TAction;
    btPesq: TSpeedButton;
    cboCampo: TComboBox;
    dsPesq: TDataSource;
    edtPesq: TEdit;
    Excluir: TAction;
    Fechar: TAction;
    grPesq: TDBGrid;
    Incluir: TAction;
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
    SpeedButton5: TSpeedButton;
    stBar: TStatusBar;
    procedure AlterarExecute(Sender: TObject);
    procedure dsPesqStateChange(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grPesqTitleClick(Column: TColumn);
    procedure IncluirExecute(Sender: TObject);
    procedure parcelaExecute(Sender: TObject);
    procedure PesqExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function AbrirFicha(alt: Boolean): TModalResult;
  end;

var
  FrmVendas: TFrmVendas;

implementation

uses util, dataprincipal, datavendas, formfvenda, datatabelas, formparcelas;

{$R *.lfm}

{ TFrmVendas }

procedure TFrmVendas.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOK
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmVendas.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
  parcela.Enabled:=Alterar.Enabled;
end;

procedure TFrmVendas.ExcluirExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a exclusão?') then begin
    DMVendas.manterVendas(2,DMVendas.psqVendasCODIGO.Value,0,0,0,0,0,0,0,'','','',
       '','','','','', DMVendas.psqVendasDTVENDA.Value,DMVendas.psqVendasDTCON.Value,0,0);
    dsPesq.DataSet.Refresh;

  end;
end;


procedure TFrmVendas.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendas.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmVendas.grPesqTitleClick(Column: TColumn);
begin
  if DMVendas.psqVendas.SortedFields=Column.FieldName then begin
    if DMVendas.psqVendas.SortType=stAscending
    then DMVendas.psqVendas.SortType:=stDescending
    else DMVendas.psqVendas.SortType:=stAscending;
  end
  else begin
    DMVendas.psqVendas.SortedFields:=Column.FieldName;
    DMVendas.psqVendas.SortType:=stAscending;
  end;
end;

procedure TFrmVendas.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmVendas.parcelaExecute(Sender: TObject);
var
  ven : TVenda;
begin
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

procedure TFrmVendas.PesqExecute(Sender: TObject);
begin
  if DMVendas.abrirPsqVendas(cboCampo.ItemIndex,edtPesq.Text)
  then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
         [DMVendas.psqVendas.RecordCount,edtPesq.Text])
  else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);
end;

function TFrmVendas.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFVenda := TFrmFVenda.Create(Nil);
  try
    FrmFVenda.atualizando:=alt;
    Result:=FrmFVenda.ShowModal;
  finally
    FrmFVenda.Free;
  end;
end;

end.

