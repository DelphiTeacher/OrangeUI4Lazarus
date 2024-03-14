unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,


//  BGRACanvas,
//  BGRABitmap,
//  uDrawCanvas,
//  uSkinPicture,
//  uDrawPicture,
//  uBasePathData,
//  uSkinBufferBitmap,
//  uBGRADrawCanvas,
//  uBGRABufferBitmap,
//  uBGRASkinPictureEngine,


  DashBoard_LineChart_WeekSummaryFrame,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);  private
    { Private declarations }
  public
    FFrame:TFrameLineChart_WeekSummary;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
//  Exit;

//  GlobalDrawCanvasClass:=TBGRADrawCanvas;
//  GlobalSkinPictureClass:=TSkinPicture;
//  GlobalSkinPictureEngineClass:=TBGRASkinPictureEngine;
//  GlobalSkinGIFPictureEngineClass:=TBGRASkinGIFPictureEngine;
//  GlobalDrawPathDataClass:=TBGRADrawPathData;
//  GlobalBufferBitmapClass:=TBGRABufferBitmap;



  FFrame:=TFrameLineChart_WeekSummary.Create(Self);
  FFrame.Parent:=Self;
  FFrame.Align:=alClient;

end;

procedure TForm4.PaintBox1Paint(Sender: TObject);
var
  Points: array[0..11] of TPoint;
begin
//  // 设置 10 个坐标点的位置
//  Points[0] := Point(100, 100);
//  Points[1] := Point(150, 50);
//  Points[2] := Point(200, 100);
//  Points[3] := Point(250, 50);
//  Points[4] := Point(300, 100);
//  Points[5] := Point(350, 50);
//  Points[6] := Point(400, 100);
//  Points[7] := Point(450, 50);
//  Points[8] := Point(500, 100);
//  Points[9] := Point(550, 50);
//
//  // 将起点和终点设置为相同的坐标，以将这 10 个坐标点连起来
//  Points[10] := Points[0];
//  Points[11] := Points[0];
//
//
//
//  // 绘制圆滑的连线
//  PaintBox1.Canvas.Pen.Color:=clRed;
//  PaintBox1.Canvas.Pen.Width:=1;
//  PaintBox1.Canvas.Pen.Style:=psSolid;
//  PaintBox1.Canvas.PolyBezier(Points);
//  PaintBox1.Canvas.Polyline(Points);

end;

end.
