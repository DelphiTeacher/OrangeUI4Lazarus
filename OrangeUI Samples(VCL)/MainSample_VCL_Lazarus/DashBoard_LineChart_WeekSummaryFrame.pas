//convert pas to utf8 by ¥
unit DashBoard_LineChart_WeekSummaryFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}

  Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  ////公共素材模块
  //EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,


  uSkinVirtualChartType,
  uDrawPathParam,
  uGraphicCommon,
  uDrawParam,

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinPanelType, StdCtrls,
  uSkinButtonType;

type
  TFrameLineChart_WeekSummary = class(TFrame)
    procedure gridDataResize(Sender: TObject);
  private
    { Private declarations }
  public
    FSkinVirtualChart:TSkinVirtualChart;
    constructor Create(AOwner: TComponent);
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameLineChart_WeekSummary.gridDataResize(Sender: TObject);
begin
  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
  //Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);
end;

constructor TFrameLineChart_WeekSummary.Create(AOwner: TComponent);
var
  ASeries:TVirtualChartSeries;
  ADataItem:TVirtualChartSeriesDataItem;
begin
  inherited;
  FSkinVirtualChart:=TSkinVirtualChart.Create(Self);
  FSkinVirtualChart.Parent:=Self;
  FSkinVirtualChart.SetBounds(
                          10,
                          FSkinVirtualChart.Top+FSkinVirtualChart.Height+10,
                          Width-10-10,
                          Height-(FSkinVirtualChart.Top+FSkinVirtualChart.Height+10)-10
                          );
  FSkinVirtualChart.Anchors:=[akLeft,akTop,akRight,akBottom];
//  FSkinVirtualChart.Align:=alClient;
//  FSkinVirtualChart.AlignWithMargins:=True;

  FSkinVirtualChart.SelfOwnMaterialToDefault.IsTransparent:=True;

  FSkinVirtualChart.SelfOwnMaterialToDefault.BarSizePercent:=0.4;
  FSkinVirtualChart.SelfOwnMaterialToDefault.BackColor.IsFill:=True;
  FSkinVirtualChart.SelfOwnMaterialToDefault.BarAxisLineParam.Color.Color:=clGray;
  FSkinVirtualChart.SelfOwnMaterialToDefault.DrawAxisCaptionParam.FontColor:=clGray;


//  //显示X轴的分隔线
//  FSkinVirtualChart.Prop.FXAxisSkinListView.SkinControlType;
//  FSkinVirtualChart.Prop.FXAxisSkinListView.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//  FSkinVirtualChart.Prop.FXAxisSkinListView.SelfOwnMaterialToDefault.IsDrawColLine:=True;
//  FSkinVirtualChart.Prop.FXAxisSkinListView.SelfOwnMaterialToDefault.IsDrawColBeginLine:=True;
//  FSkinVirtualChart.Prop.FXAxisSkinListView.SelfOwnMaterialToDefault.IsDrawColEndLine:=True;
//
//  //显示Y轴的分隔线
//  FSkinVirtualChart.Prop.FYAxisSkinListView.SkinControlType;
//  FSkinVirtualChart.Prop.FYAxisSkinListView.SelfOwnMaterialToDefault.BackColor.BorderWidth:=1;
//  FSkinVirtualChart.Prop.FYAxisSkinListView.SelfOwnMaterialToDefault.DrawItemDevideParam.IsFill:=True;



  //X轴坐标
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Mon';
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Tue';
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Wed';
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Thu';
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Fri';
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Sat';
  FSkinVirtualChart.Properties.AxisItems.Add.Caption:='Sun';



//  //Y轴坐标上的点,自动，不需要设置
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='1,800';
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='1,500';
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='1,200';
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='900';
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='600';
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='300';
//  FSkinVirtualChart.Properties.YAxisItems.Add.Caption:='0';



  //数据
  ASeries:=TVirtualChartSeries(FSkinVirtualChart.Properties.SeriesList.Add);
  ASeries.Caption:='expected';
  ASeries.ChartType:=sctBezierLine;

  ASeries.DataItems.BeginUpdate;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Mon';
  ADataItem.Value:=100;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Tue';
  ADataItem.Value:=120;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Web';
  ADataItem.Value:=161;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Thu';
  ADataItem.Value:=134;
//  ADataItem.Color:=clGreen;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Fri';
  ADataItem.Value:=105;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Sat';
  ADataItem.Value:=160;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Sun';
  ADataItem.Value:=165;


  ASeries.DataItems.EndUpdate;




  //数据
  ASeries:=TVirtualChartSeries(FSkinVirtualChart.Properties.SeriesList.Add);
  ASeries.Caption:='actual';
  ASeries.ChartType:=sctBezierLine;

  ASeries.DataItems.BeginUpdate;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Mon';
  ADataItem.Value:=120;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Tue';
  ADataItem.Value:=82;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Web';
  ADataItem.Value:=91;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Thu';
  ADataItem.Value:=154;
//  ADataItem.Color:=clGreen;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Fri';
  ADataItem.Value:=162;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Sat';
  ADataItem.Value:=140;

  ADataItem:=ASeries.DataItems.Add;
  ADataItem.Caption:='Sun';
  ADataItem.Value:=145;


  ASeries.DataItems.EndUpdate;





end;

end.
