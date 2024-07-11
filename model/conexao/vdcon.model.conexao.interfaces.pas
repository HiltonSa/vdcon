unit vdcon.model.conexao.interfaces;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, db;

type


  iModelConexao = interface
    ['{2D6795BC-9DA1-4851-A615-6C62F588F25B}']
    function Conexao : TCustomConnection;

  end;


implementation

end.

