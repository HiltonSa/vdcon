program vdcon;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, laz_fpspreadsheet, memdslaz, datetimectrls, tachartlazaruspkg,
  zcomponent, formprincipal, dataprincipal, util, formmsg, datatabelas,
  formagentes, formfagente, formfiliais, formffilial, formequipes, formfequipe,
  formempresas, formfempresa, formregrascomissao, formfregra, formvendas,
  datavendas, formfvenda, formfaixas, formffaixa, formparcelas, formfparcela,
  formrecautomatico, relbaixacomissao, formcalcularcomissao, relpagarcomissao,
  datasiacon, formselcomissao, formrecmanual, relparcelaspendentes,
  formselparcelaspendentes, formreceberparcela, relproducao,
  formselproducaovendas, formpainel, datapainel, formselresumoperiodo,
  relresumoperiodo, formselcancelamentos, relcancelamentos, formselvendasagente,
  relvendasagente
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Vendas de Consórcio';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.CreateForm(TdmScn, dmScn);
  Application.CreateForm(TDMTab, DMTab);
  Application.CreateForm(TDMVendas, DMVendas);
  Application.CreateForm(TdmPainel, dmPainel);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);

  if DMPrincipal.LogarUsuario then begin
     Application.Run;
  end;
  Application.Terminate;
end.

