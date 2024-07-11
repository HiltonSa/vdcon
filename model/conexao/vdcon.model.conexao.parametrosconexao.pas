unit vdcon.model.conexao.parametrosconexao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, IniFiles, Forms;

type

  TRegParametros = record
    DataBase : String;
    UserName: String;
    DriverId: String;
    Server: String;
    Porta: Integer;
    Password: String;
  end;

  { TConexaoParametros }

  TConexaoParametros = class
    public
    class function getParametros: TRegParametros;
  end;

implementation

{ TConexaoParametros }

class function Tconexaoparametros.Getparametros: Tregparametros;
var
  VArqIni: TIniFile;
  VNomeArq: String;
  VRegPar: TRegParametros;
begin

  VNomeArq := ExtractFilePath(Application.ExeName)+'VdCon.ini';

  if FileExists(VNomeArq) { *Converted from FileExists* } then begin
    VArqIni := TIniFile.Create(VNomeArq);
    try
       VRegPar.Server := VArqIni.ReadString('IBX','Servidor','');
       VRegPar.Database := VArqIni.ReadString('IBX','BD','');
       VRegPar.Porta := VArqIni.ReadInteger('IBX','Porta',0);
       VRegPar.DriverId:=VArqIni.ReadString('IBX','Protocolo','');
       VRegPar.UserName:=VArqIni.ReadString('IBX','Resu','');
       VRegPar.Password:=VArqIni.ReadString('IBX','Ssap','');
    finally
      VArqIni.Free;
    end;
  end;
  Result:=VRegPar;

end;

end.

