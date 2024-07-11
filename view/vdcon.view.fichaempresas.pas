unit vdcon.view.fichaempresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, BufDataset, db, FileUtil, DBDateTimePicker, DateTimePicker,
  Forms, Controls, Graphics, Dialogs, LCLType, ActnList, ExtCtrls, Buttons,
  StdCtrls, DbCtrls;

type

  { TCaptionHelper }

  TCaptionHelper = class helper for TEdit
    function ToInteger: Integer;
    function ToFloat: Double;
  end;

  { TFrmFEmpresa }

  TFrmFEmpresa = class(TForm)
    cboUnidade: TComboBox;
    cboUltFaixa: TComboBox;
    edPcPer: TEdit;
    edPcEntrega: TEdit;
    edMesPer: TEdit;
    edVigencia: Tdatetimepicker;
    edCodigo: Tedit;
    edCnpj: TEdit;
    edNomeFantasia: TEdit;
    edRazaoSocial: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    lbTitulo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel4: Tpanel;
    pnAcao: TPanel;
    procedure Formcreate(Sender: Tobject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Fatualizando: Boolean;
    Fempresa: Tdataset;
    procedure Setatualizando(AValue: Boolean);
    procedure Setempresa(Avalue: Tdataset);
    procedure Cancelar(Sender: TObject);
    procedure Gravar(Sender: TObject);
    { private declarations }
  public
    { public declarations }
    property atualizando: Boolean read Fatualizando write Setatualizando;
    property Empresa: TDataSet read FEmpresa write SetEmpresa;
  end;

var
  FrmFEmpresa: TFrmFEmpresa;

implementation

uses vdcon.controller.util, vdcon.controller.botaopadrao.factory, vdcon.controller;

{$R *.lfm}

{ TCaptionHelper }

function Tcaptionhelper.Tointeger: Integer;
begin
  Result := StrToIntDef(Self.Text, 0);
end;

function Tcaptionhelper.Tofloat: Double;
begin
  Result := StrToFloatDef(Self.Text, 0);
end;

{ TFrmFEmpresa }

procedure Tfrmfempresa.Formkeydown(Sender: Tobject;
  var Key: Word; Shift: Tshiftstate);
begin
  case Key of
    VK_RETURN: SelectNext(ActiveControl,True,True);
    VK_ESCAPE: Cancelar(nil);
  end;
end;

procedure Tfrmfempresa.Gravar(Sender: Tobject);
var
  vModo: Integer;
begin
  if edNomeFantasia.Text = '' then begin
    MostraAviso('Precisa informar NOME FANTASIA!');
    edNomeFantasia.SetFocus;
  end
  else if edRazaoSocial.Text = '' then begin
    MostraAviso('Precisa informar RAZÃO SOCIAL!');
    edRazaoSocial.SetFocus;
  end
  //else if edVigencia.DateTime then begin
  //   MostraAviso('Precisa informar VIGENCIA!');
  //   edVigencia.SetFocus;
  //end
  else if ConfirmaMensagem('Confirma a gravação?') then begin
     vModo := 0;
     if Fatualizando
     then vModo := 1;
     TController.New
       .Entidades
         .Empresas
           .ManterEmpresa( vModo,
                           edNomeFantasia.Text,
                           edRazaoSocial.Text,
                           getNumeros(edCnpj.Text),
                           edVigencia.DateTime,
                           cboUnidade.ItemIndex,
                           edCodigo.ToInteger,
                           edPcEntrega.ToFloat,
                           edMesPer.ToInteger,
                           edPcPer.ToFloat,
                           0,
                           StrToIntDef(Copy(cboUltFaixa.Text,201,4),0));
     ModalResult := mrOk;
  end;
end;

procedure Tfrmfempresa.Formcreate(Sender: Tobject);
begin
  TWinControl(TControllerBotaoPadraoFactory.New.Gravar(@Gravar).Show).Parent := pnAcao;
  TWinControl(TControllerBotaoPadraoFactory.New.Cancelar(@Cancelar).Show).Parent := pnAcao;
  //btGravar.Glyph.LoadFromResourceName(HINSTANCE,'like');
  //btCancelar.Glyph.LoadFromResourceName(HINSTANCE,'dislike');
End;

procedure Tfrmfempresa.Cancelar(Sender: Tobject);
begin
  ModalResult:=mrCancel;
end;

procedure Tfrmfempresa.Setatualizando(Avalue: Boolean);
begin
  Fatualizando:=AValue;
  if Fatualizando then begin
    montarComboBox(cboUltFaixa,
                    TController.New
                     .Entidades
                       .Faixas
                       .RetornaFaixasEmpresa(Empresa.FieldByName('CODIGO').AsInteger),
                       'CODIGO','DESCRICAO',False);
    cboUltFaixa.ItemIndex :=
            RetornarIndice(cboUltFaixa, Empresa.FieldByName('ULTFAIXA').AsInteger);

    //DMPrincipal.posicionarFaixas(Empresa.FieldByName('CODIGO').AsInteger);
    edCnpj.Text:=RetornarFormatado(Empresa.FieldByName('CNPJ').AsString, tfCnpj);
    edNomeFantasia.Text:=Empresa.FieldByName('NOMEFANTASIA').AsString;
    edMesPer.Text:=Empresa.FieldByName('MESPER').AsString;
    edPcEntrega.Text:=retornaValorFormatado( Empresa.FieldByName('PCENTREGA').AsFloat, 3);
    edPcPer.Text:=retornaValorFormatado( Empresa.FieldByName('PCPER').AsFloat, 3);
    edRazaoSocial.Text:=Empresa.FieldByName('RAZAOSOCIAL').AsString;
    edVigencia.DateTime:=Empresa.FieldByName('VIGENCIA').AsDateTime;
    edCodigo.Text:= retornaCodigoFormatado(Empresa.FieldByName('CODIGO').AsInteger, 6);
    cboUnidade.ItemIndex:=Empresa.FieldByName('UNIDADE').AsInteger;
    cboUltFaixa.Enabled:=True;
    lbTitulo.Caption:='Alterando '+edNomeFantasia.Text;
  end
  else begin
    lbTitulo.Caption:='Nova Empresa';
    cboUnidade.ItemIndex:=0;
    cboUltFaixa.Enabled:=False;
  end;
end;

procedure Tfrmfempresa.Setempresa(Avalue: Tdataset);
begin
  if Fempresa = Avalue then Exit;
  Fempresa := Avalue;
end;

end.

