unit vdcon.view.mensagens;

{$mode objfpc}{$H+}

interface

uses
  Windows,  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  Buttons;

type

  { TFrmMsg }

  TFrmMsg = class(TForm)
    btSim: TImage;
    btNao: TImage;
    Pnmsg: Tpanel;
    pnTela: TPanel;
    procedure btNaoClick(Sender: TObject);
    procedure btSimClick(Sender: TObject);
    procedure Formcreate(Sender: Tobject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Fbt: Integer;
    procedure Setbt(AValue: Integer);
    { private declarations }
  public
    { public declarations }
    property bt: Integer read Fbt write Setbt;
  end;

var
  FrmMsg: TFrmMsg;

implementation

{$R *.lfm}

{ TFrmMsg }

procedure TFrmMsg.btNaoClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFrmMsg.btSimClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure Tfrmmsg.Formcreate(Sender: Tobject);
begin
  pnTela.Left:=(Screen.Width - pnTela.Width) {div 2};
  pnTela.Top:=(Screen.Height - pnTela.Height) {div 2};
End;

procedure TFrmMsg.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  case Key of
    VK_F2: if btSim.Visible then btSimClick(nil);
    VK_ESCAPE: btNaoClick(nil);
    else MessageBeep(MB_ICONERROR);
  end;
end;

procedure TFrmMsg.Setbt(AValue: Integer);
begin
  Fbt:=AValue;
  btSim.Visible := (Fbt = 1);
end;

end.

