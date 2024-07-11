unit relproducao;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRelProducao }

  TFrmRelProducao = class(TForm)
    cab1: TRLBand;
    det1: TRLBand;
    ds: TDataSource;
    grCab1: TRLBand;
    grCab2: TRLBand;
    grEqp: TRLGroup;
    grFil: TRLGroup;
    grRod2: TRLBand;
    grVen: TRLGroup;
    lbEmp: TRLLabel;
    lbEmpRel: TRLLabel;
    lbFil: TRLLabel;
    lbUsu: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
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
  FrmRelProducao: TFrmRelProducao;

implementation

uses dataprincipal, datatabelas;

{$R *.lfm}

{ TFrmRelProducao }

procedure TFrmRelProducao.FormCreate(Sender: TObject);
begin
  lbEmp.Caption:=DMPrincipal.UsuEmp;
  lbUsu.Caption:=' USUARIO: '+DMPrincipal.UsuNom;
  lbFil.Caption:=' FILIAL: '+DMPrincipal.UsuFil;
end;

end.

