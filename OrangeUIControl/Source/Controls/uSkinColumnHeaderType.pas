//convert pas to utf8 by ¥

/// <summary>
///   <para>
///     虚拟表格
///   </para>
///   <para>
///     Virtual Grid
///   </para>
/// </summary>
unit uSkinColumnHeaderType;

interface
{$I FrameWork.inc}

{$I Version.inc}


uses
  Classes,
  SysUtils,
  Types,
  DateUtils,
  Math,

  {$IFDEF VCL}
  Messages,
  ExtCtrls,
  Controls,
  StdCtrls,
  Dialogs,
  Forms,
  //{$IFDEF MSWINDOWS}
  //uSkinWindowsEdit,
  //{$ENDIF}
  {$ENDIF}
  {$IFDEF FMX}
  UITypes,
  FMX.Types,
  FMX.Controls,
  FMX.Dialogs,

  FMX.Edit,
  FMX.ListBox,
  uSkinFireMonkeyEdit,
  {$ENDIF}


  uFuncCommon,
  uSkinAnimator,
  uBaseList,
  uBinaryObjectList,
  uBaseLog,
  uSkinItems,
  uSkinListLayouts,
  uDrawParam,
  uGraphicCommon,
  uSkinBufferBitmap,
  uDrawCanvas,
  uFileCommon,
  uComponentType,
  uDrawEngine,
  uBinaryTreeDoc,
  uDrawPicture,
  uSkinMaterial,
  uSkinRegManager,
  uDrawTextParam,
  uDrawLineParam,
  uDrawRectParam,
  uDrawPathParam,
  uSkinImageList,
  uSkinCustomListType,
  uSkinCheckBoxType,
  uSkinVirtualListType,
  uSkinEditType,
  uBasePathData,
  uSkinControlGestureManager,
  uSkinScrollControlType,
//  uSkinCustomListType,
  uSkinItemDesignerPanelType,
  {$IFDEF FMX}
  uSkinFireMonkeyItemDesignerPanel,
  {$ENDIF}

  uSkinListBoxType,

  uDrawPictureParam;



const
  IID_ISkinColumnHeader:TGUID='{D3D65F7C-398C-42DA-B745-B095EF372A4B}';








type
  TSkinColumnHeader=class;
  TSkinColumnHeaderClass=class of TSkinColumnHeader;





  //TSkinColumnHeaderItems=class;
  //TSkinColumnHeaderItemsClass=class of TSkinColumnHeaderItems;
  TColumnHeaderProperties=class;
  //TSkinColumnHeaderLayoutsManager=class;

  /// <summary>
  ///   <para>
  ///     列表框接口
  ///   </para>
  ///   <para>
  ///     Interface of ColumnHeader
  ///   </para>
  /// </summary>
  ISkinColumnHeader=interface//(ISkinScrollControl)
  ['{D3D65F7C-398C-42DA-B745-B095EF372A4B}']


    function GetColumnHeaderProperties:TColumnHeaderProperties;
    property Properties:TColumnHeaderProperties read GetColumnHeaderProperties;
    property Prop:TColumnHeaderProperties read GetColumnHeaderProperties;
  end;



  /// <summary>
  ///   <para>
  ///     列表项逻辑
  ///   </para>
  ///   <para>
  ///     ListItem Logic
  ///   </para>
  /// </summary>
  TSkinColumnHeaderLayoutsManager=class(TSkinVirtualListLayoutsManager)
  public
    FIsAddAutoFitWidth:Boolean;
    function CalcItemWidth(AItem: ISkinItem): Double;override;
  end;


  /// <summary>
  ///   <para>
  ///     列表框属性
  ///   </para>
  ///   <para>
  ///     Properties of ColumnHeader
  ///   </para>
  /// </summary>
  TColumnHeaderProperties=class(TVirtualListProperties)
  protected
//      FSkinVirutalGridIntf:ISkinVirtualGrid;
    FSkinColumnHeaderIntf:ISkinColumnHeader;
//    function GetItems: TSkinVirtualGridColumns;
//    procedure SetItems(const Value: TSkinVirtualGridColumns);
  //protected
  //  function GetMouseDownItem: TSkinItem;
  //  function GetMouseOverItem: TSkinItem;
  //  function GetSelectedItem: TSkinItem;
  //  function GetPanDragItem: TSkinItem;
  //
  //  procedure SetMouseDownItem(Value: TSkinItem);
  //  procedure SetMouseOverItem(Value: TSkinItem);
  //  procedure SetSelectedItem(Value: TSkinItem);
  //  procedure SetPanDragItem(Value: TSkinItem);
  protected
    ////列表逻辑
    //function GetListLayoutsManager: TSkinColumnHeaderLayoutsManager;
    //获取列表项列表的类
    function GetItemsClass:TBaseSkinItemsClass;override;
    //获取列表逻辑类
    function GetCustomListLayoutsManagerClass:TSkinCustomListLayoutsManagerClass;override;

protected
  //点击列表项,TreeView需要扩展它来实现自动展开
  procedure DoClickItem(AItem:TBaseSkinItem;X:Double;Y:Double);override;
  protected
    //获取分类名称
    function GetComponentClassify:String;override;
  protected
  public
    constructor Create(ASkinControl:TControl);override;
  public

    /// <summary>
    ///   <para>
    ///     列表项布局管理者
    ///   </para>
    ///   <para>
    ///     ??
    ///   </para>
    /// </summary>
    //property ListLayoutsManager:TSkinColumnHeaderLayoutsManager read GetListLayoutsManager;
//
//        /// <summary>
//        ///   <para>
//        ///     获取当前交互的列表项
//        ///   </para>
//        ///   <para>
//        ///     Get interactive ListItem
//        ///   </para>
//        /// </summary>
//        function GetInteractiveItem:TSkinItem;
//        /// <summary>
//        ///   <para>
//        ///     获取当前交互的列表项
//        ///   </para>
//        ///   <para>
//        ///     Get interactive ListItem
//        ///   </para>
//        /// </summary>
//        property InteractiveItem:TSkinItem read GetInteractiveItem;
//        /// <summary>
//        ///   <para>
//        ///     选中的列表项
//        ///   </para>
//        ///   <para>
//        ///     Selected ListItem
//        ///   </para>
//        /// </summary>
//        property SelectedItem:TSkinItem read GetSelectedItem write SetSelectedItem;
//
//        /// <summary>
//        ///   <para>
//        ///     按下的列表项
//        ///   </para>
//        ///   <para>
//        ///     Pressed ListeItem
//        ///   </para>
//        /// </summary>
//        property MouseDownItem:TSkinItem read GetMouseDownItem write SetMouseDownItem;
//
//        /// <summary>
//        ///   <para>
//        ///     停靠的列表项
//        ///   </para>
//        ///   <para>
//        ///     Hovered ListItem
//        ///   </para>
//        /// </summary>
//        property MouseOverItem:TSkinItem read GetMouseOverItem write SetMouseOverItem;
//
//
//        /// <summary>
//        ///   <para>
//        ///     平拖的列表项
//        ///   </para>
//        ///   <para>
//        ///     PanDrag ListItem
//        ///   </para>
//        /// </summary>
//        property PanDragItem:TSkinItem read GetPanDragItem write SetPanDragItem;


  published

    /// <summary>
    ///   <para>
    ///     列表项列表
    ///   </para>
    ///   <para>
    ///     ListItem List
    ///   </para>
    /// </summary>
//    property Items:TSkinVirtualGridColumns read GetItems write SetItems;

    /// <summary>
    ///   <para>
    ///     是否启用居中选择模式
    ///   </para>
    ///   <para>
    ///     Center selected pattern
    ///   </para>
    /// </summary>
    //property IsEnabledCenterItemSelectMode;
  end;



  /// <summary>
  ///   <para>
  ///     列表项列表
  ///   </para>
  ///   <para>
  ///     ListItem List
  ///   </para>
  /// </summary>
//  TSkinColumnHeaderItems=class(TSkinItems)
//  private
//    function GetItem(Index: Integer): TSkinColumnHeaderItem;
//    procedure SetItem(Index: Integer; const Value: TSkinColumnHeaderItem);
//  protected
////    function CreateBinaryObject(const AClassName:String=''):TInterfacedPersistent;override;
////    procedure InitSkinItemClass;override;
//    function GetSkinItemClass:TBaseSkinItemClass;override;
//  public
//    function Add:TSkinColumnHeaderItem;overload;
//    function Insert(Index:Integer):TSkinColumnHeaderItem;
//    property Items[Index:Integer]:TSkinColumnHeaderItem read GetItem write SetItem;default;
//  end;









  /// <summary>
  ///   <para>
  ///     列表框素材基类
  ///   </para>
  ///   <para>
  ///     Base class of ColumnHeader material
  ///   </para>
  /// </summary>
  {$I ComponentPlatformsAttribute.inc}
  TSkinColumnHeaderDefaultMaterial=class(TSkinVirtualListDefaultMaterial)
//  private
//    //展开图片
//    FSortStateAscPicture:TDrawPicture;
//    FSortStateDescPicture:TDrawPicture;
//    //展开图片绘制参数
//    FDrawSortStatePictureParam:TDrawPictureParam;
//  private
//    procedure SetDrawSortStatePictureParam(const Value: TDrawPictureParam);
//    procedure SetSortStateAscPicture(const Value: TDrawPicture);
//    procedure SetSortStateDescPicture(const Value: TDrawPicture);
//  public
//    constructor Create(AOwner:TComponent);override;
//    destructor Destroy;override;
//  published
//    property SortStateAscPicture:TDrawPicture read FSortStateAscPicture write SetSortStateAscPicture;
//    property SortStateDescPicture:TDrawPicture read FSortStateDescPicture write SetSortStateDescPicture;
//    property DrawSortStatePictureParam:TDrawPictureParam read FDrawSortStatePictureParam write SetDrawSortStatePictureParam;
  end;

  TSkinColumnHeaderDefaultType=class(TSkinVirtualListDefaultType)
  protected
    FSkinColumnHeaderIntf:ISkinColumnHeader;
  protected
    function GetGrid:TControl;
    //绑定对象
    function CustomBind(ASkinControl:TControl):Boolean;override;
    //解除绑定
    procedure CustomUnBind;override;
    //决定列表项所使用的素材,因为有的素材在Grid中设置,所以需要判断一下
    function DecideItemMaterial(AItem:TBaseSkinItem;ASkinMaterial:TSkinCustomListDefaultMaterial): TBaseSkinListItemMaterial;override;
    //绘制内容,要绘制排序的顺度状态
    function CustomDrawItemContent(ACanvas: TDrawCanvas;
                                    AItemIndex:Integer;
                                    AItem:TBaseSkinItem;
                                    AItemDrawRect:TRectF;
                                    ASkinMaterial:TSkinCustomListDefaultMaterial;
                                    const ADrawRect: TRectF;
                                    ACustomListPaintData:TPaintData;
                                    ASkinItemMaterial:TBaseSkinListItemMaterial;
                                    AItemEffectStates:TDPEffectStates;
                                    AIsDrawItemInteractiveState:Boolean
                                    ): Boolean;override;

    procedure SizeChanged;override;
  protected
    function GetSkinMaterial:TSkinColumnHeaderDefaultMaterial;
  end;


  {$I ComponentPlatformsAttribute.inc}
  TSkinColumnHeader=class(TSkinVirtualList,ISkinColumnHeader)
  private

    function GetColumnHeaderProperties:TColumnHeaderProperties;
    procedure SetColumnHeaderProperties(Value:TColumnHeaderProperties);
  protected
    //获取控件属性类
    function GetPropertiesClassType:TPropertiesClassType;override;
  public
    function SelfOwnMaterialToDefault:TSkinColumnHeaderDefaultMaterial;
    function CurrentUseMaterialToDefault:TSkinColumnHeaderDefaultMaterial;
    function Material:TSkinColumnHeaderDefaultMaterial;

    property Prop:TColumnHeaderProperties read GetColumnHeaderProperties write SetColumnHeaderProperties;
  published
    //属性(必须在VertScrollBar和HorzScrollBar之前)
    property Properties:TColumnHeaderProperties read GetColumnHeaderProperties write SetColumnHeaderProperties;

  end;























implementation

uses
  uSkinVirtualGridType;


{ TColumnHeaderProperties }


constructor TColumnHeaderProperties.Create(ASkinControl:TControl);
begin
  inherited Create(ASkinControl);
  if Not ASkinControl.GetInterface(IID_ISkinColumnHeader,Self.FSkinColumnHeaderIntf) then
  begin
    ShowException('This Component Do not Support ISkinColumnHeader Interface');
  end
  else
  begin
  end;
//  if Not ASkinControl.GetInterface(IID_ISkinColumnHeader,Self.FSkinColumnHeaderIntf) then
//  begin
//    ShowException('This Component Do not Support ISkinColumnHeader Interface');
//  end
//  else
//  begin
//  end;
end;

procedure TColumnHeaderProperties.DoClickItem(AItem: TBaseSkinItem; X,
  Y: Double);
begin
  inherited;

//  //点击表头
//  if Assigned(TSkinVirtualGrid(Self.FSkinControl.Owner).FOnClickColumn) then
//  begin
//    TSkinVirtualGrid(Self.FSkinControl.Owner).FOnClickColumn(Self.FSkinControl.Owner,TSkinVirtualGridColumn(AItem));
//  end;

  //自动排序
  TSkinVirtualGrid(Self.FSkinControl.Owner).Prop.DoClickColumn(TSkinVirtualGridColumn(AItem),X,Y);

end;

function TColumnHeaderProperties.GetComponentClassify: String;
begin
  Result:='SkinColumnHeader';
end;

//function TColumnHeaderProperties.GetInteractiveItem: TSkinItem;
//begin
//  Result:=TSkinItem(Inherited InteractiveItem);
//end;

//function TColumnHeaderProperties.GetItems: TSkinVirtualGridColumns;
//begin
//  Result:=TSkinVirtualGridColumns(FItems);
//end;

function TColumnHeaderProperties.GetItemsClass: TBaseSkinItemsClass;
begin
  //Result:=TSkinVirtualGridColumns;
  Result:=TSkinVirtualGrid(FSkinControl.Owner).GetColumnsClass;
end;

//function TColumnHeaderProperties.GetListLayoutsManager: TSkinColumnHeaderLayoutsManager;
//begin
//  Result:=TSkinColumnHeaderLayoutsManager(Self.FListLayoutsManager);
//end;

function TColumnHeaderProperties.GetCustomListLayoutsManagerClass: TSkinCustomListLayoutsManagerClass;
begin
  Result:=TSkinColumnHeaderLayoutsManager;
end;

//procedure TColumnHeaderProperties.SetItems(const Value: TSkinVirtualGridColumns);
//begin
//  Inherited SetItems(Value);
//end;

//function TColumnHeaderProperties.GetMouseDownItem: TSkinItem;
//begin
//  Result:=TSkinItem(Inherited MouseDownItem);
//end;
//
//function TColumnHeaderProperties.GetMouseOverItem: TSkinItem;
//begin
//  Result:=TSkinItem(Inherited MouseOverItem);
//end;
//
//function TColumnHeaderProperties.GetPanDragItem: TSkinItem;
//begin
//  Result:=TSkinItem(Inherited PanDragItem);
//end;
//
//function TColumnHeaderProperties.GetSelectedItem: TSkinItem;
//begin
//  Result:=TSkinItem(Inherited SelectedItem);
//end;
//
//procedure TColumnHeaderProperties.SetMouseDownItem(Value: TSkinItem);
//begin
//  Inherited MouseDownItem:=Value;
//end;
//
//procedure TColumnHeaderProperties.SetMouseOverItem(Value: TSkinItem);
//begin
//  Inherited MouseOverItem:=Value;
//end;
//
//procedure TColumnHeaderProperties.SetSelectedItem(Value: TSkinItem);
//begin
//  Inherited SelectedItem:=Value;
//end;
//
//procedure TColumnHeaderProperties.SetPanDragItem(Value: TSkinItem);
//begin
//  Inherited PanDragItem:=Value;
//end;

{ TSkinColumnHeaderDefaultType }

function TSkinColumnHeaderDefaultType.CustomBind(ASkinControl:TControl):Boolean;
begin
  if Inherited CustomBind(ASkinControl) then
  begin
    if ASkinControl.GetInterface(IID_ISkinColumnHeader,Self.FSkinColumnHeaderIntf) then
    begin
      Result:=True;
    end
    else
    begin
      ShowException('This Component Do not Support ISkinColumnHeader Interface');
    end;
  end;
end;

function TSkinColumnHeaderDefaultType.CustomDrawItemContent(
  ACanvas: TDrawCanvas; AItemIndex: Integer; AItem: TBaseSkinItem;
  AItemDrawRect: TRectF; ASkinMaterial: TSkinCustomListDefaultMaterial;
  const ADrawRect: TRectF; ACustomListPaintData: TPaintData;
  ASkinItemMaterial: TBaseSkinListItemMaterial;
  AItemEffectStates: TDPEffectStates;
  AIsDrawItemInteractiveState: Boolean): Boolean;
var
  ASortStatePicture:TDrawPicture;
//  ASortStatePath:TPathActionCollection;
  AGridMaterial:TSkinVirtualGridDefaultMaterial;
begin
  Inherited;

  //绘制排序状态
  ASortStatePicture:=nil;
//  ASortStatePath:=nil;
  if GetGrid<>nil then
  begin
    AGridMaterial:=TSkinVirtualGrid(GetGrid).CurrentUseMaterialToDefault;
    if TSkinVirtualGridColumn(AItem).FSortState=sissAsc then
    begin
      ASortStatePicture:=AGridMaterial.SortStateAscPicture;
//      ASortStatePath:=AGridMaterial.SortStateAscPath;
    end
    else
    if TSkinVirtualGridColumn(AItem).SortState=sissDesc then
    begin
      ASortStatePicture:=AGridMaterial.SortStateDescPicture;
//      ASortStatePath:=AGridMaterial.SortStateDescPath;
    end;

    if ASortStatePicture<>nil then
    begin
      ACanvas.DrawPicture(AGridMaterial.DrawSortStatePictureParam,ASortStatePicture,AItemDrawRect);
    end;

//    if ASortStatePath<>nil then
//    begin
//      //自己用路径来画三角形,它有上下两个三角形,一个灰色，一个其他颜色
//      ACanvas.DrawPath(AGridMaterial.DrawSortStatePathParam,AItemDrawRect,ASortStatePath);
//    end;

  end;

end;

procedure TSkinColumnHeaderDefaultType.CustomUnBind;
begin
  Inherited CustomUnBind;
  Self.FSkinColumnHeaderIntf:=nil;
end;

function TSkinColumnHeaderDefaultType.DecideItemMaterial(AItem: TBaseSkinItem;ASkinMaterial: TSkinCustomListDefaultMaterial): TBaseSkinListItemMaterial;
var
  AColumn:TSkinVirtualGridColumn;
begin
  if AItem is TSkinVirtualGridColumn then
  begin
    AColumn:=TSkinVirtualGridColumn(AItem);
    if AColumn.IsUseDefaultGridColumnMaterial then
    begin
      //使用表格素材中的DrawColumnMaterial
      Result:=TSkinVirtualGridDefaultMaterial(TSkinVirtualGrid(GetGrid).CurrentUseMaterial).DrawColumnMaterial;
    end
    else
    begin
      //使用Column自己的FMaterial
      Result:=AColumn.SelfOwnMaterial;
    end;

  end;

end;

function TSkinColumnHeaderDefaultType.GetGrid: TControl;
begin
  Result:=TSkinVirtualGrid(Self.FSkinControl.Owner);
end;

function TSkinColumnHeaderDefaultType.GetSkinMaterial: TSkinColumnHeaderDefaultMaterial;
begin
  if Self.FSkinControlIntf.GetCurrentUseMaterial<>nil then
  begin
    Result:=TSkinColumnHeaderDefaultMaterial(Self.FSkinControlIntf.GetCurrentUseMaterial);
  end
  else
  begin
    Result:=nil;
  end;
end;
procedure TSkinColumnHeaderDefaultType.SizeChanged;
begin
  inherited;

  //重新计算下需要自动适应的列的宽度
  TSkinVirtualGrid(GetGrid).Prop.SetColumnsAutoFitControlWidth;

end;

//
//{ TSkinColumnHeaderItems }
//
//
//function TSkinColumnHeaderItems.Add: TSkinColumnHeaderItem;
//begin
//  Result:=TSkinColumnHeaderItem(Inherited Add);
//end;
//
////procedure TSkinColumnHeaderItems.InitSkinItemClass;
////begin
////  SkinItemClass:=TSkinColumnHeaderItem;
////end;
//
//function TSkinColumnHeaderItems.Insert(Index:Integer): TSkinColumnHeaderItem;
//begin
//  Result:=TSkinColumnHeaderItem(Inherited Insert(Index));
//end;
//
//procedure TSkinColumnHeaderItems.SetItem(Index: Integer;const Value: TSkinColumnHeaderItem);
//begin
//  Inherited Items[Index]:=Value;
//end;
//
////function TSkinColumnHeaderItems.CreateBinaryObject(const AClassName:String=''): TInterfacedPersistent;
////begin
////  Result:=SkinItemClass.Create;//(Self);
////end;
//
//function TSkinColumnHeaderItems.GetItem(Index: Integer): TSkinColumnHeaderItem;
//begin
//  Result:=TSkinColumnHeaderItem(Inherited Items[Index]);
//end;
//
//function TSkinColumnHeaderItems.GetSkinItemClass: TBaseSkinItemClass;
//begin
//  Result:=TSkinColumnHeaderItem;
//end;

{ TSkinColumnHeader }

function TSkinColumnHeader.Material:TSkinColumnHeaderDefaultMaterial;
begin
  Result:=TSkinColumnHeaderDefaultMaterial(SelfOwnMaterial);
end;

function TSkinColumnHeader.SelfOwnMaterialToDefault:TSkinColumnHeaderDefaultMaterial;
begin
  Result:=TSkinColumnHeaderDefaultMaterial(SelfOwnMaterial);
end;

function TSkinColumnHeader.CurrentUseMaterialToDefault:TSkinColumnHeaderDefaultMaterial;
begin
  Result:=TSkinColumnHeaderDefaultMaterial(CurrentUseMaterial);
end;

function TSkinColumnHeader.GetPropertiesClassType: TPropertiesClassType;
begin
  Result:=TColumnHeaderProperties;
end;

function TSkinColumnHeader.GetColumnHeaderProperties: TColumnHeaderProperties;
begin
  Result:=TColumnHeaderProperties(Self.FProperties);
end;

procedure TSkinColumnHeader.SetColumnHeaderProperties(Value: TColumnHeaderProperties);
begin
  Self.FProperties.Assign(Value);
end;







{ TSkinColumnHeaderDefaultMaterial }

//constructor TSkinColumnHeaderDefaultMaterial.Create(AOwner: TComponent);
//begin
//  inherited;
//
//
//  FSortStateAscPicture:=CreateDrawPicture('SortStateDescPicture','升序图片');
//
//  FSortStateDescPicture:=CreateDrawPicture('SortStateDescPicture','降序图片');
//
//  FDrawSortStatePictureParam:=CreateDrawPictureParam('DrawItemAccessoryPictureParam','展开图片绘制参数');
//  FDrawSortStatePictureParam.IsControlParam:=False;
//
//
//end;
//
//destructor TSkinColumnHeaderDefaultMaterial.Destroy;
//begin
//
//  FreeAndNil(FSortStateAscPicture);
//  FreeAndNil(FSortStateDescPicture);
//
//  FreeAndNil(FDrawSortStatePictureParam);
//
//  inherited;
//end;
//
//procedure TSkinColumnHeaderDefaultMaterial.SetDrawSortStatePictureParam(
//  const Value: TDrawPictureParam);
//begin
//  FDrawSortStatePictureParam.Assign(Value);
//end;
//
//procedure TSkinColumnHeaderDefaultMaterial.SetSortStateAscPicture(
//  const Value: TDrawPicture);
//begin
//  FSortStateAscPicture.Assign(Value);
//end;
//
//procedure TSkinColumnHeaderDefaultMaterial.SetSortStateDescPicture(
//  const Value: TDrawPicture);
//begin
//  FSortStateDescPicture.Assign(Value);
//end;

{ TSkinColumnHeaderLayoutsManager }

function TSkinColumnHeaderLayoutsManager.CalcItemWidth(AItem: ISkinItem): Double;
begin
  Result:=Inherited;
  //if AItem is TSkinVirtualGridColumn then
  //begin
  //  if FIsAddAutoFitWidth and TSkinVirtualGridColumn(AItem).FIsAutoFitControlWidth then
  //  begin
  //    Result:=Result+TSkinVirtualGridColumn(AItem).FAutoFitWidth;//在Lazarus下面莫明奇妙会很大的值
  //    uBaseLog.OutputDebugString(FloatToStr(TSkinVirtualGridColumn(AItem).FAutoFitWidth));
  //  end;
  //end;

end;

initialization
  RegisterClasses([TSkinColumnHeader]);

  RegisterSkinControlStyle('SkinColumnHeader',TSkinColumnHeaderDefaultType,TSkinColumnHeaderDefaultMaterial,TColumnHeaderProperties,Const_Default_ComponentType,True);


end.


