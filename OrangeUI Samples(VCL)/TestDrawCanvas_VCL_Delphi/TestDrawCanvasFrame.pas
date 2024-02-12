unit TestDrawCanvasFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  uDrawCanvas,
  uDrawRectParam,
  Types,
  Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFrameTestDrawCanvas = class(TFrame)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameTestDrawCanvas.PaintBox1Paint(Sender: TObject);
var
  ADrawCanvas:TDrawCanvas;
  ADrawRectParam:TDrawRectParam;
  ADrawRect:TRectF;
  ALeft,ATop:Integer;
var
  ACenter:TPointF;
  ARadius:TPointF;
  ARad:Double;
  ACos:Double;
  AStartPoint:TPointF;
  AStopPoint:TPointF;
  AStartAngle:Double;
  ASweepAngle:Double;

  FCanvas:TCanvas;
  ARect:TRectF;

//var
//  iTop, iHeight: Integer;
//  iLeft,iWidth : Integer;
//  iC: Integer;
//  h,w: Integer;
  Canvas: TCanvas;

//  procedure DrawPathEnveloppeExt(ACanvas: TCanvas; const AiLeft, AiTop, AiRight, AiBottom, AiC: Integer; AiPivotX, AiPivotY: Integer);
//  begin
//    ACanvas.MoveTo(AiLeft,AiTop + AiC);
//
//    //左边竖线
//    ACanvas.LineTo(AiLeft,AiBottom - AiC);
//
//
//    AStartAngle:=-45;
//    ASweepAngle:=90;
//
//    ACenter.X:=(AiLeft+AiLeft + (AiC*2)) div 2;
//    ACenter.Y:=(AiBottom -(AiC*2)+AiBottom) div 2;
//    ACanvas.MoveTo(Ceil(ACenter.X),Ceil(ACenter.Y));
//    ACanvas.LineTo(Ceil(ACenter.X),Ceil(ACenter.Y));
//
//
//
//    //根据中心点、角度，算出圆弧上的点
//    ARad:=AStartAngle*PI/180;
//
//    //x都是弧度
//    ACos:=Cos(ARad);
//    AStartPoint.X := ACenter.X + AiC * ACos;
//    AStartPoint.Y := ACenter.Y + AiC * Sin(ARad);
////    ACanvas.MoveTo(Ceil(AStartPoint.X),Ceil(AStartPoint.Y));
////    ACanvas.LineTo(Ceil(AStartPoint.X+1),Ceil(AStartPoint.Y));
//
//
//
//
//    ARad:=(AStartAngle+ASweepAngle)*PI/180;
//
//    //x都是弧度
//    ACos:=Cos(ARad);
//    AStopPoint.X := ACenter.X + AiC * ACos;
//    AStopPoint.Y := ACenter.Y + AiC * Sin(ARad);
////    ACanvas.MoveTo(Ceil(AStopPoint.X),Ceil(AStopPoint.Y));
////    ACanvas.LineTo(Ceil(AStopPoint.X+1),Ceil(AStopPoint.Y));
//
//
//    SetArcDirection(ACanvas.Handle, AD_CLOCKWISE);
////    SetArcDirection(ACanvas.Handle, AD_COUNTERCLOCKWISE);
//
//    //左下角
//    ACanvas.Arc(
//                  //
//                  AiLeft, AiBottom -(AiC*2),
//
//                  AiLeft + (AiC*2), AiBottom,
//
////                  AiLeft, AiBottom - AiC,
////
////                  AiLeft + AiC + AiC,AiBottom
//                   //计算出起点
//                   Ceil(AStartPoint.X),
//                   Ceil(AStartPoint.Y),
//                   //计算出终点
//                   Ceil(AStopPoint.X),
//                   Ceil(AStopPoint.Y)
//
//                  );
//
//
////    ACanvas.LineTo(AiPivotX-AiC,AiBottom);
////    ACanvas.ArcTo(AiPivotX-(2*AiC),AiBottom -(2*AiC), AiPivotX, AiBottom, AiPivotX - AiC, AiBottom, AiPivotX, AiBottom - AiC);
////    ACanvas.LineTo(AiPivotX ,AiPivotY + (AiC));
////
////    SetArcDirection(ACanvas.Handle, AD_CLOCKWISE);
////
//////    ACanvas.MoveTo(AiPivotX + AiC, AiPivotY );
//////    ACanvas.Arc(AiPivotX,AiPivotY, AiPivotX + (2*AiC), AiPivotY + (2*AiC),  AiPivotX + AiC, AiPivotY, AiPivotX , AiPivotY+ AiC);
//////    ACanvas.MoveTo(AiPivotX + AiC, AiPivotY);
////    ACanvas.ArcTo(AiPivotX,AiPivotY, AiPivotX + (2*AiC), AiPivotY + (2*AiC),  AiPivotX, AiPivotY + AiC, AiPivotX + AiC , AiPivotY);
////
////    SetArcDirection(ACanvas.Handle, AD_COUNTERCLOCKWISE);
////
////
////    ACanvas.LineTo(AiRight-AiC,AiPivotY);
////
////
////    ACanvas.ArcTo(AiRight-(2*AiC),AiPivotY -(2*AiC),AiRight,AiPivotY, AiRight-AiC,AiPivotY, AiRight,AiPivotY - AiC);
////    ACanvas.LineTo(AiRight,AiTop + AiC);
////    ACanvas.ArcTo(AiRight-(AiC*2),AiTop,AiRight,AiTop+(2*AiC),AiRight,AiTop + AiC,AiRight-AiC,AiTop);
////    ACanvas.LineTo(AiLeft+ AiC,AiTop);
////    ACanvas.ArcTo(AiLeft,AiTop,AiLeft+(2*AiC),AiTop + (2*AiC), AiLeft + AiC ,AiTop,AiLeft,AiTop+ AiC);
////    CloseFigure(ACanvas.Handle);
//  end;


begin
//  h := PaintBox1.ClientHeight;
//  w := PaintBox1.ClientWidth;
//
//  iC      := 15;
//  iTop    := 35;
//  iHeight := 165;
//  iLeft   := 50;
//  iWidth  := 250;


  Canvas := PaintBox1.Canvas;

//  BeginPath(Canvas.Handle);
//  DrawPathEnveloppeExt(Canvas, iLeft, iTop, iLeft + iWidth, iTop + iHeight, iC, 200,120);
//  EndPath(Canvas.Handle);

  Canvas.Brush.Color := clLime;
  Canvas.Brush.Style := bsSolid;
  Canvas.Pen.Width   := 2;
  Canvas.Pen.Color   := clGrayText;



//  AStartAngle:=-180;
//  ASweepAngle:=120;
//
//
//  //画圆弧
//  ARect:=RectF(0,0,100,100);
//
//  //圆心
//  ACenter.X:=ARect.Left+ARect.Width/2;
//  ACenter.Y:=ARect.Top+ARect.Height/2;
//
//  //半径
//  ARadius.X:=ARect.Width/2;
//  ARadius.Y:=ARect.Width/2;
//
//
//  //圆弧中心点计算出来，这个位置要用来绘制数据标题
//  //      ARad:=Math.DegToRad(AAngle);
//  //      ARad:=Math.CycleToRad(AAngle);
//  //      ARad:=Math.GradToRad(AAngle);
//  //x都是弧度
//  ARad:=AStartAngle*PI/180;
//  ACos:=Cos(ARad);
//  AStartPoint.X := ACenter.X + ARadius.X * ACos;
//  AStartPoint.Y := ACenter.Y + ARadius.X * Sin(ARad);
//
//
//  //x都是弧度
//  ARad:=(AStartAngle+ASweepAngle)*PI/180;
//  ACos:=Cos(ARad);
//  AStopPoint.X := ACenter.X + ARadius.X * ACos;
//  AStopPoint.Y := ACenter.Y + ARadius.X * Sin(ARad);
//
//
//
//
//
//  if ASweepAngle>0 then
//  begin
//    SetArcDirection(FCanvas.Handle, AD_CLOCKWISE);
//  end
//  else
//  begin
//    SetArcDirection(FCanvas.Handle, AD_COUNTERCLOCKWISE);
//  end;
//
//  //ARC的实现不一样，在Delphi和Lazarus中
//  FCanvas.Arc(Ceil(ARect.Left),Ceil(ARect.Top),
//                   Ceil(ARect.Right),Ceil(ARect.Bottom),
//                   //计算出起点
//                   Ceil(AStartPoint.X),
//                   Ceil(AStartPoint.Y),
//                   //计算出终点
//                   Ceil(AStopPoint.X),
//                   Ceil(AStopPoint.Y)
//                    );












  //test AngleArc
  //SetArcDirection对AngleArc没什么用
//  SetArcDirection(Canvas.Handle, AD_CLOCKWISE);
//  SetArcDirection(Canvas.Handle, AD_COUNTERCLOCKWISE);
//  Canvas.MoveTo(100,50);
//  Canvas.AngleArc(50,50,50,90,90);

//  //通过正负来改变方式
//  Canvas.AngleArc(50,50,50,0,-90);

//  StrokePath(PaintBox1.Canvas.Handle);
//  StrokeAndFillPath(PaintBox1.Canvas.Handle);

//  FCanvas.Pen.Mode

  Exit;



  ADrawCanvas:=CreateDrawCanvas('');
  ADrawCanvas.Prepare(PaintBox1.Canvas);
  try
    ALeft:=0;
    ATop:=0;

    //Fill Rect
    PaintBox1.Canvas.Brush.Style:=bsClear;
    PaintBox1.Canvas.TextOut(ALeft,ATop,'Fill Rect');
    ADrawRect:=RectF(ALeft,ATop+20,ALeft+100,ATop+20+20);
    ADrawRectParam:=TDrawRectParam.Create('','');
    ADrawRectParam.IsFill:=True;
    ADrawRectParam.FillColor.Color:=clBlue;
    ADrawCanvas.DrawRect(ADrawRectParam,ADrawRect);
    FreeAndNil(ADrawRectParam);

    ALeft:=ALeft+120;


    //Draw Rect
    PaintBox1.Canvas.Brush.Style:=bsClear;
    PaintBox1.Canvas.TextOut(ALeft,ATop,'Draw Rect');
    ADrawRect:=RectF(ALeft,ATop+20,ALeft+100,ATop+20+20);
    ADrawRectParam:=TDrawRectParam.Create('','');
    ADrawRectParam.IsFill:=False;
    ADrawRectParam.BorderColor.Color:=clBlue;
    ADrawRectParam.BorderWidth:=1;
    ADrawCanvas.DrawRect(ADrawRectParam,ADrawRect);
    FreeAndNil(ADrawRectParam);



    ALeft:=ALeft+120;


    //Fill and Draw Rect
    PaintBox1.Canvas.Brush.Style:=bsClear;
    PaintBox1.Canvas.TextOut(ALeft,ATop,'Fill and Draw Rect');
    ADrawRect:=RectF(ALeft,ATop+20,ALeft+100,ATop+20+20);
    ADrawRectParam:=TDrawRectParam.Create('','');
    ADrawRectParam.IsFill:=True;
    ADrawRectParam.FillColor.Color:=clRed;
    ADrawRectParam.BorderColor.Color:=clBlack;
    ADrawRectParam.BorderWidth:=1;
    ADrawCanvas.DrawRect(ADrawRectParam,ADrawRect);
    FreeAndNil(ADrawRectParam);


    ALeft:=ALeft+120;


    //Fill Round Rect
    PaintBox1.Canvas.Brush.Style:=bsClear;
    PaintBox1.Canvas.TextOut(ALeft,ATop,'Fill Round Rect');
    ADrawRect:=RectF(ALeft,ATop+20,ALeft+100,ATop+20+20);
    ADrawRectParam:=TDrawRectParam.Create('','');
    ADrawRectParam.IsFill:=True;
    ADrawRectParam.FillColor.Color:=clRed;
    ADrawRectParam.IsRound:=True;
    ADrawCanvas.DrawRect(ADrawRectParam,ADrawRect);
    FreeAndNil(ADrawRectParam);




    ALeft:=ALeft+120;


    //Draw Round Rect
    PaintBox1.Canvas.Brush.Style:=bsClear;
    PaintBox1.Canvas.TextOut(ALeft,ATop,'Draw Round Rect');
    ADrawRect:=RectF(ALeft,ATop+20,ALeft+100,ATop+20+20);
    ADrawRectParam:=TDrawRectParam.Create('','');
    ADrawRectParam.IsFill:=False;
    ADrawRectParam.FillColor.Color:=clRed;
    ADrawRectParam.BorderColor.Color:=clBlack;
    ADrawRectParam.BorderWidth:=1;
    ADrawRectParam.IsRound:=True;
    ADrawCanvas.DrawRect(ADrawRectParam,ADrawRect);
    FreeAndNil(ADrawRectParam);



  finally
    FreeAndNil(ADrawCanvas);
  end;





end;

end.
