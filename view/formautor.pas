unit formautor;

{$MODE Delphi}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ActnList, StdCtrls;

type
  TFrmAutor = class(TForm)
    AL: TActionList;
    Autorizar: TAction;
    Cancelar: TAction;
    btGravar: TSpeedButton;
    btCancelar: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    lblTipo: TLabel;
    Panel3: TPanel;
    edSenha: TEdit;
    pnMenu: TPanel;
    procedure AutorizarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAutor: TFrmAutor;

implementation

{$R *.lfm}

procedure TFrmAutor.AutorizarExecute(Sender: TObject);
begin
  if edSenha.Text='Corvette'
  then ModalResult := mrOk
  else ModalResult := mrCancel;
end;

procedure TFrmAutor.CancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;


end.
