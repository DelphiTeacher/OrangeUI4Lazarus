//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     日期编辑框
///   </para>
///   <para>
///     DateEdit Box
///   </para>
/// </summary>
unit uSkinDateEditType;

interface
{$I FrameWork.inc}

uses
  Classes,
  SysUtils,
  uFuncCommon,
  Types,
  {$IFDEF VCL}
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Messages,
  Controls,
  StdCtrls,
  Forms,
  ExtCtrls,
  Graphics,
  {$ENDIF}
  {$IFDEF FMX}
  UITypes,
  FMX.Types,
  FMX.Controls,
  {$ENDIF}
  uSkinPublic,
  uGraphicCommon,
  uBaseLog,
  uBinaryTreeDoc,
//  uSkinPackage,
  uSkinRegManager,
  uSkinBufferBitmap,
  uDrawCanvas,
  uSkinMaterial,
  uComponentType,
  uDrawEngine,
  uDrawPicture,
  uDrawTextParam,
  uDrawPictureParam;

const
  IID_ISkinDateEdit:TGUID='{0591FFC8-D257-4B2D-B875-6CE4EE4D05B7}';



type
  TDateEditProperties=class;

  ISkinDateEdit=interface//(ISkinControl)
    ['{0591FFC8-D257-4B2D-B875-6CE4EE4D05B7}']
    function GetText:String;
    property Text:String read GetText;

    function GetDateEditProperties:TDateEditProperties;
    property Properties:TDateEditProperties read GetDateEditProperties;
    property Prop:TDateEditProperties read GetDateEditProperties;
  end;


  //DateEdit属性
  TDateEditProperties=class(TSkinControlProperties)
  protected
    FDrawText:String;
    //提示文本
    FHelpText:String;

    //日期编辑框接口
    FSkinDateEditIntf:ISkinDateEdit;

    procedure SetHelpText(const Value: String);
  protected
    procedure AssignProperties(Src:TSkinControlProperties);override;
  public
    constructor Create(ASkinControl:TControl);override;
    destructor Destroy;override;
  public
    //获取分类名称
    function GetComponentClassify:String;override;
  public
    property DrawText:String read FDrawText write FDrawText;
  published
    /// <summary>
    ///   <para>
    ///     提示文本
    ///   </para>
    ///   <para>
    ///     Help text
    ///   </para>
    /// </summary>
    property HelpText:String read FHelpText write SetHelpText;
  end;









  {$I ComponentPlatformsAttribute.inc}
  /// <summary>
  ///   <para>
  ///     日期编辑框默认素材
  ///   </para>
  ///   <para>
  ///    DateEdit Box default material
  ///   </para>
  /// </summary>
  TSkinDateEditDefaultMaterial=class(TSkinControlMaterial)
  private
    //下拉箭头图片图片
    FArrowPicture:TDrawPicture;
    //下拉箭头图片图标绘制参数
    FDrawArrowPictureParam:TDrawPictureParam;

    //文本绘制参数
    FDrawTextParam:TDrawTextParam;

    //正常状态图片
    FNormalPicture:TDrawPicture;
    //鼠标停靠状态图片
    FHoverPicture:TDrawPicture;
    //获取焦点情况下的状态图片
    FFocusedPicture:TDrawPicture;
    //禁用状态图片
    FDisabledPicture:TDrawPicture;
    //图片绘制参数
    FDrawPictureParam:TDrawPictureParam;
    //提示文本绘制字体
    FDrawHelpTextParam:TDrawTextParam;

    procedure SetHoverPicture(const Value: TDrawPicture);
    procedure SetFocusedPicture(const Value: TDrawPicture);
    procedure SetNormalPicture(const Value: TDrawPicture);
    procedure SetDisabledPicture(const Value: TDrawPicture);
    procedure SetDrawPictureParam(const Value: TDrawPictureParam);
    procedure SetDrawTextParam(const Value: TDrawTextParam);

    procedure SetArrowPicture(const Value: TDrawPicture);
    procedure SetDrawArrowPictureParam(const Value: TDrawPictureParam);
    procedure SetDrawHelpTextParam(const Value: TDrawTextParam);
//  protected
//    //从文档节点中加载
//    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;
//    //保存到文档节点
//    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  published
    //
    /// <summary>
    ///   <para>
    ///    下拉箭头图标(点击弹出下拉菜单)
    ///   </para>
    ///   <para>
    ///     Drop down arrow icon(click to pop up drop down menu)
    ///   </para>
    /// </summary>
    property ArrowPicture:TDrawPicture read FArrowPicture write SetArrowPicture;
    //
    /// <summary>
    ///   <para>
    ///     下拉箭头图标绘制参数
    ///   </para>
    ///   <para>
    ///     Draw parameters of dropdown arrow icon
    ///   </para>
    /// </summary>
    property DrawArrowPictureParam:TDrawPictureParam read FDrawArrowPictureParam write SetDrawArrowPictureParam;

    /// <summary>
    ///   <para>
    ///     正常状态图片
    ///   </para>
    ///   <para>
    ///     Normal state picture
    ///   </para>
    /// </summary>
    property NormalPicture:TDrawPicture read FNormalPicture write SetNormalPicture;

    /// <summary>
    ///   <para>
    ///     鼠标停靠状态图片
    ///   </para>
    ///   <para>
    ///     Picture at hovering state picture
    ///   </para>
    /// </summary>
    property HoverPicture:TDrawPicture read FHoverPicture write SetHoverPicture;

    /// <summary>
    ///   <para>
    ///     获取焦点状态下的图片
    ///   </para>
    ///   <para>
    ///     Picture at focused state
    ///   </para>
    /// </summary>
    property FocusedPicture:TDrawPicture read FFocusedPicture write SetFocusedPicture;

    /// <summary>
    ///   <para>
    ///     禁用状态图片
    ///   </para>
    ///   <para>
    ///     Picture at disabled state
    ///   </para>
    /// </summary>
    property DisabledPicture:TDrawPicture read FDisabledPicture write SetDisabledPicture;

    /// <summary>
    ///   <para>
    ///     图片绘制参数
    ///   </para>
    ///   <para>
    ///     Draw parameters of picture
    ///   </para>
    /// </summary>
    property DrawPictureParam:TDrawPictureParam read FDrawPictureParam write SetDrawPictureParam;


    /// <summary>
    ///   <para>
    ///     文本绘制参数
    ///   </para>
    ///   <para>
    ///     Draw text parameters
    ///   </para>
    /// </summary>
    property DrawTextParam:TDrawTextParam read FDrawTextParam write SetDrawTextParam;
    //
    /// <summary>
    ///   <para>
    ///     提示文本绘制参数
    ///   </para>
    ///   <para>
    ///     Draw text of Help text
    ///   </para>
    /// </summary>
    property DrawHelpTextParam:TDrawTextParam read FDrawHelpTextParam write SetDrawHelpTextParam;
  end;

  TSkinDateEditDefaultType=class(TSkinControlType)
  protected
    //日期编辑框接口
    FSkinDateEditIntf:ISkinDateEdit;
    function GetSkinMaterial:TSkinDateEditDefaultMaterial;
  protected
    //绑定对象
    function CustomBind(ASkinControl:TControl):Boolean;override;
    //解除绑定
    procedure CustomUnBind;override;
    //绘制边框
    function CustomPaint(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF;APaintData:TPaintData):Boolean;override;
  public
    //自定义绘制方法
    function CustomPaintHelpText(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF;APaintData:TPaintData):Boolean;virtual;
  end;







implementation





{ TSkinDateEditDefaultType }


function TSkinDateEditDefaultType.GetSkinMaterial: TSkinDateEditDefaultMaterial;
begin
  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
  begin
    Result:=TSkinDateEditDefaultMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
  end
  else
  begin
    Result:=nil;
  end;
end;

function TSkinDateEditDefaultType.CustomPaint(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect: TRectF;APaintData:TPaintData): Boolean;
var
  ADrawPicture:TDrawPicture;
begin
  ADrawPicture:=nil;
  if Self.GetSkinMaterial<>nil then
  begin
    if Not Self.FSkinControlIntf.Enabled then
    begin
      ADrawPicture:=Self.GetSkinMaterial.FDisabledPicture;
    end
    else if Self.FSkinControlIntf.Focused then
    begin
      ADrawPicture:=Self.GetSkinMaterial.FFocusedPicture;
    end
    else if Self.FSkinControlIntf.IsMouseOver then
    begin
      ADrawPicture:=Self.GetSkinMaterial.FHoverPicture;
    end
    else
    begin
      ADrawPicture:=Self.GetSkinMaterial.FNormalPicture;
    end;
    if ADrawPicture.CurrentPictureIsEmpty then
    begin
      ADrawPicture:=Self.GetSkinMaterial.FNormalPicture;
    end;

    //绘制背景图片
    ACanvas.DrawPicture(Self.GetSkinMaterial.FDrawPictureParam,ADrawPicture,ADrawRect);



    //在ListBox中绘制文本
    if APaintData.IsInDrawDirectUI then
    begin
      ACanvas.DrawText(Self.GetSkinMaterial.FDrawTextParam,
                      Self.FSkinDateEditIntf.Prop.DrawText,
                      ADrawRect);
    end
    else
    begin

//      {$IFDEF VCL}
      //绘制文本
      if (Self.FSkinDateEditIntf.Text<>'') then
      begin
        ACanvas.DrawText(Self.GetSkinMaterial.FDrawTextParam,
                        Self.FSkinDateEditIntf.Text,
                        ADrawRect);
      end;
//      {$ENDIF}
    end;


    //绘制下拉箭头
    ACanvas.DrawPicture(Self.GetSkinMaterial.FDrawArrowPictureParam,
                          Self.GetSkinMaterial.FArrowPicture,
                          ADrawRect);


    CustomPaintHelpText(ACanvas,ASkinMaterial,ADrawRect,APaintData);


  end;
end;

function TSkinDateEditDefaultType.CustomPaintHelpText(ACanvas: TDrawCanvas;
  ASkinMaterial: TSkinControlMaterial; const ADrawRect: TRectF;
  APaintData: TPaintData): Boolean;
begin

  //绘制提示文本
  if (
            (Self.FSkinDateEditIntf.Text='') and not APaintData.IsInDrawDirectUI
          or (Self.FSkinDateEditIntf.Prop.DrawText='') and APaintData.IsInDrawDirectUI
      )
     and (Self.FSkinDateEditIntf.Prop.HelpText<>'') then
  begin
    ACanvas.DrawText(Self.GetSkinMaterial.FDrawHelpTextParam,Self.FSkinDateEditIntf.Prop.HelpText,ADrawRect);
  end;

end;

function TSkinDateEditDefaultType.CustomBind(ASkinControl:TControl): Boolean;
begin
  if Inherited CustomBind(ASkinControl) then
  begin
    if ASkinControl.GetInterface(IID_ISkinDateEdit,Self.FSkinDateEditIntf) then
    begin
      Result:=True;
    end
    else
    begin
      ShowException('This Component Do not Support ISkinDateEdit Interface');
    end;
  end;
end;

procedure TSkinDateEditDefaultType.CustomUnBind;
begin
  Inherited CustomUnBind;
  Self.FSkinDateEditIntf:=nil;
end;


{ TSkinDateEditDefaultMaterial }


procedure TSkinDateEditDefaultMaterial.SetDrawTextParam(const Value: TDrawTextParam);
begin
  FDrawTextParam.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetArrowPicture(const Value: TDrawPicture);
begin
  FArrowPicture.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetDrawArrowPictureParam(const Value: TDrawPictureParam);
begin
  FDrawArrowPictureParam.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetDrawHelpTextParam(
  const Value: TDrawTextParam);
begin
  FDrawHelpTextParam.Assign(Value);
end;

constructor TSkinDateEditDefaultMaterial.Create;
begin
  inherited Create(AOwner);


  FDrawHelpTextParam:=CreateDrawTextParam('DrawHelpTextParam','提示文本绘制参数');
  FDrawHelpTextParam.DrawFont.FontColor.Color:=GrayColor;

  FArrowPicture:=CreateDrawPicture('ArrowPicture','下拉箭头图标');
  FDrawArrowPictureParam:=CreateDrawPictureParam('DrawArrowPictureParam','下拉箭头图标绘制参数');

  FDrawTextParam:=CreateDrawTextParam('DrawTextParam','在ListBox中文本的绘制参数');//  FDrawTextParam.FontVertAlign:=fvaCenter;

  FNormalPicture:=CreateDrawPicture('NormalPicture','正常状态图片');
  FHoverPicture:=CreateDrawPicture('HoverPicture','鼠标停靠状态图片');
  FFocusedPicture:=CreateDrawPicture('FocusedPicture','获取焦点状态图片');
  FDisabledPicture:=CreateDrawPicture('DisabledPicture','禁用状态图片');

  FDrawPictureParam:=CreateDrawPictureParam('DrawPictureParam','图片绘制参数');
end;

destructor TSkinDateEditDefaultMaterial.Destroy;
begin
  FreeAndNil(FDrawHelpTextParam);


  FreeAndNil(FArrowPicture);
  FreeAndNil(FDrawArrowPictureParam);

  FreeAndNil(FDrawTextParam);
  FreeAndNil(FDrawPictureParam);
  FreeAndNil(FNormalPicture);
  FreeAndNil(FHoverPicture);
  FreeAndNil(FFocusedPicture);
  FreeAndNil(FDisabledPicture);
  inherited;
end;

procedure TSkinDateEditDefaultMaterial.SetDisabledPicture(const Value: TDrawPicture);
begin
  FDisabledPicture.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetDrawPictureParam(const Value: TDrawPictureParam);
begin
  FDrawPictureParam.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetHoverPicture(const Value: TDrawPicture);
begin
  Self.FHoverPicture.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetFocusedPicture(const Value: TDrawPicture);
begin
  Self.FFocusedPicture.Assign(Value);
end;

procedure TSkinDateEditDefaultMaterial.SetNormalPicture(const Value: TDrawPicture);
begin
  Self.FNormalPicture.Assign(Value);
end;


{ TDateEditProperties }


function TDateEditProperties.GetComponentClassify: String;
begin
  Result:='SkinDateEdit';
end;

procedure TDateEditProperties.SetHelpText(const Value: String);
begin
  if FHelpText<>Value then
  begin
    FHelpText:=Value;
    Invalidate;
  end;
end;

procedure TDateEditProperties.AssignProperties(Src: TSkinControlProperties);
begin
  inherited;
  Self.FHelpText:=TDateEditProperties(Src).FHelpText;
end;

constructor TDateEditProperties.Create(ASkinControl:TControl);
begin
  inherited Create(ASkinControl);
  if Not ASkinControl.GetInterface(IID_ISkinDateEdit,Self.FSkinDateEditIntf) then
  begin
    ShowException('This Component Do not Support ISkinDateEdit Interface');
  end
  else
  begin
    Self.FSkinControlIntf.Width:=100;
    Self.FSkinControlIntf.Height:=22;
  end;
end;


destructor TDateEditProperties.Destroy;
begin
  inherited;
end;


initialization


  //日期框
  RegisterSkinControlStyle('SkinDateEdit',TSkinDateEditDefaultType,TSkinDateEditDefaultMaterial,TDateEditProperties,Const_Default_ComponentType,True);


end.


