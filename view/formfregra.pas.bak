unit formfregra;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, DBDateTimePicker, Forms,LCLType,
  Controls, Graphics, Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DbCtrls;

type

  { TFrmFRegra }

  TFrmFRegra = class(TForm)
    AL: TActionList;
    cboEmp: TDBLookupComboBox;
    cboFaixa: TDBLookupComboBox;
    dsFai: TDataSource;
    dsEmp: TDataSource;
    edPct: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    reg: TBufDataset;
    Cancelar: TAction;
    ds: TDataSource;
    edPar: TDBEdit;
    edLib: TDBEdit;
    Gravar: TAction;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    regEmp: TLongintField;
    regFaixa: TLongintField;
    regLib: TLongintField;
    regPar: TLongintField;
    regPerc: TFloatField;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure CancelarExecute(Sender: TObject);
    procedure cboEmpSelect(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure GravarExecute(Sender: TObject);
  private
    Fatualizando: Boolean;
    Fempresa: Integer;
    Ffaixa: Integer;
    procedure Setatualizando(AValue: Boolean);
    procedure Setempresa(AValue: Integer);
    procedure Setfaixa(AValue: Integer);
    { private declarations }
  public
    { public declarations }
    property atualizando: Boolean read Fatualizando write Setatualizando;
    property empresa: Integer read Fempresa write Setempresa;
    property faixa: Integer read Ffaixa write Setfaixa;
  end;

var
  FrmFRegra: TFrmFRegra;

implementation

uses dataprincipal, util;

{$R *.lfm}

{ TFrmFRegra }

procedure TFrmFRegra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmFRegra.FormShow(Sender: TObject);
begin
  if Fempresa > 0
  then cboFaixa.SetFocus;
  if Ffaixa > 0
  then edPar.SetFocus;
end;

procedure TFrmFRegra.GravarExecute(Sender: TObject);
begin
  if regPar.Value <= 0 then begin
    MostraAviso('PARCELA deve ser informada!');
    edPar.SetFocus;
  end
  else if regLib.Value <= 0 then begin
    MostraAviso('PCL LIBERAÇÃO deve ser informada!');
    edLib.SetFocus;
  end
  else if DMPrincipal.regraExiste(regEmp.Value,regPar.Value,regFaixa.Value) then begin
    MostraAviso('Regra já existe!');
    edPar.SetFocus;
  end
  else if (regPerc.Value <= 0) and (not ConfirmaMensagem('Confirma PERCENTUAL negativo ou nulo?'))
  then edPct.SetFocus
  else if ConfirmaMensagem('Confirma a gravação?') then begin
    if Fatualizando
    then DMPrincipal.manterRegras(1,
                                    regEmp.Value,
                                    regPar.Value,
                                    regLib.Value,
                                    regFaixa.Value,
                                    regPerc.Value)
    else DMPrincipal.manterRegras(0,
                                    regEmp.Value,
                                    regPar.Value,
                                    regLib.Value,
                                    regFaixa.Value,
                                    regPerc.Value);
    reg.Close;
    ModalResult:=mrOK;
  end;



end;

procedure TFrmFRegra.CancelarExecute(Sender: TObject);
begin
  reg.Cancel;
  ModalResult:=mrCancel;
end;

procedure TFrmFRegra.cboEmpSelect(Sender: TObject);
begin
  DMPrincipal.posicionarFaixas(DMPrincipal.psqEmpCODIGO.Value);
  if DMPrincipal.psqFaixa.EOF then begin
    MostraErro('Não existem faixas para a empresa!');
    cboEmp.SetFocus;
  end;
end;

procedure TFrmFRegra.Setatualizando(AValue: Boolean);
begin
  reg.CreateDataset;
  reg.Append;
  Fatualizando:=AValue;
  DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp,
            'select * from EMPRESA order by NOMEFANTASIA');
  if Fatualizando then begin
    Caption:='Atualizando Regra';
    regEmp.Value:=DMPrincipal.psqRegraEMPRESA.Value;
    regLib.Value:=DMPrincipal.psqRegraPCLIB.Value;
    regFaixa.Value:=DMPrincipal.psqRegraFAIXA.Value;
    regPar.Value:=DMPrincipal.psqRegraPARCELA.Value;
    regPerc.Value:=DMPrincipal.psqRegraPERCENTUAL.Value;
    DMPrincipal.posicionarFaixas(regEmp.Value);
    edPar.ReadOnly:=True;
    edPar.TabStop:=False;
    edPar.Color:=clBtnFace;
  end
  else  begin
    Caption:='Incluindo Regra';
    edPar.ReadOnly:=False;
    edPar.TabStop:=True;
    edPar.Color:=clWhite;
  end;
end;

procedure TFrmFRegra.Setempresa(AValue: Integer);
begin
  if Fempresa=AValue then Exit;
  Fempresa:=AValue;
  regEmp.Value:=Fempresa;
end;

procedure TFrmFRegra.Setfaixa(AValue: Integer);
begin
  if Ffaixa=AValue then Exit;
  Ffaixa:=AValue;
  regFaixa.Value:=Ffaixa;
  DMPrincipal.posicionarFaixas(Fempresa);
end;

end.

