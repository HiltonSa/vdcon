unit vdcon.controller.botaoimportarsiacon;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoImportarSiacon }

  TControllerBotaoImportarSiacon = class(TInterfacedObject, iControllerBotaoForm)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoForm;
      function Show: TObject;
      procedure Clique(Sender: TObject);

  end;

implementation

uses vdcon.controller.botaopadrao.factory;

{ TControllerBotaoImportarSiacon }

constructor TcontrollerbotaoImportarSiacon.Create;
begin

end;

destructor TcontrollerbotaoImportarSiacon.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoImportarSiacon.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoImportarSiacon.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnImportarSiacon')
               .onClick(@Clique)
               .Caption('Importar Siacon')
               .Item;
end;

procedure TcontrollerbotaoImportarSiacon.Clique(Sender: Tobject);
begin

end;

end.

