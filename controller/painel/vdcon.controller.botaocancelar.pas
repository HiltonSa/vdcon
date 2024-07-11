unit vdcon.controller.botaocancelar;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Controls, vdcon.controller.interfaces;

type

  { TControllerBotaoCancelar }

  TControllerBotaoCancelar = class(TInterfacedObject, iControllerBotaoAcao)
    private
      FClicar: TNotifyEvent;
    public
      constructor Create(aoClicar: TNotifyEvent);
      destructor Destroy; override;
      class function New(aoClicar: TNotifyEvent): iControllerBotaoAcao;
      function Show: TObject;

  end;

implementation

uses vdcon.controller.botaopadrao.factory;

{ TControllerBotaoCancelar }

constructor TcontrollerbotaoCancelar.Create(aoClicar: TNotifyEvent);
begin
  FClicar := aoClicar;
end;

destructor TcontrollerbotaoCancelar.Destroy;
begin
  inherited Destroy;
end;

class function TcontrollerbotaoCancelar.New(aoClicar: TNotifyEvent): iControllerBotaoAcao;
begin
  Result := Self.Create(aoClicar);
end;

function TcontrollerbotaoCancelar.Show: Tobject;
begin
  Result := TControllerBotaoPadraoFactory.New
               .Padrao
               .Name('btnCancelar')
               .onClick(FClicar)
               .Caption('Cancelar')
               .Align(TAlign.alBottom)
               .Imagem('dislike')
               .Item;
end;


end.

