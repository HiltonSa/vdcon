unit vdcon.controller.botaorecebimentoautomatico;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoRecebimentoAutomatico }

  TControllerBotaoRecebimentoAutomatico = class(TInterfacedObject, iControllerBotaoForm)
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

{ TControllerBotaoRecebimentoAutomatico }

constructor TcontrollerbotaoRecebimentoAutomatico.Create;
begin

end;

destructor TcontrollerbotaoRecebimentoAutomatico.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoRecebimentoAutomatico.New: Icontrollerbotaoform;
begin
  Result := Self.Create;
end;

function TcontrollerbotaoRecebimentoAutomatico.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnRecebimentoAutomatico')
               .onClick(@Clique)
               .Caption('Recebimento Automático')
               .Item;
end;

procedure TcontrollerbotaoRecebimentoAutomatico.Clique(Sender: Tobject);
begin

end;

end.

