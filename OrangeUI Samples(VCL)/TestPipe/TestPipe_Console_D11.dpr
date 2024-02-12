program TestPipe_Console_D11;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  StrUtils,
  Types,
  System.SysUtils;

begin
  try

    //输入
    var AInput:String;
    Write('请输入两个数字:');
    ReadLn(AInput);

    //计算和
    var ANumberArray:TStringDynArray;
    ANumberArray:=SplitString(AInput,',');
    var ASum:Integer;
    ASum:=StrToInt(ANumberArray[0])+StrToInt(ANumberArray[1]);

    //打印结果
    WriteLn('输出：'+AInput+'的和='+IntToStr(ASum));

    ReadLn(AInput);
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
