unit formgrusu;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls,
  ImgList, ActnList, formfgrusu, DB;

type

  { TFrmGrUsu }

  TFrmGrUsu = class(TForm)
    dsPesq: TDataSource;
    AL: TActionList;
    grPesq: TDBGrid;
    nvPesq: TDBNavigator;
    Panel2: TPanel;
    Incluir: TAction;
    Alterar: TAction;
    Excluir: TAction;
    Fechar: TAction;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    stBar: TStatusBar;
    Rotinas: TAction;
    SpeedButton5: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure RotinasExecute(Sender: TObject);
    procedure IncluirExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FecharExecute(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure dsPesqStateChange(Sender: TObject);
    procedure AlterarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function AbrirFicha(alterar: Boolean): TModalResult;
  end;

var
  FrmGrUsu: TFrmGrUsu;

implementation

uses DataPrincipal, formexcgrusu, formrotgru, util;

{$R *.lfm}

{ TFrmGrUsu }

function TFrmGrUsu.AbrirFicha(alterar: Boolean): TModalResult;
begin
  FrmFGrUsu := TFrmFGrUsu.Create(nil);
  try
    FrmFGrUsu.alterando:=alterar;
    Result := FrmFGrUsu.ShowModal;
  finally
    FrmFGrUsu.Free;
  end;
end;

procedure TFrmGrUsu.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True)=mrOK
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmGrUsu.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
  Rotinas.Enabled := Alterar.Enabled;
end;

procedure TFrmGrUsu.ExcluirExecute(Sender: TObject);
var
   blnExcluir: Boolean;
begin
  //blnExcluir := False;
  //if DMPrincipal.executarSQL(Format(
  //    'select CODIGO, USUARIO from ZZ_USUARIOS where GRUSU=%d',
  //    [DMPrincipal.cdsPsqGrUsuCODIGO.Value])) then begin
  //   FrmExcGrUsu := TFrmExcGrUsu.Create(nil);
  //   try
  //      blnExcluir := (FrmExcGrUsu.ShowModal = mrOk);
  //   finally
  //     FrmExcGrUsu.Free;
  //   end;
  //end
  //else blnExcluir := ConfirmaMensagem('Confirma a exclusão?');

  if ConfirmaMensagem('Confirma a exclusão?') then begin
     DMPrincipal.manterGrUsu(2,DMPrincipal.cdsPsqGrUsuCODIGO.Value,'');
     dsPesq.DataSet.Refresh;
  end;

end;

procedure TFrmGrUsu.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmGrUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmGrUsu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   //VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmGrUsu.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmGrUsu.RotinasExecute(Sender: TObject);
begin
  DMPrincipal.IncluirRotinas(0,DMPrincipal.cdsPsqGrUsuCODIGO.Value);
  FrmRotGru := TFrmRotGru.Create(nil);
  try
     FrmRotGru.ShowModal;
  finally
    FrmRotGru.Free;
  end;
end;

procedure TFrmGrUsu.FormCreate(Sender: TObject);
begin
  dsPesq.DataSet.Open;
end;

end.
