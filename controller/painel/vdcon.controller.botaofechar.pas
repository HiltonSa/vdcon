unit vdcon.controller.botaofechar;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Forms, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoFechar }

  TControllerBotaoFechar = class(TInterfacedObject, iControllerBotaoAcao)
    private
      FEvento: TNotifyEvent;
    public
      constructor Create(aValue: TNotifyEvent);
      destructor Destroy; override;
      class function New(aValue: TNotifyEvent): iControllerBotaoAcao;
      function Show: TObject;
  end;

implementation

uses vdcon.controller.botaopadrao.factory, vdcon.controller.util;

{ TControllerBotaoFechar }

constructor TcontrollerbotaoFechar.Create(aValue: TNotifyEvent);
begin
  FEvento := aValue;
end;

destructor TcontrollerbotaoFechar.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoFechar.New(aValue: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aValue);
end;

function TcontrollerbotaoFechar.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnFechar')
               .onClick(FEvento)
               .Caption('Fechar')
               .Align(TAlign.alBottom)
               .Imagem('voltar')
               .Item;
end;

//procedure TcontrollerbotaoFechar.Clique(Sender: Tobject);
//var
//  vContainer: TComponent;
//begin
//  vContainer := TComponent(TControl(Sender).GetParentComponent).GetParentComponent;
//        //MostraAviso(vContainer.Name);
//  TForm(vContainer.GetParentComponent).Close;
//  //TControl(Sender).GetParentComponent.Free;
//  //TController.New.Menus.Principal(vContainer).Exibir;
//end;

end.

