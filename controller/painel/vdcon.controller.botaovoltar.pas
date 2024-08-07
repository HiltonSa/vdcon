unit vdcon.controller.botaovoltar;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, Buttons, vdcon.controller.interfaces;

type

  { TControllerBotaoVoltar }

  TControllerBotaoVoltar = class(TInterfacedObject, iControllerBotaoAcao)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoAcao;
      function Show: TObject;
      procedure Clique(Sender: TObject);

  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller, vdcon.controller.util;

{ TControllerBotaoVoltar }

constructor Tcontrollerbotaovoltar.Create;
begin

end;

destructor Tcontrollerbotaovoltar.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerbotaovoltar.New: iControllerBotaoAcao;
begin
  Result := Self.Create;
end;

function Tcontrollerbotaovoltar.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnVoltar')
               .Align(TAlign.alBottom)
               .onClick(@Clique)
               .Caption('Voltar')
               .Imagem('voltar')
               .LayoutBotao(TButtonLayout.blGlyphLeft)
               .Item;
end;

procedure Tcontrollerbotaovoltar.Clique(Sender: Tobject);
var
  vContainer: TComponent;
begin
  vContainer := TComponent(TControl(Sender).GetParentComponent).GetParentComponent;
  TControl(Sender).GetParentComponent.Free;
  TController.New.Menus.Principal(vContainer).Exibir;
end;

end.

