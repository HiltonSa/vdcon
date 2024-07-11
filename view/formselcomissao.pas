unit formselcomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, Forms, Controls, Graphics,LCLType,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls;

type

  { TFrmSelComissao }

  TFrmSelComissao = class(TForm)
    AL: TActionList;
    cboFil: TComboBox;
    cboPer: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    ds: TDataSource;
    Fechar: TAction;
    imp: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    per: TBufDataset;
    perCal: TDateField;
    perCod: TLongintField;
    perDes: TStringField;
    perFim: TDateField;
    perIni: TDateField;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure cboFilSelect(Sender: TObject);
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
  FrmSelComissao: TFrmSelComissao;
  Fil: Integer;

implementation

uses dataprincipal, vdcon.controller.util, datavendas, relpagarcomissao, datatabelas;

{$R *.lfm}

{ TFrmSelComissao }

procedure TFrmSelComissao.FormCreate(Sender: TObject);
var
  stSql: String;
begin
  Fil:=DMPrincipal.Filial;
  stSql:='select *  from PERIODO order by DTINI desc';

  cboPer.Clear;

  if DMVendas.abrirPeriodo(stSql)
  then montarComboBox(cboPer, DMVendas.psqPer,'CODIGO','DESCRICAO',False);

  if Fil=0
  then begin
    DMTab.AbrirPesquisa(DMTab.psqFiliais,'select * from FILIAIS order by DESCRICAO');
    montarComboBox(cboFil,DMTab.psqFiliais,'CODIGO','DESCRICAO',True);
  end
  else begin
    cboFil.Clear;
    cboFil.AddItem(DMPrincipal.UsuFil, NiL);
    cboFil.Enabled:=False;
  end;
  cboFil.ItemIndex:=0;
  cboPer.ItemIndex:=-1;
end;

procedure TFrmSelComissao.FecharExecute(Sender: TObject);
begin
  DMVendas.psqPer.Close;
  per.Close;
  Close;
end;

procedure TFrmSelComissao.cboPerSelect(Sender: TObject);
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
  imp.Enabled:=True;
end;

procedure TFrmSelComissao.cboFilSelect(Sender: TObject);
begin
    Fil:=StrToIntDef(Copy(cboFil.Text,201,4),0);
end;

procedure TFrmSelComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   //VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmSelComissao.impExecute(Sender: TObject);
begin
  if DMVendas.abrirRelComissoes(perCod.Value, Fil) then begin
    FrmRelPagarComissao := TFrmRelPagarComissao.Create(nil);
    try
       FrmRelPagarComissao.RP.Title:=Format('COMISSÃO EM %s DE %s A %s',
             [perDes.Value,FormatDateTime('dd/mm/yyyy',perIni.Value),
             FormatDateTime('dd/mm/yyyy',perFim.Value)]);
       FrmRelPagarComissao.RP.Preview();
    finally
      FrmRelPagarComissao.Free;
    end;
  end
  else MostraAviso('Sem comissões para esse período!');
end;

end.

