unit MyComboBoxFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinPanelType,

  uSkinItems,
  XSuperObject,
  uGraphicCommon,
  SelectPopupForm,
  EasyServiceCommonMaterialDataMoudle_VCL,
  ListItemStyle_CheckBoxIconLeft_CaptionRight,

  uSkinListViewType,
  uSkinItemDesignerPanelType,
  uSkinWindowsControl, uSkinButtonType, Vcl.StdCtrls, uDrawCanvas,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinWindowsEdit;

type
  TFrameMyComboBox = class(TFrame)
    edtValue2: TEdit;
    btnDropDown: TSkinWinButton;
    pnlClient: TSkinWinPanel;
    lvData: TSkinWinListView;
    edtValue: TSkinWinEdit;
    procedure btnDropDownClick(Sender: TObject);virtual;
    procedure lvDataClickItem(AItem:TSkinItem);virtual;
    procedure lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);virtual;
    procedure lvDataPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);virtual;
  private
    function GetText: String;
    procedure SetText(const Value: String);
    { Private declarations }
  protected
//    function lvData:TSkinWinListView;virtual;
    function GetPopupFormWidth:Integer;virtual;
    function CreateSelectPopupForm:TfrmSelectPopup;virtual;
  public
//    lvData:TSkinWinListView;
//    FPopupFormWidth:Integer;
    FfrmSelectPopup:TfrmSelectPopup;
    DropDownCount:Integer;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //这个列表项是否可以被添加到Text
    function IsItemCanAddToText(AItem:TSkinItem):Boolean;virtual;

    function GetSelectedTextArray:ISuperArray;virtual;
    function GetSelectedCaptions:String;virtual;
    function GetSelectedNames:String;virtual;

    property Text:String read GetText write SetText;

    function GetSelectedIndexArray:ISuperArray;

    { Public declarations }
  end;



  //LinkedIn公司规模多选框
  TFrameSelectCompanySizeComboBox=class(TFrameMyComboBox)
    procedure lvDataClickItem(AItem:TSkinItem);override;
    procedure lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);override;
  protected
  public
    constructor Create(AOwner:TComponent);override;
  end;



  //LinkedIn人脉级别多选框
  TFrameSelectContactLevelComboBox=class(TFrameMyComboBox)
    procedure lvDataClickItem(AItem:TSkinItem);override;
    procedure lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);override;
  protected
  public
    constructor Create(AOwner:TComponent);override;
  end;

  //LinkedIn数据过滤多选框
  TFrameDataFilterComboBox=class(TFrameMyComboBox)
    procedure lvDataClickItem(AItem:TSkinItem);override;
    procedure lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);override;
  protected
  public
    constructor Create(AOwner:TComponent);override;
  end;


  //Ins话题多选框
  TFrameSelectInsTopicComboBox=class(TFrameMyComboBox)
    procedure btnDropDownClick(Sender: TObject);override;
    procedure lvDataClickItem(AItem:TSkinItem);override;
  protected
  public
    constructor Create(AOwner:TComponent);override;
    function GetSelectedNames:String;override;
  end;



implementation

{$R *.dfm}

procedure TFrameMyComboBox.btnDropDownClick(Sender: TObject);
var
  APopupPoint:TPoint;
  ASelectedList:TStringList;
  I: Integer;
  AEditText:string;
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


  FfrmSelectPopup.Popup(APopupPoint,
                        GetPopupFormWidth,
                        //200
                        ControlSize(ScreenScaleSize(Self.DropDownCount*Self.lvData.Prop.ItemHeight))
                        );

end;

constructor TFrameMyComboBox.Create(AOwner: TComponent);
begin
  inherited;
//  lvData:=TSkinWinListView.Create(Self);
////  lvData.Parent:=Self;
////  lvData.Align:=alClient;
//  lvData.SkinControlType;
//  lvData.SelfOwnMaterial;
//  lvData.VertScrollBar;
//  lvData.HorzScrollBar;
//  lvData.Prop.ViewType:=lvtList;
//  lvData.Prop.ItemWidth:=-1;
//  lvData.OnClickItem:=lvDataClickItem;
//  lvData.Material.DrawItemDevideParam.IsFill:=True;


//  lvData.Prop.Items.BeginUpdate;
//  try
//    lvData.Prop.Items.Add.Caption:='中国';
//    lvData.Prop.Items.Add.Caption:='美国';
//  finally
//    lvData.Prop.Items.EndUpdate();
//  end;


  //加速，因为如果为每个Item创建一个StyleFrame，会比较慢
  Self.lvData.Prop.FDefaultItemStyleSetting.IsUseCache:=False;

  DropDownCount:=6;

  //GetParentForm(Self)

end;

function TFrameMyComboBox.CreateSelectPopupForm: TfrmSelectPopup;
begin
  Result:=SelectPopupForm.CreateSelectPopupForm(Application.MainForm,TfrmSelectPopup);
end;

destructor TFrameMyComboBox.Destroy;
begin

  inherited;
end;

//获取已选内容文本数组
//function TFrameMyComboBox.lvData: TSkinWinListView;
//begin
//  Result:=Self.lvData;
//end;

function TFrameMyComboBox.GetPopupFormWidth: Integer;
begin
  Result:=Width;
//  if FPopupFormWidth>0 then
//  begin
//    Result:=FPopupFormWidth;
//  end;

end;

function TFrameMyComboBox.GetSelectedCaptions: String;
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

function TFrameMyComboBox.GetSelectedNames: String;
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

function TFrameMyComboBox.GetSelectedTextArray: ISuperArray;
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

  Result:=TSuperArray.Create;
  for I:=0 to Self.lvData.Prop.Items.Count-1 do
  begin
    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
    begin
      Result.S[Result.Length]:=Self.lvData.Prop.Items[I].Caption;
    end;
  end;
end;

function TFrameMyComboBox.GetText: String;
begin
  Result:=Self.edtValue.Text;
end;

function TFrameMyComboBox.IsItemCanAddToText(AItem: TSkinItem): Boolean;
begin
  Result:=True;
end;

//获取已选内容下标数组
function TFrameMyComboBox.GetSelectedIndexArray: ISuperArray;
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

  Result:=TSuperArray.Create;
  for I:=0 to Self.lvData.Prop.Items.Count-1 do
  begin
    if Self.lvData.Prop.Items[I].Selected and IsItemCanAddToText(Self.lvData.Prop.Items[I]) then
    begin
      Result.I[Result.Length]:=Self.lvData.Prop.Items[I].Index;
    end;
  end;
end;

procedure TFrameMyComboBox.lvDataClickItem(AItem: TSkinItem);
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

end;

procedure TFrameMyComboBox.lvDataNewListItemStyleFrameCacheInit(Sender: TObject;
  AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
begin
  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(ANewListItemStyleFrameCache.FItemStyleFrame);
  AFrame.imgItemIcon.Visible:=False;
end;

procedure TFrameMyComboBox.lvDataPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin
  //
end;

procedure TFrameMyComboBox.SetText(const Value: String);
begin
  Self.edtValue.Text:=Value;
end;



{ TFrameSelectCompanySizeComboBox }

constructor TFrameSelectCompanySizeComboBox.Create(AOwner: TComponent);
var
  I:Integer;
  ACompanySizeArray:ISuperArray;
begin
  inherited;

  lvData.Prop.Items.BeginUpdate;
  try
    lvData.Prop.Items.Clear;
    lvData.Prop.MultiSelect:=True;
    lvData.Prop.ItemHeight:=32;
    lvData.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';

    ACompanySizeArray:=TSuperArray.Create('["1-10人","11-50人","51-200人","201-500人","501-1000人","1001-5000人","5001-10000人","超过10001人"]');
    for I := 0 to ACompanySizeArray.Length - 1 do
    begin
      lvData.Prop.Items.Add.Caption:=ACompanySizeArray.S[I];
    end;

  finally
    lvData.Prop.Items.EndUpdate();
  end;
end;

procedure TFrameSelectCompanySizeComboBox.lvDataClickItem(AItem: TSkinItem);
var
  I:Integer;
  AText:String;
begin
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

procedure TFrameSelectCompanySizeComboBox.lvDataNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
begin
  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(ANewListItemStyleFrameCache.FItemStyleFrame);
  AFrame.imgItemIcon.Visible:=False;
end;

{ TFrameSelectContactLevelComboBox }

constructor TFrameSelectContactLevelComboBox.Create(AOwner: TComponent);
var
  I:Integer;
  ACompanySizeArray:ISuperArray;
begin
  inherited;

  lvData.Prop.Items.BeginUpdate;
  try
    lvData.Prop.Items.Clear;
    lvData.Prop.MultiSelect:=True;
    lvData.Prop.ItemHeight:=32;
    lvData.Prop.DefaultItemStyle:='CheckBoxIconLeft_CaptionRight';

    ACompanySizeArray:=TSuperArray.Create('["1度","2度","3度+"]');
    for I := 0 to ACompanySizeArray.Length - 1 do
    begin
      lvData.Prop.Items.Add.Caption:=ACompanySizeArray.S[I];
    end;

  finally
    lvData.Prop.Items.EndUpdate();
  end;
end;

procedure TFrameSelectContactLevelComboBox.lvDataClickItem(AItem: TSkinItem);
var
  I:Integer;
  AText:String;
begin
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

procedure TFrameSelectContactLevelComboBox.lvDataNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameListItemStyle_CheckBoxIconLeft_CaptionRight;
begin
  AFrame:=TFrameListItemStyle_CheckBoxIconLeft_CaptionRight(ANewListItemStyleFrameCache.FItemStyleFrame);
  AFrame.imgItemIcon.Visible:=False;
end;

{ TFrameSelectInsTopicComboBox }

procedure TFrameSelectInsTopicComboBox.btnDropDownClick(Sender: TObject);
var
  I:Integer;
  ASelectedList:TStringList;
  AEditText:string;
begin
  inherited;

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
      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Name)<>-1);
    end;
  finally
    FreeAndNil(ASelectedList);
    Self.lvData.Prop.Items.EndUpdate;
  end;

end;

constructor TFrameSelectInsTopicComboBox.Create(AOwner: TComponent);
begin
  inherited;

  DropDownCount:= 10;

end;

function TFrameSelectInsTopicComboBox.GetSelectedNames: String;
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
      Self.lvData.Prop.Items[I].Selected:=(ASelectedList.IndexOf(Self.lvData.Prop.Items[i].Name)<>-1);
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

procedure TFrameSelectInsTopicComboBox.lvDataClickItem(AItem: TSkinItem);
var
  I:Integer;
  AText:String;
begin
  inherited;

  if not Self.lvData.Prop.MultiSelect then
  begin
    //单选
    Self.edtValue.Text:=AItem.Name;
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
        AText:=AText+Self.lvData.Prop.Items[I].Name;
      end;
    end;
    Self.edtValue.Text:=AText;

  end;

end;

{ TFrameDataFilterComboBox }

constructor TFrameDataFilterComboBox.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TFrameDataFilterComboBox.lvDataClickItem(AItem: TSkinItem);
begin
  inherited;

end;

procedure TFrameDataFilterComboBox.lvDataNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
begin
  inherited;

end;

end.
