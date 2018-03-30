unit relparcelaspendentes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TFrmRelParPend }

  TFrmRelParPend = class(TForm)
    cab1: TRLBand;
    det2: TRLBand;
    ds: TDataSource;
    lbEmp: TRLLabel;
    lbEmpRel: TRLLabel;
    lbFil: TRLLabel;
    lbUsu: TRLLabel;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
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
  FrmRelParPend: TFrmRelParPend;

implementation

uses datavendas, dataprincipal;

{$R *.lfm}

{ TFrmRelParPend }

procedure TFrmRelParPend.FormCreate(Sender: TObject);
begin
  lbEmp.Caption:=DMPrincipal.UsuEmp;
  lbUsu.Caption:=' USUARIO: '+DMPrincipal.UsuNom;
  lbFil.Caption:=' FILIAL: '+DMPrincipal.UsuFil;
end;

end.

