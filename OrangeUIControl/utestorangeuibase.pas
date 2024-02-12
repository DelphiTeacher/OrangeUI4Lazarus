unit uTestOrangeUIBase;

interface

uses
  Classes,
  SysUtils,
  uFileCommon,
  uFuncCommon,
  uBaseLog,
  uBaseList,
  uBaseHttpControl,
  uGraphicCommon,
  uDrawParam,

  DateUtils;

function Test(ALogList:TStrings):Boolean;
function Test_uFileCommon(ALogList:TStrings):Boolean;
function Test_uFuncCommon(ALogList:TStrings):Boolean;
function Test_uBaseLog(ALogList:TStrings):Boolean;
function Test_uBaseList(ALogList:TStrings):Boolean;
function Test_uBaseHttpControl(ALogList:TStrings):Boolean;
function Test_uGraphicCommon(ALogList:TStrings):Boolean;
function Test_uDrawParam(ALogList:TStrings):Boolean;


implementation

function Test(ALogList:TStrings):Boolean;
begin
  //uFileCommon,
  ALogList.Add('uFileCommon');
  Test_uFileCommon(ALogList);

  //uFuncCommon,
  ALogList.Add('uFuncCommon');
  Test_uFuncCommon(ALogList);

  //uBaseLog,
  ALogList.Add('');
  ALogList.Add('uBaseLog');
  Test_uBaseLog(ALogList);

  //uBaseList,
  ALogList.Add('');
  ALogList.Add('uBaseList');
  Test_uBaseList(ALogList);

  //uBaseHttpControl,
  ALogList.Add('');
  ALogList.Add('uBaseHttpControl');
  Test_uBaseHttpControl(ALogList);

  //uGraphicCommon,
  ALogList.Add('');
  ALogList.Add('uGraphicCommon');
  Test_uGraphicCommon(ALogList);

  //uDrawParam,
  ALogList.Add('');
  ALogList.Add('uDrawParam');
  Test_uDrawParam(ALogList);

end;

function Test_uFileCommon(ALogList:TStrings):Boolean;
begin
  ALogList.Add('GetApplicationPath:'+GetApplicationPath);
end;

function Test_uFuncCommon(ALogList:TStrings):Boolean;
begin
  ALogList.Add('StdDateTimeToStr:'+StdDateTimeToStr(Now));
end;

function Test_uBaseLog(ALogList:TStrings):Boolean;
begin
  ALogList.Add('GetNewLogFileName:'+GetNewLogFileName('OrangeUI.log'));

  GlobalLog:=TBaseLog.Create(CONST_BASELOG_FILENAME);
  GlobalLog.IsWriteLog:=True;
  GlobalLog.IsOutputLog:=True;
  GlobalLog.HandleException(nil,'Test OrangeUI uBaseLog');
  FreeAndNil(GlobalLog);

end;

function Test_uBaseList(ALogList:TStrings):Boolean;
var
  ABaseList:TBaseList;
  AObject:TObject;
begin
  ABaseList:=TBaseList.Create;
  AObject:=TObject.Create;
  ABaseList.Add(AObject);
  ALogList.Add('ABaseList.Count After Add:'+IntToStr(ABaseList.Count));
  ABaseList.Remove(AObject);
  ALogList.Add('ABaseList.Count After Remove:'+IntToStr(ABaseList.Count));

  FreeAndNil(ABaseList);
end;

function Test_uBaseHttpControl(ALogList:TStrings):Boolean;
var
  ABaseHttpControl:THttpControl;
begin

  ABaseHttpControl:=THttpControl.Create();
  FreeAndNil(ABaseHttpControl);

end;

function Test_uGraphicCommon(ALogList:TStrings):Boolean;
begin

end;

function Test_uDrawParam(ALogList:TStrings):Boolean;
begin

end;




end.
