unit formfagente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, BufDataset, FileUtil, Forms, Controls, Graphics,
  Dialogs, ActnList, ExtCtrls, StdCtrls, Buttons, DbCtrls, datatabelas,
  vdcon.controller.util, LCLType;

type

  { TFrmFAgente }

  TFrmFAgente = class(TForm)
    AL: TActionList;
    bfAge: TBufDataset;
    bfAgeAtivo: TLongintField;
    bfAgeCelular: TStringField;
    bfAgeCodExt: TStringField;
    bfAgeCodigo: TLongintField;
    bfAgeCPF: TStringField;
    bfAgeDDD: TStringField;
    bfAgeEquipe: TLongintField;
    bfAgeNome: TStringField;
    bfAgeSupervisao: TLongintField;
    Cancelar: TAction;
    cbAtivo: TCheckBox;
    cboNivel: TDBLookupComboBox;
    cboEqp: TDBLookupComboBox;
    dsSiup: TDataSource;
    DBEdit1: TDBEdit;
    ds: TDataSource;
    dsEqp: TDataSource;
    edCpf1: TDBEdit;
    edCpf2: TDBEdit;
    edCpf3: TDBEdit;
    edNome: TDBEdit;
    edCpf: TDBEdit;
    Gravar: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure bfAgeCelularGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure bfAgeCPFGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
    procedure CancelarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FrmFAgente: TFrmFAgente;

implementation

uses dataprincipal;

{$R *.lfm}

{ TFrmFAgente }

procedure TFrmFAgente.FormCreate(Sender: TObject);
begin
  ds.DataSet.Close;
  DMTab.AbrirPesquisa(DMTab.psqSuper,'select * from SUPERVISAO order by DESCRICAO');
  if DMPrincipal.Filial = 0
  then DMTab.AbrirPesquisa(DMTab.psqEqpe,'select * from EQUIPES order by DESCRICAO')
  else DMTab.AbrirPesquisa(DMTab.psqEqpe,Format(
       'select * from EQUIPES where FILIAL = %d order by DESCRICAO',
               [DMPrincipal.Filial]));
end;

procedure TFrmFAgente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar.Execute;
  end;
end;

procedure TFrmFAgente.GravarExecute(Sender: TObject);
begin
  if edNome.Text = '' then begin
    MostraAviso('Precisa informar NOME!');
    edNome.SetFocus;
  end
  else if bfAgeSupervisao.Value = 0 then begin
     MostraAviso('Precisa informar NIVEL!');
     cboNivel.SetFocus;
  end
  else if (bfAgeEquipe.Value = 0) and (bfAgeSupervisao.Value=1) then begin
    MostraAviso('Precisa informar EQUIPE!');
    cboEqp.SetFocus;
  end
  else if ConfirmaMensagem('Confirma a gravação?') then begin
     if cbAtivo.Checked
     then bfAgeAtivo.Value := 1
     else bfAgeAtivo.Value := 0;
     if Fatualizando
     then DMTab.manterAgente(1,
              bfAgeCodigo.Value,
              bfAgeEquipe.Value,
              bfAgeSupervisao.Value,
              bfAgeAtivo.Value,
              bfAgeNome.Value,
              bfAgeCPF.Value,
              bfAgeDDD.Value,
              bfAgeCelular.Value,
              bfAgeCodExt.Value)
     else DMTab.manterAgente(0, 0,
               bfAgeEquipe.Value,
               bfAgeSupervisao.Value,
               bfAgeAtivo.Value,
               bfAgeNome.Value,
               bfAgeCPF.Value,
               bfAgeDDD.Value,
               bfAgeCelular.Value,
               bfAgeCodExt.Value);
     bfAge.Cancel;
     ModalResult := mrOk;
  end;
end;

procedure TFrmFAgente.CancelarExecute(Sender: TObject);
begin
  bfAge.Cancel;
  ModalResult:=mrCancel;
end;

procedure TFrmFAgente.bfAgeCPFGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText:=RetornarFormatado(bfAgeCPF.AsString, tfCpf);
end;

procedure TFrmFAgente.bfAgeCelularGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin
  aText:=RetornarFormatado(bfAgeCelular.AsString,tfCelular);
end;

procedure TFrmFAgente.Setatualizando(AValue: Boolean);
begin
  Fatualizando:=AValue;
  bfAge.CreateDataset;
  bfAge.Append;
  if Fatualizando then begin
    Caption:='Alterando Agente';
    bfAgeCodigo.Value:=DMTab.psqAgentesCODIGO.Value;
    bfAgeNome.Value:=DMTab.psqAgentesNOME.Value;
    bfAgeSupervisao.Value:=DMTab.psqAgentesSUPERVISAO.Value;
    bfAgeEquipe.Value:=DMTab.psqAgentesEQUIPE.Value;
    bfAgeDDD.Value:=DMTab.psqAgentesDDD.Value;
    bfAgeCelular.Value:=DMTab.psqAgentesCELULAR.Value;
    bfAgeAtivo.Value:=DMTab.psqAgentesATIVO.Value;
    bfAgeCPF.Value:=DMTab.psqAgentesCPF.Value;
    bfAgeCodExt.Value:=DMTab.psqAgentesCDEXTERNO.Value;
    cbAtivo.Checked:=(bfAgeAtivo.Value=1);
  end
  else begin
    Caption:='Incluindo Agente';
    bfAgeAtivo.Value:=1;
    cbAtivo.Enabled:=False;
  end;
end;

end.

