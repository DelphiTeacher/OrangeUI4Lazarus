//convert pas to utf8 by ¥
//convert pas to utf8 by ¥
unit WaitingForm;

interface

uses
  {$IFDEF FPC}
  LCLType,
  {$ELSE}
//  Windows,
  {$ENDIF}
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Types,
  //GIFImg,
  Dialogs,
  StdCtrls,
  ExtCtrls,
//  pngimage,
  DateUtils,
  Math,
  uSkinBufferBitmap,
  uSkinWindowsControl, uSkinLabelType;

type
  TfrmWaiting = class(TForm)
    imgWaiting: TImage;
    tmrWaiting: TTimer;
    tmrTiming: TTimer;
    tmrCheckWindowValid: TTimer;
    lblWaiting: TSkinWinLabel;
    procedure tmrCheckWindowValidTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    //提示内容
    FHintStr:String;
    //显示在这个窗体之上
    FWindowParent:THandle;
//    //检测的窗体句柄
//    FCheckWindowHandle:HWND;
//    //跟随的窗体句柄
//    FFollowWindowHandle:HWND;

  private
    FParentForm:TForm;
    //跟随窗体
//    FFollowForm:TForm;
    //等待窗体的宽度
    FWaitingFormWidth:Integer;
    //等待窗体的高度
    FWaitingFormHeight:Integer;
    //等待窗体的句柄
    FWaitingFormHandle:Integer;


    { Private declarations }
  protected
    procedure CreateParams(var AParams:TCreateParams);override;
  public
    constructor Create(AOwner:TComponent;AWindowParent:THandle);
    procedure SetHintStr(AHintStr: String);
//    procedure SetCheckWindow(ACheckWindowHandle:HWND);
//    procedure SetFollowWindow(AFollowWindowHandle:HWND);
    procedure AdjustFormSize(out AWidth, AHeight: Integer);
    { Public declarations }
  end;

var
  frmWaiting:TfrmWaiting;
//var
  ////是否注册
  //IsRegWaitingCom:Boolean;
//  //等待界面
//  frmWaitingList:TList;
  ////全局WaitingForm
  //frmWaiting:TfrmWaiting;

//显示数据加载页面
procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
//关闭数据加载页面
procedure CloseWaitingForm;//(AParentForm:TForm);
procedure HideWaitingFrame;//(AParentForm:TForm);


implementation

{$R *.dfm}

//procedure WaitSomeTime;
//var
//  BeginTime:DWORD;
//begin
//  BeginTime:=GetTickCount;
//  while GetTickCount-BeginTime<100 do
//  begin
//    Application.ProcessMessages;
//  end;
//end;

procedure ShowWaitingFrame(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
begin
  OpenWaitingForm(AParentForm,AHintStr,IsEnableTiming);
end;

procedure OpenWaitingForm(AParentForm:TForm;AHintStr:String;IsEnableTiming:Boolean=False);
var
//  AWaitingForm:TWaitingFormClass;
  AWindowParentHandle: Integer;
begin
  //Try
    //if DisableWaitingForm then Exit;


    IsEnableTiming:=False;
    //if Not IsRegWaitingCom then Exit;

//    //先关闭等待界面
//    CloseWaitingForm(AParentForm);

    if AParentForm=nil then
    begin
      AParentForm:=Application.MainForm;
    end;
    AWindowParentHandle:=0;
    if AParentForm<>nil then
    begin
      AWindowParentHandle:=AParentForm.Handle;
    end;

    //获取空闲的等待界面
    if frmWaiting=nil then
    begin
      //frmWaiting:=TfrmWaiting.Create;
      ////创建等待界面
      //frmWaiting.CreateWaitingForm;
      frmWaiting:=TfrmWaiting.Create(nil,AWindowParentHandle);
  //    frmWaiting.WaitingForm:=Self;
//      frmWaiting.SetBounds(0,0,0,0);
//      frmWaiting.Show;
//      frmWaiting.Hide;
    end;

    //创建等待界面
    if frmWaiting<>nil then
    begin
      //设置父窗体(用于判断唯一)
      frmWaiting.FParentForm:=AParentForm;
//      //设置跟随窗体
//      frmWaiting.FFollowForm:=AParentForm;


      ////创建等待窗体
      //frmWaiting.FWaiting.CreateWindow(AWindowParentHandle);

      //获取等待窗体的句柄
      //frmWaiting.GetWaitingFormHandle(frmWaiting.FWaitingFormHandle);
      //设置检测窗体,如果检测窗体关闭了,那么等待窗体自动关闭
//      frmWaiting.FWaiting.SetCheckWindow(AParentForm.Handle);
      //设置等待窗体的提示文字
      frmWaiting.SetHintStr(AHintStr);
      //获取等待窗体的窗体大小并调整等待窗体大小和位置
      frmWaiting.AdjustFormSize(frmWaiting.FWaitingFormWidth,frmWaiting.FWaitingFormHeight);




//      //是否启动计时
//      if IsEnableTiming then
//      begin
//        frmWaiting.FWaiting.StartTiming;
//      end;


      ////重新排列窗体位置
      //frmWaiting.ResetWindowPosition;


      //显示等待界面
      frmWaiting.Show;

      //WaitSomeTime;
    end;

  //Except
  //  On E:Exception do
  //  begin
  //    OutputDebugString(PWideChar(E.Message));
  //  end;
  //End;
end;

procedure HideWaitingFrame;//(AParentForm:TForm);
begin
  CloseWaitingForm;//(AParentForm);
end;

procedure CloseWaitingForm;//(AParentForm:TForm);
//var
//  I: Integer;
//  AWaitingForm:TWaitingFormClass;
begin


  if frmWaiting<>nil then
  begin
    frmWaiting.Hide;
//    frmWaiting.FWaiting.SetCheckWindow(0);
//    frmWaiting.FWaiting.StopTiming;
    frmWaiting.FParentForm:=nil;
//    frmWaiting.FFollowForm:=nil;
  end;


//  for I := frmWaitingList.Count - 1 Downto 0 do
//  begin
//    AWaitingForm:=TWaitingFormClass(frmWaitingList.Items[I]);
//    if (AWaitingForm.FParentForm=AParentForm) then
//    begin
//      frmWaitingList.Delete(I);
//      AWaitingForm.FWaiting.Hide;
//      AWaitingForm.FWaiting.StopTiming;
//      AWaitingForm.FParentForm:=nil;
//      AWaitingForm.FFollowForm:=nil;
//      AWaitingForm.Free;
//    end;
//  end;
end;

constructor TfrmWaiting.Create(AOwner: TComponent; AWindowParent: THandle);
begin
  //显示在父窗体之上
  FWindowParent:=AWindowParent;
  Inherited Create(AOwner);
end;

procedure TfrmWaiting.CreateParams(var AParams: TCreateParams);
begin
  inherited CreateParams(AParams);
  //指定显示在这个窗体之上
  //AParams.WndParent:=FWindowParent;
  //不在任务栏显示
//  AParams.ExStyle:=AParams.ExStyle and Not WS_EX_APPWINDOW;
end;

procedure TfrmWaiting.FormPaint(Sender: TObject);
//var
//  AWindowRgn:HRGN;
begin
//  {$IFDEF FPC}
//  {$ELSE}
//  AWindowRgn:=Windows.CreateRoundRectRgn(0,0,Width,Height,4,4);
//  Try
//    SetWindowRgn(Handle,AWindowRgn,False);
//    Self.Canvas.Pen.Color:=$00E0E0E0;
//    Self.Canvas.Pen.Width:=4;
//    Self.Canvas.RoundRect(0,0,Width,Height,4,4);
//  Finally
//    DeleteObject(AWindowRgn);
//  End;
//  {$ENDIF}
end;

procedure TfrmWaiting.FormShow(Sender: TObject);
begin
//  {$IFDEF FPC}
//  {$ELSE}
//  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
//              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
//  {$ENDIF}
end;

//procedure TfrmWaiting.SetCheckWindow(ACheckWindowHandle: HWND);
//begin
//  //设置检查窗体，显示检测计时器
//  FCheckWindowHandle:=ACheckWindowHandle;
////  Self.tmrCheckWindowValid.Enabled:=ACheckWindowHandle<>0;
//end;

//procedure TfrmWaiting.SetFollowWindow(AFollowWindowHandle: HWND);
//begin
//  //设置跟随窗体
//  FFollowWindowHandle:=AFollowWindowHandle;
//end;

procedure TfrmWaiting.SetHintStr(AHintStr: String);
begin
  //设置提示文本
  FHintStr:=AHintStr;
  lblWaiting.Caption:=AHintStr;
  lblWaiting.Invalidate;
end;

procedure TfrmWaiting.AdjustFormSize(out AWidth, AHeight: Integer);
//var
//  DC:HDC;
//  Graphics:IGPGraphics;
//  Gap:Integer;
//  DigitWidth,DigitHeight:Integer;
//  ColonWidth,ColonHeight:Integer;
begin
//  DC:=GetDC(0);
//  Try
//    Graphics:=TSkinHelper.CreateGraphicsByDC(DC);

    //根据字符串计算需要显示的窗体大小
    AHeight:=70;
    AWidth:=190;

    //设置Label的宽茺
//    lblWaiting.Width:=uBufferBitmap.CalcFontWidth(Graphics,FHintStr+'......',lblWaiting.Font)+10;
    lblWaiting.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(FHintStr+'......',
                        lblWaiting.SelfOwnMaterialToDefault.DrawCaptionParam.FontSize))+10;

    //居中显示进度条和Label
    AWidth:=10
            +imgWaiting.Width
            +10
            +lblWaiting.Width
            +10;
//    SetBounds(0,0,AWidth,AHeight);
    Width:=AWidth;
    Height:=AHeight;

    imgWaiting.Top:=(AHeight-imgWaiting.Height) div 2 -2;
    imgWaiting.Left:=10;


    //滚动进度条
    //TGIFImage(imgWaiting.Picture.Graphic).Animate:=True;

    lblWaiting.Top:=(AHeight-lblWaiting.Height) div 2;// -2;
    lblWaiting.Left:=imgWaiting.Left+imgWaiting.Width+6;


//  Finally
//    ReleaseDC(0,DC);
//  End;
end;

procedure TfrmWaiting.tmrCheckWindowValidTimer(Sender: TObject);
begin
//  if Not Windows.IsWindow(FCheckWindowHandle) then
//  begin
//    Self.tmrCheckWindowValid.Enabled:=False;
//    SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0,
//              SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
////    Hide;
////    WaitingForm.Free;
//  end;
end;

initialization
//  //注册WaitingForm
//  frmWaitingList:=TList.Create;
  //DisableWaitingForm:=False;
  //IsRegWaitingCom:=True;
  frmWaiting:=nil;
  //RegisterWaitingCom;

finalization
  //UnRegisterWaitingCom;
  FreeAndNil(frmWaiting);
//  FreefrmWaitingList;
//  frmWaitingList.Free;

end.


