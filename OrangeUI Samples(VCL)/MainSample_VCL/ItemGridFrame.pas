unit ItemGridFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Forms,


  Math,
  DashBoard_Analyse_ItemGrid_TwoCellTextFrame,
  DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame,
  DashBoard_Projects_ItemGrid_TwoCellTextHasBackColorFrame,

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListViewType, uDrawCanvas, uSkinItems, Vcl.Controls;

type
  TFrameItemGrid=class(TFrame)
    procedure FrameResize(Sender: TObject);
    procedure SkinWinListView1NewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);
  private
    { Private declarations }
  public
    FItemGrid_TwoCellTextFrame:TFrameItemGrid_TwoCellText;
    FItemGrid_MultiColorProgressBarColumnFrame:TFrameItemGrid_MultiColorProgressBarColumn;
    FItemGrid_MultiColorProgressBarColumnFrame2:TFrameItemGrid_MultiColorProgressBarColumn;
    FItemGrid_TwoCellTextHasBackColorFrame:TFrameItemGrid_TwoCellTextHasBackColor;

    FControlLayoutItems:TControlLayoutItems;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameDashBoard }

constructor TFrameItemGrid.Create(AOwner: TComponent);
begin
  inherited;

  FItemGrid_TwoCellTextFrame:=TFrameItemGrid_TwoCellText.Create(Self);
  FItemGrid_TwoCellTextFrame.Parent:=Self;
//  FItemGrid_TwoCellTextFrame.pnlClient.Material.BackColor.ShadowSize:=5;
//  FItemGrid_TwoCellTextFrame.Padding.SetBounds(0,10,0,-5);


  FItemGrid_MultiColorProgressBarColumnFrame:=TFrameItemGrid_MultiColorProgressBarColumn.Create(Self);
  FItemGrid_MultiColorProgressBarColumnFrame.Name:='FItemGrid_MultiColorProgressBarColumnFrame';
  FItemGrid_MultiColorProgressBarColumnFrame.Parent:=Self;
  FItemGrid_MultiColorProgressBarColumnFrame.pnlClient.Material.BackColor.ShadowSize:=5;


  FItemGrid_MultiColorProgressBarColumnFrame2:=TFrameItemGrid_MultiColorProgressBarColumn.Create(Self);
  FItemGrid_MultiColorProgressBarColumnFrame.Name:='FItemGrid_MultiColorProgressBarColumnFrame2';
  FItemGrid_MultiColorProgressBarColumnFrame2.Parent:=Self;
  FItemGrid_MultiColorProgressBarColumnFrame2.pnlClient.Material.BackColor.ShadowSize:=5;
  FItemGrid_MultiColorProgressBarColumnFrame2.lblCaption.Caption:='社交媒体流量';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[0].Caption:='Facebook';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[0].Detail:='2,250';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[0].Detail1:='30';

  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[1].Caption:='Instagram';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[1].Detail:='1,250';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[1].Detail1:='10';

  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[2].Caption:='Twitter';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[2].Detail:='6,250';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[2].Detail1:='60';

  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[3].Caption:='LinkedIn';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[3].Detail:='250';
  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[3].Detail1:='5';



  FItemGrid_TwoCellTextHasBackColorFrame:=TFrameItemGrid_TwoCellTextHasBackColor.Create(Self);
  FItemGrid_TwoCellTextHasBackColorFrame.Name:='FItemGrid_TwoCellTextHasBackColorFrame';
  FItemGrid_TwoCellTextHasBackColorFrame.Parent:=Self;



  FControlLayoutItems:=TControlLayoutItems.Create;
  FControlLayoutItems.Add(FItemGrid_TwoCellTextFrame,0.4,FItemGrid_TwoCellTextFrame.Height);
  FControlLayoutItems.Add(FItemGrid_TwoCellTextHasBackColorFrame,0.6,FItemGrid_TwoCellTextFrame.Height).FThisRowItemCount:=2;


  FControlLayoutItems.Add(FItemGrid_MultiColorProgressBarColumnFrame,-1,FItemGrid_MultiColorProgressBarColumnFrame.Height);
  FControlLayoutItems.Add(FItemGrid_MultiColorProgressBarColumnFrame2,-1,FItemGrid_MultiColorProgressBarColumnFrame2.Height);



  //那个间隔
  FControlLayoutItems.FListLayoutsManager.ItemSpace:=10;
  FControlLayoutItems.FListLayoutsManager.ItemCountPerLine:=2;


end;

destructor TFrameItemGrid.Destroy;
begin
  FreeAndNil(FControlLayoutItems);
  inherited;
end;

procedure TFrameItemGrid.FrameResize(Sender: TObject);
begin
  if FControlLayoutItems<>nil then
  begin
    FControlLayoutItems.FListLayoutsManager.ControlWidth:=Self.Width;
    FControlLayoutItems.FListLayoutsManager.ControlHeight:=Self.Height;
    FControlLayoutItems.FListLayoutsManager.DoItemSizeChange(nil);
    FControlLayoutItems.AlignControls;
    Self.Height:=Ceil(FControlLayoutItems.FListLayoutsManager.CalcContentHeight);
  end;
end;

procedure TFrameItemGrid.SkinWinListView1NewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
begin
//  //加入阴影
//  TFrameListItemStyle_DashBoardSummaryItem(ANewListItemStyleFrameCache.FItemStyleFrame).ItemDesignerPanel.Material.BackColor.ShadowSize:=5;
end;

end.
