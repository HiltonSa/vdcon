unit vdcon.model.interfaces;

interface

uses
  Classes, vdcon.model.entidades.usuarios, vdcon.model.dao.interfaces, db;

type

  iModelConexaoParametros = interface;

  iModelConexao = interface
    ['{4CE63F40-DBAB-443B-849B-E6DAEFD9D91C}']
    function Conectar: iModelConexao;
    function EndConexao: TComponent;
    function Parametros : iModelConexaoParametros;
  end;

  iModelConexaoParametros = interface
    ['{281948A4-FB90-41FB-965A-2488948F1A74}']
    function Database(Value: string) : iModelConexaoParametros;
    function UserName(Value: string) : iModelConexaoParametros;
    function Password(Value: string) : iModelConexaoParametros;
    function DriverID(Value: string) : iModelConexaoParametros;
    function Server(Value: string) : iModelConexaoParametros;
    function Porta(Value: integer) : iModelConexaoParametros;
    function EndParametros : iModelConexao;
  end;

  iModelDataSet = interface
    ['{EA9C4D1A-C72F-46C6-89B4-D30C082F44FF}']
    function SQL : TStrings;
    function Params : TParams;
    function ExecSQL(Asql: String) : iModelDataSet;
    function DataSet : TDataSet;
    function Open(aSQL : String) : iModelDataSet; overload;
    function Open : iModelDataSet; overload;
  end;

  iModelFactoryConexao = interface
    ['{13E1A125-A1D9-454C-9625-CED199CFC0C5}']
    function ConexaoZeos : iModelConexao;
  end;

  iModelFactoryDataSet = interface
    ['{E314B935-10E1-4FBB-B141-59E2EDFC976B}']
    function DataSetZeos(Conexao: iModelConexao) : iModelDataSet;
  end;

  iModelUsuario = interface
    ['{8FEA3EAE-3723-47F5-980F-98D5C82E09AE}']
    function Entidade : TUSUARIO;
    function DAO : specialize iModelDAO<TUSUARIO>;
    function LogarUsuario(aLogin, aSenha: String): iModelUsuario;
    function NovaSessao: iModelUsuario;
  end;

implementation

end.
