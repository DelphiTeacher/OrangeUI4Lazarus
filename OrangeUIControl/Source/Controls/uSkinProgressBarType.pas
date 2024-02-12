//convert pas to utf8 by ¥

/// <summary>
///   <para>
///     进度条
///   </para>
///   <para>
///     Progress Bar
///   </para>
/// </summary>
unit uSkinProgressBarType;

interface
{$I FrameWork.inc}

uses
  Classes,
  SysUtils,
  {$IFDEF VCL}
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Messages,
  Controls,
  {$ENDIF}
  {$IFDEF FMX}
  FMX.Types,
  UITypes,
  FMX.Controls,
  {$ENDIF}
  Math,
  Variants,
  Types,
  uBaseLog,
  uSkinItems,
  uFuncCommon,
  uBaseSkinControl,
  uGraphicCommon,
  uDrawCanvas,
  uDrawPathParam,
  uDrawEngine,
  uSkinRegManager,
  uSkinMaterial,
  uBinaryTreeDoc,
  uDrawPicture,
  uBasePathData,
  uSkinBufferBitmap,
  uComponentType,
  uDrawTextParam,
  uDrawRectParam,
  uDrawPictureParam;


const
  IID_ISkinProgressBar:TGUID='{1D001BFE-978E-47FD-B966-6284A12A0081}';



type
  TProgressBarOrientation=(
                          prHorizontal,
                          prVertical
                          );
  TProgressBarProperties=class;




  /// <summary>
  ///   <para>
  ///     进度条接口
  ///   </para>
  ///   <para>
  ///     Interface of ProgressBar
  ///   </para>
  /// </summary>
  ISkinProgressBar=interface//(ISkinControl)
    ['{1D001BFE-978E-47FD-B966-6284A12A0081}']
    function GetOnChange: TNotifyEvent;
    property OnChange: TNotifyEvent read GetOnChange;// write SetOnChange;

    function GetProgressBarProperties:TProgressBarProperties;
    property Properties:TProgressBarProperties read GetProgressBarProperties;
    property Prop:TProgressBarProperties read GetProgressBarProperties;
  end;




  //
  /// <summary>
  ///   <para>
  ///     进度条属性
  ///   </para>
  ///   <para>
  ///     Properties of ProgressBar
  ///   </para>
  /// </summary>
  TProgressBarProperties=class(TSkinControlProperties)
  protected
    FMin: Integer;
    FMax: Integer;
    FPosition: Integer;

    FOrientation:TProgressBarOrientation;

    FSkinProgressBarIntf:ISkinProgressBar;

    procedure DoChange;

    procedure SetOrientation(const Value: TProgressBarOrientation);
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPosition(const Value: Integer);

    procedure SetParams(APosition, AMin, AMax: Integer);
    //赋值
    procedure AssignProperties(Src:TSkinControlProperties);override;
    //获取分类名称
    function GetComponentClassify:String;override;
  public
    constructor Create(ASkinControl:TControl);override;
    destructor Destroy;override;
  public
    function GetPercent:Double;
    property StaticPosition: Integer read FPosition write FPosition;
  published

    /// <summary>
    ///   <para>
    ///     最小值
    ///   </para>
    ///   <para>
    ///     Min
    ///   </para>
    /// </summary>
    property Min: Integer read FMin write SetMin;
    /// <summary>
    ///   <para>
    ///     最大值
    ///   </para>
    ///   <para>
    ///     Max
    ///   </para>
    /// </summary>
    property Max: Integer read FMax write SetMax;
    /// <summary>
    ///   <para>
    ///     位置
    ///   </para>
    ///   <para>
    ///     Position
    ///   </para>
    /// </summary>
    property Position: Integer read FPosition write SetPosition;

    //
    /// <summary>
    ///   <para>
    ///     排列类型
    ///   </para>
    ///   <para>
    ///     Orientation type
    ///   </para>
    /// </summary>
    property Orientation: TProgressBarOrientation read FOrientation write SetOrientation ;//default prHorizontal;
  end;









  //
  /// <summary>
  ///   <para>
  ///     进度条素材基类
  ///   </para>
  ///   <para>
  ///     Base class of ProgressBar
  ///   </para>
  /// </summary>
  TSkinProgressBarMaterial=class(TSkinControlMaterial)
  private
    //是否绘制百分比文字
    FIsDrawPercent: Boolean;
    //绘制百分比参数
    FDrawPercentParam: TDrawTextParam;
    //标题绘制参数
    FDrawCaptionParam:TDrawTextParam;
    FIsClipPercentRect: Boolean;
    procedure SetDrawPercentParam(const Value: TDrawTextParam);
    procedure SetIsDrawPercent(const Value: Boolean);
    procedure SetDrawCaptionParam(const Value: TDrawTextParam);
    procedure SetIsClipPercentRect(const Value: Boolean);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  protected
    //从文档节点中加载
    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;
    //保存到文档节点
    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    //是否剪裁百分比
    property IsClipPercentRect:Boolean read FIsClipPercentRect write SetIsClipPercentRect;

    /// <summary>
    ///   <para>
    ///     是否绘制百分比文字
    ///   </para>
    ///   <para>
    ///     Whether draw percent
    ///   </para>
    /// </summary>
    property IsDrawPercent:Boolean read FIsDrawPercent write SetIsDrawPercent;

    /// <summary>
    ///   <para>
    ///     百分比文字的绘制参数
    ///   </para>
    ///   <para>
    ///     Draw parameter of percent text
    ///   </para>
    /// </summary>
    property DrawPercentParam:TDrawTextParam read FDrawPercentParam write SetDrawPercentParam;
  published

    /// <summary>
    ///   <para>
    ///     标题绘制参数
    ///   </para>
    ///   <para>
    ///     Draw caption parameters
    ///   </para>
    /// </summary>
    property DrawCaptionParam:TDrawTextParam read FDrawCaptionParam write SetDrawCaptionParam;
  end;

  /// <summary>
  ///   <para>
  ///     进度条控件类型基类
  ///   </para>
  ///   <para>
  ///     Base class of ProgressBar
  ///   </para>
  /// </summary>
  TSkinProgressBarType=class(TSkinControlType)
  protected
    FSkinProgressBarIntf:ISkinProgressBar;
    function GetSkinMaterial: TSkinProgressBarMaterial;
  protected
    procedure SizeChanged;override;
    //比例
    function GetProgressDrawStep(ADrawRect:TRectF):Double;
    //移动滑块位置
    function GetProgressDrawPos(ADrawRect:TRectF):Double;

    //进度条客户区尺寸
    function GetProgressBarClientSize(ADrawRect:TRectF):Double;

    //获取进度条的绘制矩形
    function GetUpSpaceDrawRect(AIsReverse:Boolean;ADrawRect:TRectF):TRectF;
  protected
    //绑定对象
    function CustomBind(ASkinControl:TControl):Boolean;override;
    //解除绑定
    procedure CustomUnBind;override;
    //绘制百分比
    function DrawPercent(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF):Boolean;
    function DrawCaption(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF):Boolean;
  end;








  {$I ComponentPlatformsAttribute.inc}
  /// <summary>
  ///   <para>
  ///     进度条默认素材
  ///   </para>
  ///   <para>
  ///     Default material of ProgressBar
  ///   </para>
  /// </summary>
  TSkinProgressBarDefaultMaterial=class(TSkinProgressBarMaterial)
  private
    FHorzBackGndPicture: TDrawPicture;
    FVertBackGndPicture: TDrawPicture;
    FHorzForeGndPicture: TDrawPicture;
    FVertForeGndPicture: TDrawPicture;

    FBackGndDrawPictureParam:TDrawPictureParam;
    FForeGndDrawPictureParam:TDrawPictureParam;

    procedure SetHorzBackGndPicture(const Value: TDrawPicture);
    procedure SetVertBackGndPicture(const Value: TDrawPicture);
    procedure SetHorzForeGndPicture(const Value: TDrawPicture);
    procedure SetVertForeGndPicture(const Value: TDrawPicture);

    procedure SetBackGndDrawPictureParam(const Value: TDrawPictureParam);
    procedure SetForeGndDrawPictureParam(const Value: TDrawPictureParam);
//  protected
//    //从文档节点中加载
//    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;
//    //保存到文档节点
//    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
  private
    FForeColor:TDrawRectParam;
    FIsReverse: Boolean;
    procedure SetIsReverse(const Value: Boolean);
    procedure SetForeColor(const Value: TDrawRectParam);
  private
    FDrawForePathParam:TDrawPathParam;
    FDrawBackPathParam:TDrawPathParam;
    FBarSize: Double;
    FMaxAngle: Double;
    FStartAngle: Double;
//    FIsReverse: Boolean;
//    procedure SetIsReverse(const Value: Boolean);
    procedure SetDrawForePathParam(const Value: TDrawPathParam);
    procedure SetDrawBackPathParam(const Value: TDrawPathParam);
    procedure SetBarSize(const Value: Double);
    procedure SetMaxAngle(const Value: Double);
    procedure SetStartAngle(const Value: Double);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    //
    /// <summary>
    ///   <para>
    ///     垂直样式时的背景图片
    ///   </para>
    ///   <para>
    ///     Background picture of vertical style
    ///   </para>
    /// </summary>
    property VertBackGndPicture:TDrawPicture read FVertBackGndPicture write SetVertBackGndPicture;
    //
    /// <summary>
    ///   <para>
    ///     水平样式时的背景图片
    ///   </para>
    ///   <para>
    ///     Background picture of horizontal style
    ///   </para>
    /// </summary>
    property HorzBackGndPicture:TDrawPicture read FHorzBackGndPicture write SetHorzBackGndPicture;

    //
    /// <summary>
    ///   <para>
    ///     垂直样式时的前景图片
    ///   </para>
    ///   <para>
    ///     Foreground picture of vertical style
    ///   </para>
    /// </summary>
    property VertForeGndPicture:TDrawPicture read FVertForeGndPicture write SetVertForeGndPicture;
    //
    /// <summary>
    ///   <para>
    ///     水平样式时的前景图片
    ///   </para>
    ///   <para>
    ///     Foreground picture of horizontal style
    ///   </para>
    /// </summary>
    property HorzForeGndPicture:TDrawPicture read FHorzForeGndPicture write SetHorzForeGndPicture;

    //
    /// <summary>
    ///   <para>
    ///     背景图片的绘制参数
    ///   </para>
    ///   <para>
    ///     Draw parameter of background picture
    ///   </para>
    /// </summary>
    property BackGndDrawPictureParam:TDrawPictureParam read FBackGndDrawPictureParam write SetBackGndDrawPictureParam;
    //
    /// <summary>
    ///   <para>
    ///     前景图片的绘制参数
    ///   </para>
    ///   <para>
    ///     Draw parameter of foreground picture
    ///   </para>
    /// </summary>
    property ForeGndDrawPictureParam:TDrawPictureParam read FForeGndDrawPictureParam write SetForeGndDrawPictureParam;
  published
    /// <summary>
    ///   <para>
    ///     前景色
    ///   </para>
    ///   <para>
    ///     Forecolor
    ///   </para>
    /// </summary>
    property ForeColor:TDrawRectParam read FForeColor write SetForeColor;
    //是否反向会制进度条
    property IsReverse:Boolean read FIsReverse write SetIsReverse;
  published
    property StartAngle:Double read FStartAngle write SetStartAngle;
    property MaxAngle:Double read FMaxAngle write SetMaxAngle;
    property BarSize:Double read FBarSize write SetBarSize;
    /// <summary>
    ///   <para>
    ///     前景色
    ///   </para>
    ///   <para>
    ///     Forecolor
    ///   </para>
    /// </summary>
    property DrawForePathParam:TDrawPathParam read FDrawForePathParam write SetDrawForePathParam;
    property DrawBackPathParam:TDrawPathParam read FDrawBackPathParam write SetDrawBackPathParam;
//    //是否反向会制进度条
//    property IsReverse:Boolean read FIsReverse write SetIsReverse;
  end;


  //进度条默认类型
  TSkinProgressBarDefaultType=class(TSkinProgressBarType)
  //private
  //  function GetSkinMaterial: TSkinProgressBarDefaultMaterial;
  protected
    //自定义绘制方法
    function CustomPaint(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF;APaintData:TPaintData):Boolean;override;
  end;











  {$I ComponentPlatformsAttribute.inc}
  /// <summary>
  ///   <para>
  ///     进度条颜色素材
  ///   </para>
  ///   <para>
  ///     Color material of ProgressBar
  ///   </para>
  /// </summary>
//  TSkinProgressBarColorMaterial=class(TSkinProgressBarMaterial)
//  private
//    FForeColor:TDrawRectParam;
//    FIsReverse: Boolean;
//    procedure SetIsReverse(const Value: Boolean);
//    procedure SetForeColor(const Value: TDrawRectParam);
////  protected
////    //从文档节点中加载
////    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;
////    //保存到文档节点
////    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
//  public
//    constructor Create(AOwner:TComponent);override;
//    destructor Destroy;override;
//  published
//    /// <summary>
//    ///   <para>
//    ///     前景色
//    ///   </para>
//    ///   <para>
//    ///     Forecolor
//    ///   </para>
//    /// </summary>
//    property ForeColor:TDrawRectParam read FForeColor write SetForeColor;
//    //是否反向会制进度条
//    property IsReverse:Boolean read FIsReverse write SetIsReverse;
//  end;
  TSkinProgressBarColorMaterial=class(TSkinProgressBarDefaultMaterial)
  end;

  TSkinProgressBarColorType=class(TSkinProgressBarDefaultType)
  private
    function GetSkinMaterial: TSkinProgressBarColorMaterial;
  protected
    //自定义绘制方法
    function CustomPaint(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF;APaintData:TPaintData):Boolean;override;
  end;


//  TSkinProgressBarHalfCircleMaterial=class(TSkinProgressBarMaterial)
//  private
//    FDrawForePathParam:TDrawPathParam;
//    FDrawBackPathParam:TDrawPathParam;
//    FBarSize: Double;
//    FMaxAngle: Double;
//    FStartAngle: Double;
////    FIsReverse: Boolean;
////    procedure SetIsReverse(const Value: Boolean);
//    procedure SetDrawForePathParam(const Value: TDrawPathParam);
//    procedure SetDrawBackPathParam(const Value: TDrawPathParam);
//    procedure SetBarSize(const Value: Double);
//    procedure SetMaxAngle(const Value: Double);
//    procedure SetStartAngle(const Value: Double);
////  protected
////    //从文档节点中加载
////    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;
////    //保存到文档节点
////    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
//  public
//    constructor Create(AOwner:TComponent);override;
//    destructor Destroy;override;
//  published
//    property StartAngle:Double read FStartAngle write SetStartAngle;
//    property MaxAngle:Double read FMaxAngle write SetMaxAngle;
//    property BarSize:Double read FBarSize write SetBarSize;
//    /// <summary>
//    ///   <para>
//    ///     前景色
//    ///   </para>
//    ///   <para>
//    ///     Forecolor
//    ///   </para>
//    /// </summary>
//    property DrawForePathParam:TDrawPathParam read FDrawForePathParam write SetDrawForePathParam;
//    property DrawBackPathParam:TDrawPathParam read FDrawBackPathParam write SetDrawBackPathParam;
////    //是否反向会制进度条
////    property IsReverse:Boolean read FIsReverse write SetIsReverse;
//  end;
  TSkinProgressBarHalfCircleMaterial=class(TSkinProgressBarDefaultMaterial)
  end;

  TSkinProgressBarHalfCircleType=class(TSkinProgressBarColorType)
//  private
//    function GetSkinMaterial: TSkinProgressBarHalfCircleMaterial;
  protected
    //画一个环
    FBackDrawPathActions:TPathActionCollection;
    FForeDrawPathActions:TPathActionCollection;
    //自定义绘制方法
    function CustomPaint(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF;APaintData:TPaintData):Boolean;override;
  public
    constructor Create(ASkinControl:TControl);override;
    destructor Destroy;override;
  end;





  {$I ComponentPlatformsAttribute.inc}
  TSkinProgressBar=class(TBaseSkinControl,
                          ISkinProgressBar,
                          IBindSkinItemTextControl,
                          IBindSkinItemValueControl
                          )
  private
    function GetProgressBarProperties:TProgressBarProperties;
    procedure SetProgressBarProperties(Value:TProgressBarProperties);
  protected
    FOnChange: TNotifyEvent;
    function GetOnChange: TNotifyEvent;
    //获取控件属性类
    function GetPropertiesClassType:TPropertiesClassType;override;
    //皮肤素材更改通知事件
    procedure DoCustomSkinMaterialChange(Sender: TObject);override;
  protected
    procedure BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
    procedure SetControlValueByBindItemField(const AFieldName:String;
                                              const AFieldValue:Variant;
                                              ASkinItem:TObject;
                                              AIsDrawItemInteractiveState:Boolean);
  public
    function SelfOwnMaterialToDefault:TSkinProgressBarDefaultMaterial;
    function CurrentUseMaterialToDefault:TSkinProgressBarDefaultMaterial;
    function Material:TSkinProgressBarDefaultMaterial;
  public
    property Prop:TProgressBarProperties read GetProgressBarProperties write SetProgressBarProperties;
  published
    //标题
    property Caption;
    property Text;
    //属性
    property Properties:TProgressBarProperties read GetProgressBarProperties write SetProgressBarProperties;
    property OnChange: TNotifyEvent read GetOnChange write FOnChange;
  end;

  {$IFDEF VCL}
  TSkinWinProgressBar=class(TSkinProgressBar)
  end;
  {$ENDIF VCL}



  TSkinRoundProgressBar=class(TSkinProgressBar)
  private
    function GetSelfOwnMaterial: TSkinProgressBarHalfCircleMaterial;
  public
    function GetCurrentUseComponentTypeName:String;override;
//    constructor Create(AOwner:TComponent);override;
  published
    //皮肤素材
    property SelfOwnMaterial:TSkinProgressBarHalfCircleMaterial read GetSelfOwnMaterial;
  end;



implementation








{ TSkinProgressBarType }

function TSkinProgressBarType.CustomBind(ASkinControl:TControl): Boolean;
begin
  if Inherited CustomBind(ASkinControl) then
  begin
    if ASkinControl.GetInterface(IID_ISkinProgressBar,Self.FSkinProgressBarIntf) then
    begin
      Result:=True;
    end
    else
    begin
      ShowException('This Component Do not Support ISkinProgressBar Interface');
    end;
  end;
end;

procedure TSkinProgressBarType.CustomUnBind;
begin
  Inherited CustomUnBind;
  Self.FSkinProgressBarIntf:=nil;
end;

function TSkinProgressBarType.DrawCaption(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial; const ADrawRect: TRectF): Boolean;
begin
  if Self.GetSkinMaterial<>nil then
  begin
    if Self.FSkinControlIntf.Caption <> '' then
    begin
      ACanvas.DrawText(Self.GetSkinMaterial.FDrawCaptionParam,
                        Self.FSkinControlIntf.Caption,
                        ADrawRect);
    end;
  end;
end;

function TSkinProgressBarType.DrawPercent(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial; const ADrawRect: TRectF): Boolean;
var
  APercent:String;
begin
  if (Self.GetSkinMaterial<>nil) and (Self.GetSkinMaterial.FIsDrawPercent) then
  begin
    APercent:=IntToStr(
      Floor(
//      Self.FSkinProgressBarIntf.Prop.Position
//      /(Self.FSkinProgressBarIntf.Prop.Max-Self.FSkinProgressBarIntf.Prop.Min)

      Self.FSkinProgressBarIntf.Prop.GetPercent*100)
    );
    ACanvas.DrawText(GetSkinMaterial.FDrawPercentParam,APercent+'%',ADrawRect)
  end;
end;

function TSkinProgressBarType.GetProgressBarClientSize(ADrawRect:TRectF): Double;
begin
  case Self.FSkinProgressBarIntf.Prop.Orientation of
    prHorizontal:
    begin
      Result:=RectWidthF(ADrawRect);
    end;
    prVertical:
    begin
      Result:=RectHeightF(ADrawRect);
    end;
  end;
end;

procedure TSkinProgressBarType.SizeChanged;
begin
  inherited;
  Invalidate;
end;

function TSkinProgressBarType.GetUpSpaceDrawRect(AIsReverse:Boolean;ADrawRect:TRectF): TRectF;
begin
  Result:=ADrawRect;
  
  if Self.FSkinProgressBarIntf.Prop.Orientation=prVertical then
  begin
    //进度条
    if Not AIsReverse then
    begin
      Result.Bottom:=Result.Top+GetProgressDrawPos(ADrawRect);
    end
    else
    begin
      Result.Top:=Result.Bottom-GetProgressDrawPos(ADrawRect);
    end;
  end
  else
  begin
    //进度条
    if Not AIsReverse then
    begin
      Result.Right:=Result.Left+GetProgressDrawPos(ADrawRect);
    end
    else
    begin
      Result.Left:=Result.Right-GetProgressDrawPos(ADrawRect);
    end;
  end;
end;

function TSkinProgressBarType.GetProgressDrawStep(ADrawRect:TRectF): Double;
begin
  Result := (GetProgressBarClientSize(ADrawRect))
      /(Self.FSkinProgressBarIntf.Prop.Max-Self.FSkinProgressBarIntf.Prop.Min);
end;

function TSkinProgressBarType.GetSkinMaterial: TSkinProgressBarMaterial;
begin
  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
  begin
    Result:=TSkinProgressBarMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
  end
  else
  begin
    Result:=nil;
  end;
end;

function TSkinProgressBarType.GetProgressDrawPos(ADrawRect:TRectF): Double;
begin
  Result:=Self.FSkinProgressBarIntf.Prop.Position*Self.GetProgressDrawStep(ADrawRect);
end;

{ TSkinProgressBarDefaultType }


//function TSkinProgressBarDefaultType.GetSkinMaterial: TSkinProgressBarDefaultMaterial;
//begin
//  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
//  begin
//    Result:=TSkinProgressBarDefaultMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
//  end
//  else
//  begin
//    Result:=nil;
//  end;
//end;

function TSkinProgressBarDefaultType.CustomPaint(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect: TRectF;APaintData:TPaintData): Boolean;
var
  ABackGndPicture:TDrawPicture;
  AForeGndPicture:TDrawPicture;
  AUpSpaceDrawRect:TRectF;
var
  //AUpSpaceDrawRect:TRectF;
  AStep:String;
  AMaterial:TSkinProgressBarDefaultMaterial;
begin
  AMaterial:=TSkinProgressBarDefaultMaterial(GetSkinMaterial);

  if AMaterial<>nil then
  begin
    //确定素材
    if Self.FSkinProgressBarIntf.Prop.Orientation=prVertical then
    begin
      ABackGndPicture:=AMaterial.FVertBackGndPicture;
      AForeGndPicture:=AMaterial.FVertForeGndPicture;

    end
    else
    begin
      ABackGndPicture:=AMaterial.FHorzBackGndPicture;
      AForeGndPicture:=AMaterial.FHorzForeGndPicture;

    end;

    //确定绘制矩形
    if Self.FSkinProgressBarIntf.Prop.Orientation=prVertical then
    begin
      AMaterial.FBackGndDrawPictureParam.StretchStyle:=issThreePartVert;
      AMaterial.FForeGndDrawPictureParam.StretchStyle:=issThreePartVert;
    end
    else
    begin
      AMaterial.FBackGndDrawPictureParam.StretchStyle:=issThreePartHorz;
      AMaterial.FForeGndDrawPictureParam.StretchStyle:=issThreePartHorz;
    end;





    //绘制背景
    ACanvas.DrawPicture(AMaterial.FBackGndDrawPictureParam,
                        ABackGndPicture,
                        ADrawRect);


    //绘制前景
    AUpSpaceDrawRect:=GetUpSpaceDrawRect(False,ADrawRect);
    //是否需要剪裁
    if AMaterial.IsClipPercentRect then
    begin
      ACanvas.SetClip(AUpSpaceDrawRect);
      //绘制前景
      AUpSpaceDrawRect:=ADrawRect;
    end
    else
    begin
    end;
    try
      ACanvas.DrawPicture(AMaterial.FForeGndDrawPictureParam,
                          AForeGndPicture,
                          AUpSpaceDrawRect);
    finally
      //是否需要剪裁
      if AMaterial.IsClipPercentRect then
      begin
        ACanvas.ResetClip;
      end;
    end;




    DrawPercent(ACanvas,ASkinMaterial,ADrawRect);
    DrawCaption(ACanvas,ASkinMaterial,ADrawRect);
  end;



  if AMaterial<>nil then
  begin
      try
        AStep:='1';

        //绘制前景
        AUpSpaceDrawRect:=GetUpSpaceDrawRect(AMaterial.FIsReverse,ADrawRect);

        AStep:='2';
        //是否需要剪裁
        if AMaterial.IsClipPercentRect then
        begin
          ACanvas.SetClip(AUpSpaceDrawRect);
          //绘制前景
          AUpSpaceDrawRect:=ADrawRect;
        end
        else
        begin
          //绘制前景
        end;
        AStep:='3';
        try
          ACanvas.DrawRect(AMaterial.FForeColor,AUpSpaceDrawRect);
        finally
          //是否需要剪裁
          if AMaterial.IsClipPercentRect then
          begin
            ACanvas.ResetClip;
          end;
        end;


        AStep:='4';
        DrawPercent(ACanvas,ASkinMaterial,ADrawRect);
        AStep:='5';
        //DrawCaption(ACanvas,ASkinMaterial,ADrawRect);

        AStep:='6';
      except
        on E:Exception do
        begin
          uBaseLog.HandleException(E,'TSkinProgressBarColorType.CustomPaint GetUpSpaceDrawRect '+AStep+' '
                      +FloatToStr(AUpSpaceDrawRect.Left)+','
                      +FloatToStr(AUpSpaceDrawRect.Top)+','
                      +FloatToStr(AUpSpaceDrawRect.Width)+','
                      +FloatToStr(AUpSpaceDrawRect.Height)+','
                      );
        end;
      end;
  end;

end;



{ TSkinProgressBarDefaultMaterial }

constructor TSkinProgressBarDefaultMaterial.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);

  FHorzBackGndPicture:=CreateDrawPicture('HorzBackGndPicture','水平样式背景图片');
  FVertBackGndPicture:=CreateDrawPicture('VertBackGndPicture','垂直样式背景图片');
  FHorzForeGndPicture:=CreateDrawPicture('HorzForeGndPicture','水平样式前景图片');
  FVertForeGndPicture:=CreateDrawPicture('VertForeGndPicture','垂直样式前景图片');


  FBackGndDrawPictureParam:=CreateDrawPictureParam('BackGndDrawPictureParam','背景图片绘制参数');

  FForeGndDrawPictureParam:=CreateDrawPictureParam('ForeGndDrawPictureParam','前景图片绘制参数');

  FForeColor:=CreateDrawRectParam('ForeColor','前景颜色');


  FBarSize:=10;
  FMaxAngle:=180;
  FStartAngle:=-180;
  FDrawForePathParam:=CreateDrawPathParam('ForeColor','前景颜色');
  FDrawBackPathParam:=CreateDrawPathParam('BackColor','底部颜色');
end;

//function TSkinProgressBarDefaultMaterial.LoadFromDocNode(ADocNode: TBTNode20_Class): Boolean;
////var
////  I: Integer;
////  ABTNode:TBTNode20;
//begin
//  Result:=False;
//
//
//  Inherited LoadFromDocNode(ADocNode);
//
////
////  for I := 0 to ADocNode.ChildNodes.Count - 1 do
////  begin
////    ABTNode:=ADocNode.ChildNodes[I];
////
////
////    if ABTNode.NodeName='HorzProgressBtnNormalPicture' then
////    begin
////      FHorzProgressBtnNormalPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzProgressBtnHoverPicture' then
////    begin
////      FHorzProgressBtnHoverPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzProgressBtnDisabledPicture' then
////    begin
////      FHorzProgressBtnDisabledPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzProgressBtnDownPicture' then
////    begin
////      FHorzProgressBtnDownPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertProgressBtnNormalPicture' then
////    begin
////      FVertProgressBtnNormalPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertProgressBtnHoverPicture' then
////    begin
////      FVertProgressBtnHoverPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertProgressBtnDisabledPicture' then
////    begin
////      FVertProgressBtnDisabledPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertProgressBtnDownPicture' then
////    begin
////      FVertProgressBtnDownPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertBackGndPicture' then
////    begin
////      FVertBackGndPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzBackGndPicture' then
////    begin
////      FHorzBackGndPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertForeGndPicture' then
////    begin
////      FVertForeGndPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzForeGndPicture' then
////    begin
////      FHorzForeGndPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    ;
////
////  end;
//
//  Result:=True;
//end;
//
//function TSkinProgressBarDefaultMaterial.SaveToDocNode(ADocNode: TBTNode20_Class): Boolean;
////var
////  ABTNode:TBTNode20;
//begin
//  Result:=False;
//
//
//  Inherited SaveToDocNode(ADocNode);
//
//
////  ABTNode:=ADocNode.AddChildNode_Class('HorzProgressBtnNormalPicture',FHorzProgressBtnNormalPicture.Name);
////  Self.FHorzProgressBtnNormalPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('HorzProgressBtnHoverPicture',FHorzProgressBtnHoverPicture.Name);
////  Self.FHorzProgressBtnHoverPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('HorzProgressBtnDisabledPicture',FHorzProgressBtnDisabledPicture.Name);
////  Self.FHorzProgressBtnDisabledPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('HorzProgressBtnDownPicture',FHorzProgressBtnDownPicture.Name);
////  Self.FHorzProgressBtnDownPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('VertProgressBtnNormalPicture',FVertProgressBtnNormalPicture.Name);
////  Self.FVertProgressBtnNormalPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('VertProgressBtnHoverPicture',FVertProgressBtnHoverPicture.Name);
////  Self.FVertProgressBtnHoverPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('VertProgressBtnDisabledPicture',FVertProgressBtnDisabledPicture.Name);
////  Self.FVertProgressBtnDisabledPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('VertProgressBtnDownPicture',FVertProgressBtnDownPicture.Name);
////  Self.FVertProgressBtnDownPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('VertBackGndPicture',FVertBackGndPicture.Name);
////  Self.FVertBackGndPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('HorzBackGndPicture',FHorzBackGndPicture.Name);
////  Self.FHorzBackGndPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('VertForeGndPicture',FVertForeGndPicture.Name);
////  Self.FVertForeGndPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////  ABTNode:=ADocNode.AddChildNode_Class('HorzForeGndPicture',FHorzForeGndPicture.Name);
////  Self.FHorzForeGndPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
//
//
//  Result:=True;
//end;

destructor TSkinProgressBarDefaultMaterial.Destroy;
begin

  FreeAndNil(FBackGndDrawPictureParam);
  FreeAndNil(FForeGndDrawPictureParam);

  FreeAndNil(FHorzBackGndPicture);
  FreeAndNil(FVertBackGndPicture);
  FreeAndNil(FHorzForeGndPicture);
  FreeAndNil(FVertForeGndPicture);

  FreeAndNil(FForeColor);


  FreeAndNil(FDrawForePathParam);
  FreeAndNil(FDrawBackPathParam);

  inherited;
end;

procedure TSkinProgressBarDefaultMaterial.SetBackGndDrawPictureParam(const Value: TDrawPictureParam);
begin
  FBackGndDrawPictureParam.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetForeGndDrawPictureParam(const Value: TDrawPictureParam);
begin
  FForeGndDrawPictureParam.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetHorzBackGndPicture(const Value: TDrawPicture);
begin
  FHorzBackGndPicture.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetVertBackGndPicture(const Value: TDrawPicture);
begin
  FVertBackGndPicture.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetHorzForeGndPicture(const Value: TDrawPicture);
begin
  FHorzForeGndPicture.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetVertForeGndPicture(const Value: TDrawPicture);
begin
  FVertForeGndPicture.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetForeColor(const Value: TDrawRectParam);
begin
  FForeColor.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetIsReverse(const Value: Boolean);
begin
  if FIsReverse<>Value then
  begin
    FIsReverse := Value;
    Self.DoChange;
  end;
end;


procedure TSkinProgressBarDefaultMaterial.SetBarSize(const Value: Double);
begin
  if FBarSize<>Value then
  begin
    FBarSize := Value;
    Self.DoChange();
  end;
end;

procedure TSkinProgressBarDefaultMaterial.SetDrawBackPathParam(
  const Value: TDrawPathParam);
begin
  FDrawBackPathParam.Assign(Value);
end;

procedure TSkinProgressBarDefaultMaterial.SetDrawForePathParam(
  const Value: TDrawPathParam);
begin
  FDrawForePathParam.Assign(Value);
end;


procedure TSkinProgressBarDefaultMaterial.SetMaxAngle(const Value: Double);
begin
  if FMaxAngle<>Value then
  begin
    FMaxAngle := Value;
    Self.DoChange();
  end;
end;

procedure TSkinProgressBarDefaultMaterial.SetStartAngle(const Value: Double);
begin
  if FStartAngle<>Value then
  begin
    FStartAngle := Value;
    Self.DoChange();
  end;
end;


//{ TSkinProgressBarColorMaterial }
//
//constructor TSkinProgressBarColorMaterial.Create(AOwner: TComponent);
//begin
//  inherited Create(AOwner);
//  FForeColor:=CreateDrawRectParam('ForeColor','前景颜色');
//end;

//function TSkinProgressBarColorMaterial.LoadFromDocNode(ADocNode: TBTNode20_Class): Boolean;
////var
////  I: Integer;
////  ABTNode:TBTNode20;
//begin
//  Result:=False;
//
//
//  Inherited LoadFromDocNode(ADocNode);
//
////  for I := 0 to ADocNode.ChildNodes.Count - 1 do
////  begin
////    ABTNode:=ADocNode.ChildNodes[I];
////
////
////    if ABTNode.NodeName='VertProgressNormalPicture' then
////    begin
////      FVertProgressNormalPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzProgressNormalPicture' then
////    begin
////      FHorzProgressNormalPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='VertProgressDisabledPicture' then
////    begin
////      FVertProgressDisabledPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HorzProgressDisabledPicture' then
////    begin
////      FHorzProgressDisabledPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end;
////
////  end;
//
//  Result:=True;
//end;
//
//function TSkinProgressBarColorMaterial.SaveToDocNode(ADocNode: TBTNode20_Class): Boolean;
////var
////  ABTNode:TBTNode20;
//begin
//  Result:=False;
//
//
//  Inherited SaveToDocNode(ADocNode);
//
//
////  ABTNode:=ADocNode.AddChildNode_Class('VertProgressNormalPicture',FVertProgressNormalPicture.Name);
////  Self.FVertProgressNormalPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('HorzProgressNormalPicture',FHorzProgressNormalPicture.Name);
////  Self.FHorzProgressNormalPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('VertProgressPicture',FVertProgressDisabledPicture.Name);
////  Self.FVertProgressDisabledPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('HorzProgressDisabledPicture',FHorzProgressDisabledPicture.Name);
////  Self.FHorzProgressDisabledPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
//
//
//  Result:=True;
//end;

//destructor TSkinProgressBarColorMaterial.Destroy;
//begin
//  FreeAndNil(FForeColor);
//  inherited;
//end;
//
//procedure TSkinProgressBarColorMaterial.SetForeColor(const Value: TDrawRectParam);
//begin
//  FForeColor.Assign(Value);
//end;
//
//procedure TSkinProgressBarColorMaterial.SetIsReverse(const Value: Boolean);
//begin
//  if FIsReverse<>Value then
//  begin
//    FIsReverse := Value;
//    Self.DoChange;
//  end;
//end;

{ TSkinProgressBarColorType }

function TSkinProgressBarColorType.CustomPaint(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect: TRectF;APaintData:TPaintData): Boolean;
var
  AUpSpaceDrawRect:TRectF;
  AStep:String;
begin
  if Self.GetSkinMaterial<>nil then
  begin
      try
        AStep:='1';

        //绘制前景
        AUpSpaceDrawRect:=GetUpSpaceDrawRect(GetSkinMaterial.FIsReverse,ADrawRect);

        AStep:='2';
        //是否需要剪裁
        if Self.GetSkinMaterial.IsClipPercentRect then
        begin
          ACanvas.SetClip(AUpSpaceDrawRect);
          //绘制前景
          AUpSpaceDrawRect:=ADrawRect;
        end
        else
        begin
          //绘制前景
        end;
        AStep:='3';
        try
          ACanvas.DrawRect(Self.GetSkinMaterial.FForeColor,AUpSpaceDrawRect);
        finally
          //是否需要剪裁
          if Self.GetSkinMaterial.IsClipPercentRect then
          begin
            ACanvas.ResetClip;
          end;
        end;


        AStep:='4';
        DrawPercent(ACanvas,ASkinMaterial,ADrawRect);
        AStep:='5';
        DrawCaption(ACanvas,ASkinMaterial,ADrawRect);

        AStep:='6';
      except
        on E:Exception do
        begin
          uBaseLog.HandleException(E,'TSkinProgressBarColorType.CustomPaint GetUpSpaceDrawRect '+AStep+' '
                      +FloatToStr(AUpSpaceDrawRect.Left)+','
                      +FloatToStr(AUpSpaceDrawRect.Top)+','
                      +FloatToStr(AUpSpaceDrawRect.Width)+','
                      +FloatToStr(AUpSpaceDrawRect.Height)+','
                      );
        end;
      end;
  end;
end;

function TSkinProgressBarColorType.GetSkinMaterial: TSkinProgressBarColorMaterial;
begin
  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
  begin
    Result:=TSkinProgressBarColorMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
  end
  else
  begin
    Result:=nil;
  end;
end;


{ TProgressBarProperties }

procedure TProgressBarProperties.AssignProperties(Src: TSkinControlProperties);
begin
  inherited;
  FOrientation:=TProgressBarProperties(Src).FOrientation;
  FMax:=TProgressBarProperties(Src).FMax;
  FMin:=TProgressBarProperties(Src).FMin;
  FPosition:=TProgressBarProperties(Src).FPosition;
end;

constructor TProgressBarProperties.Create(ASkinControl:TControl);
begin
  inherited Create(ASkinControl);
  if Not ASkinControl.GetInterface(IID_ISkinProgressBar,Self.FSkinProgressBarIntf) then
  begin
    ShowException('This Component Do not Support ISkinProgressBar Interface');
  end
  else
  begin
    FOrientation:=prHorizontal;
    FMin:=0;
    FMax:=100;
    FPosition:=0;
    case FOrientation of
      prHorizontal:
      begin
        FSkinControlIntf.Width:=120;
        FSkinControlIntf.Height:=22;
      end;
      prVertical:
      begin
        FSkinControlIntf.Width:=22;
        FSkinControlIntf.Height:=120;
      end;
    end;
  end;
end;

destructor TProgressBarProperties.Destroy;
begin
  inherited;
end;

procedure TProgressBarProperties.DoChange;
begin
  if Assigned(Self.FSkinProgressBarIntf.OnChange) then
  begin
    Self.FSkinProgressBarIntf.OnChange(Self);
  end;
end;

procedure TProgressBarProperties.SetOrientation(const Value: TProgressBarOrientation);
begin
  if Value <> FOrientation then
  begin
    FOrientation := Value;
    if not (csLoading in FSkinControl.ComponentState) then
      FSkinControlIntf.SetBounds(FSkinControlIntf.Left, FSkinControlIntf.Top, FSkinControlIntf.Height, FSkinControlIntf.Width);
  end;
end;

procedure TProgressBarProperties.SetMax(const Value: Integer);
begin
  SetParams(FPosition, FMin, Value);
end;

procedure TProgressBarProperties.SetMin(const Value: Integer);
begin
  SetParams(FPosition, Value, FMax);
end;

procedure TProgressBarProperties.SetParams(APosition, AMin, AMax: Integer);
begin

  if APosition < AMin then
  begin
    APosition := AMin;
  end;

  if APosition > AMax then
  begin
    APosition := AMax;
  end;

  if (FPosition <> APosition) or (FMin <> AMin) or (FMax <> AMax)  then
  begin
    FMin := AMin;
    FMax := AMax;

    FPosition := APosition;

    //触发更改事件
    DoChange;

    Invalidate;
  end;

end;

procedure TProgressBarProperties.SetPosition(const Value: Integer);
begin
  SetParams(Value, FMin, FMax);
end;

function TProgressBarProperties.GetComponentClassify: String;
begin
  Result:='SkinProgressBar';
end;




function TProgressBarProperties.GetPercent: Double;
begin
  Result:=Self.FSkinProgressBarIntf.Prop.Position
      /(Self.FSkinProgressBarIntf.Prop.Max-Self.FSkinProgressBarIntf.Prop.Min);
  if Result>1 then
  begin
    Result:=1;
  end;
end;

{ TSkinProgressBarMaterial }

procedure TSkinProgressBarMaterial.AssignTo(Dest: TPersistent);
var
  DestObject:TSkinProgressBarMaterial;
begin
  if Dest is TSkinProgressBarMaterial then
  begin
    DestObject:=TSkinProgressBarMaterial(Dest);

    DestObject.FIsDrawPercent:=Self.FIsDrawPercent;

  end;
  inherited;

end;

constructor TSkinProgressBarMaterial.Create(AOwner: TComponent);
begin
  inherited;
  FDrawPercentParam:=CreateDrawTextParam('DrawPercentParam','百分比绘制参数');
  FDrawCaptionParam:=CreateDrawTextParam('DrawCaptionParam','标题绘制参数');

end;

function TSkinProgressBarMaterial.LoadFromDocNode(ADocNode: TBTNode20_Class): Boolean;
var
  I: Integer;
  ABTNode:TBTNode20;
begin
  Result:=False;


  Inherited LoadFromDocNode(ADocNode);

  for I := 0 to ADocNode.ChildNodes.Count - 1 do
  begin
    ABTNode:=ADocNode.ChildNodes[I];


    if ABTNode.NodeName='FIsDrawPercent' then
    begin
      ABTNode.ConvertNode_Bool32.Data:=FIsDrawPercent;
    end

    ;

  end;

  Result:=True;
end;

function TSkinProgressBarMaterial.SaveToDocNode(ADocNode: TBTNode20_Class): Boolean;
var
  ABTNode:TBTNode20;
begin
  Result:=False;


  Inherited SaveToDocNode(ADocNode);


  ABTNode:=ADocNode.AddChildNode_Bool32('IsDrawPercent','是否绘制百分比文字');
  ABTNode.ConvertNode_Bool32.Data:=FIsDrawPercent;

  Result:=True;

end;

destructor TSkinProgressBarMaterial.Destroy;
begin
  FreeAndNil(FDrawCaptionParam);
  FreeAndNil(FDrawPercentParam);
  inherited;
end;

procedure TSkinProgressBarMaterial.SetDrawCaptionParam(const Value: TDrawTextParam);
begin
  FDrawCaptionParam.Assign(Value);
end;

procedure TSkinProgressBarMaterial.SetDrawPercentParam(const Value: TDrawTextParam);
begin
  FDrawPercentParam.Assign(Value);
end;

procedure TSkinProgressBarMaterial.SetIsClipPercentRect(const Value: Boolean);
begin
  if FIsClipPercentRect<>Value then
  begin
    FIsClipPercentRect := Value;
    Self.DoChange;
  end;
end;

procedure TSkinProgressBarMaterial.SetIsDrawPercent(const Value: Boolean);
begin
  if FIsDrawPercent<>Value then
  begin
    FIsDrawPercent := Value;
    Self.DoChange;
  end;
end;

{ TSkinProgressBar }

function TSkinProgressBar.Material:TSkinProgressBarDefaultMaterial;
begin
  Result:=TSkinProgressBarDefaultMaterial(SelfOwnMaterial);
end;

function TSkinProgressBar.SelfOwnMaterialToDefault:TSkinProgressBarDefaultMaterial;
begin
  Result:=TSkinProgressBarDefaultMaterial(SelfOwnMaterial);
end;

function TSkinProgressBar.CurrentUseMaterialToDefault:TSkinProgressBarDefaultMaterial;
begin
  Result:=TSkinProgressBarDefaultMaterial(CurrentUseMaterial);
end;

function TSkinProgressBar.GetPropertiesClassType: TPropertiesClassType;
begin
  Result:=TProgressBarProperties;
end;

function TSkinProgressBar.GetProgressBarProperties: TProgressBarProperties;
begin
  Result:=TProgressBarProperties(Self.FProperties);
end;

procedure TSkinProgressBar.SetControlValueByBindItemField(
  const AFieldName: String; const AFieldValue: Variant; ASkinItem: TObject;
  AIsDrawItemInteractiveState: Boolean);
var
  APosition:Integer;
  AFieldValueStr:String;
begin
  if (VarType(AFieldValue)=varInteger) then
  begin
    Self.GetProgressBarProperties.StaticPosition:=AFieldValue;
  end
  else
  begin
    APosition:=0;
    AFieldValueStr:=AFieldValue;
    TryStrToInt(AFieldValueStr,APosition);
    Self.GetProgressBarProperties.StaticPosition:=APosition;
  end;
end;

procedure TSkinProgressBar.SetProgressBarProperties(Value: TProgressBarProperties);
begin
  Self.FProperties.Assign(Value);
end;

function TSkinProgressBar.GetOnChange: TNotifyEvent;
begin
  Result:=Self.FOnChange;
end;

procedure TSkinProgressBar.DoCustomSkinMaterialChange(Sender: TObject);
begin
  if not (csReading in Self.ComponentState)
    and not (csLoading in Self.ComponentState) then
  begin
    Self.GetProgressBarProperties.AdjustAutoSizeBounds;
  end;
  Inherited;
end;

procedure TSkinProgressBar.BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
var
  APosition:Integer;
begin
  APosition:=0;
  if TryStrToInt(AText,APosition) then
  begin

  end;
  GetProgressBarProperties.StaticPosition:=APosition;
end;



{ TSkinProgressBarHalfCircleType }

constructor TSkinProgressBarHalfCircleType.Create(ASkinControl: TControl);
begin
  inherited;
  FBackDrawPathActions:=TPathActionCollection.Create(TPathActionItem,nil,GlobalDrawPathDataClass);
  FForeDrawPathActions:=TPathActionCollection.Create(TPathActionItem,nil,GlobalDrawPathDataClass);

end;

function TSkinProgressBarHalfCircleType.CustomPaint(ACanvas: TDrawCanvas;
  ASkinMaterial: TSkinControlMaterial; const ADrawRect: TRectF;
  APaintData: TPaintData): Boolean;
var
//  ADrawPathActions:TPathActionCollection;
  AOutPathActionItem:TPathActionItem;
  AInnerPathActionItem:TPathActionItem;
  APathActionItem:TPathActionItem;
  AMaxRadius:Double;
  AOffset:Double;
  ALeftOffset:Double;
  ATopOffset:Double;
  AStartPoint,AStopPoint:TPointF;
  AMaterial:TSkinProgressBarHalfCircleMaterial;
  ATempDrawRect:TRectF;
begin
  if ASkinMaterial=nil then Exit;

  FBackDrawPathActions.Clear;

  FForeDrawPathActions.Clear;


  AMaterial:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial);




  ////////////////////////实现方式1,用画粗线的方式实现/////////////////////////////
  //用特殊的方式来实现,即画粗线的方式
  ATempDrawRect:=RectF(ADrawRect.Left+AMaterial.FBarSize/2,
                       ADrawRect.Top+AMaterial.FBarSize/2,
                       ADrawRect.Right-AMaterial.FBarSize/2,
                       ADrawRect.Bottom-AMaterial.FBarSize/2
                      );
  AMaterial.DrawBackPathParam.StaticPenWidth:=Ceil(AMaterial.FBarSize);
  AMaterial.DrawBackPathParam.PenColor.FColor:=AMaterial.DrawBackPathParam.FillColor.FColor;

  AMaterial.DrawForePathParam.StaticPenWidth:=Ceil(AMaterial.FBarSize);
  AMaterial.DrawForePathParam.PenColor.FColor:=AMaterial.DrawForePathParam.FillColor.FColor;


//  ATempDrawRect:=ADrawRect;


  //计算外圆外径
  if TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle<=180 then
  begin
      //保证半个圆都在控件里
      if ATempDrawRect.Width>ATempDrawRect.Height*2 then
      begin
        AMaxRadius:=ATempDrawRect.Height;
      end
      else
      begin
        AMaxRadius:=ATempDrawRect.Width / 2;
      end;
      ALeftOffset:=(ATempDrawRect.Width-2*AMaxRadius) / 2;
      ATopOffset:=(ATempDrawRect.Height-AMaxRadius);
  end
  else
  begin
      //保证整个圆都在控件里
      if ATempDrawRect.Width>ATempDrawRect.Height then
      begin
        AMaxRadius:=ATempDrawRect.Height / 2;
      end
      else
      begin
        AMaxRadius:=ATempDrawRect.Width / 2;
      end;
      ALeftOffset:=(ATempDrawRect.Width-2*AMaxRadius) / 2;
      ATopOffset:=(ATempDrawRect.Height-2*AMaxRadius) / 2;
  end;





  ////////////////////////实现方式1,用画粗线的方式实现/////////////////////////////
  //画背景色
  //外环
  AOutPathActionItem:=TPathActionItem(FBackDrawPathActions.Add);

  AOutPathActionItem.ActionType:=patAddArc;
  //圆环所在的矩形
  AOutPathActionItem.X:=ALeftOffset;
  AOutPathActionItem.Y:=ATopOffset;
  //计算出最大的半径
  AOutPathActionItem.X1:=AOutPathActionItem.X+2*AMaxRadius;
  //保证是一个正方形里面
  AOutPathActionItem.Y1:=AOutPathActionItem.Y+2*AMaxRadius;

  //半圆
  AOutPathActionItem.StartAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FStartAngle;
  AOutPathActionItem.SweepAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle;


  //画边
  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
  APathActionItem.ActionType:=patDrawPath;

  ACanvas.DrawPath(TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FDrawBackPathParam,ATempDrawRect,FBackDrawPathActions);

  //画前景色
  if Self.FSkinProgressBarIntf.Prop.GetPercent>0 then
  begin

    AOutPathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
    //有内环
    //圆环
    //有内环
    //圆环



    //外环
    AOutPathActionItem.ActionType:=patAddArc;
    //圆环所在的矩形
    AOutPathActionItem.X:=ALeftOffset;
    AOutPathActionItem.Y:=ATopOffset;
    //计算出最大的半径
    AOutPathActionItem.X1:=AOutPathActionItem.X+2*AMaxRadius;
    //保证是一个正方形里面
    AOutPathActionItem.Y1:=AOutPathActionItem.Y+2*AMaxRadius;


    //半圆
    AOutPathActionItem.StartAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FStartAngle;
    AOutPathActionItem.SweepAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle*Self.FSkinProgressBarIntf.Prop.GetPercent;

    //画边
    APathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
    APathActionItem.ActionType:=patDrawPath;

    ACanvas.DrawPath(TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FDrawForePathParam,ATempDrawRect,FForeDrawPathActions);

  end;







//  ////////////////////////实现方式2,用画框线的方式实现,较复杂/////////////////////////////
//
//
//  //画背景色
//  //外环
//  AOutPathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
//
//  AOutPathActionItem.ActionType:=patAddArc;
//  //圆环所在的矩形
//  AOutPathActionItem.X:=ALeftOffset;
//  AOutPathActionItem.Y:=ATopOffset;
//  //计算出最大的半径
//  AOutPathActionItem.X1:=AOutPathActionItem.X+2*AMaxRadius;
//  //保证是一个正方形里面
//  AOutPathActionItem.Y1:=AOutPathActionItem.Y+2*AMaxRadius;
//
//  //半圆
//  AOutPathActionItem.StartAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FStartAngle;
//  AOutPathActionItem.SweepAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle;
//
//
//  //内环
//  AOffset:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FBarSize;//(APathDrawRect.Width-(APathDrawRect.Width/ASkinVirtualChartDefaultMaterial.FPieRadiusPercent)*ASkinVirtualChartDefaultMaterial.FPieInnerSizePercent)/2;
//  AInnerPathActionItem:=TPathActionItem(Self.FBackDrawPathActions.Add);
//  AInnerPathActionItem.ActionType:=patAddArc;
//  AInnerPathActionItem.X:=AOutPathActionItem.X+AOffset;
//  AInnerPathActionItem.Y:=AOutPathActionItem.Y+AOffset;
//  AInnerPathActionItem.X1:=AOutPathActionItem.X1-AOffset;
//  AInnerPathActionItem.Y1:=AOutPathActionItem.Y1-AOffset;
//  //要反方向画,不然填充不了扇形
//  AInnerPathActionItem.StartAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FStartAngle+TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle;
//  AInnerPathActionItem.SweepAngle:=-TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle;
//
//
//
//  //画线 外弧终点到内弧起点
//  AStopPoint:=AInnerPathActionItem.GetArcStartPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
//  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
//  APathActionItem.ActionType:=patLineTo;
//  APathActionItem.X:=AStopPoint.X;
//  APathActionItem.Y:=AStopPoint.Y;
//  APathActionItem.Index:=AInnerPathActionItem.Index;
//
//
//  //画线 内弧终点到外弧起点
//  AStartPoint:=AOutPathActionItem.GetArcStartPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
//  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
//  APathActionItem.ActionType:=patLineTo;
//  APathActionItem.X:=AStartPoint.X;
//  APathActionItem.Y:=AStartPoint.Y;
//
//
//
//
//
//
//
//
//
//
//
////  //连接两个圆弧的终点
////
////  //内弧终点到外弧起点
////  AStopPoint:=AInnerPathActionItem.GetArcStopPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
////  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
////  APathActionItem.ActionType:=patMoveTo;
////  APathActionItem.X:=AStopPoint.X;
////  APathActionItem.Y:=AStopPoint.Y;
////  APathActionItem.Index:=AOutPathActionItem.Index;
//////
////  //画线 内弧终点到外弧起点
////  AStartPoint:=AOutPathActionItem.GetArcStartPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
////  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
////  APathActionItem.ActionType:=patLineTo;
////  APathActionItem.X:=AStartPoint.X;
////  APathActionItem.Y:=AStartPoint.Y;
////  APathActionItem.Index:=AOutPathActionItem.Index;
////
////  //画线 外弧终点到内弧起点
////  AStopPoint:=AInnerPathActionItem.GetArcStartPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
////  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
////  APathActionItem.ActionType:=patLineTo;
////  APathActionItem.X:=AStopPoint.X;
////  APathActionItem.Y:=AStopPoint.Y;
////  APathActionItem.Index:=AInnerPathActionItem.Index;
//
//
//
//
//  AOutPathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
//  AOutPathActionItem.ActionType:=patStart;
//  AOutPathActionItem.Index:=0;
//
////  AOutPathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
////  AOutPathActionItem.ActionType:=patClose;
//
//
//  AOutPathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
//  AOutPathActionItem.ActionType:=patStop;
//
//
////  //画边
////  APathActionItem:=TPathActionItem(FBackDrawPathActions.Add);
////  APathActionItem.ActionType:=patDrawPath;
//
//
//  //填充
//  APathActionItem:=TPathActionItem(Self.FBackDrawPathActions.Add);
//  APathActionItem.ActionType:=patFillPath;
//
////  //填充
////  APathActionItem:=TPathActionItem(Self.FBackDrawPathActions.Add);
////  APathActionItem.ActionType:=patDrawAndFillPath;
//
//  ACanvas.DrawPath(TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FDrawBackPathParam,ATempDrawRect,FBackDrawPathActions);
//
//
//
//
//
//
//  //画前景色
//  if Self.FSkinProgressBarIntf.Prop.GetPercent>0 then
//  begin
//
//    AOutPathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
//    //有内环
//    //圆环
//
//
//
//    //外环
//    AOutPathActionItem.ActionType:=patAddArc;
//    //圆环所在的矩形
//    AOutPathActionItem.X:=ALeftOffset;
//    AOutPathActionItem.Y:=ATopOffset;
//    //计算出最大的半径
//    AOutPathActionItem.X1:=AOutPathActionItem.X+2*AMaxRadius;
//    //保证是一个正方形里面
//    AOutPathActionItem.Y1:=AOutPathActionItem.Y+2*AMaxRadius;
//
//
//    //半圆
//    AOutPathActionItem.StartAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FStartAngle;
//    AOutPathActionItem.SweepAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle*Self.FSkinProgressBarIntf.Prop.GetPercent;
//
//
//    //算出结束的点
//
//
//
//
//
////    //内环
////    AOffset:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FBarSize;//(APathDrawRect.Width-(APathDrawRect.Width/ASkinVirtualChartDefaultMaterial.FPieRadiusPercent)*ASkinVirtualChartDefaultMaterial.FPieInnerSizePercent)/2;
////    AInnerPathActionItem:=TPathActionItem(Self.FForeDrawPathActions.Add);
////    AInnerPathActionItem.ActionType:=patAddArc;
////    //小圆
////    AInnerPathActionItem.X:=AOutPathActionItem.X+AOffset;
////    AInnerPathActionItem.Y:=AOutPathActionItem.Y+AOffset;
////    AInnerPathActionItem.X1:=AOutPathActionItem.X1-AOffset;
////    AInnerPathActionItem.Y1:=AOutPathActionItem.Y1-AOffset;
////    //要反方向画,不然填充不了扇形
////    AInnerPathActionItem.StartAngle:=TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FStartAngle+TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle*Self.FSkinProgressBarIntf.Prop.GetPercent;
////    AInnerPathActionItem.SweepAngle:=-TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FMaxAngle*Self.FSkinProgressBarIntf.Prop.GetPercent;
//
//
//
//
//
//
////    //连接两个圆弧的终点
////
////    //必须先起点移动  内弧终点到外弧起点
////    AStopPoint:=AInnerPathActionItem.GetArcStopPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
////    APathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
////    APathActionItem.ActionType:=patMoveTo;
////    APathActionItem.X:=AStopPoint.X;
////    APathActionItem.Y:=AStopPoint.Y;
////    APathActionItem.Index:=AOutPathActionItem.Index;
//
////    //画线 内弧终点到外弧起点
////    AStartPoint:=AOutPathActionItem.GetArcStartPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
////    APathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
////    APathActionItem.ActionType:=patLineTo;
////    APathActionItem.X:=AStartPoint.X;
////    APathActionItem.Y:=AStartPoint.Y;
////    APathActionItem.Index:=AOutPathActionItem.Index;
////
////    //画线 外弧终点到内弧起点
////    AStopPoint:=AInnerPathActionItem.GetArcStartPoint(RectF(0,0,Ceil(ADrawRect.Width),Ceil(ADrawRect.Height)));
////    APathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
////    APathActionItem.ActionType:=patLineTo;
////    APathActionItem.X:=AStopPoint.X;
////    APathActionItem.Y:=AStopPoint.Y;
////    APathActionItem.Index:=AInnerPathActionItem.Index;
//
//
//
//
//
////    //填充
////    APathActionItem:=TPathActionItem(Self.FForeDrawPathActions.Add);
////    APathActionItem.ActionType:=patFillPath;
//
//    //画边
//    APathActionItem:=TPathActionItem(FForeDrawPathActions.Add);
//    APathActionItem.ActionType:=patDrawPath;
//
////    ACanvas.DrawPath(TSkinProgressBarHalfCircleMaterial(ASkinMaterial).FDrawForePathParam,ATempDrawRect,FForeDrawPathActions);
//
//  end;

  
end;


destructor TSkinProgressBarHalfCircleType.Destroy;
begin
  FreeAndNil(FBackDrawPathActions);
  FreeAndNil(FForeDrawPathActions);
  inherited;
end;

//function TSkinProgressBarHalfCircleType.GetSkinMaterial: TSkinProgressBarHalfCircleMaterial;
//begin
//  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
//  begin
//    Result:=TSkinProgressBarHalfCircleMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
//  end
//  else
//  begin
//    Result:=nil;
//  end;
//end;

//{ TSkinProgressBarHalfCircleMaterial }
//
//constructor TSkinProgressBarHalfCircleMaterial.Create(AOwner: TComponent);
//begin
//  inherited;
//  FBarSize:=10;
//  FMaxAngle:=180;
//  FStartAngle:=-180;
//  FDrawForePathParam:=CreateDrawPathParam('ForeColor','前景颜色');
//  FDrawBackPathParam:=CreateDrawPathParam('BackColor','底部颜色');
//end;
//
//destructor TSkinProgressBarHalfCircleMaterial.Destroy;
//begin
//  FreeAndNil(FDrawForePathParam);
//  FreeAndNil(FDrawBackPathParam);
//
//  inherited;
//end;
//
//
//procedure TSkinProgressBarHalfCircleMaterial.SetBarSize(const Value: Double);
//begin
//  if FBarSize<>Value then
//  begin
//    FBarSize := Value;
//    Self.DoChange();
//  end;
//end;
//
//procedure TSkinProgressBarHalfCircleMaterial.SetDrawBackPathParam(
//  const Value: TDrawPathParam);
//begin
//  FDrawBackPathParam.Assign(Value);
//end;
//
//procedure TSkinProgressBarHalfCircleMaterial.SetDrawForePathParam(
//  const Value: TDrawPathParam);
//begin
//  FDrawForePathParam.Assign(Value);
//end;
//
//
//procedure TSkinProgressBarHalfCircleMaterial.SetMaxAngle(const Value: Double);
//begin
//  if FMaxAngle<>Value then
//  begin
//    FMaxAngle := Value;
//    Self.DoChange();
//  end;
//end;
//
//procedure TSkinProgressBarHalfCircleMaterial.SetStartAngle(const Value: Double);
//begin
//  if FStartAngle<>Value then
//  begin
//    FStartAngle := Value;
//    Self.DoChange();
//  end;
//end;

{ TSkinRoundProgressBar }

//constructor TSkinRoundProgressBar.Create(AOwner: TComponent);
//begin
//  inherited;
//
//end;

function TSkinRoundProgressBar.GetCurrentUseComponentTypeName: String;
begin
  Result:='HalfCircle';
end;

function TSkinRoundProgressBar.GetSelfOwnMaterial: TSkinProgressBarHalfCircleMaterial;
begin
  Result:=TSkinProgressBarHalfCircleMaterial(FMaterial);
end;

initialization
  RegisterClasses([TSkinProgressBar]);
  //进度条
  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarDefaultType,TSkinProgressBarDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarColorType,TSkinProgressBarColorMaterial,'Color',False);
  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarDefaultType,TSkinProgressBarColorMaterial,'ColorTest',False);
  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarDefaultType,TSkinProgressBarDefaultMaterial,'Color',False);
//  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarHalfCircleType,TSkinProgressBarHalfCircleMaterial,'HalfCircle',False);
  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarHalfCircleType,TSkinProgressBarHalfCircleMaterial,'HalfCircleTest',False);
  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarHalfCircleType,TSkinProgressBarDefaultMaterial,'HalfCircle',False);
  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarHalfCircleType,TSkinProgressBarDefaultMaterial,'Round',False);


end.


