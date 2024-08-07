unit vdcon.controller.formularios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.controller.interfaces, vdcon.model.interfaces,
  Forms, db, ActnList, vdcon.controller.ambiente, StdCtrls, Controls;

type

  { TControllerFormularios }

  TControllerFormularios = class(TInterfacedObject, iControllerFormularios)
    private
      FAmbiente: TAmbiente;
      FForm: TForm;
    public
      Constructor Create;
      Destructor Destroy; override;
      class function New: iControllerFormularios;
      function Principal : iControllerFormularios;
      function Empresa: iControllerFormularios;
      function AplicarRestricoes: iControllerFormularios;
      function MostrarForm: TModalResult;
      function VerificarRotinas: iControllerFormularios;
      function SetarAmbiente: iControllerFormularios;
  end;

implementation

uses vdcon.view.principal, vdcon.view.empresas, vdcon.controller,
  vdcon.view.frames.empresas, VDCON.controller.util;

{ TControllerFormularios }

constructor Tcontrollerformularios.Create;
begin
  FAmbiente:=TAmbiente.New;
end;

destructor Tcontrollerformularios.Destroy;
begin
  //if Assigned(FForm)
  //then FreeAndNil(FForm);
  inherited Destroy;
end;

class function Tcontrollerformularios.New: Icontrollerformularios;
begin
  Result := Self.Create;
end;

function Tcontrollerformularios.Principal: Icontrollerformularios;
begin
  Result := Self;
  FForm := Form1;
end;

function Tcontrollerformularios.Empresa: Icontrollerformularios;
begin
  Result := Self;
  FForm := TFrmEmpresas.Create(nil);
end;

function Tcontrollerformularios.Aplicarrestricoes: Icontrollerformularios;
var
   I: Integer;
   qryRot : TDataSet;
begin
  Result := Self;

  qryRot := TController.New.Entidades.Usuarios.RotinasFormulario(FForm.Caption);

  for I := 0 to FForm.ComponentCount - 1 do
    if (FForm.Components[I] is TActionList) then begin
      while not qryRot.eof do begin
        try
           TAction(TActionList(FForm.Components[I]).Actions[qryRot.FieldByName('ACAO').AsInteger]).Visible
                              := (qryRot.FieldByName('PRIVIL').AsInteger = 1);
           TAction(TActionList(FForm.Components[I]).Actions[qryRot.FieldByName('ACAO').AsInteger]).Enabled
                              := (qryRot.FieldByName('PRIVIL').AsInteger = 1);
        except

        end;
        qryRot.Next;
      end;
    end;
end;

function Tcontrollerformularios.Mostrarform: TModalResult;
begin
  Result := FForm.ShowModal;
end;

function Tcontrollerformularios.Verificarrotinas: Icontrollerformularios;
begin
  Result := Self;
end;

function Tcontrollerformularios.Setarambiente: Icontrollerformularios;
begin
  Result := Self;
  (FForm.FindComponent('lbNomeUsuario') as Tlabel).Caption := FAmbiente.NomeUsuario;
  (FForm.FindComponent('lbNomeFilial') as Tlabel).Caption := FAmbiente.NomeFilial;
end;

end.

