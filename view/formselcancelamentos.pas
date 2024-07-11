unit formselcancelamentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, dateutils, LCLType;

type

  { TFrmSelCancelamentos }

  TFrmSelCancelamentos = class(TForm)
    AL: TActionList;
    edFim: TDateTimePicker;
    edIni: TDateTimePicker;
    Fechar: TAction;
    imp: TAction;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure edFimExit(Sender: TObject);
    procedure edIniExit(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure impExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmSelCancelamentos: TFrmSelCancelamentos;

implementation

uses dataprincipal, datavendas, vdcon.controller.util, relcancelamentos;

{$R *.lfm}

{ TFrmSelCancelamentos }

procedure TFrmSelCancelamentos.FormCreate(Sender: TObject);
begin
  edIni.Date:=StartOfTheMonth(Date);
  edFim.Date:=EndOfTheMonth(Date);
end;

procedure TFrmSelCancelamentos.edIniExit(Sender: TObject);
begin
  edFim.Date:=EndOfTheMonth(edIni.Date);
end;

procedure TFrmSelCancelamentos.edFimExit(Sender: TObject);
begin
  if edIni.Date > edFim.Date then begin
    MostraAviso('Data FINAL deve ser maior que a data INICIAL!');
    edFim.Date:=EndOfTheMonth(edIni.Date);
    edFim.SetFocus;
  end;
end;

procedure TFrmSelCancelamentos.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelCancelamentos.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMVendas.can.Close;
end;

procedure TFrmSelCancelamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmSelCancelamentos.impExecute(Sender: TObject);
begin
  if DMVendas.abrirCancelamentos(edIni.Date, edFim.Date) then begin
    FrmRelCancelamentos := TFrmRelCancelamentos.Create(nil);
    try
      FrmRelCancelamentos.RP.Title:=Format('CANCELAMENTOS ENTRE %s E %s',
             [DateToStr(edIni.Date), DateToStr(edFim.Date)]);
      FrmRelCancelamentos.RP.PreviewModal;
    finally
      FrmRelCancelamentos.Free;
    end;

  end
  else MostraAviso('Cancelamentos não encontrados!');
end;

end.

