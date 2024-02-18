unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,uDrawCanvas,uDrawPicture,uDrawPictureParam,
  BGRABitmap,BGRABitmapTypes,BGRASVG,BGRASVGType,BGRASVGShapes,
  uBasePathData,
  uBGRADrawCanvas,
  uBGRABufferBitmap,
  uSkinPicture,
  uBGRASVGSupport,
  uSkinBufferBitmap,
  uBGRASkinPictureEngine;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private
    FDrawPicture:TDrawPicture;
    FDrawPictureParam:TDrawPictureParam;
  public
    procedure ChangeFill(AElement: TSVGElement; AData: pointer;
      var ARecursive: boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  ADrawCanvas:TDrawCanvas;
  ABitmap:TBGRABitmap;
  ACenter:TPointF;
  ARadius:Double;
  ARad:Double;
  ACos:Double;
  AStartPoint:TPointF;
  AStopPoint:TPointF;
begin
  //PaintBox1.Canvas.Brush.Style:=bsSolid;
  //PaintBox1.Canvas.Brush.Color:=clRed;
  //PaintBox1.Canvas.FillRect(Rect(0,0,PaintBox1.Width,PaintBox1.Height));

  ABitmap:=TBGRABitmap.Create;
  ABitmap.SetSize(PaintBox1.Width,PaintBox1.Height);
  ABitmap.Fill(clSilver);


  ACenter.X:=PaintBox1.Width/2;
  ACenter.Y:=PaintBox1.Height/2;

  ARadius:=PaintBox1.Height/2;

  ////画弧
  //ABitmap.Canvas.Pen.Style:=psSolid;
  //ABitmap.Canvas.Pen.Color:=clRed;
  //
  //ABitmap.Canvas.MoveTo(0,0);
  //ABitmap.Canvas.LineTo(90,90);


  ABitmap.Canvas2D.fillStyle(clRed);

  ABitmap.Canvas2D.strokeStyle(clRed);
  //ABitmap.Canvas2D.LineStyle(psSolid);
  ABitmap.Canvas2D.lineWidth:=2;



  ABitmap.Canvas2D.beginPath;


  //算出起点
  //x都是弧度
  //ARad:=0*PI/180;
  //ACos:=Cos(ARad);
  //AStartPoint.X := ACenter.X + ARadius * ACos;
  //AStartPoint.Y := ACenter.Y + ARadius * Sin(ARad);
  //ABitmap.Canvas2D.MoveTo(AStartPoint.X,AStartPoint.Y);


//  //画圆环弧
//  //2pi表示360度
//  //两个角度的参数是起点角度和终点角度，与其他的不一样
//  ABitmap.Canvas2D.arc(ACenter.X,ACenter.Y,ARadius,0,0 + pi*2/4);
//
//  //ARad:=0*PI/180;
//  //ACos:=Cos(ARad);
//  //AStartPoint.X := ACenter.X + (ARadius-10) * ACos;
//  //AStartPoint.Y := ACenter.Y + (ARadius-10) * Sin(ARad);
//  //ABitmap.Canvas2D.MoveTo(AStartPoint.X,AStartPoint.Y);
//  ABitmap.Canvas2D.arc(ACenter.X,ACenter.Y,ARadius-10,pi*2/4,0,True);
//
//  //ABitmap.Canvas2D.MoveTo(0,0);
//  //ABitmap.Canvas2D.LineTo(90,90);
//
//  ABitmap.Canvas2D.ClosePath;
//
//  ABitmap.Canvas2D.stroke;
//  ABitmap.Canvas2D.fill;



  //测试下负数角度
  //经测试有效果,和想像中的一样
  ABitmap.Canvas2D.arc(ACenter.X,ACenter.Y,ARadius,-pi*2/4,0);
  ABitmap.Canvas2D.stroke;



  //ADrawCanvas:=CreateDrawCanvas('');
  //try
  //  ADrawCanvas.PrepareBitmap(ABitmap);
  //  ADrawCanvas.DrawPicture(FDrawPictureParam,FDrawPicture,RectF(0,0,PaintBox1.Width,PaintBox1.Height));
  //finally
  //  FreeAndNil(ADrawCanvas);
  //end;

  ABitmap.Draw(PaintBox1.Canvas,0,0);

  ABitmap.Free;

end;

procedure TForm1.ChangeFill(AElement: TSVGElement; AData: pointer;
  var ARecursive: boolean);
begin
  if AElement is TSVGDefine then
    ARecursive:= false
  else
  begin
   if not AElement.isFillNone then AElement.fillColor := CSSSkyBlue;
   if not AElement.isStrokeNone then AElement.strokeColor := CSSSkyBlue;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
Var
 bmp: TBGRABitmap;
 svg: TBGRASVG;
 SVGcontent:TStringStream;
 ABGRAPixel:TBGRAPixel;
begin

  GlobalDrawCanvasClass:=TBGRADrawCanvas;
  GlobalSkinPictureClass:=TSkinPicture;
  GlobalSkinPictureEngineClass:=TBGRASkinPictureEngine;
  GlobalSkinGIFPictureEngineClass:=TBGRASkinGIFPictureEngine;
  GlobalDrawPathDataClass:=TBGRADrawPathData;
  GlobalBufferBitmapClass:=TBGRABufferBitmap;


 FDrawPicture:=TDrawPicture.Create;
 FDrawPicture.LoadFromFile('edit.svg');
 FDrawPicture.FixedColor.Color:=clRed;


 FDrawPictureParam:=TDrawPictureParam.Create('','');


 //SVG paint to bitmap
 bmp:= TBGRABitmap.Create;
 SVGcontent:=TStringStream.Create('',TEncoding.UTF8);
 //ABGRAPixel:=clRed;
 try
  SVGcontent.LoadFromFile('edit.svg');
  svg:= TBGRASVG.CreateFromString(SVGcontent.DataString);
   svg.IterateElements(@ChangeFill, nil, true);
  //svg.Fill:=
  try
   if (Image1.Width > 0) and (Image1.Height > 0)
   then
     begin
       bmp.SetSize(Round(Image1.Width),Round(Image1.Height));
       bmp.Fill(clWhite);
       bmp.Canvas2D.strokeStyle(clRed);
       bmp.Canvas2D.fillStyle(clRed);
       svg.StretchDraw(bmp.Canvas2D, taCenter, tlCenter, 0,0,Image1.Width,Image1.Height);
       Image1.Picture.Bitmap.Assign(bmp);
     end;
  finally
   svg.Free;
  end;
 finally
  bmp.Free;
  SVGcontent.Free;
 end;


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDrawPicture);
  FreeAndNil(FDrawPictureParam);
end;




end.

