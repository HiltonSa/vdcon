unit formtrsenha;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MaskEdit, DBCtrls, ExtCtrls, ImgList, ActnList, DB;

type

  { TFrmTrSenha }

  TFrmTrSenha = class(TForm)
    ds: TDataSource;
    AL: TActionList;
    Gravar: TAction;
    Cancelar: TAction;
    Panel1: TPanel;
    Label2: TLabel;
    edDesc: TDBEdit;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    edtAtual: TEdit;
    Label1: TLabel;
    edtNova: TEdit;
    Label3: TLabel;
    EdtConf: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GravarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrSenha: TFrmTrSenha;

implementation

uses DataPrincipal, util;

{$R *.lfm}

procedure TFrmTrSenha.CancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmTrSenha.FormCreate(Sender: TObject);
begin
  DMPrincipal.PosicionarDataset(DMPrincipal.cdsUsu,DMPrincipal.UsuCod);
end;

procedure TFrmTrSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmTrSenha.GravarExecute(Sender: TObject);
begin
  if DMPrincipal.SenhaCorreta(edtAtual.Text) then begin
     if edtNova.Text <> EdtConf.Text then begin
        MostraErro('Nova Senha não confere!');
        edtNova.Clear;
        EdtConf.Clear;
        edtNova.SetFocus;
     end
     else
       if ConfirmaMensagem('Confirma a nova senha?') then begin
            DMPrincipal.AlterarSenha(edtNova.Text);
            ModalResult := mrOk;
       end;
  end
  else MostraErro('Senha Inválida!');

end;

end.
