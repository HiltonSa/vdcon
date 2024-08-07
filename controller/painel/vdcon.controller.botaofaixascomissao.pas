unit vdcon.controller.botaofaixascomissao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoFaixasComissao }

  TControllerBotaoFaixasComissao = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoFaixasComissao }

constructor TcontrollerbotaoFaixasComissao.Create;
begin

end;

destructor TcontrollerbotaoFaixasComissao.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoFaixasComissao.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoFaixasComissao.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnFaixasComissao')
               .onClick(@Clique)
               .Caption('Faixas de Comissão')
               .Item;
end;

procedure TcontrollerbotaoFaixasComissao.Clique(Sender: Tobject);
begin

end;

end.

