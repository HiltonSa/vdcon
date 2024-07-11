unit relvendasagente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRelVendasAgente }

  TFrmRelVendasAgente = class(TForm)
    cab1: TRLBand;
    det1: TRLBand;
    ds: TDataSource;
    grCab1: TRLBand;
    grCab2: TRLBand;
    grRod2: TRLBand;
    grVen: TRLGroup;
    lbEmp: TRLLabel;
    lbEmpRel: TRLLabel;
    lbFil: TRLLabel;
    lbUsu: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand6: TRLBand;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBResult18: TRLDBResult;
    RLDBResult19: TRLDBResult;
    RLDBResult20: TRLDBResult;
    RLDBResult21: TRLDBResult;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLLabel16: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    rod: TRLBand;
    RP: TRLReport;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FrmRelVendasAgente: TFrmRelVendasAgente;

implementation

uses dataprincipal, datavendas;

{$R *.lfm}

{ TFrmRelVendasAgente }

procedure TFrmRelVendasAgente.FormCreate(Sender: TObject);
begin
  lbEmp.Caption:=DMPrincipal.UsuEmp;
  lbUsu.Caption:=' USUARIO: '+DMPrincipal.UsuNom;
  lbFil.Caption:=' FILIAL: '+DMPrincipal.UsuFil;
end;

end.

