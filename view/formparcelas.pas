unit formparcelas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  ExtCtrls, DBGrids, Buttons, StdCtrls, LCLType, vdcon.controller.util;

type

  { TFrmParcelas }

  TFrmParcelas = class(TForm)
    ds: TDataSource;
    edNmCli: TEdit;
    edEmp: TEdit;
    edContrato: TEdit;
    edCod: TEdit;
    edDtVen: TEdit;
    edDcBem: TEdit;
    edVlBem: TEdit;
    edNmVen: TEdit;
    grPesq: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    sair: TAction;
    alterar: TAction;
    AL: TActionList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure alterarExecute(Sender: TObject);
    procedure sairExecute(Sender: TObject);
  private
    Fvenda: TVenda;
    procedure Setvenda(AValue: TVenda);
    { private declarations }
  public
    { public declarations }
    property venda : TVenda read Fvenda write Setvenda;
    function AbrirFicha(alt: Boolean): TModalResult;
  end;

var
  FrmParcelas: TFrmParcelas;

implementation

uses dataprincipal, datavendas, formfparcela;

{$R *.lfm}

{ TFrmParcelas }

procedure TFrmParcelas.sairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmParcelas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE
  then sair.Execute;
end;

procedure TFrmParcelas.alterarExecute(Sender: TObject);
begin
  if DMVendas.psqParRECEBIDO.Value = 0
  then MostraAviso('Parcela já RECEBIDA!');
  if AbrirFicha(true) = mrOK
  then ds.DataSet.Refresh;
  //end
  //else if ConfirmaMensagem('Parcela já RECEBIDA! Deseja anular o recebimento?') then begin
  //  DMVendas.manterParcelas(1, DMVendas.psqParVENDA.Value,
  //                             DMVendas.psqParPARCELA.Value,
  //                             DMVendas.psqParPERIODO.Value,
  //                             DMVendas.psqParDTVENC.Value,
  //                             0,
  //                             DMVendas.psqParRECEBER.Value,
  //                             0.0,
  //                             DMVendas.psqParPAGAR.Value,
  //                             DMVendas.psqParPAGO.Value);
  //  ds.DataSet.Refresh;
  //end;
end;

procedure TFrmParcelas.Setvenda(AValue: TVenda);
begin
  Fvenda:=AValue;
  edEmp.Text:=Fvenda.empresa;
  edContrato.Text:=Fvenda.contrato;
  edCod.Text:=retornaCodigoFormatado(Fvenda.codigo,6);
  edDtVen.Text:=FormatDateTime('dd/mm/yyyy',Fvenda.dtVen);
  edNmVen.Text:=Fvenda.nmVen;
  edDcBem.Text:=Fvenda.dcBem;
  edVlBem.Text:=retornaValorFormatado(Fvenda.vlBem,2);
  edNmCli.Text:=Fvenda.nmCli;
  DMPrincipal.PosicionarDataset(DMVendas.psqPar,Fvenda.codigo);
end;

function TFrmParcelas.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFParcela := TFrmFParcela.Create(nil);
  try
    Result:=FrmFParcela.ShowModal;
  finally
    FrmFParcela.Free;
  end;
end;

{ TFrmParcelas }


end.

