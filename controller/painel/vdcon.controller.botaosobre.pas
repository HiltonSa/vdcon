unit vdcon.controller.botaosobre;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoSobre }

  TControllerBotaoSobre = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoSobre }

constructor TcontrollerbotaoSobre.Create;
begin

end;

destructor TcontrollerbotaoSobre.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoSobre.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoSobre.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnSobre')
               .onClick(@Clique)
               .Caption('Sobre')
               .Item;
end;

procedure TcontrollerbotaoSobre.Clique(Sender: Tobject);
begin

end;

end.

