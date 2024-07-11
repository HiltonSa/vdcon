unit formrotgru;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MaskEdit, DBCtrls, ExtCtrls, DB, Buttons, ImgList, ActnList,
  Grids, DBGrids;

type

  { TFrmRotGru }

  TFrmRotGru = class(TForm)
    edCod: TEdit;
    edDesc: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    grRot: TDBGrid;
    nvBen: TDBNavigator;
    dsRot: TDataSource;
    AL: TActionList;
    Alterar: TAction;
    Fechar: TAction;
    Panel1: TPanel;
    btCancelar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dsFrm: TDataSource;
    Panel3: TPanel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    PrxFrm: TAction;
    AntFrm: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    AltTodos: TAction;
    SpeedButton4: TSpeedButton;
    edQtdRot: TEdit;
    procedure AltTodosExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure AntFrmExecute(Sender: TObject);
    procedure PrxFrmExecute(Sender: TObject);
    procedure grRotDblClick(Sender: TObject);
    procedure AlterarExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RolarFormulario(Sentido: integer);
  end;

var
  FrmRotGru: TFrmRotGru;
  Prv: integer;

implementation

uses DataPrincipal, vdcon.controller.util;

{$R *.lfm}

procedure TFrmRotGru.AltTodosExecute(Sender: TObject);
begin
  if Prv = 0
  then Prv := 1
  else Prv := 0;
  DMPrincipal.ExecutarComando(
     Format('update ZZ_ITGRU set PRIVIL=%d where GRUSU=%d and FORMULARIO=%s',
                    [Prv,DMPrincipal.cdsPsqGrUsuCODIGO.Value,
                    QuotedStr(DMPrincipal.qryFrmFORMULARIO.Value)]));
  dsRot.DataSet.Refresh;
end;

procedure TFrmRotGru.AntFrmExecute(Sender: TObject);
begin
  RolarFormulario(0);
end;

procedure TFrmRotGru.grRotDblClick(Sender: TObject);
begin
  Alterar.Execute;  
end;

procedure TFrmRotGru.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmRotGru.FormCreate(Sender: TObject);
begin
  edCod.Text:=retornaCodigoFormatado(DMPrincipal.cdsPsqGrUsuCODIGO.Value,2);
  edDesc.Text:=DMPrincipal.cdsPsqGrUsuDESCRICAO.Value;
  if not DMPrincipal.qryFrm.Active
  then DMPrincipal.qryFrm.Open;
  DMPrincipal.qryFrm.First;
  DMPrincipal.PosicionarItGru(DMPrincipal.cdsPsqGrUsuCODIGO.Value,
                                         DMPrincipal.qryFrmFORMULARIO.Value);
  Prv := 1;
  edQtdRot.Text := retornaCodigoFormatado(DMPrincipal.cdsItGru.RecordCount,4);
end;

procedure TFrmRotGru.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if grRot.Focused then Alterar.Execute;
   VK_RIGHT: PrxFrm.Execute;
   VK_LEFT: AntFrm.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmRotGru.PrxFrmExecute(Sender: TObject);
begin
  RolarFormulario(1);
end;

procedure TFrmRotGru.RolarFormulario(Sentido: integer);
begin
  if Sentido = 0 then DMPrincipal.qryFrm.Prior;
  if Sentido = 1 then DMPrincipal.qryFrm.Next;
  DMPrincipal.PosicionarItGru(DMPrincipal.cdsPsqGrUsuCODIGO.Value,
                                       DMPrincipal.qryFrmFORMULARIO.Value);
end;

procedure TFrmRotGru.AlterarExecute(Sender: TObject);
begin
  if DMPrincipal.cdsItGruPRIVIL.Value = 0
  then Prv:=1
  else Prv:=0;

  DMPrincipal.ExecutarComando(
       Format('update ZZ_ITGRU set PRIVIL=%d where GRUSU=%d and ROTINA=%d',
                    [Prv,DMPrincipal.cdsPsqGrUsuCODIGO.Value,
                    DMPrincipal.cdsItGruROTINA.Value]));

  DMPrincipal.cdsItGru.Refresh;
end;

end.
