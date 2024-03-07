//convert pas to utf8 by ¥
unit uSkinSelectPopupForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  DB,

  {$IFDEF FPC}
  LCLType,
  {$ELSE}
  uSkinWindowsForm,
  {$ENDIF}

//  GdiElement,
  Graphics,
  uBaseLog,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
//  uSkinListViewType,
//  uManager,
  Buttons;

type
  //选中一条记录的事件
  TOnSelectRecordEvent=procedure(Sender:TObject;ADataset:TDataset) of object;
//  TOnSelectRecordJsonEvent=procedure(Sender:TObject;ARecordJson:ISuperObject) of object;

  TfrmSkinSelectPopupClass=class of TfrmSkinSelectPopup;

  TfrmSkinSelectPopup = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
  protected
    //用于过滤
    procedure DoFilter(AKeyword:String);virtual;
    //用于清理数据
    procedure DoClear;virtual;
    procedure CustomPopup;virtual;
  protected
    FWinForm:TSkinWinForm;
    procedure CreateParams(var Params:TCreateParams);override;

  public
    //当前传进来的关键字
    FKeyWord:String;
    //选中了记录的事件
    OnSelectRecord: TOnSelectRecordEvent;



    //窗体是否已经弹出
    IsPopuped:Boolean;
    //隐藏窗体
    procedure HidePopup;

    //弹出窗体
    procedure Popup(APopupPoint:TPoint;
                    APopupFormWidth:Integer;
                    APopupFormHeight:Integer;
                    //-1表示当前
                    AParentFormHandle:Integer=0;
                    AShowFlag:Integer=SWP_NOACTIVATE or SWP_SHOWWINDOW);
    //弹出并过滤
    procedure PopupAndFilter(
                            AKeyWord:String;
                            APopupPoint:TPoint;
                            APopupFormWidth:Integer;
                            APopupFormHeight:Integer);
  end;


//  TfrmSelectListViewPopup=class(TfrmSkinSelectPopup)
//  public
//    lvData:TSkinWinListView;
//    constructor Create(AOwner:TComponent);override;
//    destructor Destroy;override;
//  end;



function CreateSkinSelectPopupForm(AOwnerForm:TForm;AfrmSkinSelectPopupClass:TfrmSkinSelectPopupClass):TfrmSkinSelectPopup;
procedure InitSkinSelectPopupForm(ASkinSelectPopupForm:TfrmSkinSelectPopup);



implementation

{$R *.dfm}

var
//  MouseHook: HHOOK;
  CurrentPopupSkinSelectPopupForm:TfrmSkinSelectPopup;

//function HookMouseProc(code: Integer; wparam: wparam; lparam: lparam): LRESULT;stdcall;
//var
//  Rect: TRect;
//begin
//  if (code = HC_ACTION) then
//  begin
//    case wparam of
//      WM_LBUTTONDOWN, WM_MBUTTONDOWN, WM_RBUTTONDOWN, WM_NCLBUTTONDOWN,
//        WM_NCMBUTTONDOWN, WM_NCRBUTTONDOWN:
//        begin
//          with PMouseHookStruct(lparam)^ do
//          begin
//            if (CurrentPopupSkinSelectPopupForm<>nil)
//              and GetWindowRect(CurrentPopupSkinSelectPopupForm.Handle, Rect) then
//            begin
//              if Not PtInRect(Rect, pt) then
//              begin
//                CurrentPopupSkinSelectPopupForm.HidePopup;
//              end;
//            end;
//          end;
//        end;
//    end;
//  end;
//  Result:=CallNextHookEx(MouseHook, code, wparam, lparam);
//end;
//
//procedure HookMouse(AState: Boolean);
//begin
//  if AState then
//  begin
//    MouseHook:=SetWindowsHookEx(WH_MOUSE, @HookMouseProc, HInstance,Windows.GetCurrentThreadId);
//  end
//  else
//  begin
//    UnhookWindowsHookEx(MouseHook);
//  end;
//end;

function CreateSkinSelectPopupForm(AOwnerForm:TForm;AfrmSkinSelectPopupClass:TfrmSkinSelectPopupClass):TfrmSkinSelectPopup;//(WndParent:TForm);
begin
  Result:=AfrmSkinSelectPopupClass.Create(AOwnerForm);
  InitSkinSelectPopupForm(Result);
end;

procedure InitSkinSelectPopupForm(ASkinSelectPopupForm:TfrmSkinSelectPopup);
//var
//  OldWidth,OldHeight:Integer;
begin
//  OldWidth:=ASkinSelectPopupForm.Width;
//  OldHeight:=ASkinSelectPopupForm.Height;
//  ASkinSelectPopupForm.SetBounds(0,0,0,0);
//  ASkinSelectPopupForm.Show;
//  ASkinSelectPopupForm.HidePopup;
//  ASkinSelectPopupForm.SetBounds(0,0,OldWidth,0);
end;

procedure HideSkinSelectPopupForm(frmSkinSelectPopup:TfrmSkinSelectPopup);
begin
  if frmSkinSelectPopup<>nil then
  begin
    frmSkinSelectPopup.HidePopup;
  end;
end;

procedure TfrmSkinSelectPopup.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  with Params do
//  begin
////    if (Owner<>nil) and (Owner is TForm) then
////    begin
////      Params.WndParent:=TForm(Owner).Handle;
////    end;
//
//    Style:=Style or CS_DROPSHADOW;
//
//    ExStyle:=ExStyle or WS_EX_TOOLWINDOW;
//  end;
end;

procedure TfrmSkinSelectPopup.DoFilter(AKeyword: String);
begin

end;

procedure TfrmSkinSelectPopup.CustomPopup;
begin

end;

procedure TfrmSkinSelectPopup.DoClear;
begin

end;

procedure TfrmSkinSelectPopup.FormCreate(Sender: TObject);
//var
//  OldWidth,OldHeight:Integer;
begin
  FKeyWord:='';

//  BorderStyle:=bsNone;

  {$IFDEF FPC}
  {$ELSE}
  Self.ImeMode:=imClose;
  //Shadow Form
  FWinForm:=TSkinWinForm.Create(Self);
  {$ENDIF}




//  OldWidth:=Self.Width;
//  OldHeight:=Self.Height;
//  Self.SetBounds(0,0,0,0);
//  //不Show的话,里面的控件显示不出来
//  Self.Show;
//  Self.HidePopup;
//  Self.SetBounds(0,0,OldWidth,0);

end;

procedure TfrmSkinSelectPopup.FormDeactivate(Sender: TObject);
begin
  uBaseLog.OutputDebugString('TfrmSkinSelectPopup.FormDeactivate');
  Hide;
end;

procedure TfrmSkinSelectPopup.FormDestroy(Sender: TObject);
begin
  if CurrentPopupSkinSelectPopupForm=Self then
  begin
    CurrentPopupSkinSelectPopupForm:=nil;
//    HookMouse(False);
  end;
end;

procedure TfrmSkinSelectPopup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfrmSkinSelectPopup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //
end;

procedure TfrmSkinSelectPopup.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfrmSkinSelectPopup.HidePopup;
begin
  FKeyWord:='';

  Hide;

//  //隐藏窗体
//  ShowWindow(Self.Handle,SW_HIDE);

  IsPopuped:=False;

  if CurrentPopupSkinSelectPopupForm=Self then
  begin
    CurrentPopupSkinSelectPopupForm:=nil;
//    HookMouse(False);
  end;

  //清空数据,避免下次显示窗体的时候还保留着上次的数据
  DoClear;

//  DoHide;



end;

procedure TfrmSkinSelectPopup.Popup(APopupPoint:TPoint;
                                  APopupFormWidth:Integer;
                                  APopupFormHeight:Integer;
                                  AParentFormHandle:Integer;
                                  AShowFlag:Integer);
begin


  if AParentFormHandle=-1 then
  begin
    { #todo : 需要处理 }
    {$IFDEF DELPHI}
    AParentFormHandle:=Application.ActiveFormHandle;
    {$ENDIF}
  end;

  //弹出窗体
//  SetWindowPos(Self.Handle,
//                //HWND_TOPMOST,这个会把输入法挡住的
//                ////AParentForm.Handle,//0,
//                AParentFormHandle,
//                APopupPoint.X,APopupPoint.Y,
//                APopupFormWidth,APopupFormHeight,
//                AShowFlag//SWP_NOACTIVATE or SWP_SHOWWINDOW// or SWP_NOZORDER
//                );
  SetBounds(APopupPoint.X,APopupPoint.Y,APopupFormWidth,APopupFormHeight);
  Show;

  CurrentPopupSkinSelectPopupForm:=Self;

//  HookMouse(True);


  CustomPopup;

end;

procedure TfrmSkinSelectPopup.PopupAndFilter(
                                    AKeyWord:String;
                                    APopupPoint:TPoint;
                                    APopupFormWidth:Integer;
                                    APopupFormHeight:Integer);
begin
  if (CurrentPopupSkinSelectPopupForm<>nil)
    and (CurrentPopupSkinSelectPopupForm<>Self) then
  begin
    HideSkinSelectPopupForm(CurrentPopupSkinSelectPopupForm);
  end;

  //过滤
  if FKeyWord<>AKeyWord then
  begin
    FKeyWord:=AKeyWord;
    DoFilter(AKeyWord);
  end;


  //弹出窗体
  Self.Popup(APopupPoint,APopupFormWidth,APopupFormHeight);


  Self.IsPopuped:=True;

end;

{ TfrmSelectListViewPopup }

//constructor TfrmSelectListViewPopup.Create(AOwner: TComponent);
//begin
//  inherited;
//
//
//
//end;
//
//destructor TfrmSelectListViewPopup.Destroy;
//begin
//
//  inherited;
//end;

initialization
  CurrentPopupSkinSelectPopupForm:=nil;



end.
