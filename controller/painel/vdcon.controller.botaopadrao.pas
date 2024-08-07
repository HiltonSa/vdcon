unit vdcon.controller.botaopadrao;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Buttons, ActnList, Controls, extctrls, vdcon.controller.interfaces;

type

  { TControllerBotaoPadrao }

  TControllerBotaoPadrao = class(TInterfacedObject, iControllerBotaoPadrao)
    private
      FBotao : TSpeedButton;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoPadrao;
      function Name(Value: string): iControllerBotaoPadrao;
      function Caption(Value: string): iControllerBotaoPadrao;
      function LayoutBotao(Value: TButtonLayout): iControllerBotaoPadrao;
      function MostrarCaption(Value: Boolean): iControllerBotaoPadrao;
      function Align(Value: TAlign): iControllerBotaoPadrao;
      function onClick(Value: TNotifyEvent): iControllerBotaoPadrao;
      function Imagem(Value: string): iControllerBotaoPadrao;
      function Acao(Value: Taction): iControllerBotaoPadrao;
      function Item: TObject;
  end;

implementation


{ TControllerBotaoPadrao }

constructor Tcontrollerbotaopadrao.Create;
begin
  FBotao:=Tspeedbutton.Create(nil);
  FBotao.Name := 'btnDefault';
  FBotao.Align:=TAlign.alTop;
  FBotao.ShowCaption:=True;
  FBotao.Layout:=TButtonLayout.blGlyphLeft;
  FBotao.Height:=60;
  FBotao.Caption := 'Default';
end;

destructor Tcontrollerbotaopadrao.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerbotaopadrao.New: Icontrollerbotaopadrao;
begin
  Result := Self.Create;
end;

function Tcontrollerbotaopadrao.Name(Value: String): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.Name := Value;
end;

function Tcontrollerbotaopadrao.Caption(Value: String): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.Caption := Value;
end;

function Tcontrollerbotaopadrao.Layoutbotao(Value: Tbuttonlayout): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.Layout:=Value;
end;

function Tcontrollerbotaopadrao.Mostrarcaption(Value: Boolean): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.ShowCaption:=Value;
end;

function Tcontrollerbotaopadrao.Align(Value: Talign): Icontrollerbotaopadrao;
begin
  Result:=Self;
  FBotao.Align:=Value;
end;

function Tcontrollerbotaopadrao.Onclick(Value: Tnotifyevent): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.OnClick := Value;
end;

function Tcontrollerbotaopadrao.Imagem(Value: String): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.LoadGlyphFromResourceName(HINSTANCE,Value);
end;

function Tcontrollerbotaopadrao.Acao(Value: Taction): Icontrollerbotaopadrao;
begin
  Result := Self;
  FBotao.Action := Value;
end;

function Tcontrollerbotaopadrao.Item: Tobject;
begin
  Result := FBotao;
end;


end.

