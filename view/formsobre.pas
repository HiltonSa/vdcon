unit formsobre;

{$MODE Delphi}

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, DataPrincipal;

type

  { TFrmSobre }

  TFrmSobre = class(TForm)
    lbProtocol: TLabel;
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    lbVersao: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.lfm}

procedure TFrmSobre.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TFrmSobre.FormShow(Sender: TObject);
begin
  lbProtocol.Caption:=Format('Lazarus e %s',[DMPrincipal.Protocolo]);
end;

procedure TFrmSobre.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSobre.Panel1Click(Sender: TObject);
begin
  Close;
end;

end.
 
