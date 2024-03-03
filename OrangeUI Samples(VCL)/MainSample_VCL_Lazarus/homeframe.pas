unit HomeFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}

  Messages, SysUtils, Variants, Classes, Forms,


  Math,
  ListItemStyle_IconLeft_CaptionDetailRight,
  ListItemStyle_DashBoardSummaryItem,
//  Home_ItemGrid_TwoCellTextFrame,
//  Home_ItemGrid_MutliColorProgressBarColumnFrame,
//  Home_BarChart_MonthSummaryFrame,

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListViewType, uDrawCanvas, uSkinItems, Controls;

type
  TFrameHome=class(TFrame)
    SkinListView1: TSkinListView;
    procedure FrameResize(Sender: TObject);
    procedure SkinListView1NewListItemStyleFrameCacheInit(Sender: TObject;
      AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);
  private
    { Private declarations }
  public
//    //是由四个Frame拼起来的
//    FItemGrid_TwoCellTextFrame:TFrameItemGrid_TwoCellText;
//    FItemGrid_MultiColorProgressBarColumnFrame:TFrameItemGrid_MultiColorProgressBarColumn;
//    FItemGrid_MultiColorProgressBarColumnFrame2:TFrameItemGrid_MultiColorProgressBarColumn;
//    FBarChart_MonthSummaryFrame:TFrameBarChart_MonthSummary;

    FControlLayoutItems:TControlLayoutItems;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameDashBoard }

constructor TFrameHome.Create(AOwner: TComponent);
begin
  inherited;

//  //热卖商品
//  FItemGrid_TwoCellTextFrame:=TFrameItemGrid_TwoCellText.Create(Self);
//  FItemGrid_TwoCellTextFrame.Parent:=Self;
//  FItemGrid_TwoCellTextFrame.pnlClient.Material.BackColor.ShadowSize:=5;
//  {$IFDEF DELPHI}
//  FItemGrid_TwoCellTextFrame.pnlClient.Margins.SetBounds(0,10,0,-5);
//  {$ENDIF}
//  {$IFDEF FPC}
//  FItemGrid_TwoCellTextFrame.pnlClient.BorderSpacing.Top:=10;//(0,10,0,-5);
//  FItemGrid_TwoCellTextFrame.pnlClient.BorderSpacing.Bottom:=-10;//(0,10,0,-5);
//  {$ENDIF}
////  FItemGrid_TwoCellTextFrame.gridData.Prop.ColumnsHeaderHeight:=0;
//
//
//  //渠道
//  FItemGrid_MultiColorProgressBarColumnFrame:=TFrameItemGrid_MultiColorProgressBarColumn.Create(Self);
//  FItemGrid_MultiColorProgressBarColumnFrame.Name:='FItemGrid_MultiColorProgressBarColumnFrame';
//  FItemGrid_MultiColorProgressBarColumnFrame.Parent:=Self;
//  FItemGrid_MultiColorProgressBarColumnFrame.pnlClient.Material.BackColor.ShadowSize:=5;
////  FItemGrid_MultiColorProgressBarColumnFrame.gridData.Prop.ColumnsHeaderHeight:=0;
//
//
//  //社交媒体流量
//  FItemGrid_MultiColorProgressBarColumnFrame2:=TFrameItemGrid_MultiColorProgressBarColumn.Create(Self);
//  FItemGrid_MultiColorProgressBarColumnFrame.Name:='FItemGrid_MultiColorProgressBarColumnFrame2';
//  FItemGrid_MultiColorProgressBarColumnFrame2.Parent:=Self;
//  FItemGrid_MultiColorProgressBarColumnFrame2.pnlClient.Material.BackColor.ShadowSize:=5;
//  FItemGrid_MultiColorProgressBarColumnFrame2.lblCaption.Caption:='social media traffic';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[0].Caption:='Facebook';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[0].Detail:='2,250';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[0].Detail1:='30';
//
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[1].Caption:='Instagram';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[1].Detail:='1,250';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[1].Detail1:='10';
//
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[2].Caption:='Twitter';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[2].Detail:='6,250';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[2].Detail1:='60';
//
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[3].Caption:='LinkedIn';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[3].Detail:='250';
//  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.Items[3].Detail1:='5';
////  FItemGrid_MultiColorProgressBarColumnFrame2.gridData.Prop.ColumnsHeaderHeight:=0;
//
//
//
//  FBarChart_MonthSummaryFrame:=TFrameBarChart_MonthSummary.Create(Self);
//  FBarChart_MonthSummaryFrame.Parent:=Self;
//
//
//  FControlLayoutItems:=TControlLayoutItems.Create;
//  //添加两个需要排列的控件，两个控件的设计时高度要保持一致
//  FControlLayoutItems.Add(SkinWinListView1,-1,SkinWinListView1.Height);
//  //热卖商品
//  FControlLayoutItems.Add(FItemGrid_TwoCellTextFrame,-1,FItemGrid_TwoCellTextFrame.Height);
//
//  //一整排报表
//  FControlLayoutItems.Add(FBarChart_MonthSummaryFrame,-2,FBarChart_MonthSummaryFrame.Height);
//
//  //渠道
//  FControlLayoutItems.Add(FItemGrid_MultiColorProgressBarColumnFrame,-1,FItemGrid_MultiColorProgressBarColumnFrame.Height);
//  //社交媒体流量
//  FControlLayoutItems.Add(FItemGrid_MultiColorProgressBarColumnFrame2,-1,FItemGrid_MultiColorProgressBarColumnFrame2.Height);
//
//
//
//  //那个间隔
//  FControlLayoutItems.FListLayoutsManager.ItemSpace:=10;
//  FControlLayoutItems.FListLayoutsManager.ItemCountPerLine:=2;
//

end;

destructor TFrameHome.Destroy;
begin
  FreeAndNil(FControlLayoutItems);
  inherited;
end;

procedure TFrameHome.FrameResize(Sender: TObject);
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

procedure TFrameHome.SkinListView1NewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameListItemStyle_IconLeft_CaptionDetailRight;
begin
  if ANewListItemStyleFrameCache.FItemStyleFrame is TFrameListItemStyle_IconLeft_CaptionDetailRight then
  begin
    AFrame:=TFrameListItemStyle_IconLeft_CaptionDetailRight(ANewListItemStyleFrameCache.FItemStyleFrame);
    AFrame.imgItemIcon.Width:=50;
    AFrame.imgItemIcon.Margins.Left:=20;

    AFrame.lblItemCaption.Material.DrawCaptionParam.FontSize:=16;
    AFrame.lblItemCaption.Height:=36;

    AFrame.lblItemDetail.Material.DrawCaptionParam.FontSize:=16;
    AFrame.lblItemDetail.Height:=36;
  end;
end;

end.
