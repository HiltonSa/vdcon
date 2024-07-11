unit vdcon.controller.interfaces;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, DB,  Controls, Buttons, Forms,
  vdcon.model.dao.interfaces, vdcon.model.interfaces, vdcon.controller.ambiente;

type

  iControllerUsuario = interface
    ['{AB67D906-1B9F-43BF-A10D-38149435082B}']
    function Dao: iDao;
    function VerificarUsuario(pNome, pSenha: string): TDataSet;
    function RotinasFormulario(pFormulario: string): TDataSet;
    function AbrirSessao: iControllerUsuario;
    function FecharSessao: iControllerUsuario;
    function RecuperarSessao: iControllerUsuario;
  end;

  iControllerEmpresa = interface
    ['{83CC6494-0548-49E5-8D90-5F1D832B4D1E}']
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

  iControllerFaixa = interface
    ['{83CC6494-0548-49E5-8D90-5F1D832B4D1E}']
    function Dao: iDao;
    function PesquisarCodigo(pCodigo: Integer): TDataSet;
    function PesquisarDescricao(pDescricao: String): TDataSet;
    function RetornaFaixasEmpresa(pEmpresa: Integer): TDataSet;
  end;

  iControllerEntidades = interface
    ['{57AE3C43-C61D-43F5-9048-FE6F24DEF4FA}']
    function Usuarios : iControllerUsuario;
    function Empresas: iControllerEmpresa;
    function Faixas: iControllerFaixa;
  end;

  iControllerFormularios = interface
    ['{3F2A9BA8-4EEB-4F1F-B393-C6AE097B7BCB}']
    function AplicarRestricoes: iControllerFormularios;
    function MostrarForm: TModalResult;
    function VerificarRotinas: iControllerFormularios;
    function SetarAmbiente: iControllerFormularios;
    function Principal : iControllerFormularios;
    function Empresa: iControllerFormularios;
  end;

  iControllerFrames = interface
    ['{C39B7A4F-AF29-4987-8F02-8637ECD63C3E}']
    function AplicarRestricoes: iControllerFrames;
    function VerificarRotinas: iControllerFrames;
    function Empresa: iControllerFrames;
    procedure MostrarFrame;
  end;

  iControllerFactoryConexao = interface
    ['{9D3875C8-A6BE-4E50-B191-FC1323CE9123}']
    function Conexao: iModelConexao;
  end;

  iControllerBotaoPadrao = interface
    ['{77B76673-2988-4FBD-8B18-96946F607771}']
    function Name(Value: string): iControllerBotaoPadrao;
    function Caption(Value: string): iControllerBotaoPadrao;
    function MostrarCaption(Value: Boolean): iControllerBotaoPadrao;
    function LayoutBotao(Value: TButtonLayout): iControllerBotaoPadrao;
    function Align(Value: TAlign): iControllerBotaoPadrao;
    function onClick(Value: TNotifyEvent): iControllerBotaoPadrao;
    function Imagem(Value: string): iControllerBotaoPadrao;
    function Item: TObject;
  end;

  iControllerBotaoAcao = interface
    ['{C70B8A9F-7755-414E-8E82-A493947E1985}']
    function Show: TObject;
  end;

  iControllerBotaoForm = interface
    ['{1733DF23-A7B4-4EB7-8EC7-15D4C3A2F1F3}']
    function Show: TObject;
  end;

  IControllerBotaoMenu = interface
    ['{CB1A93EE-B988-4E7D-B023-C4FBB8A5B320}']
    function Exibir: TObject;
  end;

  iControllerBotaoFactory = interface
    ['{06108827-B170-4E99-8083-DA23997D1E12}']
    function Padrao: iControllerBotaoPadrao;
    function Usuario: iControllerBotaoForm;
    function Voltar: iControllerBotaoAcao;
    function Cadastro: IControllerBotaoMenu;
    function Operacoes: IControllerBotaoMenu;
    function Relatorios: IControllerBotaoMenu;
    function Apoio: IControllerBotaoMenu;
    function Sair: iControllerBotaoAcao;
    function Empresa: iControllerBotaoForm;
    function FaixasComissao: iControllerBotaoForm;
    function RegrasComissao: iControllerBotaoForm;
    function Filiais: iControllerBotaoForm;
    function Equipes: iControllerBotaoForm;
    function Agentes: iControllerBotaoForm;
    function CalculoComissoes: iControllerBotaoForm;
    function RecebimentoManual: iControllerBotaoForm;
    function RecebimentoAutomatico: iControllerBotaoForm;
    function ImportarSiacon: iControllerBotaoForm;
    function Vendas: iControllerBotaoForm;
    function ParcelasPendentes: iControllerBotaoForm;
    function ComissoesPeriodo: iControllerBotaoForm;
    function ProducaoVendas: iControllerBotaoForm;
    function CancelamentoPeriodo: iControllerBotaoForm;
    function VendasAgente: iControllerBotaoForm;
    function ResumoVendas: iControllerBotaoForm;
    function TrocarUsuario: iControllerBotaoForm;
    function TrocarSenha: iControllerBotaoForm;
    function GrupoUsuarios: iControllerBotaoForm;
    function Sobre: iControllerBotaoForm;
    function Incluir(aValue: TNotifyEvent): iControllerBotaoAcao;
    function Gravar(aValue: TNotifyEvent): iControllerBotaoAcao;
    function Cancelar(aValue: TNotifyEvent): iControllerBotaoAcao;
    function Pesquisar(aValue: TNotifyEvent): iControllerBotaoAcao;
    function Alterar(aValue: TNotifyEvent): iControllerBotaoAcao;
    function Excluir(aValue: TNotifyEvent): iControllerBotaoAcao;
    function Fechar(aValue: TNotifyEvent): iControllerBotaoAcao;
  end;

  iControllerPainel  = interface
    ['{0501DB07-D9F3-45AC-B9BA-673C8465B58E}']
    function Name(Value: string): iControllerPainel;
    function Align(Value: TAlign): iControllerPainel;
    function Largura(Value: Integer): iControllerPainel;
    function AddOpcao(Value: TObject): iControllerPainel;
    function Item: TObject;
    procedure Exibir;
  end;

  iControllerPainelMenu = interface
    ['{C162EB25-910B-4ED3-8178-7FA74E3085E6}']
    procedure Exibir;
  end;

  iControllerPainelFactory = interface
    ['{560F7A0B-2FB4-44F0-9C33-3CF3A52320B4}']
    function Menu(Container:TComponent): iControllerPainel;
    function Apoio(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
    function Principal(Container:TComponent): iControllerPainelMenu;
    function Cadastros(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
    function Operacoes(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
    function Relatorio(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
    function MenuCrud(Container:TComponent; aParent: TWinControl): iControllerPainelMenu;
  end;

  iController = interface
    ['{94B0E4CA-B7F2-4831-90C2-5D87DED9AF12}']
    function Entidades : iControllerEntidades;
    function Frames(aParent: TWinControl): iControllerFrames;
    function Formularios: iControllerFormularios;
    function Menus: iControllerPainelFactory;
  end;


implementation

end.

