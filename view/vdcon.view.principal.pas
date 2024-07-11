unit vdcon.view.principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ActnList, vdcon.controller.ambiente, vdcon.controller,
  vdcon.controller.interfaces;

type

  { TForm1 }

  TForm1 = class(TForm)
    Acagentes: Taction;
    Accalc: Taction;
    Accalculo: Taction;
    Acempresa: Taction;
    Acequipes: Taction;
    Acfaixa: Taction;
    Acfiliais: Taction;
    Acgrusu: Taction;
    Acimportar: Taction;
    Acpainel: Taction;
    Acrecebida: Taction;
    Acrecmanual: Taction;
    Acregra: Taction;
    Acsair: Taction;
    Acsobre: Taction;
    Actrimagem: Taction;
    Actrsenha: Taction;
    Actrusu: Taction;
    Acusuarios: Taction;
    Acvendas: Taction;
    Ae: Tapplicationproperties;
    Al: Tactionlist;
    Image1: Timage;
    imgLogo: TImage;
    Impsiacon: Taction;
    Label1: Tlabel;
    Label3: Tlabel;
    Label4: Tlabel;
    lbNomeUsuario: Tlabel;
    Label2: Tlabel;
    lbNomeFilial: TLabel;
    pnBackground: TPanel;
    pnUsuario: TPanel;
    pnImage: TPanel;
    pnMenu: TPanel;
    pnCab: TPanel;
    Relcancelamentos: Taction;
    Relcomissao: Taction;
    Relparpend: Taction;
    Relprodvendas: Taction;
    Relresumo: Taction;
    Relvenagente: Taction;
    procedure Acsairexecute(Sender: Tobject);
    procedure Aeexception(Sender: Tobject; E: Exception);
    procedure Aehint(Sender: Tobject);
    procedure Formcreate(Sender: Tobject);
    procedure Formkeydown(Sender: Tobject; var Key: Word; Shift: Tshiftstate);
    procedure Imglogoclick(Sender: Tobject);
    procedure Pnbackgroundpaint(Sender: Tobject);
    procedure Pnbackgroundresize(Sender: Tobject);
  private
    FAmbiente : TAmbiente;
    FController : iController;
  public

  end;

var
  Form1: TForm1;


implementation

uses vdcon.controller.util;

{$R *.lfm}

{ TForm1 }

procedure Tform1.Formkeydown(Sender: Tobject;
  var Key: Word; Shift: Tshiftstate);
begin
  if Key = 27
  then Close;
End;

procedure Tform1.Acsairexecute(Sender: Tobject);
begin
  Close;
End;

procedure Tform1.Aeexception(Sender: Tobject; E: Exception);
//var
//    NomeDoLog, nomeComputador: string;
//    Arquivo: TextFile;
begin
// if (E is EDatabaseError) then begin
//    NomeDoLog := ChangeFileExt(Application.Exename, '.err');
//    AssignFile(Arquivo, NomeDoLog);
//    nomeComputador := DMPrincipal.NomeComputadorAtual;
//
//    if FileExists(NomeDoLog) { *Converted from FileExists* }
//    then Append(arquivo) { se existir, apenas adiciona linhas }
//    else ReWrite(arquivo); { cria um novo se nÃ£o existir }
//
//    try
//      WriteLn(arquivo,  DateTimeToStr(Now) + ': Usuario:' +DMPrincipal.UsuNom+' Computador: ' +nomeComputador);
//      WriteLn(arquivo, 'Erro:' + E.Message);
//      WriteLn(arquivo,'----------------------------------------------------------------------');
//    finally
//      CloseFile(arquivo)
//    end;
//// end;
// Application.ShowException(E);
end;

procedure Tform1.Formcreate(Sender: Tobject);
begin
  //DMPrincipal.VerificarRotinas(FrmPrincipal);
  //DMPrincipal.AplicarRestricoes(FrmPrincipal);
  FAmbiente := TAMBIENTE.New;
  FController := TController.New;
  FController
     .Formularios
       .Principal
         .VerificarRotinas
         .AplicarRestricoes
         .SetarAmbiente;
  FController
    .Menus
     .Principal(pnMenu)
     .Exibir;

End;

procedure Tform1.Imglogoclick(Sender: Tobject);
const
  menuAberto = 150;
  menuFechado = 80;
begin
  if pnMenu.Width=menuAberto
  then pnMenu.Width:=menuFechado
  else pnMenu.Width:=menuAberto;
End;

procedure Tform1.Pnbackgroundpaint(Sender: Tobject);
var
  imgBackground: TJPEGImage;
begin
  try
     imgBackground := TJPEGImage.Create;
     imgBackground.LoadFromResourceName(HINSTANCE,'fachada');
     TPanel(Sender).Canvas.StretchDraw(ClientRect, imgBackground);
  finally
    imgBackground.Free;
  end;

End;

procedure Tform1.Pnbackgroundresize(Sender: Tobject);
begin
  FAmbiente.SetarPosicao(pnBackground.Top, pnBackground.Left,
                         pnBackground.ClientHeight, pnBackground.ClientWidth);
End;

//procedure Tform1.Speedbutton4click(Sender: Tobject);
//begin
//    TControllerPainelFactory.New.Apoio(Form1).Exibir;
//End;

//procedure TForm1.acGrUsuExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmGrUsu,FrmGrUsu);
//end;

//procedure TForm1.acImportarExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmImpSiacon,FrmImpSiacon);
//  //if ConfirmaMensagem('Confirma a importação das Vendas do Siacon?')
//  //then begin
//  //  dmScn.incluirVendasProprias(IncDay(Date,-15));
//  //  MostraAviso('Fim de importação!');
//  //end;
//end;

//procedure TForm1.acPainelExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmPainel,FrmPainel);
//end;

//procedure TForm1.acRecebidaExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmRecAutomatico, FrmRecAutomatico);
//end;

//procedure TForm1.acRecManualExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmRecManual,FrmRecManual);
//end;

//procedure TForm1.acRegraExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmRgCom,FrmRgCom);
//end;

//procedure TForm1.acAgentesExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmAgentes,FrmAgentes);
//  //DMPrincipal.CriaFormFilho(TFrmAgentes,FrmAgentes);
//end;

//procedure TForm1.acCalculoExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmCalcularComissao, FrmCalcularComissao);
//end;

//procedure TForm1.acEmpresaExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmEmpresas, FrmEmpresas);
//end;

//procedure TForm1.acEquipesExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmEquipes, FrmEquipes);
//end;

//procedure TForm1.acFaixaExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmFaixas, FrmFaixas);
//end;

//procedure TForm1.acFiliaisExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmFiliais, FrmFiliais);
//end;

//procedure TForm1.acSobreExecute(Sender: TObject);
//begin
//  FrmSobre := TFrmSobre.Create(nil);
//  try
//    FrmSobre.ShowModal;
//  finally
//    FrmSobre.Free;
//  end;
//end;

//procedure TForm1.acCalcExecute(Sender: TObject);
//begin
//  DMPrincipal.MostrarCalc;
//end;

//procedure TForm1.acTrImagemExecute(Sender: TObject);
//begin
//    if DMPrincipal.AbrirFig.Execute then begin
//       DMPrincipal.UsuFig := DMPrincipal.AbrirFig.FileName;
//       DMPrincipal.GravarImagem;
//       BckGrnd.Picture.LoadFromFile(DMPrincipal.UsuFig);
//    end;
//end;

//procedure TForm1.acTrSenhaExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmTrSenha,FrmTrSenha);
//end;

//procedure TForm1.acTrUsuExecute(Sender: TObject);
//begin
//    if DMPrincipal.LogarUsuario then begin
//      SetarUsuario;
//      DMPrincipal.AplicarRestricoes(FrmPrincipal);
//    end
//    else Application.Terminate;
//end;

//procedure TForm1.acUsuariosExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmUsuarios,FrmUsuarios);
//end;

//procedure TForm1.acVendasExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmVendas, FrmVendas);
//  //DMPrincipal.CriaFormFilho(TFrmVendas, FrmVendas);
//end;


procedure TForm1.AEHint(Sender: TObject);
begin
  //stBar.Panels[3].Text:=Application.Hint;
end;

//procedure TForm1.impSiaconExecute(Sender: TObject);
//begin
//  if DMPrincipal.Autorizar
//  then dmScn.importarVendas
//  else MostraAviso('Não autorizado!');
//end;

//procedure TForm1.relCancelamentosExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmSelCancelamentos, FrmSelCancelamentos);
//end;

//procedure TForm1.relComissaoExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmSelComissao,FrmSelComissao);
//end;

//procedure TForm1.relParPendExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmSelParcelasPendentes, FrmSelParcelasPendentes);
//end;

//procedure TForm1.relProdVendasExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmSelProdVendas, FrmSelProdVendas);
//end;

//procedure TForm1.relResumoExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmSelResumoPeriodo, FrmSelResumoPeriodo);
//end;

//procedure TForm1.relVenAgenteExecute(Sender: TObject);
//begin
//  DMPrincipal.CriaForm(TFrmSelVendasAgente,FrmSelVendasAgente);
//end;

//procedure TForm1.SetarUsuario;
//begin
//  DMPrincipal.SetUsu;
//  stBar.Panels[1].Text := DMPrincipal.UsuNom;
//  stBar.Panels[2].Text := FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Date);
//  stBar.Panels[5].Text:=DMPrincipal.ImpNom;
//  stBar.Panels[6].Text := DMPrincipal.UsuFil;
//  stBar.Panels[7].Text:=DMPrincipal.PerNom;
//  if FileExists(DMPrincipal.UsuFig) then
//    BckGrnd.Picture.LoadFromFile(DMPrincipal.UsuFig);
//end;

end.

