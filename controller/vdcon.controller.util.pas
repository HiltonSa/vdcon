unit vdcon.controller.util;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, maskutils, Dialogs, Forms, Controls, StdCtrls, LCLIntf, dateutils,
  LCLType, LMessages, Messages, Variants, Graphics, Buttons, ExtCtrls, windows,
  vdcon.model.interfaces, db, ZDataset;

type TFormatacao = (tfCpf, tfCnpj, tfFone, tfCelular, tfCEP);

  TVenda = record
    codigo: Integer;
    empresa: String;
    contrato: String;
    dcBem: String;
    vlBem: Double;
    dtVen: TDate;
    nmVen: String;
    nmCli: String;
  end;


  function RetornarFormatado(str:String; tipo: TFormatacao): String;
  function RetornarNomeComputador: String;
  function retornaCodigoFormatado(cod,zeros: Integer): String;
  function retornaValorFormatado(val: Double; casas: Integer): String;
  procedure MostraAviso(msg: String);
  procedure MostraErro(msg: String);
  function ConfirmaMensagem(msg: String): Boolean;
  function MostraMensagem(Msg: string; bt: Integer): Boolean;
  function CalculaDigMod10(num:String): String;
  function VerificaDV(dig: String): Boolean;
  procedure getDDDFone(var ddd,fone:string; texto:String);
  function getNumeros(str: String):string;
  function getCpfcnpjSiacon(tp, cpfcgc: string): string;
  procedure montarComboBox(var cbo: TComboBox; cds: TZQuery; codNome, descNome: String; todos: Boolean); overload;
  procedure montarComboBox(var cbo: TComboBox; cds: TDataSet; codNome, descNome: String; todos: Boolean); overload;
  function retornaSitAgente(sit: Integer): String;
  procedure ArredondarComponente(Componente: TWinControl);
  function LogarUsuario: Boolean;
  function CriaForm(frmClass: TFormClass; out Obj): TModalResult;
  function RetornaDataSql(aData: TDateTime): String;
  function RetornarIndice(var cbo: TCombobox; pCod: Integer): Integer;

implementation

uses vdcon.view.mensagens, vdcon.view.login;

function Retornarformatado(Str: String; Tipo: Tformatacao): String;
var
  tamStr: Integer;
begin
  tamStr:=Length(str);
  if tamStr=0
  then Result:=''
  else begin
    case tipo of
      tfCpf:
        if tamStr < 11
        then Result:= str
        else Result:= FormatMaskText('000\.000\.000\-00',str);
      tfCnpj:
        if tamStr < 14
        then Result:=str
        else Result:= FormatMaskText('00\.000\.000\/0000\-00',str);
      tfFone:
        if (tamStr < 8) or (tamStr > 9)
        then Result:=str
        else if tamStr = 8
        then Result:=FormatMaskText('9999\-9999;0;_',str )
        else Result := FormatMaskText('99999\-9999;0;_',str );
      tfCelular:
        if (tamStr < 8) or (tamStr > 9)
        then Result:=str
        else if tamStr = 8
        then Result:=FormatMaskText('9999\-9999;0;_',str )
        else Result := FormatMaskText('99999\-9999;0;_',str );
      tfCEP:
        if tamStr < 8
        then Result:= str
        else Result:= FormatMaskText('00\.000\-000',str);
    end;
  end;
end;

function Retornacodigoformatado(Cod, Zeros: Integer): String;
var
  mascara: String;
begin
  mascara:='%.'+IntToStr(zeros)+'d';
  Result := Format(mascara,[cod]);
end;

function Retornavalorformatado(Val: Double; Casas: Integer): String;
var
  mascara: String;
begin
  mascara:='%50.'+IntToStr(casas)+'n';
  Result := Trim(Format(mascara,[val]));
end;

procedure Mostraaviso(Msg: String);
begin
  QuestionDlg('Atenção',msg,mtInformation,[mrOk],'');
end;

procedure Mostraerro(Msg: String);
begin
  //QuestionDlg('Atenção',msg,mtError,[mrOk],'');
  MostraMensagem(msg, 0);
end;

function Confirmamensagem(Msg: String): Boolean;
begin
  //Result := QuestionDlg('Atenção',msg,mtConfirmation,[mrYes,'Sim',mrNo,'Não'],'')=mrYes;
  Result := MostraMensagem(Msg,1)
end;

function Mostramensagem(Msg: String; Bt: Integer): Boolean;
begin
  FrmMsg := TFrmMsg.Create(nil);
  try
     FrmMsg.bt := bt;
     FrmMsg.pnMsg.Caption := Msg;
     Result := FrmMsg.ShowModal=mrOk;
  finally
    FrmMsg.Free;
  end;
end;

function Calculadigmod10(Num: String): String;
var
   tam, sum, i, resto, np: Integer;
   stNum,stSum: String;
   p2: Boolean;
begin
  stNum:=num;
  tam:=Length(stNum);
  sum:=0;
  stSum:='';
  p2:=True;
  for I := 0 to tam-1 do begin
    np:=StrToInt(Copy(stNum,tam-I,1));
    if p2
    then stSum:=stSum+IntToStr(np * 2)
    else stSum:=stSum+IntToStr(np);
    p2:=not p2;
  end;
  tam:=Length(stSum);
  for I := 1 to tam do begin
    np:=StrToInt(Copy(stSum,I,1));
    sum:=sum+np;
  end;
  resto:= (10 - (sum mod 10));
  if resto=10
  then resto:=0;
  Result := IntToStr(resto);
end;

function Verificadv(Dig: String): Boolean;
begin
  if Length(Dig) = 11 then begin
    Result := CalculaDigMod10(Copy(Dig,1,10)) = Copy(Dig,11,1);
  end
  else Result := True;
end;

procedure Getdddfone(var Ddd, Fone: String; Texto: String);
var
   tam: Integer;
   stNovo: String;
begin

  stNovo:=getNumeros(texto);

  //if stNovo[1]='0'
  //then stNovo:=Copy(stNovo,2,100);

  tam:=Length(stNovo);

  case tam of
    0: begin
      ddd:='';
      fone:='';
    end;
    7,8,9: begin
      ddd:='';
      fone:=stNovo;
    end;
    10: begin
      if stNovo[1]='0'
      then begin
        ddd:=Copy(stNovo,2,2);
        fone:=Copy(stNovo,4,7);
      end
      else begin
        ddd:=Copy(stNovo,1,2);
        fone:=Copy(stNovo,3,8);
      end;
    end;
    11: begin
      if stNovo[1]='0'
      then begin
        ddd:=Copy(stNovo,2,2);
        fone:=Copy(stNovo,4,8);
      end
      else begin
        ddd:=Copy(stNovo,1,2);
        fone:=Copy(stNovo,3,9);
      end;
    end;
    else begin
      if stNovo[1]='0'
      then begin
        ddd:=Copy(stNovo,2,2);
        fone:=Copy(stNovo,4,10);
      end
      else begin
        ddd:=Copy(stNovo,1,2);
        fone:=Copy(stNovo,3,10);
      end;
    end;
  end;
end;

function Getnumeros(Str: String): String;
var
   i: integer;
   st: String;
begin
  if str = ''
  then Result:=''
  else begin
    st:='';
    for i := 1 to Length(str) do begin
        if str[i] in ['0'..'9']
        then st:=st+str[i];
    end;
    Result:=st;
  end;
end;

function Getcpfcnpjsiacon(Tp, Cpfcgc: String): String;
begin
  if Length(cpfcgc)<=0
  then Result:=''
  else begin
    if tp = 'F'
    then Result := Copy(cpfcgc,2,9)+Copy(cpfcgc,15,2)
    else Result := Copy(cpfcgc,3,14);
  end;
end;

procedure Montarcombobox(
  var Cbo: Tcombobox; Cds: TDataSet; Codnome, Descnome: String; Todos: Boolean); overload;
begin
  cbo.Clear;
  if (todos) and (cds.RecordCount>1)
  then cbo.AddItem('Todos',nil);
  cds.First;
  while not cds.EOF do begin
    cbo.AddItem(Format('%-200s%.4d',[
                                     cds.FieldByName(descNome).AsString,
                                     cds.FieldByName(codNome).AsInteger]),nil);
    cds.Next;
  end;

end;

procedure Montarcombobox(
  var Cbo: Tcombobox; Cds: TZQuery; Codnome, Descnome: String; Todos: Boolean); overload;
begin
  cbo.Clear;
  if (todos) and ((cds as TDataSet).RecordCount>1)
  then cbo.AddItem('Todos',nil);
  (cds as TDataSet).First;
  while not (cds as TDataSet).EOF do begin
    cbo.AddItem(Format('%-200s%.4d',[
                                     (cds as TDataSet).FieldByName(descNome).AsString,
                                     (cds as TDataSet).FieldByName(codNome).AsInteger]),nil);
    (cds as TDataSet).Next;
  end;

end;

function Retornasitagente(Sit: Integer): String;
begin
  if sit = 1
  then Result := 'Ativo'
  else Result := 'Inativo';
end;

procedure Arredondarcomponente(Componente: Twincontrol);
const
  RADIUS = 3;
var
  R : TRect;
  Rgn : HRGN;

begin
  with Componente do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, RADIUS, RADIUS);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

function Logarusuario: Boolean;
begin
  FrmLogin := TFrmLogin.Create(nil);
  try
     Result := FrmLogin.ShowModal=mrOk;
  finally
    FrmLogin.Free;
  end;
End;

function Criaform(Frmclass: Tformclass; out Obj): Tmodalresult;
begin
  try
     TForm(Obj) := frmClass.Create(nil);
     Result := TForm(Obj).ShowModal;
  finally
         FreeAndNil(Obj);
  end;
End;

function Retornadatasql(Adata: Tdatetime): String;
const
  Meses : array[1..12] of string = ('jan', 'feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');
begin
  Result := Format('%d-%s-%d',[DayOf(Adata), Meses[MonthOf(Adata)],YearOf(Adata)]);
End;

function Retornarindice(var Cbo: Tcombobox; Pcod: Integer): Integer;
var
  I : Integer;
begin
  Result := -1;
  for I := 0 to Pred(cbo.Items.Count) do
  begin
    if Pcod = StrToIntDef(Copy(cbo.Items[I],201,4),0)
    then Result := I;
  end;
End;

function RetornarNomeComputador: String;
var
  ipbuffer : string;
  nsize : dword;
begin
  nsize:=255;
  SetLength(ipbuffer,nsize);
  if GetComputerName(PChar(ipbuffer),nsize)
  then Result := Trim(PChar(ipbuffer))
  else Result :='Não Determinado!';
  end;

end.

