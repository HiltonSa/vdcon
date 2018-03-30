unit relresumoperiodo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRelResumoPeriodo }

  TFrmRelResumoPeriodo = class(TForm)
    cab1: TRLBand;
    det1: TRLBand;
    ds: TDataSource;
    grCab2: TRLBand;
    grEqp: TRLGroup;
    grFil: TRLGroup;
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
    RLDBResult12: TRLDBResult;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    RLDBResult16: TRLDBResult;
    RLDBResult17: TRLDBResult;
    RLDBResult18: TRLDBResult;
    RLDBResult19: TRLDBResult;
    RLDBResult20: TRLDBResult;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText23: TRLDBText;
    RLLabel16: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel23: TRLLabel;
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
  FrmRelResumoPeriodo: TFrmRelResumoPeriodo;

implementation

uses dataprincipal, datavendas;

{$R *.lfm}

{ TFrmRelResumoPeriodo }

procedure TFrmRelResumoPeriodo.FormCreate(Sender: TObject);
begin
  lbEmp.Caption:=DMPrincipal.UsuEmp;
  lbUsu.Caption:=' USUARIO: '+DMPrincipal.UsuNom;
  lbFil.Caption:=' FILIAL: '+DMPrincipal.UsuFil;
end;

end.

