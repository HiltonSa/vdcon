unit vdcon.view.empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  ExtCtrls, Buttons, ComCtrls, StdCtrls, DBGrids, DbCtrls, LCLType, vdcon.controller,
  vdcon.controller.interfaces, vdcon.controller.ambiente;

type

  { TFrmEmpresas }

  TFrmEmpresas = class(TForm)
    AL: TActionList;
    Alterar: TAction;
    cboCampo: TComboBox;
    dsPesq: TDataSource;
    edtPesq: TEdit;
    Excluir: TAction;
    Fechar: TAction;
    grPesq: TDBGrid;
    Incluir: TAction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: Tlabel;
    nvPesq: TDBNavigator;
    pnAcao: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: Tpanel;
    Pesq: TAction;
    stBar: TStatusBar;
    procedure AlterarExecute(Sender: TObject);
    procedure dsPesqStateChange(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Formcreate(Sender: Tobject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Formshow(Sender: Tobject);
    procedure IncluirExecute(Sender: TObject);
    procedure PesqExecute(Sender: TObject);
  private
    { private declarations }
    FController: iController;
    FDataSet: TDataSet;
    FAmbiente: TAmbiente;
  public
    { public declarations }
    function AbrirFicha(alt: Boolean): TModalResult;
  end;

var
  FrmEmpresas: TFrmEmpresas;


implementation

uses vdcon.view.fichaempresas, dataprincipal, vdcon.controller.util,
  vdcon.controller.botaopadrao.factory;

{$R *.lfm}

{ TFrmEmpresas }

procedure TFrmEmpresas.AlterarExecute(Sender: TObject);
begin
  if AbrirFicha(True) = mrOK
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmEmpresas.dsPesqStateChange(Sender: TObject);
begin
  Alterar.Enabled := (dsPesq.State = dsBrowse);
  Excluir.Enabled := Alterar.Enabled;
end;

procedure TFrmEmpresas.ExcluirExecute(Sender: TObject);
begin
  if dsPesq.DataSet.FieldByName('CODIGO').AsInteger > 1  then begin
    if ConfirmaMensagem('Confirma a exclusão?') then begin
      DMPrincipal.manterEmpresa(2,dsPesq.DataSet.FieldByName('CODIGO').AsInteger,0,0,0,0,'','',
              '',0.0,0.0,dsPesq.DataSet.FieldByName('VIGENCIA').AsDateTime);
      dsPesq.DataSet.Refresh;
    end;
  end;
end;

procedure TFrmEmpresas.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmpresas.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  if dsPesq.DataSet.Active
  then dsPesq.DataSet.Close;
end;

procedure Tfrmempresas.Formcreate(Sender: Tobject);
begin
  FController := TController.New;
  FAmbiente:= TAMBIENTE.New;
  //FController.Menus.MenuCrud(pnAcao, nil).Exibir;
  TWinControl(TControllerBotaoPadraoFactory.New.Incluir(@IncluirExecute).Show).Parent := pnAcao;
  TWinControl(TControllerBotaoPadraoFactory.New.Alterar(@AlterarExecute).Show).Parent := pnAcao;
  TWinControl(TControllerBotaoPadraoFactory.New.Excluir(@ExcluirExecute).Show).Parent := pnAcao;
  TWinControl(TControllerBotaoPadraoFactory.New.Pesquisar(@PesqExecute).Show).Parent := pnAcao;
  TWinControl(TControllerBotaoPadraoFactory.New.Fechar(@FecharExecute).Show).Parent := pnAcao;
  //btAlterar.Glyph.LoadFromResourceName(HINSTANCE,'pen');
  //btExcluir.Glyph.LoadFromResourceName(HINSTANCE,'trash');
  //btPesq.Glyph.LoadFromResourceName(HINSTANCE,'search');
  //btFechar.Glyph.LoadFromResourceName(HINSTANCE,'voltar');
  //btNovo.Glyph.LoadFromResourceName(HINSTANCE, 'bulb');
End;

procedure TFrmEmpresas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   VK_RETURN: if edtPesq.Focused then Pesq.Execute;
   VK_ESCAPE: Fechar.Execute;
  end;
end;

procedure Tfrmempresas.Formshow(Sender: Tobject);
begin
  Self.SetBounds( FAmbiente.Esquerda,
                   FAmbiente.Alto,
                   FAmbiente.Largura,
                   FAmbiente.Altura);

End;

procedure TFrmEmpresas.IncluirExecute(Sender: TObject);
begin
  if AbrirFicha(False) = mrOk
  then if dsPesq.DataSet.Active
  then dsPesq.DataSet.Refresh;
end;

procedure TFrmEmpresas.PesqExecute(Sender: TObject);
begin
  if cboCampo.ItemIndex = 0
  then dsPesq.DataSet := FController.Entidades.Empresas
                              .PesquisarCodigo(StrToIntDef(edtPesq.Text,0))
  else dsPesq.DataSet := FController.Entidades.Empresas
                              .PesquisarDescricao(edtPesq.Text+'%');
  if not dsPesq.DataSet.IsEmpty
  then  stBar.SimpleText := Format('Encontradas %d ocorrencias para %s...',
         [dsPesq.DataSet.RecordCount,edtPesq.Text])
  else  stBar.SimpleText := Format('%s não encontrado!',[edtPesq.Text]);
end;

function TFrmEmpresas.AbrirFicha(alt: Boolean): TModalResult;
begin
  FrmFEmpresa := TFrmFEmpresa.Create(nil);
  try
    FrmFEmpresa.Empresa := dsPesq.DataSet;
    FrmFEmpresa.atualizando:=alt;
    Result := FrmFEmpresa.ShowModal;
  finally
    FrmFEmpresa.Free;
  end;
end;

end.

