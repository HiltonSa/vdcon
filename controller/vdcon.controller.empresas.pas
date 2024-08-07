unit vdcon.controller.empresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, db, vdcon.controller.interfaces, vdcon.model.interfaces,
  vdcon.model.dao, vdcon.model.dao.interfaces, vdcon.model.entidades.organizacao.empresa;

type

  { TControllerEmpresas }

  TControllerEmpresas = class(TInterfacedObject, iControllerEmpresa)
     private
       FQuery: iModelDataSet;
       FEmpresa: TEMPRESA;
     public
       constructor Create(AQuery: iModelDataSet);
       destructor Destroy; override;
       class function New(AQuery: iModelDataSet): iControllerEmpresa;
       function Dao: iDao;
       function PesquisarCodigo(pCodigo: Integer): TDataSet;
       function PesquisarDescricao(pDescricao: String): TDataSet;
       procedure ManterEmpresa( pModo: Integer;
                               pFantasia, pRazao, pCnpj: String;
                               pVigencia: TDateTime;
                               pUnidade, pCodigo: Integer;
                               pEntrega: Double;
                               pMesPer: Integer;
                               pPcPer: Double;
                               pAcerto, pUltFaixa: Integer);
  end;

implementation

{ TControllerEmpresas }

constructor Tcontrollerempresas.Create(Aquery: Imodeldataset);
begin
  FQuery := Aquery;
  FEmpresa := TEMPRESA.Create;
end;

destructor Tcontrollerempresas.Destroy;
begin
  if Assigned(FEmpresa)
  then FreeAndNil(FEmpresa);
  inherited Destroy;
end;

class function Tcontrollerempresas.New(Aquery: Imodeldataset): Icontrollerempresa;
begin
  Result := Self.Create(Aquery);
end;

function Tcontrollerempresas.Dao: Idao;
begin
  Result := TModelDAO.New(FQuery) ;
end;

function Tcontrollerempresas.Pesquisarcodigo(Pcodigo: Integer): Tdataset;
const
  SQL_CODIGO =
    'select * from EMPRESA where CODIGO=%d ';
begin
  Result :=
    FQuery
      .Open(Format(SQL_CODIGO,[Pcodigo]))
      .DataSet;
end;

function Tcontrollerempresas.Pesquisardescricao(Pdescricao: String): Tdataset;
const
  SQL_DESCRICAO =
    'select * from EMPRESA where NOMEFANTASIA like %s order by NOMEFANTASIA';
begin
  Result :=
    FQuery
      .Open(Format(SQL_DESCRICAO,[QuotedStr(Pdescricao)]))
      .DataSet;
end;

procedure Tcontrollerempresas.Manterempresa(Pmodo: Integer; Pfantasia, Prazao, Pcnpj: String; Pvigencia: TDateTime; Punidade, Pcodigo: Integer; Pentrega: Double; Pmesper: Integer; Ppcper: Double; Pacerto, Pultfaixa: Integer);
begin
  FEmpresa.CODIGO := Pcodigo;
  FEmpresa.NOMEFANTASIA := Pfantasia;
  FEmpresa.RAZAOSOCIAL := Prazao;
  FEmpresa.CNPJ := Pcnpj;
  FEmpresa.VIGENCIA := Pvigencia;
  FEmpresa.UNIDADE := Punidade;
  FEmpresa.PCENTREGA := Pentrega;
  FEmpresa.MESPER := Pmesper;
  FEmpresa.PCPER := Ppcper;
  FEmpresa.ACERTO := Pacerto;
  FEmpresa.ULTFAIXA := Pultfaixa;
  FQuery.ExecSQL(FEmpresa.RetornaSQL(TTipoSql(Pmodo)));
end;

end.

