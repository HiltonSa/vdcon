unit formffaixa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls, LCLType;

type

  { TFrmFFaixa }

  TFrmFFaixa = class(TForm)
    AL: TActionList;
    edMax: TDBEdit;
    edMin: TDBEdit;
    edCod: TDBEdit;
    edDesc: TDBEdit;
    fxa: TBufDataset;
    Cancelar: TAction;
    ds: TDataSource;
    fxaCod: TLongintField;
    fxaDesc: TStringField;
    fxaEmp: TLongintField;
    fxaMax: TFloatField;
    fxaMin: TFloatField;
    Gravar: TAction;
    Label2: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure CancelarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GravarExecute(Sender: TObject);
  private
    Fatualizando: Boolean;
    procedure Setatualizando(AValue: Boolean);
    { private declarations }
  public
    { public declarations }
    property atualizando: Boolean read Fatualizando write Setatualizando;
  end;

var
  FrmFFaixa: TFrmFFaixa;

implementation

uses dataprincipal, vdcon.controller.util;

{$R *.lfm}

{ TFrmFFaixa }

procedure TFrmFFaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmFFaixa.CancelarExecute(Sender: TObject);
begin
  fxa.Cancel;
  ModalResult:=mrCancel;
end;

procedure TFrmFFaixa.GravarExecute(Sender: TObject);
begin
  if (fxaDesc.IsNull) or (fxaDesc.Value='') then begin
    MostraAviso('DESCRIÇÃO deve ser informada!');
    edDesc.SetFocus;
  end
  else if fxaMin.Value <=0 then begin
    MostraAviso('INTERVALO MINIMO deve ser informado!');
    edMin.SetFocus;
  end
  else if fxaMax.Value <= fxaMin.Value then begin
    MostraAviso('MAXIMO dev ser maior que o MINIMO!');
    edMax.SetFocus;
  end
  else if ConfirmaMensagem('Confirma a gravação?') then begin
    if Fatualizando
    then DMPrincipal.manterFaixas(1,
                                    fxaCod.Value,
                                    fxaEmp.Value,
                                    fxaDesc.Value,
                                    fxaMin.Value,
                                    fxaMax.Value)
    else DMPrincipal.manterFaixas(0, 0,
                                       fxaEmp.Value,
                                       fxaDesc.Value,
                                       fxaMin.Value,
                                       fxaMax.Value);
    fxa.Close;
    ModalResult:=mrOK;
  end;
end;

procedure TFrmFFaixa.Setatualizando(AValue: Boolean);
begin
  fxa.CreateDataset;
  fxa.Append;
  Fatualizando:=AValue;
  if Fatualizando then begin
    Caption:='Atualizando Faixa de Comissão';
    fxaEmp.Value:=DMPrincipal.psqFaixaEMPRESA.Value;
    fxaDesc.Value:=DMPrincipal.psqFaixaDESCRICAO.Value;
    fxaMax.Value:=DMPrincipal.psqFaixaMAXIMO .Value;
    fxaMin.Value:=DMPrincipal.psqFaixaMINIMO.Value;
    fxaCod.Value:=DMPrincipal.psqFaixaCODIGO.Value;
  end
  else  begin
    Caption:='Incluindo Faixa de Comissão';
    fxaEmp.Value:=DMPrincipal.psqEmpCODIGO.Value;
  end;
end;

end.

