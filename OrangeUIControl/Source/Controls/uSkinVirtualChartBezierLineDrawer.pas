//convert pas to utf8 by ¥

/// <summary>
///   <para>
///     列表框
///   </para>
///   <para>
///     List Box
///   </para>
/// </summary>
unit uSkinVirtualChartBezierLineDrawer;

interface


{$I FrameWork.inc}
{$I Version.inc}

uses
  Classes,
  SysUtils,
  uFuncCommon,
  Types,//定义了TRectF

  //{$IF CompilerVersion>=30.0}
  //{$IFEND}

  uBaseList,
  uBaseLog,
  DateUtils,

  {$IFDEF VCL}
  Messages,
  ExtCtrls,
  Controls,
  {$ENDIF}
  {$IFDEF FMX}
  UITypes,
  FMX.Types,
  FMX.Controls,
  FMX.Dialogs,
  {$ENDIF}


  Math,
  uBaseSkinControl,
  uSkinItems,
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
  uDrawTextParam,
  uDrawLineParam,
  uDrawRectParam,
  uBasePathData,
  uDrawPathParam,
  uSkinImageList,
  uSkinListLayouts,
  uSkinPanelType,
  uSkinCustomListType,
  uSkinVirtualListType,
  uSkinListBoxType,
  uSkinLabelType,
  uSkinItemDesignerPanelType,

  {$IFDEF FMX}
  uSkinFireMonkeyItemDesignerPanel,
  {$ENDIF}

  {$IFDEF OPENSOURCE_VERSION}
  {$ELSE}
  uSkinListViewType,
  {$ENDIF}
  uSkinVirtualChartType,

//  uSkinControlGestureManager,
//  uSkinScrollControlType,
  uDrawPictureParam;


type
  //贝塞尔线状图生成路径
  TVirtualChartSeriesBezierLineDrawer=class(TVirtualChartSeriesDrawer)
  public
    //判断鼠标是否在Item里面
    function PtInItem(ADataItem:TVirtualChartSeriesDataItem;APoint:TPointF):Boolean;override;
    procedure GenerateDrawPathList(APathDrawRect:TRectF);override;
//    function GetDataItemColor(ADataItem:TVirtualChartSeriesDataItem):TDelphiColor;override;
    //绘制Y轴分隔线，X轴刻度值
    function CustomPaint(ACanvas:TDrawCanvas;ASkinMaterial:TSkinControlMaterial;const ADrawRect:TRectF;APaintData:TPaintData;const APathDrawRect:TRectF):Boolean;override;
  end;


implementation


{ TVirtualChartSeriesBezierLineDrawer }

procedure TVirtualChartSeriesBezierLineDrawer.GenerateDrawPathList(
  APathDrawRect: TRectF);
var
  I: Integer;
//  ADataItemRect:TRectF;
//  ADataItemPathRect:TRectF;
  AVirtualChartSeriesList:TVirtualChartSeriesList;
  AXAxisSkinListBox:TSkinListBox;
  ALegendSkinListView:TSkinVirtualList;
  AItemWidth:Double;
  ALeft:Double;
  ADataItem:TVirtualChartSeriesDataItem;
  APathActionItem:TPathActionItem;
  ASkinVirtualChartDefaultMaterial:TSkinVirtualChartDefaultMaterial;
begin
  Inherited;



  AVirtualChartSeriesList:=TVirtualChartSeriesList(Self.FSeries.Collection);

  AXAxisSkinListBox:=TVirtualChartSeriesList(Self.FSeries.Collection).FSkinVirtualChartIntf.Properties.FXAxisSkinListBox;
//  ASkinVirtualChartDefaultMaterial:=TSkinVirtualChartDefaultMaterial(TVirtualChartSeriesList(Self.FSeries.Collection).FSkinVirtualChartIntf.Properties.FSkinControlIntf.GetCurrentUseMaterial);
  ASkinVirtualChartDefaultMaterial:=TSkinVirtualChartDefaultMaterial(TSkinVirtualChart(TVirtualChartSeriesList(Self.FSeries.Collection).FSkinVirtualChartIntf.Properties.SkinControl).CurrentUseMaterial);

  ALegendSkinListView:=TVirtualChartSeriesList(Self.FSeries.Collection).FSkinVirtualChartIntf.Properties.FLegendSkinListView;

  if ALegendSkinListView<>nil then
  begin
      ALegendSkinListView.Visible:=False;
      ALegendSkinListView.OnMouseOverItemChange:=nil;
      ALegendSkinListView.OnPrepareDrawItem:=nil;
  end;

  //然后生成柱子
  //需要最大值,计算出百分比
  ALeft:=0;
  for I := 0 to Self.FSeries.DataItems.Count-1 do
  begin
      ADataItem:=Self.FSeries.DataItems[I];


      ADataItem.FDrawPercent:=0;
      if (AVirtualChartSeriesList.FMaxValue-AVirtualChartSeriesList.FMinValue)>0 then
      begin
        ADataItem.FDrawPercent:=
              (ADataItem.Value-AVirtualChartSeriesList.FMinValue)/(AVirtualChartSeriesList.FMaxValue-AVirtualChartSeriesList.FMinValue);
      end;




      //横排的
      //生成Path列表
      //AItemWidth:=AXAxisSkinListBox.Prop.CalcItemWidth(AXAxisSkinListBox.Prop.Items[I]);
      AItemWidth:=APathDrawRect.Width / AXAxisSkinListBox.Prop.Items.Count;

//      //数据项所在的大矩形-相对坐标
//      ADataItemRect:=RectF(0,0,0,0);
//      ADataItemRect.Left:=ALeft;
//      ADataItemRect.Top:=0;
//      ADataItemRect.Right:=ALeft+AItemWidth;
//      ADataItemRect.Bottom:=APathDrawRect.Height;

      ADataItem.FLinePoint.X:=ALeft+AItemWidth/2;
      ADataItem.FLinePoint.Y:=APathDrawRect.Height*(1-ADataItem.FDrawPercent);



      //下一个Item的左边距
      ALeft:=ALeft+AItemWidth;



      ADataItem.FDrawPathActions.Clear;

      APathActionItem:=TPathActionItem(ADataItem.FDrawPathActions.Add);
      APathActionItem.ActionType:=patStart;

//      ADataItemPathRect.Left:=ADataItemRect.Left+AItemWidth*(1-ABarSizePercent)/2;
//      ADataItemPathRect.Top:=ADataItemRect.Top+APathDrawRect.Height*(1-ADataItem.FDrawPercent);
//      ADataItemPathRect.Right:=ADataItemPathRect.Left+AItemWidth*ABarSizePercent;
//      ADataItemPathRect.Bottom:=ADataItemRect.Bottom;


      //生成圈的Path
      APathActionItem:=TPathActionItem(ADataItem.FDrawPathActions.Add);
      APathActionItem.ActionType:=patAddEllipse;
      APathActionItem.X:=ADataItem.FLinePoint.X-ASkinVirtualChartDefaultMaterial.LineDotRadius;
      //这个柱状图是从底部上来的
      APathActionItem.Y:=ADataItem.FLinePoint.Y-ASkinVirtualChartDefaultMaterial.LineDotRadius;
      APathActionItem.X1:=ADataItem.FLinePoint.X+ASkinVirtualChartDefaultMaterial.LineDotRadius;
      APathActionItem.Y1:=ADataItem.FLinePoint.Y+ASkinVirtualChartDefaultMaterial.LineDotRadius;

      ADataItem.FLineDotRect.Left:=APathDrawRect.Left+APathActionItem.X;
      ADataItem.FLineDotRect.Top:=APathDrawRect.Top+APathActionItem.Y;
      ADataItem.FLineDotRect.Right:=APathDrawRect.Left+APathActionItem.X1;
      ADataItem.FLineDotRect.Bottom:=APathDrawRect.Top+APathActionItem.Y1;


//      APathActionItem:=TPathActionItem(ADataItem.FDrawPathActions.Add);
//      APathActionItem.ActionType:=patGetRegion;

      APathActionItem:=TPathActionItem(ADataItem.FDrawPathActions.Add);
      APathActionItem.ActionType:=patStop;

      //填充
      APathActionItem:=TPathActionItem(ADataItem.FDrawPathActions.Add);
      APathActionItem.ActionType:=patFillPath;

      APathActionItem:=TPathActionItem(ADataItem.FDrawPathActions.Add);
      APathActionItem.ActionType:=patDrawPath;




//      //绝对坐标
//      OffsetRect(ADataItemPathRect,APathDrawRect.Left,APathDrawRect.Top);
//      OffsetRect(ADataItemRect,APathDrawRect.Left,APathDrawRect.Top);
//      ADataItem.FItemRect:=ADataItemRect;
//      ADataItem.FItemDrawRect:=ADataItemRect;
//      ADataItem.FBarPathDrawRect:=ADataItemPathRect;



  end;


end;




function TVirtualChartSeriesBezierLineDrawer.PtInItem(
  ADataItem: TVirtualChartSeriesDataItem; APoint: TPointF): Boolean;
begin
  //线状图,只需要判断鼠标是否在那个圆点上即可
  Result:=PtInRectF(ADataItem.FLineDotRect,APoint);

end;

function TVirtualChartSeriesBezierLineDrawer.CustomPaint(ACanvas: TDrawCanvas;
  ASkinMaterial: TSkinControlMaterial; const ADrawRect: TRectF;
  APaintData: TPaintData; const APathDrawRect: TRectF): Boolean;
var
  I: Integer;
var
//  ADrawRect:TRectF;
  X:Double;
  Y:Double;
  AXAxisSkinListBox:TSkinListBox;
  AYAxisSkinListBox:TSkinListBox;
  ASkinVirtualChartIntf:ISkinVirtualChart;
  ACaptionRect:TRectF;
  AItemWidth:Double;
var
  ASkinVirtualChartDefaultMaterial:TSkinVirtualChartDefaultMaterial;
//var
//  I:Integer;
var
  ADataItem:TVirtualChartSeriesDataItem;
  AItemEffectStates:TDPEffectStates;
  AOldColor:TDelphiColor;
  AItemCaptionWidth:Double;
  ALastItemCaptionDrawLeft:Double;
  APoints:Array of TPointF;
  ADrawPoints:Array of TPointF;
//  APoints:Array of TPoint;
//  AItemPaintData:TPaintData;
//var
//  ASkinVirtualChartDefaultMaterial:TSkinVirtualChartDefaultMaterial;
begin

  ASkinVirtualChartDefaultMaterial:=TSkinVirtualChartDefaultMaterial(ASkinMaterial);
  ASkinVirtualChartIntf:=TVirtualChartSeriesList(Self.FSeries.Collection).FSkinVirtualChartIntf;



//  PaintAxis(ACanvas,ASkinMaterial,ADrawRect,APaintData,APathDrawRect);


  Inherited;



  ASkinVirtualChartDefaultMaterial:=TSkinVirtualChartDefaultMaterial(ASkinMaterial);
//  SetLength(APoints,Self.FSeries.FDataItems.Count);
  SetLength(APoints,Self.FSeries.DataItems.Count);

  //绘制线条
  for I := 0 to Self.FSeries.DataItems.Count-1 do
  begin
    ADataItem:=Self.FSeries.DataItems[I];


    APoints[I].X:=APathDrawRect.Left+ADataItem.FLinePoint.X;
    APoints[I].Y:=APathDrawRect.Top+ADataItem.FLinePoint.Y;

//    APoints[I].X:=Ceil(APathDrawRect.Left+ADataItem.FLinePoint.X);
//    APoints[I].Y:=Ceil(APathDrawRect.Top+ADataItem.FLinePoint.Y);

//    if I+1<Self.FSeries.FDataItems.Count then
//    begin
//      AOldColor:=ASkinVirtualChartDefaultMaterial.FLineColorParam.Color.FColor;
//
//      ASkinVirtualChartDefaultMaterial.FLineColorParam.Color.FColor:=Self.GetDataItemColor(ADataItem);
////      ACanvas.DrawLine(ASkinVirtualChartDefaultMaterial.FLineColorParam,
////                       APathDrawRect.Left+ADataItem.FLinePoint.X,
////                       APathDrawRect.Top+ADataItem.FLinePoint.Y,
////                       APathDrawRect.Left+Self.FSeries.FDataItems[I+1].FLinePoint.X,
////                       APathDrawRect.Top+Self.FSeries.FDataItems[I+1].FLinePoint.Y
////                        );
//      SetLength(ADrawPointFs,4);
//
//      ADrawPointFs[0]:=APointFs[I];
//      getCtrlPoint(APoints,I,pA,pB);
//      AGPPoints[1]:=TGPPointF_Create(pA.X,pA.Y);
//      AGPPoints[2]:=TGPPointF_Create(pB.X,pB.Y);
//      AGPPoints[3]:=TGPPointF_Create(APoints[I+1].X,APoints[I+1].Y);
//      FGraphics.DrawBeziers(AGPPen,AGPPoints);
//
//      ASkinVirtualChartDefaultMaterial.FLineColorParam.Color.FColor:=AOldColor;
//    end;

  end;


//  ACanvas.FCanvas.Pen.Style:=TPenStyle.psSolid;
//  ACanvas.FCanvas.Pen.Color:=Self.GetDataItemColor(ADataItem);
//  ACanvas.FCanvas.Pen.Width:=Ceil(ASkinVirtualChartDefaultMaterial.FLineColorParam.PenWidth);
//  ACanvas.FCanvas.PolyBezier(APoints);


//  if Self.FSeries.FDataItems.Count>1 then
//  begin
//    ASkinVirtualChartDefaultMaterial.FLineColorParam.Color.FColor:=Self.GetDataItemColor(Self.FSeries.FDataItems[0]);
//    ACanvas.DrawBezierLine(ASkinVirtualChartDefaultMaterial.FLineColorParam,APoints);
//    ASkinVirtualChartDefaultMaterial.FLineColorParam.Color.FColor:=AOldColor;
//  end;



  //绘制线条
  SetLength(ADrawPoints,4);
  for I := 0 to Self.FSeries.DataItems.Count-1 do
  begin
    ADataItem:=Self.FSeries.DataItems[I];


//    APoints[I].X:=APathDrawRect.Left+ADataItem.FLinePoint.X;
//    APoints[I].Y:=APathDrawRect.Top+ADataItem.FLinePoint.Y;

    if I<Self.FSeries.DataItems.Count-1 then
    begin
      AOldColor:=ASkinVirtualChartDefaultMaterial.LineColorParam.Color.FColor;

      ASkinVirtualChartDefaultMaterial.LineColorParam.Color.FColor:=Self.GetDataItemColor(ADataItem);
      ADrawPoints[0]:=APoints[I];
      getCtrlPoint(APoints,I,ADrawPoints[1],ADrawPoints[2]);
      ADrawPoints[3]:=APoints[I+1];
//      FGraphics.DrawBeziers(AGPPen,ADrawPoints);
      ACanvas.DrawBezierLine(ASkinVirtualChartDefaultMaterial.LineColorParam,
                             ADrawPoints
                              );

      ASkinVirtualChartDefaultMaterial.LineColorParam.Color.FColor:=AOldColor;
    end;


    //给数据项加上状态
    AItemEffectStates:=Self.FSeries.FListLayoutsManager.ProcessItemDrawEffectStates(ADataItem);
    ASkinVirtualChartDefaultMaterial.LineDotParam.StaticEffectStates:=AItemEffectStates;
//    ASkinVirtualChartDefaultMaterial.FBarColorParam.FillColor.FColor:=Self.GetDataItemColor(ADataItem);
//
//
//    //处理绘制参数的透明度
//    ASkinVirtualChartDefaultMaterial.FBarColorParam.DrawAlpha:=Ceil(ASkinVirtualChartDefaultMaterial.FBarColorParam.CurrentEffectAlpha*1);

//    AItemPaintData:=GlobalNullPaintData;
//    AItemPaintData.IsDrawInteractiveState:=True;
//    ProcessParamEffectStates(ASkinVirtualChartDefaultMaterial.FBarColorParam,
//                                1,
//                                AItemEffectStates,
//                                AItemPaintData
//                                );


    AOldColor:=ASkinVirtualChartDefaultMaterial.BarColorParam.FillColor.FColor;


    ASkinVirtualChartDefaultMaterial.LineDotParam.PenColor.FColor:=Self.GetDataItemColor(ADataItem);


    //{$IFDEF FPC}
    //ASkinVirtualChartDefaultMaterial.FLineDotParam.PenWidth:=10;
    //{$ENDIF}



    ACanvas.DrawPath(ASkinVirtualChartDefaultMaterial.LineDotParam,APathDrawRect,ADataItem.FDrawPathActions);


    ASkinVirtualChartDefaultMaterial.BarColorParam.FillColor.FColor:=AOldColor;

  end;

end;


end.
