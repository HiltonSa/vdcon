unit formequipes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, LCLType;

type

  { TFrmEquipes }

  TFrmEquipes = class(TForm)
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
    procedure dsPesqDataChange(Sender: TObject; Field: TField);
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
  FrmEquipes: TFrmEquipes;

implementation

uses dataprincipal, datatabelas, util, formfequipe;

{$R *.lfm}

{ TFrmEquipes }

procedure TFrmEquipes.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True)=mrOK
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmEquipes.dsPesqDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFrmEquipes.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmEquipes.ExcluirExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a exclusão?') then begin
    DMTab.manterEquipe(2,DMTab.psqEqpeCODIGO.Value,0,0,'');
    dsPesq.DataSet.Refresh;
  end;
end;

procedure TFrmEquipes.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmEquipes.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmEquipes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmEquipes.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmEquipes.PesqExecute(Sender: TObject);
var
  strSql : string;
begin
  if cboCampo.ItemIndex = 0
  then strSql := Format('select * from EQUIPES where CODIGO=%d',
              [StrToIntDef(edtPesq.Text,0)])
  else strSql := Format('select * from EQUIPES where DESCRICAO like %s order by DESCRICAO',
       [QuotedStr(edtPesq.Text+'%')]);
  if DMPrincipal.AbrirPesquisa(DMTab.psqEqpe,strSql)
  then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
         [DMTab.psqEqpe.RecordCount,edtPesq.Text])
  else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);

end;

function TFrmEquipes.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFEquipe := TFrmFEquipe.Create(nil);
  try
     FrmFEquipe.alterando:=alt;
     Result:=FrmFEquipe.ShowModal;
  finally
    FrmFEquipe.Free;
  end;
end;

end.

