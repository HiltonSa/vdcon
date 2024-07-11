unit formpainel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, TAGraph, TASeries, TADbSource, Forms,
  Controls, Graphics, Dialogs, ActnList, ExtCtrls, Menus, DBGrids, dateutils,
  StdCtrls, ComCtrls, CheckLst, TAChartAxisUtils, TACustomSeries, TATools,
  TAChartListbox;

type

  { TFrmPainel }

  TFrmPainel = class(TForm)
    AL: TActionList;
    asTotFil: TAreaSeries;
    bsFil3: TBarSeries;
    bsFil2: TBarSeries;
    bsFil1: TBarSeries;
    cbMrk: TCheckBox;
    cboEqp: TComboBox;
    cboPer: TComboBox;
    cboAbr: TComboBox;
    cbVal: TCheckBox;
    clEmp: TChartListbox;
    clFil: TChartListbox;
    grEmp: TChart;
    csEmp5: TDbChartSource;
    csTotEmp: TDbChartSource;
    csTotFil: TDbChartSource;
    csFil3: TDbChartSource;
    csFil2: TDbChartSource;
    csEmp1: TDbChartSource;
    csEmp2: TDbChartSource;
    csEmp3: TDbChartSource;
    csEmp4: TDbChartSource;
    dsFil: TDataSource;
    csFil1: TDbChartSource;
    dsEmp: TDataSource;
    Fechar: TAction;
    bsEmp1: TBarSeries;
    bsEmp2: TBarSeries;
    bsEmp3: TBarSeries;
    bsEmp4: TBarSeries;
    bsEmp5: TBarSeries;
    asTotEmp: TAreaSeries;
    grFil: TChart;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MenuItem1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    pnFil: TPanel;
    Panel4: TPanel;
    pnEmp: TPanel;
    pg: TPageControl;
    pnGer: TPanel;
    pnGraf: TPanel;
    pmFil: TPopupMenu;
    Splitter1: TSplitter;
    tsFil: TTabSheet;
    tsGeral: TTabSheet;
    procedure cbMrkClick(Sender: TObject);
    procedure cboAbrSelect(Sender: TObject);
    procedure cbValClick(Sender: TObject);
    procedure clFilItemClick(Sender: TObject; Index: integer);
    procedure clFilMouseEnter(Sender: TObject);
    procedure clFilMouseLeave(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PmfilClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure montarGrafico();
    procedure montarCboEqp(codFil: Integer);
  end;

var
  FrmPainel: TFrmPainel;
  Fil: Integer;

implementation

uses dataprincipal, datapainel, vdcon.controller.util, datatabelas;

{$R *.lfm}

{ TFrmPainel }

procedure TFrmPainel.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmPainel.cbMrkClick(Sender: TObject);
begin
  montarGrafico;
end;

procedure TFrmPainel.cboAbrSelect(Sender: TObject);
begin
  montarGrafico;
end;

procedure TFrmPainel.cbValClick(Sender: TObject);
begin
  //if cbVal.Checked
  //then csFil.FieldY:='VLR'
  //else csFil.FieldY:='QTD';
  montarGrafico;
end;

procedure TFrmPainel.clFilItemClick(Sender: TObject; Index: integer);
begin
  montarGrafico;
end;

procedure TFrmPainel.clFilMouseEnter(Sender: TObject);
begin

end;

procedure TFrmPainel.clFilMouseLeave(Sender: TObject);
begin

end;

procedure TFrmPainel.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dmPainel.resFil.Close;
  dsFil.DataSet.Close;
  dsEmp.DataSet.Close;
  DMTab.psqPer.Close;
  DMTab.psqEqpe.Close;
end;

procedure TFrmPainel.FormCreate(Sender: TObject);
var
  I:Integer;
  opcao: TMenuItem;
begin
  Fil:=DMPrincipal.Filial;
  //if Fil=0 then begin
  //  DMTab.AbrirPesquisa(DMTab.psqFiliais,'select * from FILIAIS order by DESCRICAO');
  //  montarComboBox(cboFil,DMTab.psqFiliais,'CODIGO','DESCRICAO',True);
  //end
  //else begin
  //  cboFil.Clear;
  //  cboFil.AddItem(DMPrincipal.UsuFil, NiL);
  //  cboFil.Enabled:=False;
  //  montarCboEqp(Fil);
  //end;
  DMTab.AbrirPesquisa(DMTab.psqPer,'select * from PERIODO order by DTINI desc');
  montarComboBox(cboPer,DMTab.psqPer,'CODIGO','DESCRICAO',False);
  //dmPainel.abrirResumoFiliais(Fil);
  //clEmp.Items.Clear;
  //for I := 0 to Pred(grEmp.SeriesCount) do begin
  //  clEmp.Items.Add( (grEmp.Series[I] as TChartSeries).Title );
  //  clEmp.Checked[I]:=True;
  //end;
  //clEmp.Columns:=grEmp.SeriesCount;
  //clEmp.Width:= 70 * clEmp.Columns;
  montarGrafico;
end;

procedure TFrmPainel.PmfilClick(Sender: TObject);
begin
  montarGrafico;
end;


procedure TFrmPainel.montarGrafico;
var
  I, reg:Integer;
  //dti: TDate;
  fmt: String;
begin

  case cboAbr.ItemIndex of
    0: reg:=12;
    1: reg:=6;
    2: reg:=MonthOf(Now);
  end;

  dmPainel.abrirRes(reg);
  dmPainel.abrirEmp(reg);

  grFil.Title.Text.Clear;
  grEmp.Title.Text.Clear;

  //bsFil1.Active:=False;
  //bsFil3.Active:=False;
  //bsFil2.Active:=False;
  //asTotFil.Active:=False;
  //bsEmp1.Active:=False;
  //bsEmp2.Active:=False;
  //bsEmp3.Active:=False;
  //bsEmp4.Active:=False;
  //bsEmp5.Active:=False;
  //asTotEmp.Active:=False;

  if cbVal.Checked then begin
    grFil.Title.Text.Add('FILIAIS - VENDAS DE COTAS (R$)');
    grEmp.Title.Text.Add('EMPRESAS - VENDAS DE COTAS (R$)');
    csFil1.FieldY:='VLFIL1';
    csFil2.FieldY:='VLFIL2';
    csFil3.FieldY:='VLFIL3';
    csTotFil.FieldY:='TTPER';
    csEmp1.FieldY:='VLEMP1';
    csEmp2.FieldY:='VLEMP2';
    csEmp3.FieldY:='VLEMP3';
    csEmp4.FieldY:='VLEMP4';
    csEmp5.FieldY:='VLEMP5';
    csTotEmp.FieldY:='TTPER';
    fmt:='%9.0n';
  end
  else begin
    grFil.Title.Text.Add('FILIAIS - VENDAS DE COTAS (UNIDADES)');
    grEmp.Title.Text.Add('EMPRESAS - VENDAS DE COTAS (UNIDADES)');
    csFil1.FieldY:='QTFIL1';
    csTotFil.FieldY:='QTPER';
    csFil2.FieldY:='QTFIL2';
    csFil3.FieldY:='QTFIL3';
    csEmp1.FieldY:='QTEMP1';
    csEmp2.FieldY:='QTEMP2';
    csEmp3.FieldY:='QTEMP3';
    csEmp4.FieldY:='QTEMP4';
    csEmp5.FieldY:='QTEMP5';
    csTotEmp.FieldY:='QTPER';
    fmt:='%.0N';
  end;

  bsFil1.Marks.Visible:=cbMrk.Checked;
  bsFil2.Marks.Visible:=cbMrk.Checked;
  bsFil3.Marks.Visible:=cbMrk.Checked;
  asTotFil.Marks.Visible:=cbMrk.Checked;
  bsEmp1.Marks.Visible:=cbMrk.Checked;
  bsEmp2.Marks.Visible:=cbMrk.Checked;
  bsEmp3.Marks.Visible:=cbMrk.Checked;
  bsEmp4.Marks.Visible:=cbMrk.Checked;
  bsEmp5.Marks.Visible:=cbMrk.Checked;
  asTotEmp.Marks.Visible:=cbMrk.Checked;
  asTotFil.Marks.Format:=fmt;
  bsFil1.Marks.Format:=fmt;
  bsFil2.Marks.Format:=fmt;
  bsFil3.Marks.Format:=fmt;
  bsEmp1.Marks.Format:=fmt;
  bsEmp2.Marks.Format:=fmt;
  bsEmp3.Marks.Format:=fmt;
  bsEmp4.Marks.Format:=fmt;
  bsEmp5.Marks.Format:=fmt;
  asTotEmp.Marks.Format:=fmt;
  grFil.LeftAxis.Marks.Format:=fmt;
  grEmp.LeftAxis.Marks.Format:=fmt;

  //for I := 0 to Pred(clFil.Items.Count) do
  //  if clFil.Checked[I] then begin
  //    case I of
  //      0: bsFil1.Active:=True;
  //      1: bsFil2.Active:=True;
  //      2: bsFil3.Active:=True;
  //      3: asTotFil.Active:=True;
  //    end;
  //  end;

  //for I := 0 to Pred(clEmp.Items.Count) do
  //  if clEmp.Checked[I] then begin
  //    case I of
  //      0: bsEmp1.Active:=True;
  //      1: bsEmp2.Active:=True;
  //      2: bsEmp3.Active:=True;
  //      3: bsEmp4.Active:=True;
  //      4: bsEmp5.Active:=True;
  //      5: asTotEmp.Active:=True;
  //    end;
  //  end;

  //dmPainel.resFil.First;
  //
  //while not dmPainel.resFil.EOF do begin
  //  dti:=StartOfTheMonth(dmPainel.resFilDTFIM.Value);
  //  anomes:=StrToInt(FormatDateTime('yyyymm',StartOfTheMonth(dmPainel.resFilDTFIM.Value)));
  //  case dmPainel.resFilCDFIL.AsInteger of
  //    1: begin
  //      if cbVal.Checked
  //      then bsFil1.AddXY(anomes,dmPainel.resFilVLR.Value)
  //      else bsFil1.AddXY(anomes,dmPainel.resFilQTD.Value);
  //      //bsFil1.AddX(dmPainel.resFilDTFIM.Value,dmPainel.resFilDCPER.Value,clRed);
  //      //if cbVal.Checked
  //      //then bsFil1.AddY(dmPainel.resFilVLR.Value, '', clRed)
  //      //else bsFil1.AddY(dmPainel.resFilQTD.Value, '', clRed);
  //    end;
  //    2: begin
  //      if cbVal.Checked
  //      then bsFil2.AddXY(anomes,dmPainel.resFilVLR.Value)
  //      else bsFil2.AddXY(anomes,dmPainel.resFilQTD.Value);
  //      //bsFil2.AddX(dmPainel.resFilDTFIM.Value,dmPainel.resFilDCPER.Value,clRed);
  //      //if cbVal.Checked
  //      //then bsFil2.AddY(dmPainel.resFilVLR.Value, '', clRed)
  //      //else bsFil2.AddY(dmPainel.resFilQTD.Value, '', clRed);
  //    end;
  //    3: begin
  //      if cbVal.Checked
  //      then bsFil3.AddXY(anomes,dmPainel.resFilVLR.Value)
  //      else bsFil3.AddXY(anomes,dmPainel.resFilQTD.Value);
  //      //bsFil3.AddX(dmPainel.resFilDTFIM.Value,dmPainel.resFilDCPER.Value,clRed);
  //      //if cbVal.Checked
  //      //then bsFil3.AddY(dmPainel.resFilVLR.Value, '', clRed)
  //      //else bsFil3.AddY(dmPainel.resFilQTD.Value, '', clRed);
  //    end;
  //  end;
  //  dmPainel.resFil.Next;
  //end;

  //pst:=bsFil1.Count;
  //if pst <  bsFil2.Count
  //then pst:=bsFil2.Count;
  //if pst < bsFil3.Count
  //then pst:=bsFil3.Count;
  //
  //grFil.BottomAxis.Intervals.Count:=pst;

end;

procedure TFrmPainel.montarCboEqp(codFil: Integer);
begin
  DMTab.AbrirPesquisa(DMTab.psqEqpe,Format(
       'select * from EQUIPES where FILIAL = %d order by DESCRICAO',
               [codFil]));
  montarComboBox(cboEqp,DMTab.psqEqpe,'CODIGO','DESCRICAO',True);
  cboEqp.ItemIndex:=0;
end;

end.

