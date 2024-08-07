unit vdcon.controller.botaorecebimentomanual;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoRecebimentoManual }

  TControllerBotaoRecebimentoManual = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoRecebimentoManual }

constructor TcontrollerbotaoRecebimentoManual.Create;
begin

end;

destructor TcontrollerbotaoRecebimentoManual.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoRecebimentoManual.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoRecebimentoManual.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnRecebimentoManual')
               .onClick(@Clique)
               .Caption('Recebimento Manual')
               .Item;
end;

procedure TcontrollerbotaoRecebimentoManual.Clique(Sender: Tobject);
begin

end;

end.

