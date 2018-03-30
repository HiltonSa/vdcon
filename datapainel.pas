unit datapainel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, TADbSource, ZDataset;

type

  { TdmPainel }

  TdmPainel = class(TDataModule)
    empCODIGO: TLongintField;
    empDCPER: TStringField;
    empQTEMP1: TLongintField;
    empQTEMP2: TLongintField;
    empQTEMP3: TLongintField;
    empQTEMP4: TLongintField;
    empQTEMP5: TLongintField;
    empQTPER: TLongintField;
    empTTPER: TFloatField;
    empVLEMP1: TFloatField;
    empVLEMP2: TFloatField;
    empVLEMP3: TFloatField;
    empVLEMP4: TFloatField;
    empVLEMP5: TFloatField;
    resCODIGO: TLongintField;
    resDCPER: TStringField;
    resFilCDFIL: TLongintField;
    resFilCDPER: TLongintField;
    resFilDCFIL: TStringField;
    resFilDCPER: TStringField;
    resFilDTFIM: TDateField;
    resFilQTD: TLargeintField;
    resFilVLR: TFloatField;
    resFil: TZQuery;
    res: TZQuery;
    resQTFIL1: TLongintField;
    resQTFIL2: TLongintField;
    resQTFIL3: TLongintField;
    resQTFILO: TLongintField;
    resQTPER: TLongintField;
    resTTPER: TFloatField;
    resVLFIL1: TFloatField;
    resVLFIL2: TFloatField;
    resVLFIL3: TFloatField;
    resVLFILO: TFloatField;
    emp: TZQuery;
    procedure empQTPERGetText(Sender: TField; var aText: string;
      DisplayText: Boolean);
  private
    { private declarations }
  public
    { public declarations }
    function abrirResumoFiliais(filial: Integer): Boolean;
    function abrirRes(reg: Integer): Boolean;
    function abrirEmp(reg: Integer): Boolean;
  end;

var
  dmPainel: TdmPainel;

implementation

uses dataprincipal;

{$R *.lfm}

{ TdmPainel }

procedure TdmPainel.empQTPERGetText(Sender: TField; var aText: string;
  DisplayText: Boolean);
begin

end;

function TdmPainel.abrirResumoFiliais(filial: Integer): Boolean;
var
  stSql: String;
begin

  stSql:='select cdper, dcper, DTFIM, cdfil, dcfil, sum(qtven) qtd, '+
         'sum(ttven) vlr from RESUMO_VENDAS ';

  //if filial > 0
  //then stSql:=Format('%s where CDFIL = %d',[stSql,filial]);

  stSql:=Format('%s group by cdper, dcper, DTFIM, cdfil, dcfil '+
                'order by cdper, cdfil',[stSql]);

  Result := DMPrincipal.AbrirPesquisa(resFil, stSql);

end;

function TdmPainel.abrirRes(reg: Integer): Boolean;
begin
  with res do begin
    Close;
    ParamByName('reg').Value:=reg;
    Open;
    Result:=not EOF;
  end;
end;

function TdmPainel.abrirEmp(reg: Integer): Boolean;
begin
  with emp do begin
    Close;
    ParamByName('reg').Value:=reg;
    Open;
    Result:=not EOF;
  end;
end;

end.

