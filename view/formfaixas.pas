unit formfaixas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, DBDateTimePicker, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, Buttons, StdCtrls, DBGrids, DbCtrls, LCLType;

type

  { TFrmFaixas }

  TFrmFaixas = class(TForm)
    AL: TActionList;
    Alterar: TAction;
    cboEmp: TComboBox;
    dsPesq: TDataSource;
    Excluir: TAction;
    Fechar: TAction;
    grPesq: TDBGrid;
    Incluir: TAction;
    Label1: TLabel;
    nvPesq: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure AlterarExecute(Sender: TObject);
    procedure cboEmpSelect(Sender: TObject);
    procedure dsPesqStateChange(Sender: TObject);
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
  FrmFaixas: TFrmFaixas;

implementation

uses dataprincipal, formffaixa, vdcon.controller.util;

{$R *.lfm}

{ TFrmFaixas }

procedure TFrmFaixas.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmFaixas.cboEmpSelect(Sender: TObject);
begin
  DMPrincipal.AbrirPesquisa(DMPrincipal.psqEmp,'select * from EMPRESA where CODIGO='+copy(cboEmp.Text,201,4));
  DMPrincipal.posicionarFaixas(DMPrincipal.psqEmpCODIGO.Value);
end;

procedure TFrmFaixas.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOK
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmFaixas.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmFaixas.ExcluirExecute(Sender: TObject);
begin
  if ConfirmaMensagem('Confirma a exclusão?') then begin
    DMPrincipal.manterFaixas(2,DMPrincipal.psqFaixaCODIGO.Value,
                               DMPrincipal.psqFaixaEMPRESA.Value,'',0.0,0.0);
    dsPesq.DataSet.Refresh;
  end;
end;

procedure TFrmFaixas.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure TFrmFaixas.FormCreate(Sender: TObject);
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
  cboEmp.ItemIndex:=-1;
end;

procedure TFrmFaixas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure TFrmFaixas.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

function TFrmFaixas.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFFaixa := TFrmFFaixa.Create(nil);
  try
     FrmFFaixa.atualizando:=alt;
     Result:=FrmFFaixa.ShowModal;
  finally
    FrmFFaixa.Free;
  end;
end;

end.

