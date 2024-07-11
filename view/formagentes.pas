unit formagentes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ActnList, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, formfagente, LCLType ;

type

  { TFrmAgentes }

  TFrmAgentes = class(TForm)
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
  FrmAgentes: TFrmAgentes;

implementation

uses dataprincipal, vdcon.controller.util, datatabelas;

{$R *.lfm}

{ TFrmAgentes }

procedure TFrmAgentes.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOK
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmAgentes.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmAgentes.ExcluirExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a exclusão?') then begin
    DMTab.manterAgente(2,DMTab.psqAgentesCODIGO.Value,0,0,0,'','','','','');
    dsPesq.DataSet.Refresh;
  end;
end;

procedure TFrmAgentes.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmAgentes.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmAgentes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmAgentes.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmAgentes.PesqExecute(Sender: TObject);
var
  strSql : string;
begin
  if DMPrincipal.Filial = 0
  then strSql:='select A.* from AGENTES A '
  else strSql:='select a.* from AGENTES A '+
               'inner join EQUIPES E on E.CODIGO=A.EQUIPE and E.FILIAL='+
                IntToStr(DMPrincipal.Filial);
  if cboCampo.ItemIndex = 0
  then strSql := Format('%s where A.CODIGO=%d ',
              [strSql,StrToIntDef(edtPesq.Text,0)])
  else strSql := Format('%s where A.NOME like %s order by A.NOME',
       [strSql,QuotedStr('%'+edtPesq.Text+'%')]);
  if DMPrincipal.AbrirPesquisa(DMTab.psqAgentes,strSql)
  then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
         [DMTab.psqAgentes.RecordCount,edtPesq.Text])
  else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);
end;

function TFrmAgentes.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFAgente := TFrmFAgente.Create(nil);
  try
    FrmFAgente.atualizando:=alt;
    Result := FrmFAgente.ShowModal;
  finally
    FrmFAgente.Free;
  end;
end;

end.

