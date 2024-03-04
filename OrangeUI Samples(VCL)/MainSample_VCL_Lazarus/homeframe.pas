//convert pas to utf8 by ¥
unit HomeFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}

  Messages, SysUtils, Variants, Classes, Forms,


  Math,
  uSkinVirtualChartType,
  OrderGridFrame,
  ListItemStyle_IconLeft_CaptionDetailRight,
  ListItemStyle_DashBoardSummaryItem,
  DashBoard_LineChart_WeekSummaryFrame,
//  Home_ItemGrid_TwoCellTextFrame,
  DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame,
//  Home_BarChart_MonthSummaryFrame,
  DashBoard_Projects_PieChart_ProjectStatusFrame,
  DashBoard_Analyse_BarChart_MonthSummaryFrame,

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
    FPieChart_ProjectStatusFrame:TFramePieChart_ProjectStatus;
    FBarChart_MonthSummaryFrame:TFrameBarChart_MonthSummary;
    FItemGrid_MultiColorProgressBarColumnFrame:TFrameItemGrid_MultiColorProgressBarColumn;

    FLineChart_WeekSummaryFrame:TFrameLineChart_WeekSummary;
    FOrderGridFrame:TFrameOrderGrid;

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

  FLineChart_WeekSummaryFrame:=TFrameLineChart_WeekSummary.Create(Self);
  FLineChart_WeekSummaryFrame.Parent:=Self;

  FPieChart_ProjectStatusFrame:=TFramePieChart_ProjectStatus.Create(Self);
  FPieChart_ProjectStatusFrame.Parent:=Self;
  FPieChart_ProjectStatusFrame.lvData.AlignWithMargins:=True;
  FPieChart_ProjectStatusFrame.lvData.Margins.Bottom:=20;


  FBarChart_MonthSummaryFrame:=TFrameBarChart_MonthSummary.Create(Self);
  FBarChart_MonthSummaryFrame.Parent:=Self;
//  FBarChart_MonthSummaryFrame.FSkinVirtualChart.Prop.SeriesList[0].ChartType:=sctLine;
//  //X轴坐标
//  FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.BeginUpdate;
//  try
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.Clear;
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Jan';
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Feb';
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Mar';
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Apr';
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.Add.Caption:='May';
//  finally
//    FBarChart_MonthSummaryFrame.FSkinVirtualChart.Properties.AxisItems.EndUpdate;
//  end;

  //
  FOrderGridFrame:=TFrameOrderGrid.Create(Self);;
  FOrderGridFrame.Parent:=Self;

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


  //渠道
  FItemGrid_MultiColorProgressBarColumnFrame:=TFrameItemGrid_MultiColorProgressBarColumn.Create(Self);
  FItemGrid_MultiColorProgressBarColumnFrame.Name:='FItemGrid_MultiColorProgressBarColumnFrame';
  FItemGrid_MultiColorProgressBarColumnFrame.Parent:=Self;
  FItemGrid_MultiColorProgressBarColumnFrame.pnlClient.Material.BackColor.ShadowSize:=5;
//  FItemGrid_MultiColorProgressBarColumnFrame.gridData.Prop.ColumnsHeaderHeight:=0;

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


  FControlLayoutItems:=TControlLayoutItems.Create;


  //添加两个需要排列的控件,两个控件的设计时高度要保持一致
  FControlLayoutItems.Add(SkinListView1,-2,SkinListView1.Height);
  //热卖商品
  FControlLayoutItems.Add(FLineChart_WeekSummaryFrame,-2,FLineChart_WeekSummaryFrame.Height);

  FControlLayoutItems.Add(FPieChart_ProjectStatusFrame,0.3333,FPieChart_ProjectStatusFrame.Height).FThisRowItemCount:=2;
  FControlLayoutItems.Add(FBarChart_MonthSummaryFrame,0.6666,FPieChart_ProjectStatusFrame.Height).FThisRowItemCount:=2;

//  FControlLayoutItems.Add(FPieChart_ProjectStatusFrame,-1,FPieChart_ProjectStatusFrame.Height);
//  FControlLayoutItems.Add(FBarChart_MonthSummaryFrame,-1,FPieChart_ProjectStatusFrame.Height);

//  FControlLayoutItems.Add(FPieChart_ProjectStatusFrame,-1,FPieChart_ProjectStatusFrame.Height);
//  FControlLayoutItems.Add(FBarChart_MonthSummaryFrame,-1,FPieChart_ProjectStatusFrame.Height);

  FControlLayoutItems.Add(FOrderGridFrame,0.6,300).FThisRowItemCount:=2;;
  //渠道
  FControlLayoutItems.Add(FItemGrid_MultiColorProgressBarColumnFrame,0.4,300).FThisRowItemCount:=2;;

//  //一整排报表
//  FControlLayoutItems.Add(FBarChart_MonthSummaryFrame,-2,FBarChart_MonthSummaryFrame.Height);
//
//  //社交媒体流量
//  FControlLayoutItems.Add(FItemGrid_MultiColorProgressBarColumnFrame2,-1,FItemGrid_MultiColorProgressBarColumnFrame2.Height);



  //那个间隔
  FControlLayoutItems.FListLayoutsManager.ItemSpace:=10;
  //默认一行三个item
  FControlLayoutItems.FListLayoutsManager.ItemCountPerLine:=2;


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
