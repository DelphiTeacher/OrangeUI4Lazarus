﻿//convert pas to utf8 by ¥
//皮肤文本框//
unit uSkinWindowsComboBox;

interface
{$I FrameWork.inc}

{$I Source\VCL\WinComboBox.inc}

uses
  Windows,
  Classes,
  Controls,
  SysUtils,
  Messages,
  StdCtrls,
  Forms,

  //{$IF CompilerVersion>=30.0}
  Types,//定义了TRectF
  //{$IFEND}

  ExtCtrls,
  Graphics,
  uVersion,
  uSkinPublic,
  uFuncCommon,
  uGraphicCommon,
  uBaseLog,
  uBaseList,
  uBinaryTreeDoc,
//  uSkinPackage,
  uSkinRegManager,
  uSkinBufferBitmap,
  uDrawCanvas,
  uSkinMaterial,
  uComponentType,
  uBasePageStructure,
  uSkinComboBoxType,
  uDrawEngine,
  uDrawPicture,
  uDrawTextParam,
  uDrawPictureParam;


type
  //皮肤文本框TSkinComboBox
  TSkinWinComboBox=class(TComboBox,
      ISkinComboBox,
          ISkinControlMaterial,
          IDirectUIControl,
    //  ISkinComponent,
      ISkinControl,
      IBindSkinItemTextControl,
      IBindSkinItemValueControl,
      ISkinItemBindingControl,
      IControlForPageFramework
  )
  private
    {$I Source\Controls\INC\Common\ISkinControl_Declare.inc}
    {$I Source\Controls\INC\VCL\ISkinControl_Control_Impl_Mouse_Declare_VCL.inc}
    {$I Source\Controls\INC\VCL\ISkinControl_Control_Impl_Key_Declare_VCL.inc}
    {$I Source\Controls\INC\Common\ISkinControl_Control_Impl_Common_Declare.inc}
    {$I Source\Controls\INC\Common\ISkinControl_Control_Impl_DirectUI_Declare.inc}
    {$I Source\Controls\INC\Common\ISkinComponent_Skin_Impl_Field_Declare.inc}
    {$I Source\Controls\INC\Common\ISkinComponent_Skin_Impl_Property_Declare.inc}
    {$I Source\Controls\INC\Common\ISkinComponent_Properties_Impl_Declare.inc}
    {$I Source\Controls\INC\Common\ISkinControl_Control_Impl_Mouse_Declare.inc}
  protected
    function GetComboBoxProperties:TComboBoxProperties;
    procedure SetComboBoxProperties(Value:TComboBoxProperties);




  protected
    //缓存位图
    FBufferBitmap:TBufferBitmap;
    //缓存位图
    function GetBufferBitmap: TBufferBitmap;
    //缓存位图
    property BufferBitmap:TBufferBitmap read GetBufferBitmap;





  protected
    //检测鼠标的定时器
    FCheckMouseStayTimer:TTimer;
    FCheckMouseStayTimerID:Integer;
    procedure CreateCheckMouseStayTimer;
    procedure OnCheckMouseStayTimer(Sender:TObject);




  protected
    //处理透明背景
    FTransparentBrush:TBrush;
    FTransparentBitmap:TBitmap;
    procedure CNCtlColorEdit(var Message:TWMCtlColorEdit);message CN_CTLCOLOREDIT;



  protected
    procedure Draw(DC:HDC);
//    //清除背景
//    procedure EraseBackGnd(ACanvas:TDrawCanvas);virtual;
//    procedure Paint; override;
    //消息处理
//    procedure PaintWindow(DC: HDC); override;
    procedure WMPaint(var Message:TWMPaint);message WM_PAINT;
    procedure WMEraseBkGnd(var Message:TWMEraseBkGnd);message WM_ERASEBKGND;
//    procedure WMNCCalcSize(var Message:TWMNCCalcSize);message WM_NCCALCSIZE;
//    procedure WMNCPaint(var Message:TWMNCPaint);message WM_NCPAINT;
    procedure WMKillFocus(var Message:TMessage);message WM_KILLFOCUS;
//    //绘制非客户区
//    procedure NCPaintWindow;
//    //非客户区绘制
//    function NCPaint(ACanvas:TDrawCanvas;const ADrawRect:TRect):Boolean;virtual;

//    procedure WMNCHitTest(var Message:TWMNCHitTest);message WM_NCHITTEST;

    procedure WMSize(var Message:TWMSize);message WM_SIZE;

    //在窗体更改尺寸的事件中刷新
    procedure CMInvalidateInParentWMSize(var Message:TMessage);message CM_InvalidateInParentWMSize;


  protected
    //IBindSkinItemTextControl
    procedure BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
    //IBindSkinItemValueControl
    procedure SetControlValueByBindItemField(const AFieldName:String;
                                              const AFieldValue:Variant;
                                              ASkinItem:TObject;
                                              AIsDrawItemInteractiveState:Boolean);

  protected
    //标题
    function GetCaption:String;
    procedure SetCaption(const Value:String);


  protected
//    //在ListBox中点击自动编辑
//    FIsAutoComboBoxInItem:Boolean;


    //边框边距
    FBorderMargins:TBorderMargins;
//    FNCBorderMargins:TBorderMargins;

    procedure SetBorderMargins(const Value: TBorderMargins);
//    procedure SetNCBorderMargins(const Value: TBorderMargins);
    procedure OnBorderMarginsChangeNotify(Sender:TObject);
  public
    //针对页面框架的控件接口
    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;virtual;
//    //获取合适的高度
//    function GetSuitDefaultItemHeight:Double;
    //获取与设置自定义属性
    function GetPropJsonStr:String;virtual;
    procedure SetPropJsonStr(AJsonStr:String);virtual;

    //获取提交的值
    function GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
                            var AErrorMessage:String):Variant;virtual;
    //设置值
    procedure SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;AImageServerUrl:String;AValue:Variant;AValueCaption:String;
                            //要设置多个值,整个字段的记录
                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue);virtual;
//    //设置属性
//    function GetProp(APropName:String):Variant;virtual;
//    procedure SetProp(APropName:String;APropValue:Variant);virtual;
    procedure DoReturnFrame(AFromFrame:TFrame);
  published
    //边框扩展边距(在VCL下才有用,FMX下此属性无用)
//    property BorderMargins:TBorderMargins read FBorderMargins write SetBorderMargins;
//    property NCBorderMargins:TBorderMargins read FNCBorderMargins write SetNCBorderMargins;
//


  protected
    function GetText:String;
//    function IsReadOnly:Boolean;
//    function GetPasswordChar:Char;


  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;


  published
  published
    property HitTest:Boolean read GetNeedHitTest write FNeedHitTest;
    //属性
    property Properties:TComboBoxProperties read GetComboBoxProperties write SetComboBoxProperties;
    //属性别名
    property ComboBoxProperties:TComboBoxProperties read GetComboBoxProperties write SetComboBoxProperties;

//    //在列表项中自动启动编辑
//    property IsAutoComboBoxInItem:Boolean read FIsAutoComboBoxInItem write FIsAutoComboBoxInItem;

//  published
//    property Align;
////    property Alignment;
//    property Anchors;
////    property AutoSelect;
////    property AutoSize;
////    property BevelEdges;
////    property BevelInner;
////    property BevelKind default bkNone;
////    property BevelOuter;
////    property BevelWidth;
//    property BiDiMode;
////    property BorderStyle;
//    property CharCase;
//    property Color;
//    property Constraints;
////    property Ctl3D;
//    property DoubleBuffered;
//    property DragCursor;
//    property DragKind;
//    property DragMode;
//    property Enabled;
//    property Font;
////    property HideSelection;
//    property ImeMode;
//    property ImeName;
//    property MaxLength;
////    property NumbersOnly;
////    property OEMConvert;
//    property ParentBiDiMode;
//    property ParentColor;
////    property ParentCtl3D;
//    property ParentDoubleBuffered;
//    property ParentFont;
//    property ParentShowHint;
////    property PasswordChar;
//    property PopupMenu;
////    property ReadOnly;
//    property ShowHint;
//    property TabOrder;
//    property TabStop;
//    property Text;
//    property TextHint;
//    property Touch;
//    property Visible;
//    {$IF CompilerVersion >= 30.0}
//    property StyleElements;
//    {$IFEND}
//    property OnChange;
//    property OnClick;
//    property OnContextPopup;
//    property OnDblClick;
//    property OnDragDrop;
//    property OnDragOver;
//    property OnEndDock;
//    property OnEndDrag;
//    property OnEnter;
//    property OnExit;
//    property OnGesture;
//    property OnKeyDown;
//    property OnKeyPress;
//    property OnKeyUp;
//    property OnMouseActivate;
//    property OnMouseDown;
//    property OnMouseEnter;
//    property OnMouseLeave;
//    property OnMouseMove;
//    property OnMouseUp;
//    property OnStartDock;
//    property OnStartDrag;
  end;

  TSkinComboBox=class(TSkinWinComboBox)
  end;




implementation




{ TSkinWinComboBox }


{$I Source\Controls\INC\Common\ISkinComponent_Skin_Impl_Field_Code.inc}
{$I Source\Controls\INC\Common\ISkinComponent_Properties_Impl_Code.inc}
{$I Source\Controls\INC\VCL\ISkinControl_Control_Impl_Code_VCL.inc}
{$I Source\Controls\INC\VCL\ISkinControl_Control_Impl_Mouse_Code_VCL.inc}
{$I Source\Controls\INC\VCL\ISkinControl_Control_Impl_Key_Code_VCL.inc}
{$I Source\Controls\INC\Common\ISkinControl_Control_Impl_Common_Code.inc}
{$I Source\Controls\INC\Common\ISkinControl_Control_Impl_DirectUI_Code.inc}
{$I Source\Controls\INC\Common\ISkinControl_Control_Impl_Mouse_Code.inc}







constructor TSkinWinComboBox.Create(AOwner: TComponent);
begin

  FBorderMargins:=TBorderMargins.Create;
  FBorderMargins.SetBounds(1,1,1,1);

//  FNCBorderMargins:=TBorderMargins.Create;
//  FNCBorderMargins.SetBounds(2,2,2,2);


  inherited Create(AOwner);
  {$I Source\Controls\INC\Common\ISkinComponent_Skin_Impl_Create_Code.inc}


//  //创建控件属性
//  FProperties:=Self.GetPropertiesClassType.Create(Self);


  FBorderMargins.OnChange:=Self.OnBorderMarginsChangeNotify;


  Self.AutoSize:=False;

  {$IFDEF DELPHI}
//  Self.BorderStyle:=bsNone;
  Self.Ctl3D:=False;
  Self.ParentCtl3D:=False;
  Self.BevelEdges:=[];
  Self.BevelInner:=bvNone;
  Self.BevelKind:=bkNone;
  Self.BevelOuter:=bvNone;
  Self.BevelWidth:=1;
  {$ENDIF}

end;

destructor TSkinWinComboBox.Destroy;
begin

  {$I Source\Controls\INC\Common\ISkinComponent_Skin_Impl_Destroy_Code.inc}

  FreeAndNil(FBufferBitmap);

  FreeAndNil(FTransparentBrush);
  FreeAndNil(FTransparentBitmap);

  FreeAndNil(FProperties);

  FBorderMargins.OnChange:=nil;
  FreeAndNil(FBorderMargins);

//  FNCBorderMargins.OnChange:=nil;
//  uFuncCommon.FreeAndNil(FNCBorderMargins);
  inherited;
end;

procedure TSkinWinComboBox.SetBorderMargins(const Value: TBorderMargins);
begin
  FBorderMargins.Assign(Value);
end;

//procedure TSkinWinComboBox.SetNCBorderMargins(const Value: TBorderMargins);
//begin
//  FNCBorderMargins.Assign(Value);
//end;

procedure TSkinWinComboBox.OnBorderMarginsChangeNotify(Sender: TObject);
begin
end;



function TSkinWinComboBox.LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;
begin
//  SetMaterialUseKind(TMaterialUseKind.mukRefByStyleName);
//  SetMaterialName(ASetting.ControlStyle);
//
//  if ASetting.HasHintLabel=0 then
//  begin
//    Caption:=ASetting.Caption;
//  end;
  Self.ComboBoxProperties.HelpText:=ASetting.input_prompt;
  Self.MaxLength:=ASetting.input_max_length;

  Result:=True;
end;

function TSkinWinComboBox.GetPropJsonStr:String;
begin
  Result:=Self.ComboBoxProperties.GetPropJsonStr;
end;

procedure TSkinWinComboBox.SetPropJsonStr(AJsonStr:String);
begin
  Self.ComboBoxProperties.SetPropJsonStr(AJsonStr);
end;

////设置属性
//function TSkinWinComboBox.GetProp(APropName:String):Variant;
//begin
//  Result:='';
//end;
//
//procedure TSkinWinComboBox.SetProp(APropName:String;APropValue:Variant);
//begin
//end;



function TSkinWinComboBox.GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
                                          var AErrorMessage:String):Variant;
begin
  Result:=Text;
end;

procedure TSkinWinComboBox.SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;AImageServerUrl:String;AValue:Variant;AValueCaption:String;
                                              //要设置多个值,整个字段的记录
                                              AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue);
begin
  Text:=AValue;
end;

procedure TSkinWinComboBox.DoReturnFrame(AFromFrame:TFrame);
begin

end;


function TSkinWinComboBox.GetBufferBitmap: TBufferBitmap;
begin
  if (FBufferBitmap=nil) then
  begin
    FBufferBitmap:=TBufferBitmap.Create;
  end;
  Result:=Self.FBufferBitmap;
end;

procedure TSkinWinComboBox.CreateCheckMouseStayTimer;
begin
  if FCheckMouseStayTimer=nil then
  begin
    FCheckMouseStayTimer:=TTimer.Create(Self);
    FCheckMouseStayTimer.OnTimer:=OnCheckMouseStayTimer;
    FCheckMouseStayTimer.Interval:=100;
    FCheckMouseStayTimer.Enabled:=False;
  end;
end;

procedure TSkinWinComboBox.WMEraseBkGnd(var Message: TWMEraseBkGnd);
begin
  Inherited;
//    Message.Result:=1;
//    Draw(Message.DC);
end;

procedure TSkinWinComboBox.CMInvalidateInParentWMSize(var Message: TMessage);
begin
  Inherited;
//  Self.NCPaintWindow;
  Self.Invalidate;
end;

procedure TSkinWinComboBox.WMPaint(var Message: TWMPaint);
//procedure TSkinWinComboBox.WMPaint(var Message: TWMPaint);
//procedure TSkinWinComboBox.Paint;
//var
//  DC:HDC;
var
  I, Clip, SaveIndex: Integer;
  DC: HDC;
  PS: TPaintStruct;
begin
//  Inherited;

//  //绘制提示文本
////  if (Text='') and (Self.ComboBoxProperties.HelpText<>'') then
////  begin
//    if Self.GetSkinControlType<>nil then
//    begin
//      DC := GetDC(Handle);
//      try
//        Draw(DC);
//      finally
//        ReleaseDC(Handle,DC);
//      end;
//    end;
////    Message.Result:=1;
////  end;
//    Message.Result:=1;


  DC := Message.DC;
  if DC = 0 then DC := BeginPaint(Handle, PS);
  try
//      DC := GetDC(Handle);
      try
        Draw(DC);
      finally
//        ReleaseDC(Handle,DC);
      end;
//    if FControls = nil then PaintWindow(DC) else
//    begin
//      SaveIndex := SaveDC(DC);
//      try
//        Clip := SimpleRegion;
//        for I := 0 to FControls.Count - 1 do
//          with TControl(FControls[I]) do
//            if (Visible and (not (csDesigning in ComponentState) or not (csDesignerHide in ControlState)) or
//              ((csDesigning in ComponentState) and not (csDesignerHide in ControlState)) and
//              not (csNoDesignVisible in ControlStyle)) and
//              (csOpaque in ControlStyle) then
//            begin
//              Clip := ExcludeClipRect(DC, Left, Top, Left + Width, Top + Height);
//              if Clip = NullRegion then Break;
//            end;
//        if Clip <> NullRegion then PaintWindow(DC);
//      finally
//        RestoreDC(DC, SaveIndex);
//      end;
//    end;
//    PaintControls(DC, nil);
  finally
    if Message.DC = 0 then EndPaint(Handle, PS);
  end;


end;




//function TSkinWinComboBox.NCPaint(ACanvas: TDrawCanvas;const ADrawRect: TRect): Boolean;
//begin
//
//
//    //绘制父控件背景
//    if (Self.GetCurrentUseMaterial<>nil) then
//    begin
//      if TSkinControlMaterial(Self.GetCurrentUseMaterial).IsTransparent then
//      begin
//        DrawParent(Self,
//                    ACanvas.Handle,
//                    0,0,Self.Width,Self.Height,
//                    0,0);
//      end;
//    end;
//
//
//
//    //绘制
//    if (GetSkinControlType<>nil) then
//    begin
//      FPaintData:=GlobalNullPaintData;
//      FPaintData.IsDrawInteractiveState:=True;
//      FPaintData.IsInDrawDirectUI:=False;
//      TSkinControlType(Self.GetSkinControlType).Paint(ACanvas,
//                                                        Self.GetCurrentUseMaterial,
//                                                        RectF(0,0,Self.Width,Self.Height),
//                                                        FPaintData);
//    end;
//
//
//    //设计时绘制虚线框和控件名称
//    if (csDesigning in Self.ComponentState) then
//    begin
//      ACanvas.DrawDesigningRect(RectF(0,0,Width,Height),GlobalNormalDesignRectBorderColor);
//
//      ACanvas.DrawDesigningText(RectF(0,0,Width,Height),Self.Name);
//    end;
//
//
//
//
//
////    //如果是运行时，并且是试用版，而且到期，那么显示试用版已到期，请联系作者DelphiTeacher
////    if not (csDesigning in Self.ComponentState)
////        and TBTNode20(uCopyRight.GetCopyRightInfo('GlobalNode_IsTray')).ConvertNode_Bool32.Data
////        and ((Now-TBTNode20(uCopyRight.GetCopyRightInfo('GlobalNode_LicensedDate')).ConvertNode_DateTime.Data)
////                  >TBTNode20(uCopyRight.GetCopyRightInfo('GlobalNode_TrayMonths')).ConvertNode_Int32.Data*31)
////    then
////    begin
////      ACanvas.Canvas.TextOut(0,0,'试用版已到期');
////    end;
//
//end;
//
//procedure TSkinWinComboBox.NCPaintWindow;
//var
//  DC:HDC;
//begin
//
//  DC:=GetWindowDC(Handle);
//
//  //绘制边框和其他非客户区
//  if (Self.BufferBitmap.Width<>Self.Width) or (Self.BufferBitmap.Height<>Self.Height) then
//  begin
//    Self.BufferBitmap.CreateBufferBitmap(Self.Width,Self.Height);
//  end;
//
//
//
//  Try
//    if Self.BufferBitmap.DrawCanvas<>nil then
//    begin
//
//      NCPaint(Self.BufferBitmap.DrawCanvas,Rect(0,0,Self.Width,Self.Height));
//
//
//
//      StretchBlt(DC,0,0,
//                  Self.Width,Self.FBorderMargins.Top,
//                  Self.BufferBitmap.Handle,0,0,
//                  Self.Width,Self.FBorderMargins.Top,
//                  SRCCOPY);
//      StretchBlt(DC,0,Self.Height-Self.FBorderMargins.Bottom,
//                  Self.Width,Self.FBorderMargins.Bottom,
//                  Self.BufferBitmap.Handle,0,Self.Height-Self.FBorderMargins.Bottom,
//                  Self.Width,Self.FBorderMargins.Bottom,
//                  SRCCOPY);
//      StretchBlt(DC,0,Self.FBorderMargins.Top,
//                  Self.FBorderMargins.Left,//+Self.GetCustomWMNCCalcSizeLeftWidth,
//                  Self.Height-Self.FBorderMargins.Top-Self.FBorderMargins.Bottom,
//                  Self.BufferBitmap.Handle,0,Self.FBorderMargins.Top,
//                  Self.FBorderMargins.Left,//+Self.GetCustomWMNCCalcSizeLeftWidth,
//                  Self.Height-Self.FBorderMargins.Top-Self.FBorderMargins.Bottom,
//                  SRCCOPY);
//      StretchBlt(DC,Self.Width-Self.FBorderMargins.Right,//-Self.GetCustomWMNCCalcSizeRightWidth,
//                  Self.FBorderMargins.Top,
//                  Self.FBorderMargins.Right,//+Self.GetCustomWMNCCalcSizeRightWidth,
//                  Self.Height-Self.FBorderMargins.Top-Self.FBorderMargins.Bottom,
//                  Self.BufferBitmap.Handle,Self.Width-Self.FBorderMargins.Right,//-Self.GetCustomWMNCCalcSizeRightWidth,
//                  Self.FBorderMargins.Top,
//                  Self.FBorderMargins.Right,//+Self.GetCustomWMNCCalcSizeRightWidth,
//                  Self.Height-Self.FBorderMargins.Top-Self.FBorderMargins.Bottom,
//                  SRCCOPY);
//
//    end;
//  finally
//    ReleaseDC(Handle,DC);
//  end;
//
//end;

procedure TSkinWinComboBox.CNCtlColorEdit(var Message: TWMCtlColorEdit);
begin
  Inherited;

  FreeAndNil(FTransparentBitmap);
  FreeAndNil(FTransparentBrush);

  FTransparentBitmap:=TBitmap.Create;
  FTransparentBrush:=TBrush.Create;

  SetBkMode(TWMCtlColorEdit(Message).ChildDC,TRANSPARENT);
  FTransparentBitmap.Width:=Self.Width;
  FTransparentBitmap.Height:=Self.Height;

  DrawParent(Self,
              Self.FTransparentBitmap.Canvas.Handle,
              0,0,
              Self.Width-Self.FBorderMargins.Left-Self.FBorderMargins.Right,
              Self.Height-Self.FBorderMargins.Top-Self.FBorderMargins.Bottom,
              Self.FBorderMargins.Left,
              Self.FBorderMargins.Top);

  if FBufferBitmap<>nil then
  begin
    Bitblt(FTransparentBitmap.Canvas.Handle,
           0,0,FTransparentBitmap.Width,FTransparentBitmap.Height,
           Self.FBufferBitmap.Handle,
           Self.FBorderMargins.Left,
           Self.FBorderMargins.Top,
           SRCCOPY
            );
  end;

  FTransparentBrush.Bitmap:=FTransparentBitmap;

  TWMCtlColorEdit(Message).Result:=FTransparentBrush.Handle;


end;

//procedure TSkinWinComboBox.WMNCCalcSize(var Message: TWMNCCalcSize);
//var
//  NewWindowRect:TRect;
//  OldWindowRect:TRect;
//  OldClientRect:TRect;
//  NewClientRect:TRect;
//  PNewWindowRect:PRect;
//  NCCalcSizeParams: PNCCalcSizeParams;
//begin
//  Inherited;
//  if
//        (Self.ComboBoxProperties<>nil)
//    and (Self.FNCBorderMargins<>nil) then
//  begin
//    //自定义边框
//    if TWMNCCalcSize(Message).CalcValidRects then
//    begin
//      NCCalcSizeParams:=TWMNCCalcSize(Message).CalcSize_Params;
//
//      NewWindowRect:=NCCalcSizeParams.rgrc[0];
//      OldWindowRect:=NCCalcSizeParams.rgrc[1];
//      OldClientRect:=NCCalcSizeParams.rgrc[2];
//      NewClientRect.Left:=NewWindowRect.Left+Self.FNCBorderMargins.Left;//+GetCustomWMNCCalcSizeLeftWidth;
//      NewClientRect.Top:=NewWindowRect.Top+Self.FNCBorderMargins.Top;
//      NewClientRect.Right:=NewWindowRect.Right-Self.FNCBorderMargins.Right;//-GetCustomWMNCCalcSizeRightWidth;
//      NewClientRect.Bottom:=NewWindowRect.Bottom-Self.FNCBorderMargins.Bottom;
//      NCCalcSizeParams.rgrc[0]:=NewClientRect;
//      NCCalcSizeParams.rgrc[1]:=NewWindowRect;
//      NCCalcSizeParams.rgrc[2]:=OldClientRect;
//
//    end
//    else
//    begin
//      PNewWindowRect:=PRect(Pointer(TWMNCCalcSize(Message).CalcSize_Params));
//      PNewWindowRect.Left:=PNewWindowRect.Left+Self.FNCBorderMargins.Left;//+GetCustomWMNCCalcSizeLeftWidth;
//      PNewWindowRect.Top:=PNewWindowRect.Top+Self.FNCBorderMargins.Top;
//      PNewWindowRect.Right:=PNewWindowRect.Right-Self.FNCBorderMargins.Right;//-GetCustomWMNCCalcSizeRightWidth;
//      PNewWindowRect.Bottom:=PNewWindowRect.Bottom-Self.FNCBorderMargins.Bottom;
//    end;
//  end;
//end;
//
//procedure TSkinWinComboBox.WMNCPaint(var Message: TWMNCPaint);
//begin
////  Inherited;
//  Message.Result:=1;
//  NCPaintWindow;
//end;

procedure TSkinWinComboBox.WMKillFocus(var Message: TMessage);
begin
  Inherited;
  Invalidate;
//  NCPaintWindow;
end;

procedure TSkinWinComboBox.OnCheckMouseStayTimer(Sender: TObject);
var
  CursorPos:TPoint;
  WindowRect:TRect;
begin
  case FCheckMouseStayTimerID of
    0://判断鼠标是否在控件中
    begin

      if GetCursorPos(CursorPos)
          and Windows.GetWindowRect(Handle,WindowRect)
          and Windows.PtInRect(WindowRect,CursorPos) then
      begin
        //鼠标在控件中,刷新
//        NCPaintWindow;
        Invalidate;
      end
      else
      begin
        Self.IsMouseOver:=False;
        CreateCheckMouseStayTimer;
        Self.FCheckMouseStayTimer.Enabled:=False;
//        DoCustomMouseLeave;
//        NCPaintWindow;
        Invalidate;
      end;
    end;
  end;
end;

//procedure TSkinWinComboBox.WMNCHitTest(var Message: TWMNCHitTest);
//begin
//  Inherited;
//  if Not (csDesigning in Self.ComponentState) then
//  begin
//
////      //设置鼠标进入状态
////      if Not Self.IsMouseOver then
////      begin
////        Self.IsMouseOver:=True;
//////        DoCustomMouseEnter;
////        CreateCheckMouseStayTimer;
////        Self.FCheckMouseStayTimerID:=0;
////        Self.FCheckMouseStayTimer.Enabled:=True;
////        Invalidate;
////        Self.NCPaintWindow;
////      end;
//
//  end;
//end;

procedure TSkinWinComboBox.WMSize(var Message: TWMSize);
begin
  Inherited;
//  if Not (csDesigning in Self.ComponentState) then
//  begin
//    Invalidate;
//    Self.NCPaintWindow;
//  end;
end;

function TSkinWinComboBox.GetComboBoxProperties: TComboBoxProperties;
begin
  Result:=TComboBoxProperties(Self.FProperties);
end;

procedure TSkinWinComboBox.SetComboBoxProperties(Value: TComboBoxProperties);
begin
  Self.FProperties.Assign(Value);
end;

function TSkinWinComboBox.GetPropertiesClassType: TPropertiesClassType;
begin
  Result:=TComboBoxProperties;
end;

//function TSkinWinComboBox.IsReadOnly:Boolean;
//begin
//  Result:=ReadOnly;
//end;
//
//function TSkinWinComboBox.GetPasswordChar:Char;
//begin
//  Result:=PasswordChar;
//end;

function TSkinWinComboBox.GetText:String;
begin
  Result:=Text;
end;

procedure TSkinWinComboBox.SetCaption(const Value:String);
begin
  if Caption<>Value then
  begin
    Inherited Caption:=Value;
    if GetSkinControlType<>nil then
    begin
      TSkinControlType(GetSkinControlType).TextChanged;
    end;
  end;
end;

function TSkinWinComboBox.GetCaption:String;
begin
  Result:=Inherited Caption;
end;


procedure TSkinWinComboBox.BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
begin
  Self.ComboBoxProperties.DrawText:=AText;
end;


procedure TSkinWinComboBox.SetControlValueByBindItemField(const AFieldName:String;
                                              const AFieldValue:Variant;
                                              ASkinItem:TObject;
                                              AIsDrawItemInteractiveState:Boolean);
begin
  Self.ComboBoxProperties.DrawText:=AFieldValue;
end;


//procedure TSkinWinComboBox.EraseBackGnd(DC: HDC);
//begin
//  Draw(DC);
//end;

procedure TSkinWinComboBox.Draw(DC: HDC);
var
  ACanvas:TDrawCanvas;
begin
        ACanvas:=CreateDrawCanvas('TSkinWinComboBox.WMPaint');
        if ACanvas<>nil then
        begin
          try
            ACanvas.Prepare(DC);


            FPaintData:=GlobalNullPaintData;
            FPaintData.IsDrawInteractiveState:=True;
            FPaintData.IsInDrawDirectUI:=False;



            //绘制父控件背景
            if (Self.GetCurrentUseMaterial<>nil) then
            begin
              if TSkinControlMaterial(Self.GetCurrentUseMaterial).IsTransparent then
              begin
                DrawParent(Self,
                            ACanvas.Handle,
                            0,0,Self.Width,Self.Height,
                            0,0);
              end;
            end;



            //绘制
            if (GetSkinControlType<>nil) then
            begin
              FPaintData:=GlobalNullPaintData;
              FPaintData.IsDrawInteractiveState:=True;
              FPaintData.IsInDrawDirectUI:=False;
              TSkinControlType(Self.GetSkinControlType).Paint(ACanvas,
                                                                Self.GetCurrentUseMaterial,
                                                                RectF(0,0,Self.Width,Self.Height),
                                                                FPaintData);
            end;


            //设计时绘制虚线框和控件名称
            if (csDesigning in Self.ComponentState) then
            begin
              ACanvas.DrawDesigningRect(RectF(0,0,Width,Height),GlobalNormalDesignRectBorderColor);

              ACanvas.DrawDesigningText(RectF(0,0,Width,Height),Self.Name);
            end;


            TSkinComboBoxDefaultType(Self.GetSkinControlType).CustomPaintHelpText(
                  ACanvas,
                  Self.GetCurrentUseMaterial,
                  RectF(Self.GetClientRect.Left,Self.GetClientRect.Top,Self.GetClientRect.Right,Self.GetClientRect.Bottom),
                  FPaintData);

          finally
            FreeAndNil(ACanvas);
          end;
        end;
end;

initialization
  RegisterClasses([TSkinComboBox]);


end.

