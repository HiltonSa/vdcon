unit formregrascomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, DBDateTimePicker, Forms,
  Controls, Graphics, Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DBGrids,
  DbCtrls, LCLType, Menus;

type

  { TFrmRgCom }

  TFrmRgCom = class(TForm)
    AL: TActionList;
    Alterar: TAction;
    cboEmp: TComboBox;
    cboFaixa: TComboBox;
    dsReg: TDataSource;
    Excluir: TAction;
    Fechar: TAction;
    grPesq: TDBGrid;
    Incluir: TAction;
    Label1: TLabel;
    Label2: TLabel;
    nvPesq: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure AlterarExecute(Sender: TObject);
    procedure cboEmpEnter(Sender: TObject);
    procedure cboEmpSelect(Sender: TObject);
    procedure cboFaixaSelect(Sender: TObject);
    procedure dsRegStateChange(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IncluirExecute(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function AbrirFicha(alt: Boolean): TModalResult;
  end;

var
  FrmRgCom: TFrmRgCom;
  intEmpresa, intFaixa: Integer;

implementation

uses datatabelas, util, dataprincipal, formfregra;

{$R *.lfm}

{ TFrmRgCom }

procedure TFrmRgCom.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmRgCom.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if dsReg.DataSet.Active
  then dsReg.DataSet.Close;
end;

procedure TFrmRgCom.cboEmpSelect(Sender: TObject);
begin
  intEmpresa:=StrToInt(copy(cboEmp.Text,201,4));
  DMPrincipal.posicionarFaixas(intEmpresa);

  if not DMPrincipal.psqFaixa.EOF then begin

    cboFaixa.Clear;
    while not DMPrincipal.psqFaixa.EOF do begin
      cboFaixa.AddItem(Format('%-200s%.4d',[
                  DMPrincipal.psqFaixaDESCRICAO.Value,
                  DMPrincipal.psqFaixaCODIGO.Value]),nil);
      DMPrincipal.psqFaixa.Next;
    end;
    cboFaixa.ItemIndex:=-1;
    cboFaixa.Enabled:=True;
    cboFaixa.SetFocus;
  end
  else MostraAviso('Empresa não tem faixas de comissão cadastradas!');

end;

procedure TFrmRgCom.cboFaixaSelect(Sender: TObject);
begin
  intFaixa:=StrToInt(Copy(cboFaixa.Text,201,4));
  DMPrincipal.posicionarRegras(intEmpresa,intFaixa);
end;

procedure TFrmRgCom.dsRegStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsReg.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmRgCom.ExcluirExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a exclusão?') then begin
    DMPrincipal.manterRegras(2,DMPrincipal.psqRegraEMPRESA.Value,
                               DMPrincipal.psqRegraPARCELA.Value,0,
                               DMPrincipal.psqRegraFAIXA.Value,0);
    dsReg.DataSet.Refresh;
  end;
end;

procedure TFrmRgCom.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOK
  then dsReg.DataSet.Refresh;
end;

procedure TFrmRgCom.cboEmpEnter(Sender: TObject);
begin
  cboFaixa.Enabled:=False;
  dsReg.DataSet.Close;
end;

procedure TFrmRgCom.FormCreate(Sender: TObject);
begin
  DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp,
          'select * from EMPRESA order by NOMEFANTASIA');
  cboEmp.Clear;
  while not DMPrincipal.psqEmp.EOF do begin
    cboEmp.AddItem(Format('%-200s%.4d',[
                  DMPrincipal.psqEmpNOMEFANTASIA.Value,
                  DMPrincipal.psqEmpCODIGO.Value]),nil);
    DMPrincipal.psqEmp.Next;
  end;
  cboEmp.ItemIndex:=0;
  intEmpresa:=0;
  intFaixa:=0;

end;

procedure TFrmRgCom.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
case Key of
  VK_RETURN: SelectNext(ActiveControl,True,True);
  VK_ESCAPE: Fechar.Execute;
end;
End;

procedure TFrmRgCom.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsReg.DataSet.Active
  then dsReg.DataSet.Refresh;
end;

function TFrmRgCom.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFRegra := TFrmFRegra.Create(nil);
  try
    FrmFRegra.atualizando:=alt;
    FrmFRegra.empresa:=intEmpresa;
    FrmFRegra.faixa:=intFaixa;
    Result:=FrmFRegra.ShowModal;
  finally
    FrmFRegra.Free;
  end;
end;

end.

