unit vdcon.controller.usuarios;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.controller.interfaces, vdcon.model.dao, vdcon.model.entidades.usuarios,
  vdcon.model.dao.interfaces, vdcon.model.interfaces,  Controls,  db,
  vdcon.controller.util, vdcon.model.entidades.sessoes, vdcon.model.entidades.estacoes,
  vdcon.controller.ambiente;


type

  { TControllerUsuarios }

  TControllerUsuarios = class(TInterfacedObject, iControllerUsuario)
  private
    FQuery   : iModelDataSet;
    FEntidade: TUSUARIO ;
    FAmbiente: TAmbiente;
    FDaoSessao: iDao;
    FDaoEstacao: iDao;
    FDaoFilial: iDao;
    function RetornaEstacao(aNOme: string): Integer;
    function RetornaFilial(aFilial: integer): String;
  public
    Constructor Create(AQuery: iModelDataSet);
    Destructor Destroy; override;
    Class function New(AQuery: iModelDataSet): iControllerUsuario;
    function Dao: iDao;
    function VerificarUsuario(pNome, pSenha: string): TDataSet;
    function RotinasFormulario(pFormulario: string): TDataSet;
    function AbrirSessao: iControllerUsuario;
    function FecharSessao: iControllerUsuario;
    function RecuperarSessao: iControllerUsuario;
  end;



implementation

{ TControllerUsuarios }

function Tcontrollerusuarios.Retornaestacao(Anome: String): Integer;
var
  vCod: Integer;
begin
  vCod:=
   FDaoEstacao
    .Find(Format('select CODIGO from ZZ_COMPUTADORES where NOME = %s',[QuotedStr(Anome)]))
    .DataSet
    .FieldByName('CODIGO').AsInteger;
  if vCod = 0
  then Begin
    FDaoEstacao.Insert(TESTACOES.Create(vCod, Anome));
    vCod:=RetornaEstacao(Anome);
  end;
  Result:=vCod;
end;

function Tcontrollerusuarios.Retornafilial(Afilial: Integer): String;
var
  vNomeFilial: string;
begin
  if Afilial = 0
  then Result := 'Todas'
  else begin
    vNomeFilial:=
     FDaoFilial
       .Find(Format('select descricao from FILIAIS where CODIGO =%d',[Afilial]))
       .DataSet
       .FieldByName('DESCRICAO').AsString;
    if vNomeFilial <> ''
    then Result := vNomeFilial
    else Result := 'Não encontrado!';
  end;

end;

constructor Tcontrollerusuarios.Create(Aquery: Imodeldataset);
begin
  FQuery:=AQuery;
  FEntidade:=TUSUARIO.Create;
  FAmbiente:=TAMBIENTE.New;
  FDaoSessao:= TModelDAO.New(Aquery);
  FDaoEstacao:= TModelDAO.New(Aquery);
  FDaoFilial := TModelDAO.New(Aquery);
end;

destructor Tcontrollerusuarios.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited Destroy;
end;

class function Tcontrollerusuarios.New(Aquery: Imodeldataset): Icontrollerusuario;
begin
  Result := Self.Create(AQuery);
end;

function Tcontrollerusuarios.Dao: Idao;
begin
  Result := TModelDAO.New(FQuery) ;
end;

function Tcontrollerusuarios.Verificarusuario(Pnome, Psenha: String): Tdataset;
const
  SQL_LOGAR_USUARIO =
    'select * from ZZ_USUARIOS where USUARIO = %s and SENHA = %s and ATIVO = 1';
begin
  Result :=
    FQuery
      .Open(Format(SQL_LOGAR_USUARIO,
                         [QuotedStr(pNome),
                          QuotedStr(pSenha)]))
      .DataSet;
end;

function Tcontrollerusuarios.Rotinasformulario(Pformulario: String): Tdataset;
const
  SQL_ROTINAS = 'select R.ACAO, I.PRIVIL from ZZ_ITGRU I '+
                'inner join ZZ_ROTINAS R on R.CODIGO=I.ROTINA '+
                'where I.GRUSU=%d and R.FORMULARIO=%s';
begin
  Result :=
    FQuery
      .Open(Format(SQL_ROTINAS,
                              [FAmbiente.GrupoUsuario,
                               QuotedStr(Pformulario)]))
      .DataSet;
end;

function Tcontrollerusuarios.Abrirsessao: Icontrollerusuario;
const
  SQL_SESSAO = 'select CODIGO from ZZ_SESSAO where USUARIO = %d and COMPUTADOR = %d and ENCERRAMENTO is null';
begin
  Result := Self;
  FAmbiente.NomeComputadorAtual:=RetornarNomeComputador;
  FAmbiente.NomeFilial:=RetornaFilial(FAmbiente.FilialAtual);
  FDaoSessao.Insert(
           TSESSAO.Create(0,
                          FEntidade.CODIGO,
                          RetornaEstacao(FAmbiente.NomeComputadorAtual)));
  FAmbiente.Sessao:=
          FDaoSessao
             .Find(Format(SQL_SESSAO,[FEntidade.CODIGO,
                          RetornaEstacao(FAmbiente.NomeComputadorAtual)]))
             .DataSet.FieldByName('CODIGO').AsInteger;
end;

function Tcontrollerusuarios.Fecharsessao: Icontrollerusuario;
begin
  Result := Self;
end;

function Tcontrollerusuarios.Recuperarsessao: Icontrollerusuario;
begin
  Result := Self;
end;

end.

