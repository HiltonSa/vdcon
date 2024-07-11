unit vdcon.view.login;

{$MODE Delphi}

interface

uses
   LCLIntf, LCLType,  SysUtils, Variants, Classes, Graphics, db, vdcon.model.interfaces,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, vdcon.controller,
  vdcon.controller.interfaces, vdcon.controller.ambiente;

type

  { TFrmLogin }

  TFrmLogin = class(TForm)
    Image1: TImage;
    btnOk: TImage;
    btnCancelar: TImage;
    pnUsu: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    EdtUsu: TEdit;
    Label2: TLabel;
    EdtSen: TEdit;
    procedure Formcreate(Sender: Tobject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FAmbiente: TAmbiente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses vdcon.controller.util;

{$R *.lfm}

procedure Tfrmlogin.Btncancelarclick(Sender: Tobject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrmlogin.Btnokclick(Sender: Tobject);
var
  vDataSet: TDataSet;
begin
  vDataSet := TController.New.Entidades.Usuarios.VerificarUsuario(EdtUsu.Text,EdtSen.Text);

  if vDataSet.IsEmpty
  then begin
      MostraErro('Usuário/Senha Inválido!');
      EdtUsu.Clear;
      EdtSen.Clear;
      EdtUsu.SetFocus;
    end
  else begin
      FAmbiente.SetarAmbiente(vDataSet);
      ModalResult := mrOk
  end;
end;


procedure Tfrmlogin.Formkeydown(Sender: Tobject;
  var Key: Word; Shift: Tshiftstate);
begin
  if Key = VK_RETURN
  then if EdtSen.Focused then btnOkClick(nil)
       else SelectNext(ActiveControl,True,True);

end;

procedure Tfrmlogin.Formcreate(Sender: Tobject);
begin
  FAmbiente:= TAMBIENTE.New;

  pnUsu.Top := (Screen.Height - pnUsu.Height) div 2;
  pnUsu.Left:= (Screen.Width - pnUsu.Width) div 2;
End;

end.
