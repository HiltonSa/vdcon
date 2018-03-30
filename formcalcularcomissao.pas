unit formcalcularcomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, FileUtil, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls, LCLType;

type

  { TFrmCalcularComissao }

  TFrmCalcularComissao = class(TForm)
    calcular: TAction;
    AL: TActionList;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ds: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    per: TBufDataset;
    cboPer: TComboBox;
    Fechar: TAction;
    imp: TAction;
    Label1: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    perCal: TDateField;
    perCod: TLongintField;
    perDes: TStringField;
    perFim: TDateField;
    perIni: TDateField;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure calcularExecute(Sender: TObject);
    procedure cboPerSelect(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure impExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmCalcularComissao: TFrmCalcularComissao;

implementation

uses dataprincipal, datavendas, util, relpagarcomissao;

{$R *.lfm}

{ TFrmCalcularComissao }

procedure TFrmCalcularComissao.FecharExecute(Sender: TObject);
begin
  DMVendas.psqPer.Close;
  per.Close;
  Close;
end;

procedure TFrmCalcularComissao.cboPerSelect(Sender: TObject);
begin
  DMVendas.psqPer.Locate('codigo',StrToInt(Copy(cboPer.Text,201,4)),[]);
  if per.Active
  then per.Close;
  per.CreateDataset;
  per.Append;
  perCod.Value:=DMVendas.psqPerCODIGO.Value;
  perCal.Value:=DMVendas.psqPerDTCAL.Value;
  perDes.Value:=DMVendas.psqPerDESCRICAO.Value;
  perFim.Value:=DMVendas.psqPerDTFIM.Value;
  perIni.Value:=DMVendas.psqPerDTINI.Value;
  per.Post;
  calcular.Enabled:=True;
end;

procedure TFrmCalcularComissao.calcularExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma o cálculo das comissões para o período?')
  then begin
    DMVendas.calcularComissoes(perCod.Value);
    MostraAviso('Calculo concluído!');
    imp.Enabled:=True;
  end;
end;

procedure TFrmCalcularComissao.FormCreate(Sender: TObject);
var
  stSql: String;
begin
  stSql:='select *  from PERIODO where datediff (day from DTCAL to current_date) '+
         'between 0 and 30 order by DTINI desc';

  //cboPer.Clear;

  if DMVendas.abrirPeriodo(stSql) then
    montarComboBox(cboPer,DMVendas.psqPer,'CODIGO','DESCRICAO',False);
//
//  begin
//    DMVendas.psqPer.First;
//    while not DMVendas.psqPer.EOF do begin
//      cboPer.AddItem(Format('%-200s%.4d',[
//                  DMVendas.psqPerDESCRICAO.Value,
//                  DMVendas.psqPerCODIGO.Value]),nil);
//      DMVendas.psqPer.Next;
//    end;
//  end;

  cboPer.ItemIndex:=-1;

end;

procedure TFrmCalcularComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   //VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmCalcularComissao.impExecute(Sender: TObject);
begin
  if DMVendas.abrirRelComissoes(perCod.Value,0) then begin
    FrmRelPagarComissao := TFrmRelPagarComissao.Create(nil);
    try
       FrmRelPagarComissao.RP.PreviewModal;
    finally
      FrmRelPagarComissao.Free;
    end;
  end
  else MostraAviso('Sem comissões para esse período!');
end;

end.

