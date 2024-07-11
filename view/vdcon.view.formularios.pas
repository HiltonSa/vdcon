unit vdcon.view.formularios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.view.interfaces, vdcon.controller.ambiente;

type

  { TFormularios }

  TFormularios = class (TInterfacedObject, iForm)
    private
      FForm: TForm;
      FAmbiente : TAmbiente;
    public
      Constructor Create(aForm : TForm);
      Destructor Destroy; override;
      class function New(aForm : TForm): iForm;
      function Principal: iForm;
  end;

implementation

{ TFormularios }

constructor Tformularios.Create(Aform: Tform);
begin
  FAmbiente:= TAMBIENTE.New;
  FForm:=aForm;
end;

destructor Tformularios.Destroy;
begin
  inherited Destroy;
end;

class function Tformularios.New(Aform: Tform): Iform;
begin
  Result := Self.Create(aForm);
end;

function Tformularios.Principal: Iform;
begin

end;

end.

