unit vdcon.controller.botaoempresa;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoEmpresa }

  TControllerBotaoEmpresa = class(TInterfacedObject, iControllerBotaoForm)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoForm;
      function Show: TObject;
      procedure Clique(Sender: TObject);

  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller;

{ TControllerBotaoEmpresa }

constructor TcontrollerbotaoEmpresa.Create;
begin

end;

destructor TcontrollerbotaoEmpresa.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoEmpresa.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoEmpresa.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnEmpresa')
               .onClick(@Clique)
               .Caption('Empresa')
               .Item;
end;

procedure TcontrollerbotaoEmpresa.Clique(Sender: Tobject);
begin
  Tcontroller.New
    .Formularios
    .Empresa
    .VerificarRotinas
    .AplicarRestricoes
    .MostrarForm;
     //.Formularios(FParent)
     //  .Empresa
     //  .AplicarRestricoes
     //  .MostrarForm;
end;

end.

