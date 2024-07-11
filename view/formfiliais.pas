unit formfiliais;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, datatabelas, LCLType;

type

  { TFrmFiliais }

  TFrmFiliais = class(TForm)
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
    stBar: TStatusBar;
    procedure AlterarExecute(Sender: TObject);
    procedure dsPesqStateChange(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IncluirExecute(Sender: TObject);
    procedure PesqExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function AbrirFicha(alt: Boolean): TModalResult;
  end;

var
  FrmFiliais: TFrmFiliais;

implementation

uses dataprincipal, formffilial, formusuarios, vdcon.controller.util;

{$R *.lfm}

{ TFrmFiliais }

procedure TFrmFiliais.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmFiliais.ExcluirExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a exclusão?') then begin
    DMTab.manterFilial(2,DMTab.psqFiliaisCODIGO.Value,0,'','');
    dsPesq.DataSet.Refresh;
  end;
end;

procedure TFrmFiliais.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmFiliais.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmFiliais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmFiliais.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmFiliais.PesqExecute(Sender: TObject);
var
  strSql : string;
begin
  if cboCampo.ItemIndex = 0
  then strSql := Format('select * from FILIAIS where CODIGO=%d',
              [StrToIntDef(edtPesq.Text,0)])
  else strSql := Format('select * from FILIAIS where DESCRICAO like %s order by DESCRICAO',
       [QuotedStr(edtPesq.Text+'%')]);
  if DMPrincipal.AbrirPesquisa(DMTab.psqFiliais,strSql)
  then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
         [DMTab.psqFiliais.RecordCount,edtPesq.Text])
  else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);
end;

procedure TFrmFiliais.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOK
  then dsPesq.DataSet.Refresh;
end;

function TFrmFiliais.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFFilial := TFrmFFilial.Create(nil);
  try
    FrmFFilial.alterando:=alt;
    Result := FrmFFilial.ShowModal;
  finally
    FrmFFilial.Free;
  end;
end;

end.

