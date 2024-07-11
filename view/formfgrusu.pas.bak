unit formfgrusu;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, DB, Buttons, StdCtrls, MaskEdit,
  DBCtrls, ExtCtrls, Menus;

type

  { TFrmFGrUsu }

  TFrmFGrUsu = class(TForm)
    ds: TDataSource;
    AL: TActionList;
    edDesc: TEdit;
    edCod: TEdit;
    Gravar: TAction;
    Cancelar: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure GravarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
  private
    Falterando: Boolean;
    procedure Setalterando(AValue: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property alterando: Boolean read Falterando write Setalterando;
  end;

var
  FrmFGrUsu: TFrmFGrUsu;

implementation

uses dataprincipal, util;

{$R *.lfm}

procedure TFrmFGrUsu.CancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmFGrUsu.Setalterando(AValue: Boolean);
begin
  Falterando:=AValue;
  if Falterando
  then begin
    Caption := 'Alterando Grupo de Usuários';
    edCod.Text:=retornaCodigoFormatado(DMPrincipal.cdsPsqGrUsuCODIGO.Value,2);
    edDesc.Text := DMPrincipal.cdsPsqGrUsuDESCRICAO.Value;
  end
  else Caption := 'Incluindo Grupo de Usuários';
end;

procedure TFrmFGrUsu.FormCreate(Sender: TObject);
begin
end;

procedure TFrmFGrUsu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: Gravar.Execute;
    VK_ESCAPE: Cancelar.Execute;  
  end;
end;

procedure TFrmFGrUsu.GravarExecute(Sender: TObject);
begin
  if edDesc.Text = '' then begin
    MostraAviso('Precisa informar DESCRIÇÃO!');
    edDesc.SetFocus;
  end
  else if ConfirmaMensagem('Confirma a gravação?') then begin
    if alterando
    then DMPrincipal.manterGrUsu(1,DMPrincipal.cdsPsqGrUsuCODIGO.Value,edDesc.Text)
    else DMPrincipal.manterGrUsu(0,0,edDesc.Text);
    ModalResult := mrOk;
  end;

end;

end.
