unit formusuarios;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, ComCtrls, Buttons, StdCtrls, ExtCtrls,
  ImgList, ActnList, vdcon.controller.util, DB;

type

  { TFrmUsuarios }

  TFrmUsuarios = class(TForm)
    dsPesq: TDataSource;
    AL: TActionList;
    Pesq: TAction;
    Incluir: TAction;
    Alterar: TAction;
    Excluir: TAction;
    Fechar: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtPesq: TEdit;
    cboCampo: TComboBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btPesq: TSpeedButton;
    stBar: TStatusBar;
    grPesq: TDBGrid;
    nvPesq: TDBNavigator;
    procedure PesqExecute(Sender: TObject);
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
  FrmUsuarios: TFrmUsuarios;

implementation

uses DataPrincipal, formfusu;

{$R *.lfm}

procedure TFrmUsuarios.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOk
  then dsPesq.DataSet.Refresh;
end;

function TFrmUsuarios.AbrirFicha(alterar: Boolean): TModalResult;
begin
  FrmFUsu := TFrmFUsu.Create(nil);
  try
     FrmFUsu.Alterando:=alterar;
     Result:=FrmFUsu.ShowModal;
  finally
    FrmFUsu.Free;
  end;
end;

procedure TFrmUsuarios.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmUsuarios.ExcluirExecute(Sender: TObject);
var
   temRegistro: Boolean;
   stSql: String;
begin
  //stSql :=
  //   'select * from %s where usuario = '+ DMPrincipal.cdsUsuCODIGO.AsString;
  //
  //temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['AUTOR']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['BENEFICIARIOS']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['CAIXA']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['EMICOB']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['MVEST']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['MVFIN']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['MVLAN']));
  //if not temRegistro
  //then temRegistro := DMPrincipal.ExecutarSql(Format(stSql,['OBSERVACOES']));
  //if not temRegistro then begin
    if ConfirmaMensagem('Confirma a exclusão?') then begin
      DMPrincipal.manterUsuario(2,DMPrincipal.cdsPesqUsuCODIGO.Value,0,0,0,'','','');
      dsPesq.DataSet.Refresh;
    end;
  //end
  //else MostraAviso('Impossível excluir usuário!');
end;

procedure TFrmUsuarios.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmUsuarios.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmUsuarios.PesqExecute(Sender: TObject);
var
  strSql : string;
begin
  if cboCampo.ItemIndex = 0
  then strSql := Format('select * from ZZ_USUARIOS where CODIGO=%d',
              [StrToIntDef(edtPesq.Text,0)])
  else strSql := Format('select * from ZZ_USUARIOS where USUARIO like %s order by USUARIO',
       [QuotedStr(edtPesq.Text+'%')]);
  if DMPrincipal.AbrirPesquisa(DMPrincipal.cdsPesqUsu,strSql)
  then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
         [DMPrincipal.cdsPesqUsu.RecordCount,edtPesq.Text])
  else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);
end;

end.
