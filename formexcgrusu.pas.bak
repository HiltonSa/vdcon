unit formexcgrusu;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, Grids, DBGrids, MaskEdit, ExtCtrls, ImgList,
  ActnList, DB;

type

  { TFrmExcGrUsu }

  TFrmExcGrUsu = class(TForm)
    AL: TActionList;
    Aplicar: TAction;
    Cancelar: TAction;
    edCod: TEdit;
    edDesc: TEdit;
    lbl: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    rbZero: TRadioButton;
    rbSubs: TRadioButton;
    rbExcluir: TRadioButton;
    cboNovo: TComboBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    btCancelar: TSpeedButton;
    procedure rbZeroClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelarExecute(Sender: TObject);
    procedure AplicarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SubstituirBeneficiarios(Novo, Antigo: Integer);
    procedure montarCboExceto(cod: Integer);
  end;

var
  FrmExcGrUsu: TFrmExcGrUsu;

implementation

uses DataPrincipal, util;

{$R *.lfm}

{ TFrmExcGrUsu }

procedure TFrmExcGrUsu.AplicarExecute(Sender: TObject);
var
   Novo: Integer;
   blnFechar: Boolean;
begin
  Novo := StrToIntDef(Copy(cboNovo.Text,1,2),0);
  blnFechar := True;
  if ConfirmaMensagem('Confirma a ATUALIZAÇÃO?') then begin
     if rbZero.Checked
     then SubstituirBeneficiarios(0,DMPrincipal.cdsPsqGrUsuCODIGO.Value)
     else if (rbSubs.Checked) and (Novo > 0)
     then SubstituirBeneficiarios(Novo,DMPrincipal.cdsPsqGrUsuCODIGO.Value)
     else blnFechar := rbExcluir.Checked;
     if blnFechar
     then ModalResult := mrOk;
  end;
end;

procedure TFrmExcGrUsu.CancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmExcGrUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
end;

procedure TFrmExcGrUsu.FormCreate(Sender: TObject);
begin
  lbl.Caption:=Format('Encontrados %d usuários com esse grupo.',
                                   [DMPrincipal.qry.RecordCount]);
  edCod.Text:=retornaCodigoFormatado(DMPrincipal.cdsPsqGrUsuCODIGO.Value,2);
  edDesc.Text:=DMPrincipal.cdsPsqGrUsuDESCRICAO.Value;
  cboNovo.Clear;
end;

procedure TFrmExcGrUsu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Aplicar.Execute;
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmExcGrUsu.rbZeroClick(Sender: TObject);
begin
  if cboNovo.Items.Count=0
  then montarCboExceto(DMPrincipal.cdsPsqGrUsuCODIGO.Value);
  cboNovo.Visible := rbSubs.Checked;
end;

procedure TFrmExcGrUsu.SubstituirBeneficiarios(Novo, Antigo: Integer);
begin
  if Novo=0
  then DMPrincipal.executarComando(
       Format('update ZZ_USUARIOS set GRUSU=0, ATIVO=0 where GRUSU=%d',[Antigo]))
  else DMPrincipal.ExecutarComando(
        Format('update ZZ_USUARIOS set GRUSU=%d where GRUSU=%d',[Novo,Antigo]));
end;

procedure TFrmExcGrUsu.montarCboExceto(cod: Integer);
begin
  cboNovo.Clear;
  if DMPrincipal.executarSQL('select * from ZZ_GRUSU order by CODIGO')
  then begin
    while not DMPrincipal.qry.EOF do begin
      if cod  <> DMPrincipal.qry.FieldByName('CODIGO').AsInteger
      then cboNovo.Items.Add(Format('%.2d %-15s',
           [DMPrincipal.qry.FieldByName('CODIGO').AsInteger,
           DMPrincipal.qry.FieldByName('DESCRICAO').AsString]));
      DMPrincipal.qry.Next;
    end;
  end;
end;

end.
