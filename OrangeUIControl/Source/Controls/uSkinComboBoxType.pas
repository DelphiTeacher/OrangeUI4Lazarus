//convert pas to utf8 by ¥


/// <summary>
///   <para>
///     下拉框
///   </para>
///   <para>
///     ComboBox
///   </para>
/// </summary>
unit uSkinComboBoxType;

interface
{$I FrameWork.inc}

uses
  Classes,
  SysUtils,
  uFuncCommon,
  Types,
  Math,
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
  uBaseSkinControl,
  uSkinPublic,
  uSkinItems,
  uDrawParam,
  uSkinCustomListType,
  uSkinItemDesignerPanelType,
  uSkinScrollControlType,
  uGraphicCommon,
  uBaseLog,
//  uComponentType,
  uSkinListViewType,
  uSkinSelectPopupForm,

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
  IID_ISkinComboBox:TGUID='{0591FFC8-D257-4B2D-B875-6CE4EE4D05B7}';



type
  TComboBoxProperties=class;

  TSkinComboBoxViewType=(scbvtText,scbvtListView);



  /// <summary>
  ///   <para>
  ///     下拉框接口
  ///   </para>
  ///   <para>
  ///     Interface of ComboBox
  ///   </para>
  /// </summary>
  ISkinComboBox=interface//(ISkinControl)
    ['{0591FFC8-D257-4B2D-B875-6CE4EE4D05B7}']
    /// <summary>
    ///   <para>
    ///     文本
    ///   </para>
    ///   <para>
    ///     Text
    ///   </para>
    /// </summary>
    function GetText:String;
    property Text:String read GetText;
    //是否下拉框弹出了
    function GetIsDropedDown:Boolean;
    function GetViewType: TSkinComboBoxViewType;

    function GetComboBoxProperties:TComboBoxProperties;
    property Properties:TComboBoxProperties read GetComboBoxProperties;
    property Prop:TComboBoxProperties read GetComboBoxProperties;
  end;





  //
  /// <summary>
  ///   <para>
  ///     下拉框属性
  ///   </para>
  ///   <para>
  ///     ComboBox properties
  ///   </para>
  /// </summary>
  TComboBoxProperties=class(TSkinControlProperties)
  protected
    //绘制文本
    FDrawText:String;
    //提示文本
    FHelpText:String;

    //下拉框接口
    FSkinComboBoxIntf:ISkinComboBox;


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
    /// <summary>
    ///   <para>
    ///     在ListBox绘制时文本
    ///   </para>
    ///   <para>
    ///     Text of drawing in ListBox
    ///   </para>
    /// </summary>
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
  ///     下拉框默认素材
  ///   </para>
  ///   <para>
  ///     Default material of ComboBox
  ///   </para>
  /// </summary>
  TSkinComboBoxDefaultMaterial=class(TSkinControlMaterial)
  private
    //下拉箭头图片图片
    FArrowPicture:TDrawPicture;
    //下拉箭头图片图标绘制参数
    FDrawArrowPictureParam:TDrawPictureParam;


    //在ListBox中文本的绘制参数
    FDrawTextParam:TDrawTextParam;


    //提示文本绘制字体
    FDrawHelpTextParam:TDrawTextParam;


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


    procedure SetHoverPicture(const Value: TDrawPicture);
    procedure SetFocusedPicture(const Value: TDrawPicture);
    procedure SetNormalPicture(const Value: TDrawPicture);
    procedure SetDisabledPicture(const Value: TDrawPicture);
    procedure SetDrawPictureParam(const Value: TDrawPictureParam);

    procedure SetDrawTextParam(const Value: TDrawTextParam);
    procedure SetDrawHelpTextParam(const Value: TDrawTextParam);

    procedure SetArrowPicture(const Value: TDrawPicture);
    procedure SetDrawArrowPictureParam(const Value: TDrawPictureParam);
//  protected
//    //从文档节点中加载
//    function LoadFromDocNode(ADocNode:TBTNode20_Class):Boolean;override;
//    //保存到文档节点
//    function SaveToDocNode(ADocNode:TBTNode20_Class):Boolean;override;
  public
    function HasMouseDownEffect:Boolean;override;
    function HasMouseOverEffect:Boolean;override;
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


    //
    /// <summary>
    ///   <para>
    ///     正常状态图片
    ///   </para>
    ///   <para>
    ///     Normal state picture
    ///   </para>
    /// </summary>
    property NormalPicture:TDrawPicture read FNormalPicture write SetNormalPicture;
    //
    /// <summary>
    ///   <para>
    ///     鼠标停靠状态图片
    ///   </para>
    ///   <para>
    ///     Picture at mouse hovering state
    ///   </para>
    /// </summary>
    property HoverPicture:TDrawPicture read FHoverPicture write SetHoverPicture;
    //
    /// <summary>
    ///   <para>
    ///     获取焦点状态下的图片
    ///   </para>
    ///   <para>
    ///      Picture of getting focused state
    ///   </para>
    /// </summary>
    property FocusedPicture:TDrawPicture read FFocusedPicture write SetFocusedPicture;
    //
    /// <summary>
    ///   <para>
    ///     禁用状态图片
    ///   </para>
    ///   <para>
    ///     Picture at disabled state
    ///   </para>
    /// </summary>
    property DisabledPicture:TDrawPicture read FDisabledPicture write SetDisabledPicture;


    //
    /// <summary>
    ///   <para>
    ///     图片绘制参数
    ///   </para>
    ///   <para>
    ///     Draw parameters of picture
    ///   </para>
    /// </summary>
    property DrawPictureParam:TDrawPictureParam read FDrawPictureParam write SetDrawPictureParam;


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
    //
    /// <summary>
    ///   <para>
    ///     在ListBox中文本的绘制参数
    ///   </para>
    ///   <para>
    ///     Draw text parameters in ListBox
    ///   </para>
    /// </summary>
    property DrawTextParam:TDrawTextParam read FDrawTextParam write SetDrawTextParam;
  end;

  TSkinComboBoxDefaultType=class(TSkinControlType)
  protected
    //下拉框接口
    FSkinComboBoxIntf:ISkinComboBox;
    function GetSkinMaterial:TSkinComboBoxDefaultMaterial;
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
  public
    //下拉框弹出时,ComboEdit会失去焦点,也就是失去当前获取焦点的状态,
    //获取当前的状态
//    function GetCurrentEffectStates(APaintData:TPaintData): TDPEffectStates;override;
    function CalcCurrentEffectStates(APaintData:TPaintData):TDPEffectStates;override;
  end;


  {$I ComponentPlatformsAttribute.inc}
  TSkinComboBox=class(TBaseSkinControl,
                        ISkinComboBox,
                        ICustomListItemEditor,
                        IBindSkinItemTextControl,
                        IBindSkinItemValueControl//,
//                        IBindSkinItemObjectControl//,
//                        ISkinItem
                        )
  private
    FItems: TStringList;
    FItemIndex: Integer;
    FOnChange: TNotifyEvent;
    FAutoDropDown: Boolean;
    FViewType: TSkinComboBoxViewType;
    FMultiSelect: Boolean;
//    FDetail:String;
//    FDetail1:String;
//    procedure SetDetail(const Value:String);
//    procedure SetDetail1(const Value:String);
    function GetComboBoxProperties:TComboBoxProperties;
    procedure SetComboBoxProperties(Value:TComboBoxProperties);
    procedure SetItems(const Value: TStringList);
    procedure SetItemIndex(const Value: Integer);
    function GetlvMultiSelectedItemsOnNewListItemStyleFrameCacheInit: TNewListItemStyleFrameCacheInitEvent;
    function GetOnlvPopupItemsNewListItemStyleFrameCacheInit: TNewListItemStyleFrameCacheInitEvent;
    procedure SetlvPopupItemsOnNewListItemStyleFrameCacheInit(
      const Value: TNewListItemStyleFrameCacheInitEvent);
    procedure SetOnlvMultiSelectedItemsNewListItemStyleFrameCacheInit(
      const Value: TNewListItemStyleFrameCacheInitEvent);
    //点击设计面板上面子控件的事件
    procedure DolvMultiSelectedItemsClickItemDesignerPanelChild(Sender:TObject;
                                                                AItem:TBaseSkinItem;//这里应该用TBaseSkinItem
                                                                AItemDesignerPanel:TSkinItemDesignerPanel;
                                                                AChild:TChildControl);
    procedure SetViewType(const Value: TSkinComboBoxViewType);
    //ISkinComboBox
    function GetViewType: TSkinComboBoxViewType;
    //是否下拉框弹出了
    function GetIsDropedDown:Boolean;
  protected
//    procedure lvMultiSelectedItemsNewListItemStyleFrameCacheInit(Sender: TObject;
//      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
//      ANewListItemStyleFrameCache: TListItemStyleFrameCache);virtual;
  protected
    procedure lvPopupItemsClickItem(AItem:TSkinItem);virtual;
//    procedure lvPopupItemsNewListItemStyleFrameCacheInit(Sender: TObject;
//      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
//      ANewListItemStyleFrameCache: TListItemStyleFrameCache);virtual;
//    procedure lvPopupItemsPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
//      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
//      AItemDrawRect: TRect);virtual;
  protected
    function GetText:String;
    procedure SetText(const Value: String);
    //获取控件属性类
    function GetPropertiesClassType:TPropertiesClassType;override;
  protected
    //在ListBox中启动编辑时所调用的ICustomListItemEditor
    procedure EditSetValue(const AValue:Variant);
    function EditGetValue:Variant;
    procedure EditMouseDown(Button: TMouseButton; Shift: TShiftState;X, Y: Double);
    procedure EditMouseUp(Button: TMouseButton; Shift: TShiftState;X, Y: Double);
    procedure EditMouseMove(Shift: TShiftState; X, Y: Double);
  protected
    procedure BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
    procedure SetControlValueByBindItemField(const AFieldName:String;
                                              const AFieldValue:Variant;
                                              ASkinItem:TObject;
                                              AIsDrawItemInteractiveState:Boolean);
//    procedure SetControlObjectByBindItemField(const AFieldName:String;
//                                              const AFieldValue:TObject;
//                                              ASkinItem:TObject;
//                                              AIsDrawItemInteractiveState:Boolean);
  public
    lvMultiSelectedItems: TSkinListView;
    lvPopupItems: TSkinListView;
//    edtValue: TSkinWinEdit;
//    edtValue2: TEdit;
    FfrmSelectPopup:TfrmSkinSelectPopup;
    DropDownCount:Integer;
    function GetPopupFormWidth:Integer;virtual;
    function CreateSelectPopupForm:TfrmSkinSelectPopup;virtual;
  public
    function SelfOwnMaterialToDefault:TSkinComboBoxDefaultMaterial;
    function CurrentUseMaterialToDefault:TSkinComboBoxDefaultMaterial;
    function Material:TSkinComboBoxDefaultMaterial;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    property Prop:TComboBoxProperties read GetComboBoxProperties write SetComboBoxProperties;
  public
    procedure SyncMultiSelectedItems;
    procedure Click;override;
    procedure DropDown(APopupPoint:TPoint);
    //这个列表项是否可以被添加到Text
    function IsItemCanAddToText(AItem:TSkinItem):Boolean;virtual;

    //function GetSelectedTextArray:ISuperArray;virtual;
    function GetSelectedCaptions:String;virtual;
    function GetSelectedNames:String;virtual;

    property Text:String read GetText write SetText;

    //function GetSelectedIndexArray:ISuperArray;

  published
    property MultiSelect:Boolean read FMultiSelect write FMultiSelect;
    property ViewType:TSkinComboBoxViewType read GetViewType write SetViewType;
    //动态
    property AutoDropDown:Boolean read FAutoDropDown write FAutoDropDown;
//    property Action;
    property Items:TStringList read FItems write SetItems;
    property ItemIndex:Integer read FItemIndex write SetItemIndex;
    //标题
//    property Caption;
//    property Detail:String read FDetail write SetDetail;
//    property Detail1:String read FDetail1 write SetDetail1;
//    property Text;
    //点击事件
    property OnClick;
    //双击事件
    property OnDblClick;
    property OnChange:TNotifyEvent read FOnChange write FOnChange;
    property OnlvMultiSelectedItemsNewListItemStyleFrameCacheInit:TNewListItemStyleFrameCacheInitEvent read GetlvMultiSelectedItemsOnNewListItemStyleFrameCacheInit write SetOnlvMultiSelectedItemsNewListItemStyleFrameCacheInit;
    property OnlvPopupItemsNewListItemStyleFrameCacheInit:TNewListItemStyleFrameCacheInitEvent read GetOnlvPopupItemsNewListItemStyleFrameCacheInit write SetlvPopupItemsOnNewListItemStyleFrameCacheInit;
    //属性
    property Properties:TComboBoxProperties read GetComboBoxProperties write SetComboBoxProperties;

  end;





implementation





{ TSkinComboBoxDefaultType }


//function TSkinComboBoxDefaultType.GetCurrentEffectStates(
//  APaintData: TPaintData): TDPEffectStates;
//begin
//  Result:=Inherited;// CalcCurrentEffectStates;
//  if AChecked then
//  begin
//    Result:=Result+[dpstPushed];
//  end;
//
//end;

function TSkinComboBoxDefaultType.GetSkinMaterial: TSkinComboBoxDefaultMaterial;
begin
  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
  begin
    Result:=TSkinComboBoxDefaultMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
  end
  else
  begin
    Result:=nil;
  end;
end;

function TSkinComboBoxDefaultType.CustomPaint(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect: TRectF;APaintData:TPaintData): Boolean;
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
    else if Self.FSkinControlIntf.Focused and APaintData.IsDrawInteractiveState  then
    begin
      ADrawPicture:=Self.GetSkinMaterial.FFocusedPicture;
    end
    else if Self.FSkinControlIntf.IsMouseOver and APaintData.IsDrawInteractiveState  then
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


    //绘制下拉箭头
    ACanvas.DrawPicture(Self.GetSkinMaterial.FDrawArrowPictureParam,
                          Self.GetSkinMaterial.FArrowPicture,
                          ADrawRect);




    //绘制文本
    if Self.FSkinComboBoxIntf.GetViewType=scbvtText then
    begin

      if APaintData.IsInDrawDirectUI then
      begin
        ACanvas.DrawText(Self.GetSkinMaterial.FDrawTextParam,
                        Self.FSkinComboBoxIntf.Prop.DrawText,
                        ADrawRect);
      end
      else
      begin

        //绘制文本
        if (Self.FSkinComboBoxIntf.Text<>'') then
        begin
          ACanvas.DrawText(Self.GetSkinMaterial.FDrawTextParam,
                          Self.FSkinComboBoxIntf.Text,
                          ADrawRect);
        end;

      end;

    end;




    {$IFDEF FMX}
    CustomPaintHelpText(ACanvas,ASkinMaterial,ADrawRect,APaintData);
    {$ENDIF}
    {$IFDEF VCL}
    CustomPaintHelpText(ACanvas,ASkinMaterial,ADrawRect,APaintData);
    {$ENDIF}



  end;
end;

function TSkinComboBoxDefaultType.CalcCurrentEffectStates(
  APaintData: TPaintData): TDPEffectStates;
begin
  Result:=Inherited;// CalcCurrentEffectStates;

  if Self.FSkinComboBoxIntf.GetIsDropedDown then
  begin
    Result:=Result+[dpstFocused];
  end;

end;

function TSkinComboBoxDefaultType.CustomBind(ASkinControl:TControl): Boolean;
begin
  if Inherited CustomBind(ASkinControl) then
  begin
    if ASkinControl.GetInterface(IID_ISkinComboBox,Self.FSkinComboBoxIntf) then
    begin
      Result:=True;
    end
    else
    begin
      ShowException('This Component Do not Support ISkinComboBox Interface');
    end;
  end;
end;

procedure TSkinComboBoxDefaultType.CustomUnBind;
begin
  Inherited CustomUnBind;
  Self.FSkinComboBoxIntf:=nil;
end;

function TSkinComboBoxDefaultType.CustomPaintHelpText(ACanvas: TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect: TRectF;APaintData:TPaintData): Boolean;
begin

  //绘制提示文本
  if (
            (Self.FSkinComboBoxIntf.Text='') and not APaintData.IsInDrawDirectUI
          or (Self.FSkinComboBoxIntf.Prop.DrawText='') and APaintData.IsInDrawDirectUI
      )
     and (Self.FSkinComboBoxIntf.Prop.HelpText<>'') then
  begin
    ACanvas.DrawText(Self.GetSkinMaterial.FDrawHelpTextParam,Self.FSkinComboBoxIntf.Prop.HelpText,ADrawRect);
  end;

end;



{ TSkinComboBoxDefaultMaterial }


procedure TSkinComboBoxDefaultMaterial.SetArrowPicture(const Value: TDrawPicture);
begin
  FArrowPicture.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetDrawArrowPictureParam(const Value: TDrawPictureParam);
begin
  FDrawArrowPictureParam.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetDrawHelpTextParam(const Value: TDrawTextParam);
begin
  FDrawHelpTextParam.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetDrawTextParam(const Value: TDrawTextParam);
begin
  FDrawTextParam.Assign(Value);
end;

constructor TSkinComboBoxDefaultMaterial.Create;
begin
  inherited Create(AOwner);


  FDrawHelpTextParam:=CreateDrawTextParam('DrawHelpTextParam','提示文本绘制参数');
  FDrawHelpTextParam.DrawFont.FontColor.Color:=GrayColor;

  FDrawTextParam:=CreateDrawTextParam('DrawTextParam','在ListBox中文本的绘制参数');

  FArrowPicture:=CreateDrawPicture('ArrowPicture','下拉箭头图标');
  FDrawArrowPictureParam:=CreateDrawPictureParam('DrawArrowPictureParam','下拉箭头图标绘制参数');



  FNormalPicture:=CreateDrawPicture('NormalPicture','正常状态图片');
  FHoverPicture:=CreateDrawPicture('HoverPicture','鼠标停靠状态图片');
  FFocusedPicture:=CreateDrawPicture('FocusedPicture','获取焦点状态图片');
  FDisabledPicture:=CreateDrawPicture('DisabledPicture','禁用状态图片');

  FDrawPictureParam:=CreateDrawPictureParam('DrawPictureParam','图片绘制参数');
end;

//function TSkinComboBoxDefaultMaterial.LoadFromDocNode(ADocNode: TBTNode20_Class): Boolean;
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
////    if ABTNode.NodeName='DrawPictureParam' then
////    begin
////      FDrawPictureParam.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='NormalPicture' then
////    begin
////      FNormalPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='HoverPicture' then
////    begin
////      FHoverPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    else if ABTNode.NodeName='DisabledPicture' then
////    begin
////      FDisabledPicture.LoadFromDocNode(ABTNode.ConvertNode_Class);
////    end
////    ;
////
////  end;
//
//  Result:=True;
//end;
//
//function TSkinComboBoxDefaultMaterial.SaveToDocNode(ADocNode: TBTNode20_Class): Boolean;
////var
////  ABTNode:TBTNode20;
//begin
//  Result:=False;
//
//  Inherited SaveToDocNode(ADocNode);
//
////  ABTNode:=ADocNode.AddChildNode_Class('DrawPictureParam',FDrawPictureParam.Name);
////  Self.FDrawPictureParam.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('NormalPicture',FNormalPicture.Name);
////  Self.FNormalPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('HoverPicture',FHoverPicture.Name);
////  Self.FHoverPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
////  ABTNode:=ADocNode.AddChildNode_Class('DisabledPicture',FDisabledPicture.Name);
////  Self.FDisabledPicture.SaveToDocNode(ABTNode.ConvertNode_Class);
////
//
//  Result:=True;
//end;

destructor TSkinComboBoxDefaultMaterial.Destroy;
begin
  FreeAndNil(FArrowPicture);
  FreeAndNil(FDrawArrowPictureParam);

  FreeAndNil(FDrawTextParam);
  FreeAndNil(FDrawHelpTextParam);

  FreeAndNil(FDrawPictureParam);
  FreeAndNil(FNormalPicture);
  FreeAndNil(FHoverPicture);
  FreeAndNil(FFocusedPicture);
  FreeAndNil(FDisabledPicture);
  inherited;
end;

function TSkinComboBoxDefaultMaterial.HasMouseDownEffect: Boolean;
begin
  Result:=True;
end;

function TSkinComboBoxDefaultMaterial.HasMouseOverEffect: Boolean;
begin
  Result:=True;
end;

procedure TSkinComboBoxDefaultMaterial.SetDisabledPicture(const Value: TDrawPicture);
begin
  FDisabledPicture.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetDrawPictureParam(const Value: TDrawPictureParam);
begin
  FDrawPictureParam.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetHoverPicture(const Value: TDrawPicture);
begin
  Self.FHoverPicture.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetFocusedPicture(const Value: TDrawPicture);
begin
  Self.FFocusedPicture.Assign(Value);
end;

procedure TSkinComboBoxDefaultMaterial.SetNormalPicture(const Value: TDrawPicture);
begin
  Self.FNormalPicture.Assign(Value);
end;


{ TComboBoxProperties }


function TComboBoxProperties.GetComponentClassify: String;
begin
  Result:='SkinComboBox';
end;

procedure TComboBoxProperties.AssignProperties(Src: TSkinControlProperties);
begin
  inherited;
  Self.FHelpText:=TComboBoxProperties(Src).FHelpText;
end;

constructor TComboBoxProperties.Create(ASkinControl:TControl);
begin
  inherited Create(ASkinControl);
  if Not ASkinControl.GetInterface(IID_ISkinComboBox,Self.FSkinComboBoxIntf) then
  begin
    ShowException('This Component Do not Support ISkinComboBox Interface');
  end
  else
  begin
    Self.FSkinControlIntf.Width:=100;
    Self.FSkinControlIntf.Height:=22;
  end;
end;

destructor TComboBoxProperties.Destroy;
begin
  inherited;
end;

procedure TComboBoxProperties.SetHelpText(const Value: String);
begin
  if FHelpText<>Value then
  begin
    FHelpText:=Value;
    Invalidate;
  end;
end;


{ TSkinComboBox }

function TSkinComboBox.GetPopupFormWidth: Integer;
begin
  Result:=Width;
//  if FPopupFormWidth>0 then
//  begin
//    Result:=FPopupFormWidth;
//  end;

end;

//function TSkinComboBox.GetText: String;
//begin
////  Result:=False;
//end;

function TSkinComboBox.GetSelectedCaptions: String;
var
  I:Integer;
  ASelectedList:TStringList;
  AEditText:string;
begin

  //替换中文逗号
  AEditText:=Self.Caption;//edtValue.Text;
  if Pos('，', AEditText) > 0 then
  begin
    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
  end;

  //设置选中
  ASelectedList:=TStringList.Create;
  Self.lvPopupItems.Prop.Items.BeginUpdate;
  try
    ASelectedList.CommaText:=AEditText;
    for I := 0 to Self.lvPopupItems.Prop.Items.Count-1 do
    begin
      Self.lvPopupItems.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvPopupItems.Prop.Items[i].Caption)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvPopupItems.Prop.Items.EndUpdate;
  end;

  Result:='';
  for I:=0 to Self.lvPopupItems.Prop.Items.Count-1 do
  begin
    if Self.lvPopupItems.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvPopupItems.Prop.Items[I]) then
    begin
      if Result<>'' then
      begin
        Result:=Result+',';
      end;
      Result:=Result+Self.lvPopupItems.Prop.Items[I].Caption;
    end;
  end;

end;

function TSkinComboBox.GetSelectedNames: String;
var
  I:Integer;
  ASelectedList:TStringList;
  AEditText:string;
begin

  //替换中文逗号
  AEditText:=Self.Caption;//edtValue.Text;
  if Pos('，', AEditText) > 0 then
  begin
    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
  end;

  //设置选中
  ASelectedList:=TStringList.Create;
  Self.lvPopupItems.Prop.Items.BeginUpdate;
  try
    ASelectedList.CommaText:=AEditText;
    for I := 0 to Self.lvPopupItems.Prop.Items.Count-1 do
    begin
      Self.lvPopupItems.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvPopupItems.Prop.Items[i].Caption)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvPopupItems.Prop.Items.EndUpdate;
  end;

  Result:='';
  for I:=0 to Self.lvPopupItems.Prop.Items.Count-1 do
  begin
    if Self.lvPopupItems.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvPopupItems.Prop.Items[I]) then
    begin
      if Result<>'' then
      begin
        Result:=Result+',';
      end;
      Result:=Result+Self.lvPopupItems.Prop.Items[I].Name;
    end;
  end;

end;

//function TSkinComboBox.GetSelectedTextArray: ISuperArray;
//var
//  I:Integer;
//  ASelectedList:TStringList;
//  AEditText:string;
//begin
//
//  //替换中文逗号
//  AEditText:=Self.edtValue.Text;
//  if Pos('，', AEditText) > 0 then
//  begin
//    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
//  end;
//
//  //设置选中
//  ASelectedList:=TStringList.Create;
//  Self.lvPopupItems.Prop.Items.BeginUpdate;
//  try
//    ASelectedList.CommaText:=AEditText;
//    for I := 0 to Self.lvPopupItems.Prop.Items.Count-1 do
//    begin
//      Self.lvPopupItems.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvPopupItems.Prop.Items[i].Caption)<>-1);
//    end;
//  finally
//    FreeAndNil(ASelectedList);
//    Self.lvPopupItems.Prop.Items.EndUpdate;
//  end;
//
//  Result:=SA();//TSuperArray.Create;
//  for I:=0 to Self.lvPopupItems.Prop.Items.Count-1 do
//  begin
//    if Self.lvPopupItems.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvPopupItems.Prop.Items[I]) then
//    begin
//      Result.S[Result.Length]:=Self.lvPopupItems.Prop.Items[I].Caption;
//    end;
//  end;
//end;

function TSkinComboBox.GetText: String;
begin
  Result:=Self.Caption;//edtValue.Text;
end;

function TSkinComboBox.GetViewType: TSkinComboBoxViewType;
begin
  Result:=FViewType;
end;

function TSkinComboBox.IsItemCanAddToText(AItem: TSkinItem): Boolean;
begin
  Result:=True;
end;

////获取已选内容下标数组
//function TSkinComboBox.GetSelectedIndexArray: ISuperArray;
//var
//  I:Integer;
//  ASelectedList:TStringList;
//  AEditText:string;
//begin
//
//  //替换中文逗号
//  AEditText:=Self.edtValue.Text;
//  if Pos('，', AEditText) > 0 then
//  begin
//    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
//  end;
//
//  //设置选中
//  ASelectedList:=TStringList.Create;
//  Self.lvPopupItems.Prop.Items.BeginUpdate;
//  try
//    ASelectedList.CommaText:=AEditText;
//    for I := 0 to Self.lvPopupItems.Prop.Items.Count-1 do
//    begin
//      Self.lvPopupItems.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvPopupItems.Prop.Items[i].Caption)<>-1);
//    end;
//  finally
//    FreeAndNil(ASelectedList);
//    Self.lvPopupItems.Prop.Items.EndUpdate;
//  end;
//
//  Result:=TSuperArray.Create;
//  for I:=0 to Self.lvPopupItems.Prop.Items.Count-1 do
//  begin
//    if Self.lvPopupItems.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvPopupItems.Prop.Items[I]) then
//    begin
//      Result.I[Result.Length]:=Self.lvPopupItems.Prop.Items[I].Index;
//    end;
//  end;
//end;

//procedure TSkinComboBox.lvMultiSelectedItemsNewListItemStyleFrameCacheInit(
//  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
//  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
//begin
//  //把图标隐藏掉
//
//end;

procedure TSkinComboBox.lvPopupItemsClickItem(AItem: TSkinItem);
var
  I:Integer;
  AText:String;
begin

  if not Self.lvPopupItems.Prop.MultiSelect then
  begin
    //单选
    Self.Text:=AItem.Caption;
    FfrmSelectPopup.HidePopup;
  end
  else
  begin

    //多选
    AText:='';
    for I:=0 to Self.lvPopupItems.Prop.Items.Count-1 do
    begin
      if Self.lvPopupItems.Prop.Items[I].Selected then
      begin
        if AText<>'' then
        begin
          AText:=AText+',';
        end;
        AText:=AText+Self.lvPopupItems.Prop.Items[I].Caption;
      end;
    end;
    Self.Text:=AText;

  end;
  Invalidate;

end;

//procedure TSkinComboBox.lvPopupItemsNewListItemStyleFrameCacheInit(Sender: TObject;
//  AListItemTypeStyleSetting: TListItemTypeStyleSetting;
//  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
////var
////  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
//begin
////  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(ANewListItemStyleFrameCache.FItemStyleFrame);
////  AFrame.imgItemIcon.Visible:=False;
//end;
//
//procedure TSkinComboBox.lvPopupItemsPrepareDrawItem(Sender: TObject;
//  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
//  AItem: TSkinItem; AItemDrawRect: TRect);
//begin
//  //
//end;

procedure TSkinComboBox.SetText(const Value: String);
begin
  if Self.Caption<>Value then
  begin
    Self.Caption:=Value;
    if (FViewType=scbvtListView) then
    begin
      Self.SyncMultiSelectedItems;
    end;
    if Assigned(FOnChange) then FOnChange(Self);
  end;
end;

procedure TSkinComboBox.SetViewType(const Value: TSkinComboBoxViewType);
begin
  if FViewType<>Value then
  begin
    FViewType := Value;
    if Self.lvMultiSelectedItems<>nil then
    begin
      lvMultiSelectedItems.Visible:=(FViewType=scbvtListView);
      if (FViewType=scbvtListView) then
      begin
        SyncMultiSelectedItems;
      end;
    end;
  end;
end;

procedure TSkinComboBox.SyncMultiSelectedItems;
var
  I:Integer;
  AEditText:String;
  ASkinItem:TSkinItem;
  ASelectedList:TStringList;
begin
  if (FViewType=scbvtListView) then
  begin
//    //多选才需要使用ListView来显示已经选中的
//    if Self.Prop.FMultiSelect then
//    begin
  //      lvMultiSelectedItems.Prop.Items.BeginUpdate;
  //      try
  //        lvMultiSelectedItems.Prop.Items.Clear;
  //    //    lvMultiSelectedItems.Prop.MultiSelect:=True;
  //    //    lvMultiSelectedItems.Prop.ItemHeight:=32;
  //    //    lvMultiSelectedItems.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';
  //
  //    //    ACompanySizeArray:=TSuperArray.Create('["1-10人","11-50人","51-200人","201-500人","501-1000人","1001-5000人","5001-10000人","超过10001人"]');
  //
  //        for I := 0 to Self.FItems.Count - 1 do
  //        begin
  //          lvMultiSelectedItems.Prop.Items.Add.Caption:=FItems[I];
  //        end;
  //
  //      finally
  //        lvMultiSelectedItems.Prop.Items.EndUpdate();
  //      end;


        //替换中文逗号
        AEditText:=Self.Text;
        if Pos('，', AEditText) > 0 then
        begin
          AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
        end;

        //设置选中的项
        ASelectedList:=TStringList.Create;
        lvMultiSelectedItems.Prop.Items.BeginUpdate;
        try
          lvMultiSelectedItems.Prop.Items.Clear;
          ASelectedList.CommaText:=AEditText;
          for I := 0 to ASelectedList.Count-1 do
          begin
            ASkinItem:=lvMultiSelectedItems.Prop.Items.Add;
            ASkinItem.Caption:=ASelectedList[I];
            ASkinItem.Width:=uSkinBufferBitmap.GetStringWidth(ASkinItem.Caption,10)+40;
          end;
        finally
          FreeAndNil(ASelectedList);
          Self.lvMultiSelectedItems.Prop.Items.EndUpdate;
        end;

//        lvMultiSelectedItems.Width:=Ceil(lvMultiSelectedItems.Prop.CalcContentWidth);

//    end;
  end;

end;

function TSkinComboBox.CreateSelectPopupForm: TfrmSkinSelectPopup;
begin
  Result:=uSkinSelectPopupForm.CreateSkinSelectPopupForm(Application.MainForm,TfrmSkinSelectPopup);
end;


//function TSkinComboBox.GetSelected: Boolean;
//begin
//  Result:=False;
//end;
//
//function TSkinComboBox.GetThisRowItemCount: Integer;
//begin
//  Result:=0;
//end;
//
////层级
//function TSkinComboBox.GetLevel:Integer;
//begin
//  Result:=0;
//end;
//
////获取与设置自定义属性
//function TSkinComboBox.GetPropJsonStr:String;
//begin
//  Result:=Inherited;
//end;
//
//procedure TSkinComboBox.SetPropJsonStr(AJsonStr:String);
//var
//  APropJson:ISuperObject;
//begin
//  Inherited;
//
//  APropJson:=SO(AJsonStr);
//  if APropJson.Contains('ReadOnly') then
//  begin
//    Self.Enabled:=not APropJson.B['ReadOnly'];
//    Invalidate;
//  end;
//
//  if APropJson.Contains('IsSelectComboBox') then
//  begin
//    Self.IsSelectComboBox:=APropJson.B['IsSelectComboBox'];
//  end;
//
//end;
//
//
//function TSkinComboBox.LoadFromFieldControlSetting(ASetting: TFieldControlSetting;AFieldControlSettingMap:TObject): Boolean;
//begin
//  Setting:=ASetting;
//  Caption:=ASetting.field_caption;
//
////  {$IFDEF FMX}
////  IsSelectComboBox:=True;
////  {$ENDIF}
////
////  {$IFDEF VCL}
//  IsSelectComboBox:=False;
////  {$ENDIF}
//
//
//
//
////  Result:=Inherited;
////
////  if (ASetting.ControlStyle='') and (ASetting.Action<>'') then
////  begin
////    //根据按钮的功能来设置按钮的素材风格
////    SetMaterialName(ASetting.Action);
////  end;
//  Result:=True;
//end;
//
//procedure TSkinComboBox.SetItemDrawRect(Value: TRectF);
//begin
//  FItemDrawRect:=Value;
//end;
//
//function TSkinComboBox.GetIsRowEnd:Boolean;
//begin
//  Result:=False;
//end;
//
//procedure TSkinComboBox.SetSkinListIntf(ASkinListIntf: ISkinList);
//begin
//  FSkinListIntf:=ASkinListIntf;
//end;
//
//procedure TSkinComboBox.TranslateControlLang(APrefix: String; ALang: TLang;
//  ACurLang: String);
//begin
//  inherited;
//
//  if GetLangValue(ALang,APrefix+Name+'.Detail',ACurLang)<>'' then
//  begin
//    Detail:=GetLangValue(ALang,APrefix+Name+'.Detail',ACurLang);
//  end;
//
//  if GetLangValue(ALang,APrefix+Name+'.Detail1',ACurLang)<>'' then
//  begin
//    Detail1:=GetLangValue(ALang,APrefix+Name+'.Detail1',ACurLang);
//  end;
//
//  if GetLangValue(ALang,APrefix+Name+'.HelpText',ACurLang)<>'' then
//  begin
//    Prop.HelpText:=GetLangValue(ALang,APrefix+Name+'.HelpText',ACurLang);
//  end;
//end;
//
//function TSkinComboBox.GetListLayoutsManager:TSkinListLayoutsManager;
//begin
//  Result:=FSkinListIntf.GetListLayoutsManager;
//end;
//
//procedure TSkinComboBox.ClearItemRect;
//begin
//
//end;
//
//procedure TSkinComboBox.SetItemRect(Value: TRectF);
//begin
//  FItemRect:=Value;
//  Self.SetBounds(Value);
//end;
//
//function TSkinComboBox.GetItemDrawRect: TRectF;
//begin
//  Result:=FItemDrawRect;
//end;
//
//function TSkinComboBox.GetItemRect: TRectF;
//begin
//  Result:=FItemRect;
//end;
//
//
//function TSkinComboBox.GetObject: TObject;
//begin
//  Result:=Self;
//end;
//
//function TSkinComboBox.GetWidth:Double;
//begin
//  Result:=Width;
//end;
//
//function TSkinComboBox.GetHeight:Double;
//begin
//  Result:=Height;
//end;

function TSkinComboBox.Material:TSkinComboBoxDefaultMaterial;
begin
  Result:=TSkinComboBoxDefaultMaterial(SelfOwnMaterial);
end;

//function TSkinComboBox.PtInItem(APoint: TPointF): Boolean;
//begin
//  Result:=PtInRect(Self.FItemDrawRect,APoint);
//
//end;

procedure TSkinComboBox.Click;
var
  APopupPoint:TPoint;
begin
  Inherited;

  if FAutoDropDown then
  begin
    //当它在设计面板中的时候就不能这么计算
    APopupPoint:=Self.ClientToScreen(Types.Point(0,Self.Height));
    DropDown(APopupPoint);
  end;
end;

constructor TSkinComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FItems:=TStringList.Create;


//  lvText:=TSkinListView;



  lvMultiSelectedItems:=TSkinListView.Create(Self);
  lvMultiSelectedItems.Parent:=Self;
  //加速，因为如果为每个Item创建一个StyleFrame，会比较慢
  Self.lvMultiSelectedItems.Prop.FDefaultItemStyleSetting.IsUseCache:=False;
  lvMultiSelectedItems.SelfOwnMaterial;
  lvMultiSelectedItems.SkinControlType;
//  lvMultiSelectedItems.Visible:=False;
//  lvMultiSelectedItems.OnClickItem := lvPopupItemsClickItem;
//  lvMultiSelectedItems.OnPrepareDrawItem := lvPopupItemsPrepareDrawItem;
//  lvMultiSelectedItems.OnNewListItemStyleFrameCacheInit := lvMultiSelectedItemsNewListItemStyleFrameCacheInit;
  lvMultiSelectedItems.OnClickItemDesignerPanelChild := DolvMultiSelectedItemsClickItemDesignerPanelChild;
//  lvMultiSelectedItems.Material.IsTransparent:=False;
//  lvMultiSelectedItems.Material.BackColor.IsFill:=True;
  lvMultiSelectedItems.Material.IsTransparent:=True;
//  lvMultiSelectedItems.Material.BackColor.IsFill:=False;
//  lvMultiSelectedItems.Material.BackColor.IsFill:=True;
//  lvMultiSelectedItems.Material.BackColor.FillColor.Color:=clRed;
//  lvMultiSelectedItems.Material.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.Eff
  lvMultiSelectedItems.Prop.ItemHeight:=36;
  lvMultiSelectedItems.Prop.ItemWidth:=50;
  lvMultiSelectedItems.Prop.ItemSpace:=5;
  lvMultiSelectedItems.Prop.ItemLayoutType:=iltHorizontal;
  lvMultiSelectedItems.Prop.ViewType:=lvtList;
  lvMultiSelectedItems.Align:=alClient;
  lvMultiSelectedItems.AlignWithMargins:=True;
  //右边要为按钮空出一点
  lvMultiSelectedItems.Margins.SetBounds(2,2,24,2);
  lvMultiSelectedItems.Prop.HorzScrollBarShowType:=TScrollBarShowType.sbstHide;
  lvMultiSelectedItems.Prop.VertScrollBarShowType:=TScrollBarShowType.sbstNone;
  lvMultiSelectedItems.Visible:=False;
//  lvMultiSelectedItems.Width:=0;
//  lvMultiSelectedItems.Top:=100;



  lvPopupItems:=TSkinListView.Create(Self);
  lvPopupItems.Parent:=Self;
//  //加速，因为如果为每个Item创建一个StyleFrame，会比较慢
//  Self.lvPopupItems.Prop.FDefaultItemStyleSetting.IsUseCache:=False;
  lvPopupItems.SelfOwnMaterial;
  lvPopupItems.SkinControlType;
//  lvPopupItems.Visible:=False;
  lvPopupItems.OnClickItem := lvPopupItemsClickItem;
//  lvPopupItems.OnPrepareDrawItem := lvPopupItemsPrepareDrawItem;
//  lvPopupItems.OnNewListItemStyleFrameCacheInit := lvPopupItemsNewListItemStyleFrameCacheInit;
  lvPopupItems.Material.IsTransparent:=False;
  lvPopupItems.Material.BackColor.IsFill:=True;
//  lvPopupItems.Material.BackColor.FillColor.Color:=clYellow;

//  lvPopupItems.Material.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.Eff
//  lvPopupItems.Material.DrawItemBackColorParam.FillColor.Color:=clBlue;
//  lvPopupItems.Material.DrawItemBackColorParam.IsFill:=True;

  lvPopupItems.Prop.ItemHeight:=32;

//  lvPopupItems.Prop.ItemWidth:=-2;
//  lvPopupItems.Prop.ViewType:=lvtIcon;
//  lvPopupItems.Prop.ColCount:=1;

  lvPopupItems.Prop.ViewType:=lvtList;
  lvPopupItems.Prop.ItemWidth:=-1;
  lvPopupItems.Top:=100;

  DropDownCount:=6;


//  edtValue:=TSkinWinEdit.Create(Self);
//  edtValue.Parent:=Self;
//  edtValue.Top:=100;
//  edtValue.Visible:=False;
//
//  edtValue2:=TEdit.Create(Self);
//  edtValue2.Parent:=Self;
//  edtValue2.Top:=100;
//  edtValue2.Visible:=False;

  FItemIndex:=-1;

  FAutoDropDown:=True;

  Self.TabStop:=True;
  Self.FMouseDownFocus:=True;

end;

function TSkinComboBox.CurrentUseMaterialToDefault:TSkinComboBoxDefaultMaterial;
begin
  Result:=TSkinComboBoxDefaultMaterial(CurrentUseMaterial);
end;

function TSkinComboBox.SelfOwnMaterialToDefault:TSkinComboBoxDefaultMaterial;
begin
  Result:=TSkinComboBoxDefaultMaterial(SelfOwnMaterial);
end;

function TSkinComboBox.GetPropertiesClassType: TPropertiesClassType;
begin
  Result:=TComboBoxProperties;
end;

//procedure TSkinComboBox.ReadState(Reader: TReader);
//var
//  ASkinMyComboBoxGroupIntf:ISkinMyComboBoxGroup;
//begin
//  inherited ReadState(Reader);
//
//
//  //自动的指定ComboBox的Parent为按钮组
//  if (Reader.Parent<>nil)
//    and (Reader.Parent.GetInterface(IID_ISkinMyComboBoxGroup,ASkinMyComboBoxGroupIntf)) then
//  begin
//    Self.Properties.ComboBoxGroup:=TSkinBaseComboBoxGroup(Reader.Parent);
//  end;
//
//end;
//
//procedure TSkinComboBox.RecordControlLangIndex(APrefix: String; ALang: TLang;
//  ACurLang: String);
//begin
//  inherited;
//
//  if Detail<>'' then
//  begin
//    RecordLangIndex(ALang,APrefix+Name+'.Detail',ACurLang,Detail);
//  end;
//
//  if Detail1<>'' then
//  begin
//    RecordLangIndex(ALang,APrefix+Name+'.Detail1',ACurLang,Detail1);
//  end;
//
//  if Self.Prop.HelpText<>'' then
//  begin
//    RecordLangIndex(ALang,APrefix+Name+'.HelpText',ACurLang,Self.Prop.HelpText);
//  end;
//end;

destructor TSkinComboBox.Destroy;
begin
  FreeAndNil(lvPopupItems);
  FreeAndNil(lvMultiSelectedItems);
//  FreeAndNil(edtValue);
//  FreeAndNil(edtValue2);

  FreeAndNil(FItems);
  inherited;
end;

procedure TSkinComboBox.DolvMultiSelectedItemsClickItemDesignerPanelChild(
  Sender: TObject; AItem: TBaseSkinItem;
  AItemDesignerPanel: TSkinItemDesignerPanel; AChild: TChildControl);
var
  I: Integer;
  ASelectedList:TStringList;
begin
  if AChild.Name='btnDelete' then
  begin
    Self.lvMultiSelectedItems.Prop.Items.BeginUpdate;
    try
      FreeAndNil(AItem);
    finally
      Self.lvMultiSelectedItems.Prop.Items.EndUpdate;
    end;
//    lvMultiSelectedItems.Width:=Ceil(lvMultiSelectedItems.Prop.CalcContentWidth);

    ASelectedList:=TStringList.Create;
    try
      for I := 0 to Self.lvMultiSelectedItems.Prop.Items.Count-1 do
      begin
        ASelectedList.Add(Self.lvMultiSelectedItems.Prop.Items[I].Caption);
      end;
      Self.StaticCaption:=ASelectedList.CommaText;
    finally
      FreeAndNil(ASelectedList);
    end;

    if Assigned(FOnChange) then FOnChange(Self);

  end;
end;

procedure TSkinComboBox.DropDown(APopupPoint:TPoint);
var

  ASelectedList:TStringList;
  I: Integer;
  AEditText:string;
  ADropDownCount:Integer;
begin
//  if (FfrmSelectPopup<>nil) and FfrmSelectPopup.IsPopuped then
//  begin
//    FfrmSelectPopup.HidePopup;
//    Exit;
//  end;



//  FfrmSelectPopup.PopupAndFilter(
//                                    //过滤的关键字
//                                    edtSearch.Text,
//                                    //弹出位置
//                                    APopupPoint,
//                                    //弹出窗体的宽度
//                                    670,
//                                    //弹出窗体的高度
//                                    200);



  //弹出下拉框
  if FfrmSelectPopup=nil then
  begin
    FfrmSelectPopup:=CreateSelectPopupForm;
  end;


  lvPopupItems.Parent:=FfrmSelectPopup;
  lvPopupItems.Align:=alClient;
  lvPopupItems.VertScrollBar.Prop.Position:=0;
  lvPopupItems.Prop.MultiSelect:=Self.MultiSelect;


  lvPopupItems.Prop.Items.BeginUpdate;
  try
    lvPopupItems.Prop.Items.Clear;
//    lvPopupItems.Prop.MultiSelect:=True;
//    lvPopupItems.Prop.ItemHeight:=32;
//    lvPopupItems.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';

//    ACompanySizeArray:=TSuperArray.Create('["1-10人","11-50人","51-200人","201-500人","501-1000人","1001-5000人","5001-10000人","超过10001人"]');
    for I := 0 to Self.FItems.Count - 1 do
    begin
      lvPopupItems.Prop.Items.Add.Caption:=FItems[I];
    end;

  finally
    lvPopupItems.Prop.Items.EndUpdate();
  end;


  //替换中文逗号
  AEditText:=Self.Text;
  if Pos('，', AEditText) > 0 then
  begin
    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
  end;

  //设置选中
  ASelectedList:=TStringList.Create;
  lvPopupItems.Prop.Items.BeginUpdate;
  try
    ASelectedList.CommaText:=AEditText;
    for I := 0 to Self.lvPopupItems.Prop.Items.Count-1 do
    begin
      Self.lvPopupItems.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvPopupItems.Prop.Items[i].Caption)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvPopupItems.Prop.Items.EndUpdate;
  end;


  if Self.lvPopupItems.Prop.Items.Count<DropDownCount then
  begin
    ADropDownCount:=Self.lvPopupItems.Prop.Items.Count;
  end
  else
  begin
    ADropDownCount:=DropDownCount;
  end;


  FfrmSelectPopup.Popup(APopupPoint,
                        GetPopupFormWidth,
                        //200
                        ControlSize(ScreenScaleSize(ADropDownCount*Self.lvPopupItems.Prop.ItemHeight))
                        );


end;

function TSkinComboBox.EditGetValue: Variant;
begin
  Result:=Text;
end;

procedure TSkinComboBox.EditMouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Double);
begin

end;

procedure TSkinComboBox.EditMouseMove(Shift: TShiftState; X, Y: Double);
begin

end;

procedure TSkinComboBox.EditMouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Double);
begin

end;

procedure TSkinComboBox.EditSetValue(const AValue: Variant);
begin
  Text:=AValue;
end;

function TSkinComboBox.GetComboBoxProperties: TComboBoxProperties;
begin
  Result:=TComboBoxProperties(Self.FProperties);
end;

function TSkinComboBox.GetIsDropedDown: Boolean;
begin
  Result:=False;
  if (FfrmSelectPopup<>nil) and FfrmSelectPopup.Visible then
  begin
    Result:=True;
  end;

end;

function TSkinComboBox.GetlvMultiSelectedItemsOnNewListItemStyleFrameCacheInit: TNewListItemStyleFrameCacheInitEvent;
begin
  Result:=Self.lvMultiSelectedItems.OnNewListItemStyleFrameCacheInit;
end;

function TSkinComboBox.GetOnlvPopupItemsNewListItemStyleFrameCacheInit: TNewListItemStyleFrameCacheInitEvent;
begin
  Result:=Self.lvPopupItems.OnNewListItemStyleFrameCacheInit;
end;

procedure TSkinComboBox.SetComboBoxProperties(Value: TComboBoxProperties);
begin
  Self.FProperties.Assign(Value);
end;

procedure TSkinComboBox.SetItemIndex(const Value: Integer);
begin
  if FItemIndex<>Value then
  begin
    if (Value>=0) and (Value<FItems.Count) then
    begin
      FItemIndex := Value;
      SetText(FItems[FItemIndex]);
    end
    else
    begin
      FItemIndex:=-1;
      SetText('');
    end;
  end;
end;

procedure TSkinComboBox.SetItems(const Value: TStringList);
begin
  FItems.Assign(Value);
end;

procedure TSkinComboBox.SetlvPopupItemsOnNewListItemStyleFrameCacheInit(
  const Value: TNewListItemStyleFrameCacheInitEvent);
begin
  Self.lvPopupItems.OnNewListItemStyleFrameCacheInit:=Value;
end;

procedure TSkinComboBox.SetOnlvMultiSelectedItemsNewListItemStyleFrameCacheInit(
  const Value: TNewListItemStyleFrameCacheInitEvent);
begin
  Self.lvMultiSelectedItems.OnNewListItemStyleFrameCacheInit:=Value;
end;

procedure TSkinComboBox.SetControlValueByBindItemField(
  const AFieldName: String; const AFieldValue: Variant; ASkinItem: TObject;
  AIsDrawItemInteractiveState: Boolean);
begin
//  Caption:=AFieldValue;
  Self.Prop.FDrawText:=AFieldValue;
end;

//procedure TSkinComboBox.SetControlObjectByBindItemField(const AFieldName: String;
//  const AFieldValue: TObject; ASkinItem: TObject;
//  AIsDrawItemInteractiveState: Boolean);
//begin
//  //有图片
////  if (Self.Prop.Picture.StaticPictureDrawType<>pdtReference) or (Self.Prop.Picture.StaticPictureDrawType<>pdtRefDrawPicture) then
//
//
//  Self.Prop.Icon.StaticPictureDrawType:=pdtReference;
//
//
//  if AFieldValue<>nil then
//  begin
//
//      //是否圆形根据图片控件设置
//      TSkinPicture(AFieldValue).IsClipRound:=Self.Prop.Icon.IsClipRound or TSkinPicture(AFieldValue).IsClipRound;
//
//
//      if (AFieldValue is TBaseDrawPicture) and (TBaseDrawPicture(AFieldValue).PictureDrawType=pdtRefDrawPicture) then
//      begin
//        Self.Prop.Icon.StaticPictureDrawType:=pdtRefDrawPicture;
//        Self.Prop.Icon.StaticRefDrawPicture:=TDrawPicture(AFieldValue);
//      end
//      else if AFieldValue is TBaseDrawPicture then
//      begin
//        Self.Prop.Icon.StaticRefPicture:=TDrawPicture(AFieldValue).CurrentPicture;
//      end
//      else
//      begin
//        Self.Prop.Icon.StaticRefPicture:=TSkinPicture(AFieldValue);
//      end;
//
//  end
//  else
//  begin
//      Self.Prop.Icon.StaticRefPicture:=nil;
//  end;
//end;
//
//procedure TSkinComboBox.SetDetail(const Value:String);
//begin
//  if FDetail<>Value then
//  begin
//    FDetail:=Value;
//    Invalidate;
//  end;
//end;
//
//procedure TSkinComboBox.SetDetail1(const Value:String);
//begin
//  if FDetail1<>Value then
//  begin
//    FDetail1:=Value;
//    Invalidate;
//  end;
//end;
//
//procedure TSkinComboBox.Click;
//begin
//  if Self.GetComboBoxProperties.IsAutoPush then
//  begin
//    Self.GetComboBoxProperties.IsPushed:=Not Self.GetComboBoxProperties.IsPushed;
//    inherited;
//  end
//  else
//  begin
//    inherited;
//  end;
//end;
//
//function TSkinComboBox.GetDetail:String;
//begin
//  Result:=FDetail;
//end;
//
//function TSkinComboBox.GetDetail1:String;
//begin
//  Result:=FDetail1;
//end;
//
//procedure TSkinComboBox.DoCustomSkinMaterialChange(Sender: TObject);
//begin
//  //自动设置尺寸
//  if not (csReading in Self.ComponentState)
//    and not (csLoading in Self.ComponentState) then
//  begin
//    Self.GetComboBoxProperties.AdjustAutoSizeBounds;
//  end;
//
//  Inherited;
//end;

procedure TSkinComboBox.BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
begin
  //为什么要Caption,
//  StaticCaption:=AText;
  Self.Prop.FDrawText:=AText;
end;

//function TSkinComboBox.GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
//                            var AErrorMessage:String): Variant;
//begin
////  Result:=BoolToStr(Self.Prop.Checked);
////begin
////  //显示不出
////  Result:=Ord(Self.Prop.Checked);
//
//
////  //wn
////  if IsSelectComboBox then
////  begin
//
//  if Setting.search_operator<>'' then
//  begin
//    if Self.Prop.IsPushed then
//    begin
//      Result:=Value;
//    end
//    else
//    begin
//      Result:='';
//    end;
//  end
//  else
//  begin
////    //内部ID
//    Result:=Value;
//  end;
//
////  end
////  else
////  begin
////    Result:=Value;
////  end;
//
//
//
//end;
//
//procedure TSkinComboBox.SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;AImageServerUrl:String;AValue:Variant;AValueCaption:String;
//                            //要设置多个值,整个字段的记录
//                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue);
//begin
////  if (ASetting.options_caption_field_name='') or (AGetDataIntfResultFieldValueIntf=nil) then
////  begin
////    Text:=AValue;
////    Value:='';
////  end
////  else
////  begin
//
//
//  if IsSelectComboBox then
//  begin
//    //用于保存选择后的内部ID
//    //Value:=AValue;
//
//
//
//    Caption:=AValueCaption;
//    Value:=AValue;
//  end
//  else
//  begin
////    //标题
////    Text:=AValue;//AValueCaption;//AGetDataIntfResultFieldValueIntf.GetFieldValue(ASetting.options_caption_field_name);
//
//    Value:=AValue;
//  end;
//
//
//
////  end;
////  if AValue<>'' then
////  begin
////    Self.Prop.Checked:=StrToBool(AValue);
////  end
////  else
////  begin
////    Self.Prop.Checked:=False;
////  end;
//end;


initialization

  RegisterClasses([TSkinComboBox]);



  //组合框
  RegisterSkinControlStyle('SkinComboBox',TSkinComboBoxDefaultType,TSkinComboBoxDefaultMaterial,TComboBoxProperties,Const_Default_ComponentType,True);


end.

