unit vdcon.controller.botaosair;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, Forms, vdcon.controller.interfaces;

type

  { TControllerBotaoSair }

  TControllerBotaoSair = class(TInterfacedObject, iControllerBotaoAcao)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoAcao;
      function Show: TObject;
      procedure Clique(Sender: TObject);

  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller.util;

{ TControllerBotaoSair }

constructor TcontrollerbotaoSair.Create;
begin

end;

destructor TcontrollerbotaoSair.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoSair.New: iControllerBotaoAcao;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoSair.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnSair')
               .onClick(@Clique)
               .Imagem('world')
               .Caption('Sair')
               .Align(TAlign.alBottom)
               .Item;
end;

procedure TcontrollerbotaoSair.Clique(Sender: Tobject);
begin
  if ConfirmaMensagem('Confirma o encerramento?')
  then Application.Terminate;
end;

end.

