unit vdcon.controller.botaofiliais;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoFiliais }

  TControllerBotaoFiliais = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoFiliais }

constructor TcontrollerbotaoFiliais.Create;
begin

end;

destructor TcontrollerbotaoFiliais.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoFiliais.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoFiliais.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnFiliais')
               .onClick(@Clique)
               .Caption('Filiais')
               .Item;
end;

procedure TcontrollerbotaoFiliais.Clique(Sender: Tobject);
begin

end;

end.

