program vdcon;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, laz_fpspreadsheet, memdslaz, datetimectrls, tachartlazaruspkg,
  zcomponent, formprincipal, dataprincipal, vdcon.controller.util, vdcon.view.mensagens, datatabelas,
  formagentes, formfagente, formfiliais, formffilial, formequipes, formfequipe,
  vdcon.view.empresas, vdcon.view.fichaempresas, formregrascomissao, formfregra, formvendas,
  datavendas, formfvenda, formfaixas, formffaixa, formparcelas, formfparcela,
  formrecautomatico, formcalcularcomissao, relpagarcomissao, datasiacon,
  formselcomissao, formrecmanual, relparcelaspendentes,
  formselparcelaspendentes, formreceberparcela, relproducao,
  formselproducaovendas, formpainel, datapainel, formselresumoperiodo,
  relresumoperiodo, formselcancelamentos, relcancelamentos, formselvendasagente,
  relvendasagente, relbaixacomissao, formImpSiacon, vdcon.controller.ambiente,
  vdcon.model.entidades.usuarios, vdcon.view.principal, vdcon.controller.usuarios,
  vdcon.controller;

{$R *.res}

begin
  Application.Title := 'Vendas de Consórcio';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TdmScn, dmScn);
  Application.CreateForm(TDMTab, DMTab);
  Application.CreateForm(TDMVendas, DMVendas);
  Application.CreateForm(TdmPainel, dmPainel);

  //Form1.ShowModal;

  if LogarUsuario
  then Begin
    TController.New.Entidades.Usuarios.AbrirSessao;
    Application.CreateForm(TForm1, Form1);
    Application.Run;
  end;
  Application.Terminate;
end.

