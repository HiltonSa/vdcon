unit vdcon.view.frames.empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, Forms, Controls, ExtCtrls, StdCtrls;

type

  { TFrameEmpresas }

  TFrameEmpresas = class(Tframe)
    Label3: Tlabel;
    Panel4: Tpanel;
  Private

  Public
    constructor Create(aParent: TComponent); override;
    destructor Destroy; override;

  end;

implementation

{$R *.lfm}

{ TFrameEmpresas }

constructor TFrameEmpresas.Create(Aparent: Tcomponent);
begin
  inherited Create(nil);
  Parent := TWinControl(Aparent);
end;

destructor TFrameEmpresas.Destroy;
begin
  inherited Destroy;
end;

end.

