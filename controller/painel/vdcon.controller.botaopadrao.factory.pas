unit vdcon.controller.botaopadrao.factory;

{$mode objfpc}{$H+}

interface

uses
  Classes, Sysutils, vdcon.controller.interfaces, vdcon.controller.botaopadrao;

type

  { TControllerBotaoPadraoFactory }

  TControllerBotaoPadraoFactory = class (TInterfacedObject, iControllerBotaoFactory)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iControllerBotaoFactory;
      function Padrao: iControllerBotaoPadrao;
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
      function Usuario: iControllerBotaoForm;
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

implementation

uses vdcon.controller.botaousuario, vdcon.controller.botaovoltar,
  vdcon.controller.botaocadastro, vdcon.controller.botaooperacoes,
  vdcon.controller.botaorelatorios, vdcon.controller.botaoapoio,
  vdcon.controller.botaosair, vdcon.controller.botaoempresa,
  vdcon.controller.botaofaixascomissao, vdcon.controller.botaoregrascomissao,
  vdcon.controller.botaofiliais, vdcon.controller.botaoequipes,
  vdcon.controller.botaoagentes, vdcon.controller.botaocalculocomissoes,
  vdcon.controller.botaorecebimentoautomatico,
  vdcon.controller.botaorecebimentomanual, vdcon.controller.botaoimportarsiacon,
  vdcon.controller.botaovendas, vdcon.controller.botaoparcelaspendentes,
  vdcon.controller.botaocomissoesperiodo, vdcon.controller.botaoproducaovendas,
  vdcon.controller.botaocancelamentosperiodo,
  vdcon.controller.botaovendasagente, vdcon.controller.botaoResumoVendas,
  vdcon.controller.botaotrocarsenha, vdcon.controller.botaotrocarusuario,
  vdcon.controller.botaogrupousuarios, vdcon.controller.botaosobre,
  vdcon.controller.painel.apoio, vdcon.controller.botaoincluir,
  vdcon.controller.botaopesquisar, vdcon.controller.botaoalterar,
  vdcon.controller.botaoexcluir, vdcon.controller.botaofechar,
  vdcon.controller.botaogravar, vdcon.controller.botaocancelar;

{ TControllerBotaoPadraoFactory }

constructor Tcontrollerbotaopadraofactory.Create;
begin

end;

destructor Tcontrollerbotaopadraofactory.Destroy;
begin
  inherited Destroy;
end;

class function Tcontrollerbotaopadraofactory.New: Icontrollerbotaofactory;
begin
  Result := Self.Create;
end;

function Tcontrollerbotaopadraofactory.Padrao: Icontrollerbotaopadrao;
begin
  Result := TControllerBotaoPadrao.New;
end;

function Tcontrollerbotaopadraofactory.Usuario: Icontrollerbotaoform;
begin
  Result := TControllerBotaoUsuario.New;
end;

function Tcontrollerbotaopadraofactory.Trocarusuario: Icontrollerbotaoform;
begin
  Result := TControllerBotaoTrocarUsuario.New;
end;

function Tcontrollerbotaopadraofactory.Trocarsenha: Icontrollerbotaoform;
begin
  Result := TControllerBotaoTrocarSenha.New;
end;

function Tcontrollerbotaopadraofactory.Grupousuarios: Icontrollerbotaoform;
begin
  Result := TControllerBotaoGrupoUsuarios.New;
end;

function Tcontrollerbotaopadraofactory.Sobre: Icontrollerbotaoform;
begin
  Result := TControllerBotaoSobre.New;
end;

function Tcontrollerbotaopadraofactory.Incluir(Avalue: Tnotifyevent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoIncluir.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Gravar(Avalue: Tnotifyevent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoGravar.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Cancelar(Avalue: Tnotifyevent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoCancelar.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Pesquisar(aValue: TNotifyEvent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoPesquisar.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Alterar(aValue: TNotifyEvent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoAlterar.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Excluir(aValue: TNotifyEvent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoExcluir.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Fechar(aValue: TNotifyEvent): Icontrollerbotaoacao;
begin
  Result := TControllerBotaoFechar.New(aValue);
end;

function Tcontrollerbotaopadraofactory.Voltar: Icontrollerbotaoacao;
begin
  Result := TControllerBotaoVoltar.New;
end;

function Tcontrollerbotaopadraofactory.Cadastro: Icontrollerbotaomenu;
begin
  Result := TControllerBotaoCadastro.New;
end;

function Tcontrollerbotaopadraofactory.Operacoes: Icontrollerbotaomenu;
begin
  Result := TControllerBotaoOperacoes.New;
end;

function Tcontrollerbotaopadraofactory.Relatorios: Icontrollerbotaomenu;
begin
  Result := TControllerBotaoRelatorios.New;
end;

function Tcontrollerbotaopadraofactory.Apoio: Icontrollerbotaomenu;
begin
  Result := TControllerBotaoApoio.New;
end;

function Tcontrollerbotaopadraofactory.Sair: Icontrollerbotaoacao;
begin
  Result := TControllerBotaoSair.New;
end;

function Tcontrollerbotaopadraofactory.Empresa: Icontrollerbotaoform;
begin
  Result := TControllerBotaoEmpresa.New;
end;

function Tcontrollerbotaopadraofactory.Faixascomissao: Icontrollerbotaoform;
begin
  Result := TControllerBotaoFaixasComissao.New;
end;

function Tcontrollerbotaopadraofactory.Regrascomissao: Icontrollerbotaoform;
begin
  Result := TControllerBotaoRegrasComissao.New;
end;

function Tcontrollerbotaopadraofactory.Filiais: Icontrollerbotaoform;
begin
  Result := TControllerBotaoFiliais.New;
end;

function Tcontrollerbotaopadraofactory.Equipes: Icontrollerbotaoform;
begin
  Result := TControllerBotaoEquipes.New;
end;

function Tcontrollerbotaopadraofactory.Agentes: Icontrollerbotaoform;
begin
  Result := TControllerBotaoAgentes.New;
end;

function Tcontrollerbotaopadraofactory.Calculocomissoes: Icontrollerbotaoform;
begin
  Result := TControllerBotaoCalculoComissoes.New;
end;

function Tcontrollerbotaopadraofactory.Recebimentomanual: Icontrollerbotaoform;
begin
  Result := TControllerBotaoRecebimentoManual.New;
end;

function Tcontrollerbotaopadraofactory.Recebimentoautomatico: Icontrollerbotaoform;
begin
  Result := TControllerBotaoRecebimentoAutomatico.New;
end;

function Tcontrollerbotaopadraofactory.Importarsiacon: Icontrollerbotaoform;
begin
  Result := TControllerBotaoImportarSiacon.New;
end;

function Tcontrollerbotaopadraofactory.Vendas: Icontrollerbotaoform;
begin
  Result := TControllerBotaoVendas.New;
end;

function Tcontrollerbotaopadraofactory.Parcelaspendentes: Icontrollerbotaoform;
begin
  Result := TControllerBotaoParcelasPendentes.New;
end;

function Tcontrollerbotaopadraofactory.Comissoesperiodo: Icontrollerbotaoform;
begin
  Result := TControllerBotaoComissoesPeriodo.New;
end;

function Tcontrollerbotaopadraofactory.Producaovendas: Icontrollerbotaoform;
begin
  Result := TControllerBotaoProducaoVendas.New;
end;

function Tcontrollerbotaopadraofactory.Cancelamentoperiodo: Icontrollerbotaoform;
begin
  Result := TControllerBotaoCancelamentosPeriodo.New;
end;

function Tcontrollerbotaopadraofactory.Vendasagente: Icontrollerbotaoform;
begin
  Result := TControllerBotaoVendasAgente.New;
end;

function Tcontrollerbotaopadraofactory.Resumovendas: Icontrollerbotaoform;
begin
  Result := TControllerBotaoResumoVendas.New;
end;

end.

