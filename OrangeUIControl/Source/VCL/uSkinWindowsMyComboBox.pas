//convert pas to utf8 by ¥
unit uSkinWindowsMyComboBox;

//{$I FrameWork.inc}
//
//{$I Source\Controls\Windows\WinControl.inc}
//
//{$I Source\Controls\uSkinPanel_Impl_Code.inc}
//


interface
{$I FrameWork.inc}


uses
  Classes,
  SysUtils,

  Forms,
  Messages,
  Windows,
  Controls,
  uBaseSkinControl,
  uSkinWindowsControl,
  uSkinWindowsEdit,
  uSkinListViewType,
  uSkinSelectPopupForm,
  Types,
  uSkinComboBoxType,
  uSkinCustomListType,
  uSkinVirtualListType,
  uSkinItemDesignerPanelType,
//  uSkinListViewType,
  StdCtrls,


//  {$IFDEF SKIN_SUPEROBJECT}
  uSkinSuperObject,
//  {$ELSE}
//  XSuperObject,
//  XSuperJson,
//  {$ENDIF}


  uLang,
  uSkinItems,
  uFuncCommon,
  uBaseLog,
  uBaseList,
  uDrawParam,
  uBasePageStructure,
  uSkinButtonType,
  uGraphicCommon,
  uSkinListLayouts,
  uSkinMaterial,
  uBinaryTreeDoc,
  uSkinBufferBitmap,
  uDrawCanvas,
  uSkinPicture,
  uComponentType,
  uDrawEngine,
  uDrawPicture,
  uSkinImageList,
  uDrawTextParam,
  uDrawRectParam,
  uSkinRegManager,
  uDrawPictureParam;


type
  {$I ComponentPlatformsAttribute.inc}
  TSkinWinMyComboBox=class(TBaseSkinControl,
                            ISkinComboBox//,
//                        IBindSkinItemTextControl,
//                        IBindSkinItemValueControl,
//                        IBindSkinItemObjectControl,
//                        ISkinItem
                        )
  private
    FItems: TStringList;
    FItemIndex: Integer;
//    FDetail:String;
//    FDetail1:String;
//    procedure SetDetail(const Value:String);
//    procedure SetDetail1(const Value:String);
    function GetComboBoxProperties:TComboBoxProperties;
    procedure SetComboBoxProperties(Value:TComboBoxProperties);
    procedure SetItems(const Value: TStringList);
    procedure lvDataClickItem(AItem:TSkinItem);virtual;
    procedure lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);virtual;
    procedure lvDataPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);virtual;
    procedure SetItemIndex(const Value: Integer);
  protected
    function GetText:String;
    procedure SetText(const Value: String);
//    function GetDetail:String;
//    function GetDetail1:String;
    //获取控件属性类
    function GetPropertiesClassType:TPropertiesClassType;override;
//    //皮肤素材更改通知事件
//    procedure DoCustomSkinMaterialChange(Sender: TObject);override;
//  protected
//    procedure ReadState(Reader: TReader); override;
//  protected
//    FItemRect:TRectF;
//    FItemDrawRect:TRectF;
//
//    FSkinListIntf:ISkinList;
//    //层级
//    function GetLevel:Integer;
//    function GetWidth:Double;
//    function GetHeight:Double;
//    function GetSelected:Boolean;
//    function GetObject:TObject;
//    function GetItemRect:TRectF;
//    procedure SetItemRect(Value:TRectF);
//    function GetItemDrawRect:TRectF;
//    procedure SetItemDrawRect(Value:TRectF);
//    function GetIsRowEnd:Boolean;
//    function GetThisRowItemCount:Integer;
//
//    procedure SetSkinListIntf(ASkinListIntf:ISkinList);
//    function GetListLayoutsManager:TSkinListLayoutsManager;
//    procedure ClearItemRect;
//
//    //鼠标是否在Item里面
//    function PtInItem(APoint:TPointF):Boolean;
//  protected
//    procedure BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
//    procedure SetControlValueByBindItemField(const AFieldName:String;
//                                              const AFieldValue:Variant;
//                                              ASkinItem:TObject;
//                                              AIsDrawItemInteractiveState:Boolean);
//    procedure SetControlObjectByBindItemField(const AFieldName:String;
//                                              const AFieldValue:TObject;
//                                              ASkinItem:TObject;
//                                              AIsDrawItemInteractiveState:Boolean);
  protected
//    function lvData:TSkinWinListView;virtual;
  public
    lvData: TSkinWinListView;
    edtValue: TSkinWinEdit;
    edtValue2: TEdit;
    FfrmSelectPopup:TfrmSkinSelectPopup;
    DropDownCount:Integer;
    function GetPopupFormWidth:Integer;virtual;
    function CreateSelectPopupForm:TfrmSkinSelectPopup;virtual;
//    Value:Variant;
//    //是不是选择性的按钮
//    //选择性的按钮,Caption是值的标题,value存值
//    //非选择性的按钮,Caption就是FieldCaption
//    IsSelectComboBox:Boolean;
//    Setting:TFieldControlSetting;
//    //针对页面框架的控件接口
//    function LoadFromFieldControlSetting(ASetting:TFieldControlSetting;AFieldControlSettingMap:TObject):Boolean;override;
//    //获取与设置自定义属性
//    function GetPropJsonStr:String;override;
//    procedure SetPropJsonStr(AJsonStr:String);override;
//    //获取提交的值
//    function GetPostValue(ASetting:TFieldControlSetting;
//                            APageDataDir:String;
//                            ASetRecordFieldValueIntf:ISetRecordFieldValue;
//                            var AErrorMessage:String):Variant;override;
//    //设置值
//    procedure SetControlValue(ASetting:TFieldControlSetting;
//                            APageDataDir:String;
//                            AImageServerUrl:String;
//                            AValue:Variant;
//                            AValueCaption:String;
//                            //要设置多个值,整个字段的记录
//                            AGetDataIntfResultFieldValueIntf:IGetDataIntfResultFieldValue);override;
//  public
//    //在点击事件中设置是否勾选属性
//    procedure Click;override;
//  public
//    //记录多语言的索引
//    procedure RecordControlLangIndex(APrefix:String;ALang:TLang;ACurLang:String);override;
//    //翻译
//    procedure TranslateControlLang(APrefix:String;ALang:TLang;ACurLang:String);override;
  public
    function SelfOwnMaterialToDefault:TSkinComboBoxDefaultMaterial;
    function CurrentUseMaterialToDefault:TSkinComboBoxDefaultMaterial;
    function Material:TSkinComboBoxDefaultMaterial;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    property Prop:TComboBoxProperties read GetComboBoxProperties write SetComboBoxProperties;
  public
    procedure Click;override;
    //这个列表项是否可以被添加到Text
    function IsItemCanAddToText(AItem:TSkinItem):Boolean;virtual;

    //function GetSelectedTextArray:ISuperArray;virtual;
    function GetSelectedCaptions:String;virtual;
    function GetSelectedNames:String;virtual;

    property Text:String read GetText write SetText;

    //function GetSelectedIndexArray:ISuperArray;

  published
    //动态
//    property Action;
    property ItemIndex:Integer read FItemIndex write SetItemIndex;
    property Items:TStringList read FItems write SetItems;
    //标题
//    property Caption;
//    property Detail:String read FDetail write SetDetail;
//    property Detail1:String read FDetail1 write SetDetail1;
//    property Text;
    //点击事件
    property OnClick;
    //双击事件
    property OnDblClick;
    //属性
    property Properties:TComboBoxProperties read GetComboBoxProperties write SetComboBoxProperties;

  end;


implementation


{ TSkinWinMyComboBox }

function TSkinWinMyComboBox.GetPopupFormWidth: Integer;
begin
  Result:=Width;
//  if FPopupFormWidth>0 then
//  begin
//    Result:=FPopupFormWidth;
//  end;

end;

//function TSkinWinMyComboBox.GetText: String;
//begin
////  Result:=False;
//end;

function TSkinWinMyComboBox.GetSelectedCaptions: String;
var
  I:Integer;
  ASelectedList:TStringList;
  AEditText:string;
begin

  //替换中文逗号
  AEditText:=Self.edtValue.Text;
  if Pos('，', AEditText) > 0 then
  begin
    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
  end;

  //设置选中
  ASelectedList:=TStringList.Create;
  Self.lvData.Prop.Items.BeginUpdate;
  try
    ASelectedList.CommaText:=AEditText;
    for I := 0 to Self.lvData.Prop.Items.Count-1 do
    begin
      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Caption)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvData.Prop.Items.EndUpdate;
  end;

  Result:='';
  for I:=0 to Self.lvData.Prop.Items.Count-1 do
  begin
    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
    begin
      if Result<>'' then
      begin
        Result:=Result+',';
      end;
      Result:=Result+Self.lvData.Prop.Items[I].Caption;
    end;
  end;

end;

function TSkinWinMyComboBox.GetSelectedNames: String;
var
  I:Integer;
  ASelectedList:TStringList;
  AEditText:string;
begin

  //替换中文逗号
  AEditText:=Self.edtValue.Text;
  if Pos('，', AEditText) > 0 then
  begin
    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
  end;

  //设置选中
  ASelectedList:=TStringList.Create;
  Self.lvData.Prop.Items.BeginUpdate;
  try
    ASelectedList.CommaText:=AEditText;
    for I := 0 to Self.lvData.Prop.Items.Count-1 do
    begin
      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Caption)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvData.Prop.Items.EndUpdate;
  end;

  Result:='';
  for I:=0 to Self.lvData.Prop.Items.Count-1 do
  begin
    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
    begin
      if Result<>'' then
      begin
        Result:=Result+',';
      end;
      Result:=Result+Self.lvData.Prop.Items[I].Name;
    end;
  end;

end;

//function TSkinWinMyComboBox.GetSelectedTextArray: ISuperArray;
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
//  Self.lvData.Prop.Items.BeginUpdate;
//  try
//    ASelectedList.CommaText:=AEditText;
//    for I := 0 to Self.lvData.Prop.Items.Count-1 do
//    begin
//      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Caption)<>-1);
//    end;
//  finally
//    FreeAndNil(ASelectedList);
//    Self.lvData.Prop.Items.EndUpdate;
//  end;
//
//  Result:=SA();//TSuperArray.Create;
//  for I:=0 to Self.lvData.Prop.Items.Count-1 do
//  begin
//    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
//    begin
//      Result.S[Result.Length]:=Self.lvData.Prop.Items[I].Caption;
//    end;
//  end;
//end;

function TSkinWinMyComboBox.GetText: String;
begin
  Result:=Self.edtValue.Text;
end;

function TSkinWinMyComboBox.IsItemCanAddToText(AItem: TSkinItem): Boolean;
begin
  Result:=True;
end;

////获取已选内容下标数组
//function TSkinWinMyComboBox.GetSelectedIndexArray: ISuperArray;
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
//  Self.lvData.Prop.Items.BeginUpdate;
//  try
//    ASelectedList.CommaText:=AEditText;
//    for I := 0 to Self.lvData.Prop.Items.Count-1 do
//    begin
//      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Caption)<>-1);
//    end;
//  finally
//    FreeAndNil(ASelectedList);
//    Self.lvData.Prop.Items.EndUpdate;
//  end;
//
//  Result:=TSuperArray.Create;
//  for I:=0 to Self.lvData.Prop.Items.Count-1 do
//  begin
//    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
//    begin
//      Result.I[Result.Length]:=Self.lvData.Prop.Items[I].Index;
//    end;
//  end;
//end;

procedure TSkinWinMyComboBox.lvDataClickItem(AItem: TSkinItem);
var
  I:Integer;
  AText:String;
begin

  if not Self.lvData.Prop.MultiSelect then
  begin
    //单选
    Self.edtValue.Text:=AItem.Caption;
    FfrmSelectPopup.HidePopup;
  end
  else
  begin

    //多选
    AText:='';
    for I:=0 to Self.lvData.Prop.Items.Count-1 do
    begin
      if Self.lvData.Prop.Items[I].Selected then
      begin
        if AText<>'' then
        begin
          AText:=AText+',';
        end;
        AText:=AText+Self.lvData.Prop.Items[I].Caption;
      end;
    end;
    Self.edtValue.Text:=AText;

  end;
  Invalidate;

end;

procedure TSkinWinMyComboBox.lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
  AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
//var
//  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
begin
//  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(ANewListItemStyleFrameCache.FItemStyleFrame);
//  AFrame.imgItemIcon.Visible:=False;
end;

procedure TSkinWinMyComboBox.lvDataPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  //
end;

procedure TSkinWinMyComboBox.SetText(const Value: String);
begin
  Self.edtValue.Text:=Value;
end;

function TSkinWinMyComboBox.CreateSelectPopupForm: TfrmSkinSelectPopup;
begin
  Result:=uSkinSelectPopupForm.CreateSkinSelectPopupForm(Application.MainForm,TfrmSkinSelectPopup);
end;


//function TSkinWinMyComboBox.GetSelected: Boolean;
//begin
//  Result:=False;
//end;
//
//function TSkinWinMyComboBox.GetThisRowItemCount: Integer;
//begin
//  Result:=0;
//end;
//
////层级
//function TSkinWinMyComboBox.GetLevel:Integer;
//begin
//  Result:=0;
//end;
//
////获取与设置自定义属性
//function TSkinWinMyComboBox.GetPropJsonStr:String;
//begin
//  Result:=Inherited;
//end;
//
//procedure TSkinWinMyComboBox.SetPropJsonStr(AJsonStr:String);
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
//function TSkinWinMyComboBox.LoadFromFieldControlSetting(ASetting: TFieldControlSetting;AFieldControlSettingMap:TObject): Boolean;
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
//procedure TSkinWinMyComboBox.SetItemDrawRect(Value: TRectF);
//begin
//  FItemDrawRect:=Value;
//end;
//
//function TSkinWinMyComboBox.GetIsRowEnd:Boolean;
//begin
//  Result:=False;
//end;
//
//procedure TSkinWinMyComboBox.SetSkinListIntf(ASkinListIntf: ISkinList);
//begin
//  FSkinListIntf:=ASkinListIntf;
//end;
//
//procedure TSkinWinMyComboBox.TranslateControlLang(APrefix: String; ALang: TLang;
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
//function TSkinWinMyComboBox.GetListLayoutsManager:TSkinListLayoutsManager;
//begin
//  Result:=FSkinListIntf.GetListLayoutsManager;
//end;
//
//procedure TSkinWinMyComboBox.ClearItemRect;
//begin
//
//end;
//
//procedure TSkinWinMyComboBox.SetItemRect(Value: TRectF);
//begin
//  FItemRect:=Value;
//  Self.SetBounds(Value);
//end;
//
//function TSkinWinMyComboBox.GetItemDrawRect: TRectF;
//begin
//  Result:=FItemDrawRect;
//end;
//
//function TSkinWinMyComboBox.GetItemRect: TRectF;
//begin
//  Result:=FItemRect;
//end;
//
//
//function TSkinWinMyComboBox.GetObject: TObject;
//begin
//  Result:=Self;
//end;
//
//function TSkinWinMyComboBox.GetWidth:Double;
//begin
//  Result:=Width;
//end;
//
//function TSkinWinMyComboBox.GetHeight:Double;
//begin
//  Result:=Height;
//end;

function TSkinWinMyComboBox.Material:TSkinComboBoxDefaultMaterial;
begin
  Result:=TSkinComboBoxDefaultMaterial(SelfOwnMaterial);
end;

//function TSkinWinMyComboBox.PtInItem(APoint: TPointF): Boolean;
//begin
//  Result:=PtInRect(Self.FItemDrawRect,APoint);
//
//end;

procedure TSkinWinMyComboBox.Click;
var
  APopupPoint:TPoint;
  ASelectedList:TStringList;
  I: Integer;
  AEditText:string;
  ADropDownCount:Integer;
begin
  //药品名称单元格输入框
  APopupPoint:=Self.ClientToScreen(Point(0,Self.Height));
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


  lvData.Parent:=FfrmSelectPopup;
  lvData.Align:=alClient;
  lvData.VertScrollBar.Prop.Position:=0;


  lvData.Prop.Items.BeginUpdate;
  try
    lvData.Prop.Items.Clear;
//    lvData.Prop.MultiSelect:=True;
//    lvData.Prop.ItemHeight:=32;
//    lvData.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';

//    ACompanySizeArray:=TSuperArray.Create('["1-10人","11-50人","51-200人","201-500人","501-1000人","1001-5000人","5001-10000人","超过10001人"]');
    for I := 0 to Self.FItems.Count - 1 do
    begin
      lvData.Prop.Items.Add.Caption:=FItems[I];
    end;

  finally
    lvData.Prop.Items.EndUpdate();
  end;


  //替换中文逗号
  AEditText:=Self.edtValue.Text;
  if Pos('，', AEditText) > 0 then
  begin
    AEditText := StringReplace(AEditText, '，', ',', [rfReplaceAll]);
  end;

  //设置选中
  ASelectedList:=TStringList.Create;
  lvData.Prop.Items.BeginUpdate;
  try
    ASelectedList.CommaText:=AEditText;
    for I := 0 to Self.lvData.Prop.Items.Count-1 do
    begin
      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Caption)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvData.Prop.Items.EndUpdate;
  end;


  if Self.lvData.Prop.Items.Count<DropDownCount then
  begin
    ADropDownCount:=Self.lvData.Prop.Items.Count;
  end
  else
  begin
    ADropDownCount:=DropDownCount;
  end;
  

  FfrmSelectPopup.Popup(APopupPoint,
                        GetPopupFormWidth,
                        //200
                        ControlSize(ScreenScaleSize(ADropDownCount*Self.lvData.Prop.ItemHeight))
                        );


end;

constructor TSkinWinMyComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FItems:=TStringList.Create;

  lvData:=TSkinWinListView.Create(Self);
  lvData.Parent:=Self;
  //加速，因为如果为每个Item创建一个StyleFrame，会比较慢
  Self.lvData.Prop.FDefaultItemStyleSetting.IsUseCache:=False;
  lvData.SelfOwnMaterial;
  lvData.SkinControlType;
//  lvData.Visible:=False;
  lvData.OnClickItem := lvDataClickItem;
  lvData.OnPrepareDrawItem := lvDataPrepareDrawItem;
  lvData.OnNewListItemStyleFrameCacheInit := lvDataNewListItemStyleFrameCacheInit;
  lvData.Material.IsTransparent:=False;
  lvData.Material.BackColor.IsFill:=True;
//  lvData.Material.DrawItemBackColorParam.DrawEffectSetting.MouseOverEffect.Eff
  lvData.Prop.ItemHeight:=32;
  lvData.Prop.ItemWidth:=-2;
  lvData.Prop.ColCount:=1;
  lvData.Top:=100;

  DropDownCount:=6;


  edtValue:=TSkinWinEdit.Create(Self);
  edtValue.Parent:=Self;
  edtValue.Top:=100;
  edtValue.Visible:=False;

  edtValue2:=TEdit.Create(Self);
  edtValue2.Parent:=Self;
  edtValue2.Top:=100;
  edtValue2.Visible:=False;

  FItemIndex:=-1;

end;

function TSkinWinMyComboBox.CurrentUseMaterialToDefault:TSkinComboBoxDefaultMaterial;
begin
  Result:=TSkinComboBoxDefaultMaterial(CurrentUseMaterial);
end;

function TSkinWinMyComboBox.SelfOwnMaterialToDefault:TSkinComboBoxDefaultMaterial;
begin
  Result:=TSkinComboBoxDefaultMaterial(SelfOwnMaterial);
end;

function TSkinWinMyComboBox.GetPropertiesClassType: TPropertiesClassType;
begin
  Result:=TComboBoxProperties;
end;

//procedure TSkinWinMyComboBox.ReadState(Reader: TReader);
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
//procedure TSkinWinMyComboBox.RecordControlLangIndex(APrefix: String; ALang: TLang;
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

destructor TSkinWinMyComboBox.Destroy;
begin
  FreeAndNil(lvData);
  FreeAndNil(edtValue);
  FreeAndNil(edtValue2);

  FreeAndNil(FItems);
  inherited;
end;

function TSkinWinMyComboBox.GetComboBoxProperties: TComboBoxProperties;
begin
  Result:=TComboBoxProperties(Self.FProperties);
end;

procedure TSkinWinMyComboBox.SetComboBoxProperties(Value: TComboBoxProperties);
begin
  Self.FProperties.Assign(Value);
end;

procedure TSkinWinMyComboBox.SetItemIndex(const Value: Integer);
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

procedure TSkinWinMyComboBox.SetItems(const Value: TStringList);
begin
  FItems.Assign(Value);
end;

//procedure TSkinWinMyComboBox.SetControlValueByBindItemField(
//  const AFieldName: String; const AFieldValue: Variant; ASkinItem: TObject;
//  AIsDrawItemInteractiveState: Boolean);
//begin
//  Caption:=AFieldValue;
//end;
//
//procedure TSkinWinMyComboBox.SetControlObjectByBindItemField(const AFieldName: String;
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
//procedure TSkinWinMyComboBox.SetDetail(const Value:String);
//begin
//  if FDetail<>Value then
//  begin
//    FDetail:=Value;
//    Invalidate;
//  end;
//end;
//
//procedure TSkinWinMyComboBox.SetDetail1(const Value:String);
//begin
//  if FDetail1<>Value then
//  begin
//    FDetail1:=Value;
//    Invalidate;
//  end;
//end;
//
//procedure TSkinWinMyComboBox.Click;
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
//function TSkinWinMyComboBox.GetDetail:String;
//begin
//  Result:=FDetail;
//end;
//
//function TSkinWinMyComboBox.GetDetail1:String;
//begin
//  Result:=FDetail1;
//end;
//
//procedure TSkinWinMyComboBox.DoCustomSkinMaterialChange(Sender: TObject);
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
//
//procedure TSkinWinMyComboBox.BindingItemText(const AName:String;const AText:String;ASkinItem:TObject;AIsDrawItemInteractiveState:Boolean);
//begin
//  //为什么要Caption,
//  Caption:=AText;
//end;
//
//function TSkinWinMyComboBox.GetPostValue(ASetting:TFieldControlSetting;APageDataDir:String;ASetRecordFieldValueIntf:ISetRecordFieldValue;
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
//procedure TSkinWinMyComboBox.SetControlValue(ASetting:TFieldControlSetting;APageDataDir:String;AImageServerUrl:String;AValue:Variant;AValueCaption:String;
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



end.


