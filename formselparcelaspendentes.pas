unit formselparcelaspendentes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics, LCLType,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls;

type

  { TFrmSelParcelasPendentes }

  TFrmSelParcelasPendentes = class(TForm)
    AL: TActionList;
    dtVenc: TDateTimePicker;
    Fechar: TAction;
    imp: TAction;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
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
  FrmSelParcelasPendentes: TFrmSelParcelasPendentes;

implementation

uses datavendas, dataprincipal, util;

{$R *.lfm}

{ TFrmSelParcelasPendentes }

procedure TFrmSelParcelasPendentes.FormCreate(Sender: TObject);
begin
     dtVenc.Date:=Date;
end;

procedure TFrmSelParcelasPendentes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   //VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmSelParcelasPendentes.impExecute(Sender: TObject);
begin
  if DMVendas.abrirPendenciaComissao(1,'')
  then DMVendas.imprimirParcelasPendentes
  else MostraAviso('Parcelas não encontradas!');
end;

procedure TFrmSelParcelasPendentes.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmSelParcelasPendentes.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  DMVendas.pnd.Close;
end;

end.

