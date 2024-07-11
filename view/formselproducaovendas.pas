unit formselproducaovendas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics, LCLType,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls, dateutils;

type

  { TFrmSelProdVendas }

  TFrmSelProdVendas = class(TForm)
    AL: TActionList;
    cboFil: TComboBox;
    cboEqp: TComboBox;
    cboVen: TComboBox;
    edIni: TDateTimePicker;
    edFim: TDateTimePicker;
    Fechar: TAction;
    imp: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure cboEqpSelect(Sender: TObject);
    procedure cboFilSelect(Sender: TObject);
    procedure edFimExit(Sender: TObject);
    procedure edIniExit(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure impExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure montarEquipe(fil: Integer);
    procedure montarAgentes(eqp:Integer);
  end;

var
  FrmSelProdVendas: TFrmSelProdVendas;
  Fil: Integer;

implementation

uses dataprincipal, datavendas, vdcon.controller.util, relproducao, datatabelas;

{$R *.lfm}

{ TFrmSelProdVendas }

procedure TFrmSelProdVendas.FormCreate(Sender: TObject);
begin
  Fil:=DMPrincipal.Filial;
  edIni.Date:=StartOfTheMonth(Date);
  edFim.Date:=EndOfTheMonth(Date);
  if Fil=0
  then begin
    DMTab.AbrirPesquisa(DMTab.psqFiliais,'select * from FILIAIS order by DESCRICAO');
    montarComboBox(cboFil,DMTab.psqFiliais,'CODIGO','DESCRICAO',True);
  end
  else begin
    cboFil.Clear;
    cboFil.AddItem(DMPrincipal.UsuFil, NiL);
    cboFil.Enabled:=False;
    montarEquipe(DMPrincipal.Filial);
  end;
  cboFil.ItemIndex:=0;
end;

procedure TFrmSelProdVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmSelProdVendas.impExecute(Sender: TObject);
var
  stSql: String;
begin
  stSql:=Format('select * from VENDAS_COMPLETAS where DTVENDA between %s and %s',
              [QuotedStr(FormatDateTime('mm/dd/yyyy',edIni.Date)),
              QuotedStr(FormatDateTime('mm/dd/yyyy',edFim.Date))]);

  if cboVen.ItemIndex>0
  then stSql:=Format('%s and CDAGE = %d',[stSql, StrToInt(Copy(cboVen.Text,201,4))])
  else begin
    if cboEqp.ItemIndex>0
    then stSql:=Format('%s and CDEQP = %d',[stSql,StrToInt(Copy(cboEqp.Text,201,4))])
    else begin
      if DMPrincipal.Filial>0
      then stSql:=Format('%s and CDEMP = %d',[stSql,Fil])
      else begin
        if cboFil.ItemIndex > 0
        then stSql:=Format('%s and CDEMP = %d',[stSql,Fil]);
      end;
    end;
  end;

  if DMPrincipal.AbrirPesquisa(DMVendas.pro, stSql) then begin
    FrmRelProducao := TFrmRelProducao.Create(nil);
    try
      FrmRelProducao.RP.Title:='PRODUCAO ENTRE '+DateToStr(edIni.Date)+' E '+
                                         DateToStr(edFim.Date);
      FrmRelProducao.RP.PreviewModal;
    finally
      FrmRelProducao.Free;
    end;
  end
  else MostraAviso('Vendas não encontradas!');

end;

procedure TFrmSelProdVendas.montarEquipe(fil: Integer);
begin

  DMTab.AbrirPesquisa(DMTab.psqEqpe,Format(
       'select * from EQUIPES where FILIAL = %d order by DESCRICAO',
               [fil]));
  montarComboBox(cboEqp,DMTab.psqEqpe,'CODIGO','DESCRICAO',True);

  if DMTab.psqEqpe.RecordCount=1
  then montarAgentes(DMTab.psqEqpeCODIGO.Value);

  cboEqp.ItemIndex:=0;

end;

procedure TFrmSelProdVendas.montarAgentes(eqp: Integer);
begin
  DMTab.AbrirPesquisa(DMTab.psqAgentes,Format(
                   'select A.* from AGENTES A where A.EQUIPE=%d '+
                   'order by A.NOME', [eqp]));
  montarComboBox(cboVen,DMTab.psqAgentes,'CODIGO','NOME',True);

  cboVen.ItemIndex:=0;
end;

procedure TFrmSelProdVendas.edIniExit(Sender: TObject);
begin
  edFim.Date:=EndOfTheMonth(edIni.Date);
end;

procedure TFrmSelProdVendas.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelProdVendas.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMTab.psqFiliais.Close;
  DMTab.psqEqpe.Close;
  DMTab.psqAgentes.Close;
  DMVendas.pro.Close;
end;

procedure TFrmSelProdVendas.edFimExit(Sender: TObject);
begin
  if edIni.Date > edFim.Date then begin
    MostraAviso('Data FINAL deve ser maior que a data INICIAL!');
    edFim.Date:=EndOfTheMonth(edIni.Date);
    edFim.SetFocus;
  end;
end;

procedure TFrmSelProdVendas.cboFilSelect(Sender: TObject);
begin
  Fil:=StrToIntDef(Copy(cboFil.Text,201,4),0);
  cboEqp.Enabled:=True;
  cboVen.Enabled:=True;
  if cboFil.Items.Count>1
  then montarEquipe(Fil)
  else begin
    cboEqp.Enabled:=False;
    cboVen.Enabled:=False;
  end;
end;

procedure TFrmSelProdVendas.cboEqpSelect(Sender: TObject);
begin
  cboVen.Enabled:=True;
  if cboEqp.Items.Count > 1
  then montarAgentes(StrToInt(Copy(cboEqp.Text,201,4)))
  else cboVen.Enabled:=False;
end;


{ TFrmSelProdVendas }


end.

