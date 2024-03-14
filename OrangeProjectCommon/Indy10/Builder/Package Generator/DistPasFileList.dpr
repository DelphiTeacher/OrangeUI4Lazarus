program DistPasFileList;

{$APPTYPE CONSOLE}

uses
  Classes,
  SysUtils,
  DModule in 'DModule.pas' {DM: TDataModule};

procedure Main;
var s : TStringList;
  Lst : String;
begin
 DM := TDM.Create(nil); try
    s := TStringList.Create;
    try
      // Default Output Path is w:\source\Indy10
   //   DM.OutputPath := 'w:\source\Indy10';
      // Default Data Path is W:\source\Indy10\builder\Package Generator\Data
    //  DM.DataPath   := 'W:\source\Indy10\builder\Package Generator\Data';
      DM.tablFile.Open;
      try
        while not DM.tablFile.Eof do
        begin
          if DM.tablFile.FieldByName('Release').AsBoolean then
          begin
            LSt := DM.tablFile.FieldByName('Pkg').AsString+'\' + DM.tablFile.FieldByName('FileName').AsString+'.pas';
            s.Add(LSt);
            WriteLn(LSt);
          end;
          DM.tablFile.Next;
        end;
        s.SaveToFile(DM.OutputPath+'\Lib\FileList.txt');
      finally
        DM.tablFile.Close;
      end;
    finally
      FreeAndNil(s);
    end;
  finally FreeAndNil(DM); end;
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  Main;
end.
