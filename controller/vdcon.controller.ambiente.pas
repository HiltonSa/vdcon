unit vdcon.controller.ambiente;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, DB, Controls;

type

    { TAMBIENTE }

    TAMBIENTE = class
    private
      Falto: Integer;
      Faltura: Integer;
      Fesquerda: Integer;
      Flargura: Integer;
      Fnomefilial: String;
      Fsenhausuario: String;
      Fcodigousuario: Integer;
      Fempresaatual: Integer;
      Ffigurausuario: String;
      Ffilialatual: Integer;
      Fgrupousuario: Integer;
      Fnomecomputadoratual: String;
      Fnomeusuario: String;
      Fsessao: Integer;
      procedure Setalto(Avalue: Integer);
      procedure Setaltura(Avalue: Integer);
      procedure Setcodigousuario(Avalue: Integer);
      procedure Setempresaatual(Avalue: Integer);
      procedure Setesquerda(Avalue: Integer);
      procedure Setfigurausuario(Avalue: String);
      procedure Setfilialatual(Avalue: Integer);
      procedure Setgrupousuario(Avalue: Integer);
      procedure Setlargura(Avalue: Integer);
      procedure Setnomecomputadoratual(Avalue: String);
      procedure Setnomefilial(Avalue: String);
      procedure Setnomeusuario(Avalue: String);
      procedure Setsenhausuario(Avalue: String);
      procedure Setsessao(Avalue: Integer);

      class var FInstance : TAmbiente;
    public
      Constructor Create;
      class function New: TAmbiente;
      Destructor Destroy; override;
      procedure SetarAmbiente(pDataSet: TDataSet);
      procedure SetarPosicao(pAlto, pEsquerda, pAltura, pLargura: Integer);
    published
        property NomeComputadorAtual: String read FNomeComputadorAtual write SetNomeComputadorAtual;
        property CodigoUsuario: Integer read FCodigoUsuario write SetCodigoUsuario ;
        property NomeUsuario: String read FNomeUsuario write SetNomeUsuario ;
        property FiguraUsuario: String read FFiguraUsuario write SetFiguraUsuario ;
        property GrupoUsuario: Integer read FGrupoUsuario write SetGrupoUsuario ;
        property FilialAtual: Integer read FFilialAtual write SetFilialAtual ;
        property EmpresaAtual: Integer read FEmpresaAtual write SetEmpresaAtual ;
        property Sessao: Integer read FSessao write SetSessao;
        property SenhaUsuario: String read FSenhaUsuario write SetSenhaUsuario;
        property NomeFilial: String read FNomeFilial write SetNomeFilial;
        property Alto: Integer read FAlto write SetAlto;
        property Esquerda: Integer read FEsquerda write SetEsquerda;
        property Altura: Integer read FAltura write SetAltura;
        property Largura: integer read FLargura write SetLargura;
    end;


implementation

uses vdcon.view.login;

{ TAMBIENTE }

procedure Tambiente.Setcodigousuario(Avalue: Integer);
begin
  if Fcodigousuario=Avalue then Exit;
  Fcodigousuario:=Avalue;
end;

procedure Tambiente.Setalto(Avalue: Integer);
begin
  if Falto = Avalue then Exit;
  Falto := Avalue;
end;

procedure Tambiente.Setaltura(Avalue: Integer);
begin
  if Faltura = Avalue then Exit;
  Faltura := Avalue;
end;

procedure Tambiente.Setempresaatual(Avalue: Integer);
begin
  if Fempresaatual=Avalue then Exit;
  Fempresaatual:=Avalue;
end;

procedure Tambiente.Setesquerda(Avalue: Integer);
begin
  if Fesquerda = Avalue then Exit;
  Fesquerda := Avalue;
end;

procedure Tambiente.Setfigurausuario(Avalue: String);
begin
  if Ffigurausuario=Avalue then Exit;
  Ffigurausuario:=Avalue;
end;

procedure Tambiente.Setfilialatual(Avalue: Integer);
begin
  if Ffilialatual=Avalue then Exit;
  Ffilialatual:=Avalue;
end;

procedure Tambiente.Setgrupousuario(Avalue: Integer);
begin
  if Fgrupousuario=Avalue then Exit;
  Fgrupousuario:=Avalue;
end;

procedure Tambiente.Setlargura(Avalue: Integer);
begin
  if Flargura = Avalue then Exit;
  Flargura := Avalue;
end;

procedure Tambiente.Setnomecomputadoratual(Avalue: String);
begin
  if Fnomecomputadoratual=Avalue then Exit;
  Fnomecomputadoratual:=Avalue;
end;

procedure Tambiente.Setnomefilial(Avalue: String);
begin
  if Fnomefilial=Avalue then Exit;
  Fnomefilial:=Avalue;
end;

procedure Tambiente.Setnomeusuario(Avalue: String);
begin
  if Fnomeusuario=Avalue then Exit;
  Fnomeusuario:=Avalue;
end;

procedure Tambiente.Setsenhausuario(Avalue: String);
begin
  if Fsenhausuario=Avalue then Exit;
  Fsenhausuario:=Avalue;
end;

procedure Tambiente.Setsessao(Avalue: Integer);
begin
  if Fsessao=Avalue then Exit;
  Fsessao:=Avalue;
end;

constructor Tambiente.Create;
begin

end;

class function Tambiente.New: Tambiente;
begin
  if not Assigned(FInstance)
  then FInstance := Self.Create;
  Result := FInstance;
end;

destructor Tambiente.Destroy;
begin
  inherited Destroy;
end;

procedure Tambiente.Setarambiente(Pdataset: Tdataset);
begin
  Setnomeusuario(pDataSet.FieldByName('USUARIO').AsString);
  Setsenhausuario(pDataSet.FieldByName('SENHA').AsString);
  Setcodigousuario(pDataSet.FieldByName('CODIGO').AsInteger);
  Setfigurausuario(Pdataset.FieldByName('IMAGEM').AsString);
  Setgrupousuario(PDataSet.FieldByName('GRUSU').AsInteger);
  Setfilialatual(PDataSet.FieldByName('FILIAL').AsInteger);
end;

procedure Tambiente.Setarposicao(Palto, Pesquerda, Paltura, Plargura: Integer);
begin
  Setalto(Palto);
  Setesquerda(Pesquerda);
  Setaltura(Paltura);
  Setlargura(Plargura);
end;


end.

