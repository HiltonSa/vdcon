unit vdcon.model.usuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.model.interfaces, vdcon.model.usuarios;

type

  { TModelUsario }

  TModelUsario = class (TInterfacedObject, iModelUsuario)
    private
      FEntidade : TUSUARIO;
      FDao : specialize iModelDAO<TUSUARIO>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelUsuario;
      function Entidade : TUSUARIO;
      function DAO : specialize iModelDAO<TUSUARIO>;

  end;

implementation

{ TModelUsario }

constructor Tmodelusario.Create;
begin
  FEntidate := TUSUARIO.Create;
  FDao := TModelDAO<TUSUARIO>.New;
end;

destructor Tmodelusario.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited Destroy;
end;

class function Tmodelusario.New: Imodelusuario;
begin
  Result := Self.Create;
end;

function Tmodelusario.Entidade: Tusuario;
begin
  Result := FEntidade;
end;

function Tmodelusario.Dao: Specialize iModelDAO<TUSUARIO>;
begin
  Result := FDao;
end;

end.

