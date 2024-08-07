unit vdcon.controller.botaoregrascomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoRegrasComissao }

  TControllerBotaoRegrasComissao = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoRegrasComissao }

constructor TcontrollerbotaoRegrasComissao.Create;
begin

end;

destructor TcontrollerbotaoRegrasComissao.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoRegrasComissao.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoRegrasComissao.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnRegrasComissao')
               .onClick(@Clique)
               .Caption('Regras de Comissão')
               .Item;
end;

procedure TcontrollerbotaoRegrasComissao.Clique(Sender: Tobject);
begin

end;

end.

