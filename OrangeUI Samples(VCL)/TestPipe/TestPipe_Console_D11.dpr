program TestPipe_Console_D11;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  StrUtils,
  Types,
  System.SysUtils;

begin
  try

    //����
    var AInput:String;
    Write('��������������:');
    ReadLn(AInput);

    //�����
    var ANumberArray:TStringDynArray;
    ANumberArray:=SplitString(AInput,',');
    var ASum:Integer;
    ASum:=StrToInt(ANumberArray[0])+StrToInt(ANumberArray[1]);

    //��ӡ���
    WriteLn('�����'+AInput+'�ĺ�='+IntToStr(ASum));

    ReadLn(AInput);
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
