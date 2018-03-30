unit formlogin;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    EdtUsu: TEdit;
    Label2: TLabel;
    EdtSen: TEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses DataPrincipal, util;

{$R *.lfm}

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
begin
  if DMPrincipal.ValidarUsuario(EdtUsu.Text,EdtSen.Text)
  then ModalResult := mrOk
  else begin
    MostraErro('Usuário/Senha Inválido!');
    EdtUsu.Clear;
    EdtSen.Clear;
    EdtUsu.SetFocus;
  end;
end;


procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN
  then if EdtSen.Focused then btnOk.Click
       else SelectNext(ActiveControl,True,True);
end;

end.
