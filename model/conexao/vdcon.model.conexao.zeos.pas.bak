unit vdcon.model.conexao.zeos;

{$mode objfpc}{$H+}

interface

uses vdcon.model.interfaces, Classes, DB,SysUtils,
  ZAbstractConnection, ZConnection;
type

  { TConexaoZeos }

  TModelConexaoZeos = class(TInterfacedObject, iModelConexao,iModelConexaoParametros)
    private
      FConexao : TZConnection;
      FDatabase: string;
      FUserName: string;
      FPassword: string;
      FDriverID: string;
      FServer: string;
      FPorta : Integer;
    procedure LerParametros;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelConexao;
      function EndConexao: TComponent;
    function Database(Value: string) : iModelConexaoParametros;
    function UserName(Value: string) : iModelConexaoParametros;
    function Password(Value: string) : iModelConexaoParametros;
    function DriverID(Value: string) : iModelConexaoParametros;
    function Server(Value: string) : iModelConexaoParametros;
    function Porta(Value: integer) : iModelConexaoParametros;
    function EndParametros : iModelConexao;
    function Parametros : iModelConexaoParametros;
    function Conectar: iModelConexao;
  end;

implementation

{ TConexaoZeos }

function TModelConexaoZeos.Conectar: iModelConexao;
begin
  Result := Self;
  LerParametros;
  try
     FConexao.Connected := True;
  except
    raise Exception.Create('Não conectado ao BD!');
  end;

end;

constructor TModelConexaoZeos.Create;
begin
  FConexao := TZConnection.Create(nil);
end;

function TModelConexaoZeos.Database(Value: string): iModelConexaoParametros;
begin
  Result := Self;
  FDatabase := Value
end;

destructor TModelConexaoZeos.Destroy;
begin
  FConexao.Free;
  inherited;
end;

function TModelConexaoZeos.DriverID(Value: string): iModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoZeos.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoZeos.EndParametros: iModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoZeos.LerParametros;
begin
  FConexao.Database := FDatabase;
  FConexao.User := FUserName;
  FConexao.Password := FPassword;
  FConexao.Protocol := FDriverID;
  FConexao.HostName := FServer;
  FConexao.Port := FPorta;
end;

class function TModelConexaoZeos.New: iModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoZeos.Parametros: iModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoZeos.Password(Value: string): iModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoZeos.Porta(Value: integer): iModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoZeos.Server(Value: string): iModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoZeos.UserName(Value: string): iModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.

