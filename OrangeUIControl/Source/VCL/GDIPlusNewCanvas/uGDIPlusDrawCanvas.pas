﻿//convert pas to utf8 by ¥
unit uGDIPlusDrawCanvas;

interface
{$I FrameWork.inc}

uses
  Windows,
  SysUtils,
  Classes,
  Types,
  Forms,
  Math,
  GdiPlus,
  Dialogs,
  Graphics,
  ActiveX,
  {$IFDEF DELPHI}
  PngImage,
  {$ENDIF}
  uFuncCommon,
  uGraphicCommon,
  uDrawPicture,
  uDrawCanvas,
  uSkinPicture,
  uBasePathData,
  uDrawParam,
  uDrawTextParam,
  uDrawRectParam,
  uDrawLineParam,
  uDrawPathParam,
  uDrawPictureParam,
  uGDIPlusSkinPictureEngine;


type
//  {$Region 'GDIPlus画布'}
  TSide = (Top, Left, Bottom, Right);
  TSides=set of TSide;



  TGPPointArray=array of TGPPoint;
  TByteArray=array of Byte;



  TGDIPlusDrawPathData=class(TBaseDrawPathData)
  public
    OriginX:Double;
    OriginY:Double;
    Path:IGPGraphicsPath;
//    Region:IGPRegion;
  public
    constructor Create;override;
    destructor Destroy;override;
//  private
//    procedure GetRegion;
  public
    procedure Clear;override;
    procedure MoveTo(const X:Double;const Y:Double);override;
    procedure LineTo(const X:Double;const Y:Double);override;


    //添加一个矩形
    procedure AddRect(const ARect:TRectF);override;
    //添加一个饼图
    procedure AddPie(const ARect:TRectF;
                      AStartAngle, ASweepAngle:Double
                      );override;
    //添加一个圆边
    procedure AddArc(const ARect:TRectF;
                      AStartAngle, ASweepAngle:Double
                      );override;
    //添加一个圆
    procedure AddEllipse(const ARect:TRectF);override;
//    //闭合路径
//    procedure Close;override;
//    //获取区域,用来判断鼠标是否在区域内
//    procedure GetRegion;override;
//    //判断鼠标是否在路径内
//    function IsInRegion(const APoint: TPointF):Boolean;override;
  end;




  { TGDIPlusDrawCanvas }

  TGDIPlusDrawCanvas=class(TDrawCanvas)
  private
    function CreateGPFont(//ADrawTextParam:TDrawTextParam;
                          AFontSize:Integer;
                          AFontStyles:TFontStyles;
                          AFontFamily:String;
                          var AGPFont:IGPFont):Boolean;
    function CreateGPBrush(//ADrawTextParam:TDrawTextParam;
                            AFontColor:TDrawColor;
                            ADrawAlpha:Integer;
                            var AGPBrush:IGPBrush):Boolean;
    function CreateGPStringFormat(ADrawTextParam:TDrawTextParam;var AGPStringFormat:IGPStringFormat):Boolean;
  public
    FGraphics:IGPGraphics;

    constructor Create;override;
    destructor Destroy;override;

  public
    procedure Clear(AColor:TColor;ADrawRect:TRectF);override;

    //函数//
    //准备DC
    function CustomPrepare:Boolean;override;
    //反准备DC
    function CustomUnPrepare:Boolean;override;



    //设置剪裁矩形
    procedure SetClip(const AClipRect:TRectF);override;
    //取消剪裁矩形
    procedure ResetClip;override;


    //绘制设计时矩形
    function DrawDesigningRect(const ADrawRect:TRectF;
                                const ABorderColor:TDelphiColor):Boolean;override;
    //绘制设计时文本
    function DrawDesigningText(const ADrawRect:TRectF;
                                const AText:String):Boolean;override;



    //计算字体绘制尺寸
    function CalcTextDrawSize(const ADrawTextParam:TDrawTextParam;
                              const AText:String;
                              const ADrawRect:TRectF;
                              var ADrawWidth:TControlSize;
                              var ADrawHeight:TControlSize;
                              const ACalcDrawSizeType:TCalcDrawSizeType):Boolean;override;
    //绘制文字
    function DrawText(const ADrawTextParam:TDrawTextParam;
                      const AText:String;
                      const ADrawRect:TRectF;
                      const AColorTextList:IColorTextList=nil):Boolean;override;


    //绘制图片
    function DrawSkinPicture(const ADrawPictureParam:TDrawPictureParam;
                            const ASkinPicture:TSkinPicture;
                            const ADrawRect:TRectF;
                            //是否可以直接使用SrcRect和DestRect,如果不可以直接使用，则需要再次计算
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF
                            ):Boolean;override;





    //绘制矩形函数//
    function DrawRect(const ADrawRectParam:TDrawRectParam;
                      const ADrawRect:TRectF):Boolean;override;


    //绘制直线函数//
    function DrawLine(const ADrawLineParam:TDrawLineParam;
                      X1:Double;
                      Y1:Double;
                      X2:Double;
                      Y2:Double):Boolean;override;


    //绘制路径//
    function DrawPathData(ADrawPathData:TBaseDrawPathData):Boolean;override;
    function FillPathData(ADrawPathParam:TDrawPathParam;ADrawPathData:TBaseDrawPathData):Boolean;override;
    //绘制路径
    function DrawPath(ADrawPathParam:TDrawPathParam;const ADrawRect:TRectF;APathActions:TPathActionCollection):Boolean;override;


  end;
//  {$EndRegion}


//function TGPRect.Create(const Rect: TRectF): TGPRect;overload;
//function TGPRect.Create(const AX, AY, AWidth, AHeight: Single): TGPRect;overload;


var
  IsHighDPIFont:Boolean;
  GlobalGPTextRenderingHint:TGPTextRenderingHint;

function TGPRectF_CreateF(const Rect: TRectF): TGPRectF;

//将位图剪裁成圆形
function RoundSkinPicture(ASkinPicture:TSkinPicture;
                          AXRadius:Double=-1;
                          AYRadius:Double=-1//;
//                          ACorners: TCorners=[TCorner.TopLeft, TCorner.TopRight, TCorner.BottomLeft, TCorner.BottomRight];
//                          const AQuality: TCanvasQuality = TCanvasQuality.SystemDefault
                          ):TSkinPicture;


implementation



//function GetScreenLogPixels:Integer;
//var
//  DC: HDC;
//begin
//  DC := GetDC(0);
//  try
//    Result := GetDeviceCaps(DC, LOGPIXELSY);
//  finally
//    ReleaseDC(0,DC);
//  end;
//end;
//
//
//function ScreenScaleSize(ASize:Single):Single;
//begin
//  Result:=ASize*GetScreenScaleRate;
//end;


//function TGPRect.Create(const AX, AY, AWidth, AHeight: Single): TGPRect;
//begin
//  Result.X:=Ceil(AX);
//  Result.Y:=Ceil(AY);
//  Result.Width:=Ceil(AWidth);
//  Result.Height:=Ceil(AHeight);
//end;

//function TGPRect.Create(const Rect: TRectF): TGPRect;
//begin
//  Result.X:=Ceil(Rect.Left);
//  Result.Y:=Ceil(Rect.Top);
//  Result.Width:=Ceil(Rect.Width);
//  Result.Height:=Ceil(Rect.Height);
//end;

function TGPRectF_CreateF(const Rect: TRectF): TGPRectF;
begin
  Result.X:=Rect.Left;
  Result.Y:=Rect.Top;
  Result.Width:=Rect.Width;
  Result.Height:=Rect.Height;
end;


{ TGDIPlusDrawCanvas }

function TGDIPlusDrawCanvas.CustomPrepare: Boolean;
begin
    FGraphics:=TGPGraphics.Create(Self.Handle);
end;

function TGDIPlusDrawCanvas.CustomUnPrepare: Boolean;
begin
    Result:=False;
    FGraphics:=nil;
    Result:=True;
end;

procedure TGDIPlusDrawCanvas.SetClip(const AClipRect:TRectF);
begin
  Self.FGraphics.SetClip(TGPRectF_CreateF(AClipRect));
end;

procedure TGDIPlusDrawCanvas.ResetClip;
begin
  Self.FGraphics.ResetClip;
end;

function RoundSkinPicture(ASkinPicture: TSkinPicture; AXRadius,
  AYRadius: Double): TSkinPicture;
var
  ABitmap:IGPBitmap;
  ARroundBitmap:IGPBitmap;
  AGraphics:IGPGraphics;
  ABrush:IGPBrush;
  AGPImageFormat:TGPImageFormat;
  APngImage:TPngImage;
  AStream:TMemoryStream;
  AAdapter:IStream;
begin
  Result:=nil;

  ABitmap:=nil;
  if ASkinPicture.SkinPictureEngine is TGDIPlusSkinPictureEngine then
  begin
    ABitmap:=TGDIPlusSkinPictureEngine(ASkinPicture.SkinPictureEngine).Bitmap;
  end
  else
  if ASkinPicture.SkinPictureEngine is TGDIPlusSkinGIFPictureEngine then
  begin
    ABitmap:=TGDIPlusSkinGIFPictureEngine(ASkinPicture.SkinPictureEngine).Bitmap;
  end;

  if ABitmap=nil then
  begin
    Exit;
  end;
  ABrush:=TGPTextureBrush.Create(ABitmap);

  ARroundBitmap:=TGPBitmap.Create(ABitmap.Width, ABitmap.Height,PixelFormat32bppARGB);
  AGraphics:=TGPGraphics.Create(ARroundBitmap);
//  AGraphics.DrawImage(ABitmap, TGPRect.Create(0, 0, ABitmap.Width,ABitmap.Height));
  AGraphics.FillEllipse(ABrush,TGPRect.Create(0, 0, ABitmap.Width,ABitmap.Height));


  AGPImageFormat:=TGPImageFormat.Create();

//  ARroundBitmap.Save('C:\round.png',AGPImageFormat.Png);
  AStream:=TMemoryStream.Create;
  AAdapter:=TCFStreamAdapter.Create(AStream, soReference);
  APngImage:=TPngImage.Create;
  try
    ARroundBitmap.Save(AAdapter,AGPImageFormat.Png);
    AStream.Position:=0;

    APngImage.LoadFromStream(AStream);

    Result:=TSkinPicture.Create;
    Result.Assign(APngImage);
  finally
    FreeAndNil(AGPImageFormat);
    FreeAndNil(AStream);
    FreeAndNil(APngImage);
  end;

end;

function TGDIPlusDrawCanvas.CreateGPBrush(//ADrawTextParam: TDrawTextParam;
                                          AFontColor:TDrawColor;ADrawAlpha:Integer;var AGPBrush: IGPBrush): Boolean;
var
  AGPColor:TGPColor;
begin
  Result:=False;

  //字体颜色
//  AGPColor:=TGPColor.CreateFromColorRef(ADrawTextParam.CurrentEffectFontColor.Color);
//  TGPColor.SetAlpha(AGPColor.FArgb,
//                    Ceil(ADrawTextParam.CurrentEffectFontColor.Alpha
//                    *ADrawTextParam.DrawAlpha/255)
//          );

  AGPColor:=TGPColor.CreateFromColorRef(AFontColor.Color);
  AGPColor.Alpha:=
                    Ceil(AFontColor.Alpha
                    *ADrawAlpha/255)
          ;

  AGPBrush:=TGPSolidBrush.Create(AGPColor);

  Result:=True;
end;

function TGDIPlusDrawCanvas.CreateGPStringFormat(ADrawTextParam: TDrawTextParam;var AGPStringFormat:IGPStringFormat): Boolean;
var
  AGPStringFormatFlags:TGPStringFormatFlags;
begin

  Result:=False;

  AGPStringFormatFlags:=[];

//  //确定绘制风格
//  if fftDirectionRightToLeft in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsDirectionRightToLeft];
//  end
//  else if fftDirectionVertical in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsDirectionVertical];
//  end
//  else if fftDirectionRightToLeft in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsDirectionRightToLeft];
//  end
//  else if fftNoFitBlackBox in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsNoFitBlackBox];
//  end
//  else if fftDisplayFormatControl in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsDisplayFormatControl];
//  end
//  else if fftNoFontFallback in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsNoFontFallback];
//  end
//  else if fftMeasureTrailingSpaces in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsMeasureTrailingSpaces];
//  end
//  else
  if //(fftNoWrap in ADrawTextParam.FontFormat) or
    not ADrawTextParam.IsWordWrap then
  begin
    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsNoWrap];
  end;
//  else if fftLineLimit in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsLineLimit];
//  end
//  else if fftNoClip in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsNoClip];
//  end
//  else if fftBypassGDI in ADrawTextParam.FontFormat then
//  begin
//    AGPStringFormatFlags:=AGPStringFormatFlags+[StringFormatFlagsBypassGDI];
//  end;

  AGPStringFormat:=TGPStringFormat.Create(AGPStringFormatFlags);


//type
//  TGPStringTrimming = (
//    StringTrimmingNone              = 0,
//    StringTrimmingCharacter         = 1,
//    StringTrimmingWord              = 2,
//    StringTrimmingEllipsisCharacter = 3,
//    StringTrimmingEllipsisWord      = 4,
//    StringTrimmingEllipsisPath      = 5);
//
//    StringTrimmingNone              = 0,
//    StringTrimmingCharacter         = 1,
//    StringTrimmingWord              = 2,
//    StringTrimmingEllipsisCharacter = 3,
//    StringTrimmingEllipsisWord      = 4,
//    StringTrimmingEllipsisPath      = 5);

  //字体截断
  case ADrawTextParam.FontTrimming of
    fttNone:
    begin
      AGPStringFormat.Trimming:=StringTrimmingNone;
    end;
    fttCharacter:
    begin
      AGPStringFormat.Trimming:=StringTrimmingEllipsisCharacter;
    end;
    fftWord:
    begin
      AGPStringFormat.Trimming:=StringTrimmingEllipsisWord;
    end;
  end;

  //字体水平对齐
  case ADrawTextParam.FontHorzAlign of
    fhaLeft: AGPStringFormat.Alignment:=StringAlignmentNear;
    fhaCenter: AGPStringFormat.Alignment:=StringAlignmentCenter;
    fhaRight: AGPStringFormat.Alignment:=StringAlignmentFar;
  end;

  //字体垂直对齐
  case ADrawTextParam.FontVertAlign of
    fvaTop: AGPStringFormat.LineAlignment:=StringAlignmentNear;
    fvaCenter: AGPStringFormat.LineAlignment:=StringAlignmentCenter;
    fvaBottom: AGPStringFormat.LineAlignment:=StringAlignmentFar;
  end;

  Result:=True;
end;

function TGDIPlusDrawCanvas.CreateGPFont(//ADrawTextParam: TDrawTextParam;
                                        AFontSize:Integer;
                                        AFontStyles:TFontStyles;
                                        AFontFamily:String;
                                        var AGPFont: IGPFont): Boolean;
var
  AEmSize:Single;
  AGPFontFamily:IGPFontFamily;
  AGPFontStyle:TGPFontStyle;
begin
  Result:=False;

//  //确定字体大小
//  {$IF CompilerVersion>=35}
//  AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
//                        GetDeviceCaps(Handle,LOGPIXELSY),72))*GetScreenScaleRate;
//  {$ELSE}
//  AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
//                        GetDeviceCaps(Handle,LOGPIXELSY),72));//*GetScreenScaleRate;
//  {$ENDIF}

//
//  if ADrawTextParam.CurrentEffectFontSize<8 then
//  begin
//    IsHighDPIFont:=True;
////    AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
////                          GetDeviceCaps(Handle,LOGPIXELSY),72))*GetScreenScaleRate;
////  end
////  else
////  begin
////    AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
////                          GetDeviceCaps(Handle,LOGPIXELSY),72));//*GetScreenScaleRate;
//  end;
//  if IsHighDPIFont then
//  begin
//    AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
//                          GetDeviceCaps(Handle,LOGPIXELSY),72))*GetScreenScaleRate;
//  end
//  else
//  begin
//    AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
//                          GetDeviceCaps(Handle,LOGPIXELSY),72));//*GetScreenScaleRate;
//  end;


  if AFontSize<8 then
  begin
    IsHighDPIFont:=True;
//    AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
//                          GetDeviceCaps(Handle,LOGPIXELSY),72))*GetScreenScaleRate;
//  end
//  else
//  begin
//    AEmSize:=Abs(-MulDiv(ADrawTextParam.CurrentEffectFontSize,
//                          GetDeviceCaps(Handle,LOGPIXELSY),72));//*GetScreenScaleRate;
  end;
  if IsHighDPIFont then
  begin
    AEmSize:=Abs(-MulDiv(AFontSize,
                          GetDeviceCaps(Handle,LOGPIXELSY),72))*GetScreenScaleRate;
  end
  else
  begin
    AEmSize:=Abs(-MulDiv(AFontSize,
                          GetDeviceCaps(Handle,LOGPIXELSY),72));//*GetScreenScaleRate;
  end;



  //字体风格
  AGPFontStyle:=[];
  if fsBold in AFontStyles then
  begin
    AGPFontStyle:=AGPFontStyle+[FontStyleBold];
  end;
  if fsItalic in AFontStyles then
  begin
    AGPFontStyle:=AGPFontStyle+[FontStyleItalic];
  end;
  if fsUnderline in AFontStyles then
  begin
    AGPFontStyle:=AGPFontStyle+[FontStyleUnderline];
  end;
  if fsStrikeout in AFontStyles then
  begin
    AGPFontStyle:=AGPFontStyle+[FontStyleStrikeout];
  end;



  //创建字体
  if Not GlobalIsUseDefaultFontFamily or (GlobalDefaultFontFamily='') then
  begin
//    {$IFDEF FPC}
    if AFontFamily='default' then
    begin
      AFontFamily:='Tahoma';
    end;
//    {$ENDIF}

    AGPFontFamily:=TGPFontFamily.Create(AFontFamily,nil);
  end
  else
  begin
    AGPFontFamily:=TGPFontFamily.Create(GlobalDefaultFontFamily,nil);
  end;
  AGPFont:=TGPFont.Create(AGPFontFamily,AEmSize,AGPFontStyle,UnitPixel);




  Result:=True;
end;

constructor TGDIPlusDrawCanvas.Create;
begin
  inherited;
end;

destructor TGDIPlusDrawCanvas.Destroy;
begin
  inherited;
end;

procedure TGDIPlusDrawCanvas.Clear(AColor:TColor;ADrawRect:TRectF);
begin
  FGraphics.Clear(TGPColor.CreateFromColorRef(AColor));
end;



function TGDIPlusDrawCanvas.DrawDesigningRect(const ADrawRect:TRectF;
                                const ABorderColor:TDelphiColor):Boolean;
var
  AGPPen:IGPPen;
  AGPColor:TGPColor;
begin
  if GlobalIsDrawDesigningRect then
  begin
    AGPColor:=TGPColor.CreateFromColorRef(clGray);
    AGPColor.Alpha:=180;
    AGPPen:=TGPPen.Create(AGPColor);
    AGPPen.DashStyle:=TGPDashStyle.DashStyleDot;
    FGraphics.DrawRectangle(AGPPen,TGPRectF.Create(ADrawRect.Left,ADrawRect.Top,ADrawRect.Width-1,ADrawRect.Height-1));
  end;
end;

function TGDIPlusDrawCanvas.DrawDesigningText(const ADrawRect:TRectF;
                                const AText:String):Boolean;
var
  AGPFont:IGPFont;
  AGPBrush:IGPBrush;
  AGPColor:TGPColor;
  AGPStringFormat:IGPStringFormat;
begin

  if GlobalIsDrawDesigningName then
  begin

    AGPColor:=TGPColor.CreateFromColorRef(clGray);
    AGPColor.Alpha:=180;
    AGPBrush:=TGPSolidBrush.Create(AGPColor);
    AGPStringFormat:=TGPStringFormat.Create();
    AGPFont:=TGPFont.Create('Tahoma',13,[],UnitPixel);
    FGraphics.DrawString(AText,AGPFont,TGPRectF.Create(ADrawRect.Left,ADrawRect.Top,ADrawRect.Width-1,ADrawRect.Height-1),
        AGPStringFormat,AGPBrush);

  end;
end;







//计算字体绘制尺寸
function TGDIPlusDrawCanvas.CalcTextDrawSize(const ADrawTextParam:TDrawTextParam;
                              const AText:String;
                              const ADrawRect:TRectF;
                              var ADrawWidth:TControlSize;
                              var ADrawHeight:TControlSize;
                              const ACalcDrawSizeType:TCalcDrawSizeType):Boolean;
var
  ARect:TGPRectF;
  AGPFont:IGPFont;
  AGPStringFormat:IGPStringFormat;
var
  ADrawRectF:TGPRectF;
begin

  Result:=False;

//  CreateGPFont(ADrawTextParam,AGPFont);
  CreateGPFont(ADrawTextParam.CurrentEffectFontSize,ADrawTextParam.CurrentEffectFontStyle,ADrawTextParam.CurrentEffectFontName,AGPFont);

  CreateGPStringFormat(ADrawTextParam,AGPStringFormat);


  if Not ADrawTextParam.IsWordWrap then
  begin
      if AText<>'' then
      begin
        ARect:=FGraphics.MeasureString(AText,AGPFont,TGPPointF.Create(0,0),AGPStringFormat);

        ADrawWidth:=Ceil(ARect.Width);
        ADrawHeight:=Ceil(ARect.Height);

      end
      else
      begin
        ARect:=FGraphics.MeasureString('王能',AGPFont,TGPPointF.Create(0,0),AGPStringFormat);

        ADrawWidth:=0;
        ADrawHeight:=Ceil(ARect.Height);

      end;
  end
  else
  begin
      if AText<>'' then
      begin
        ADrawRectF:=TGPRectF_CreateF(ADrawRect);
        ADrawRectF.Height:=MaxInt;

        ARect:=FGraphics.MeasureString(AText,AGPFont,ADrawRectF,AGPStringFormat);

        ADrawWidth:=Ceil(ARect.Width);
        ADrawHeight:=Ceil(ARect.Height);
      end
      else
      begin
        ARect:=FGraphics.MeasureString('王能',AGPFont,TGPPointF.Create(0,0),AGPStringFormat);

        ADrawWidth:=0;
        ADrawHeight:=Ceil(ARect.Height);
      end;
  end;

  Result:=True;
end;


function TGDIPlusDrawCanvas.DrawLine(const ADrawLineParam:TDrawLineParam;
                                      X1:Double;
                                      Y1:Double;
                                      X2:Double;
                                      Y2:Double):Boolean;
var
  APt1, APt2: TPointF;
  ARectF:TRectF;
var
  AGPPen:IGPPen;
  AGPColor:TGPColor;
begin
  Result:=False;

  if (ADrawLineParam.PenWidth=0)
  then
  begin
    Exit;
  end;


  Result:=True;

  if IsSameDouble(ADrawLineParam.PenWidth,0)
  then
  begin
    Exit;
  end;




  ARectF:=RectF(X1,Y1,X2,Y2);
  ARectF:=ADrawLineParam.CalcDrawRect(ARectF);
  X1:=ARectF.Left;
  Y1:=ARectF.Top;
  X2:=ARectF.Right;
  Y2:=ARectF.Bottom;




  Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeAntiAlias;

  AGPColor:=TGPColor.CreateFromColorRef(ADrawLineParam.Color.Color);
//  TGPColor.SetAlpha(AGPColor.FArgb,ADrawLineParam.Color.Alpha);
  AGPColor.Alpha:=ADrawLineParam.Color.Alpha;

  AGPPen:=TGPPen.Create(AGPColor, ADrawLineParam.PenWidth);
  FGraphics.DrawLine(AGPPen,X1,Y1,X2,Y2);


  Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeDefault;

  Result:=True;
end;

function TGDIPlusDrawCanvas.DrawPath(ADrawPathParam:TDrawPathParam;const ADrawRect:TRectF;APathActions:TPathActionCollection):Boolean;
//var
//  AGPPen:IGPPen;
//  AGPColor:TGPColor;
////  AGPPathData:IGPPathData;
////  AGPGraphicsPath:IGPGraphicsPath;
////begin
////  ACanvas.FCanvas.Stroke.Thickness:=ADrawPathData.PenWidth;
////  ACanvas.FCanvas.Stroke.Kind := TBrushKind.Solid;
////  ACanvas.FCanvas.Stroke.Color := ADrawPathData.PenColor.Color;
////  ACanvas.FCanvas.DrawPath(ADrawPathData.PathData,1,ACanvas.FCanvas.Stroke);
//begin
//  Result:=False;
//
////  if (ADrawLineParam.PenWidth=0)
////  then
////  begin
////    Exit;
////  end;
//
//  AGPColor:=TGPColor.CreateFromColorRef(ADrawPathData.PenColor.Color);
//  TGPColor.SetAlpha(AGPColor.FArgb,ADrawPathData.PenColor.Alpha);
//
//  AGPPen:=TGPPen.Create(AGPColor, ADrawPathData.PenWidth);
//
////  AGPPathData:=ADrawPathData.PathData;
////
////  AGPGraphicsPath:=TGPGraphicsPath.Create(
////                     TGPPointArray(AGPPathData.PointPtr),
////                     TByteArray(AGPPathData.TypePtr)
////                     );
//
//  FGraphics.DrawPath(AGPPen,TGDIPlusDrawPathData(ADrawPathData).Path);
//
//  Result:=True;
var
  I: Integer;
  BDrawRect:TRectF;
  APathActionItem:TPathActionItem;
  ADrawPathData:TBaseDrawPathData;
  ARect:TRectF;
begin
  //根据DrawRectSetting返回需要绘制的实际矩形
  BDrawRect:=ADrawPathParam.CalcDrawRect(ADrawRect);

  ADrawPathData:=TBaseDrawPathData(APathActions.FDrawPathData);

  ADrawPathData.PenWidth:=ADrawPathParam.CurrentEffectPenWidth;
  ADrawPathData.PenColor.Color:=ADrawPathParam.CurrentEffectPenColor.Color;


//  ADrawPathData.Stroke.Thickness:=ADrawPathParam.CurrentEffectPenWidth;
//  ADrawPathData.Stroke.Kind := TBrushKind.Solid;
//  ADrawPathData.Stroke.Color := ADrawPathParam.CurrentEffectPenColor.Color;

//  AGPColor:=TGPColor.CreateFromColorRef(ADrawPathData.PenColor.Color);
//  TGPColor.SetAlpha(AGPColor.FArgb,ADrawPathData.PenColor.Alpha);
//
//  AGPPen:=TGPPen.Create(AGPColor, ADrawPathData.PenWidth);

  Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeHighQuality;

//  if APathActions.FIsChanged then
//  begin
    ADrawPathData.Clear;
//  end;

  for I := 0 to APathActions.Count-1 do
  begin
    APathActionItem:=APathActions[I];
    case APathActionItem.ActionType of
      patClear:
      begin
//        if APathActions.FIsChanged then
//        begin
          ADrawPathData.Clear;
//        end;
      end;
      patMoveTo:
      begin
//        if APathActions.FIsChanged then
//        begin
          ADrawPathData.MoveTo(
                              BDrawRect.Left+(APathActionItem.GetX(BDrawRect)),
                              BDrawRect.Top+(APathActionItem.GetY(BDrawRect))
                              );
//        end;
      end;
      patCurveTo:
      begin
//        if APathActions.FIsChanged then
//        begin
          ADrawPathData.CurveTo(
                                BDrawRect.Left+APathActionItem.GetX(BDrawRect),
                                BDrawRect.Top+APathActionItem.GetY(BDrawRect),

                                BDrawRect.Left+APathActionItem.GetX1(BDrawRect),
                                BDrawRect.Top+APathActionItem.GetY1(BDrawRect),

                                BDrawRect.Left+APathActionItem.GetX2(BDrawRect),
                                BDrawRect.Top+APathActionItem.GetY2(BDrawRect)
                                );
//        end;
      end;
      patLineTo:
      begin
//        if APathActions.FIsChanged then
//        begin
          ADrawPathData.LineTo(
                              BDrawRect.Left+(APathActionItem.GetX(BDrawRect)),
                              BDrawRect.Top+(APathActionItem.GetY(BDrawRect))
                              );
//        end;
      end;
      patDrawPath:
      begin
        if BiggerDouble(ADrawPathParam.CurrentEffectPenWidth,0) then
        begin
//          Self.FGraphics.DrawPath();

          Self.DrawPathData(
                ADrawPathData//,
//                ADrawPathParam.DrawAlpha/255,
//                ADrawPathData.Stroke
                );
        end;
//        if APathActions.FIsChanged then
//        begin
          TGDIPlusDrawPathData(ADrawPathData).Path.Reset;//不然在画CheckBox的勾时,线条会合起来
//        end;
      end;
      patFillPath:
      begin

          //创建画刷
          FillPathData(ADrawPathParam,ADrawPathData);
//          Self.FCanvas.Fill.Kind:=FMX.Graphics.TBrushKind.bkSolid;
//          Self.FCanvas.Fill.Color:=ADrawPathParam.CurrentEffectFillDrawColor.Color;
//
//          Self.FCanvas.FillPath(
//                ADrawPathData.Path,
//                ADrawPathParam.DrawAlpha/255,
//                Self.FCanvas.Fill);

      end;
      patDrawAndFillPath:
      begin

          //创建画刷
          FillPathData(ADrawPathParam,ADrawPathData);
//          Self.FCanvas.Fill.Kind:=FMX.Graphics.TBrushKind.bkSolid;
//          Self.FCanvas.Fill.Color:=ADrawPathParam.CurrentEffectFillDrawColor.Color;
//
//          Self.FCanvas.FillPath(
//                ADrawPathData.Path,
//                ADrawPathParam.DrawAlpha/255,
//                Self.FCanvas.Fill);

      end;



      patAddRect:
      begin
//        if APathActions.FIsChanged then
//        begin
          ARect:=RectF(
                      BDrawRect.Left+APathActionItem.GetX(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY(BDrawRect),
                      BDrawRect.Left+APathActionItem.GetX1(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY1(BDrawRect)
                      );
          ADrawPathData.AddRect(ARect);
//        end;
      end;
      patAddPie:
      begin
//        if APathActions.FIsChanged then
//        begin
          ARect:=RectF(
                      BDrawRect.Left+APathActionItem.GetX(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY(BDrawRect),
                      BDrawRect.Left+APathActionItem.GetX1(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY1(BDrawRect)
                      );
          //饼图扇形鼠标移上去要变大
          ARect:=ADrawPathParam.CalcDrawPathRect(ARect);
          ADrawPathData.AddPie(ARect,APathActionItem.StartAngle,APathActionItem.SweepAngle);
//        end;
      end;
      patAddArc:
      begin
//        if APathActions.FIsChanged then
//        begin
          ARect:=RectF(
                      BDrawRect.Left+APathActionItem.GetX(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY(BDrawRect),
                      BDrawRect.Left+APathActionItem.GetX1(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY1(BDrawRect)
                      );
          //饼图扇形鼠标移上去要变大
          ARect:=ADrawPathParam.CalcDrawPathRect(ARect);
          ADrawPathData.AddArc(ARect,APathActionItem.StartAngle,APathActionItem.SweepAngle);
//        end;
      end;
      patAddEllipse:
      begin
//        if APathActions.FIsChanged then
//        begin
          ARect:=RectF(
                      BDrawRect.Left+APathActionItem.GetX(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY(BDrawRect),
                      BDrawRect.Left+APathActionItem.GetX1(BDrawRect),
                      BDrawRect.Top+APathActionItem.GetY1(BDrawRect)
                      );
          ARect:=ADrawPathParam.CalcDrawPathRect(ARect);
          ADrawPathData.AddEllipse(ARect);
//        end;
      end;
//      patGetRegion:
//      begin
//          ADrawPathData.GetRegion;
//      end;


    end;
  end;

  APathActions.FIsChanged:=False;

  Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeDefault;


end;

function TGDIPlusDrawCanvas.DrawPathData(ADrawPathData: TBaseDrawPathData): Boolean;
var
  AGPPen:IGPPen;
  AGPColor:TGPColor;
//  AGPPathData:IGPPathData;
//  AGPGraphicsPath:IGPGraphicsPath;
//begin
//  ACanvas.FCanvas.Stroke.Thickness:=ADrawPathData.PenWidth;
//  ACanvas.FCanvas.Stroke.Kind := TBrushKind.Solid;
//  ACanvas.FCanvas.Stroke.Color := ADrawPathData.PenColor.Color;
//  ACanvas.FCanvas.DrawPath(ADrawPathData.PathData,1,ACanvas.FCanvas.Stroke);
begin
  Result:=False;
//  Self.FCanvas.Stroke.Thickness:=ADrawPathData.PenWidth;
//  Self.FCanvas.Stroke.Kind := TBrushKind.Solid;
//  Self.FCanvas.Stroke.Color := ADrawPathData.PenColor.Color;
//  Self.FCanvas.DrawPath(TGDIPlusDrawPathData(ADrawPathData).Path,1,Self.FCanvas.Stroke);

//  if (ADrawLineParam.PenWidth=0)
//  then
//  begin
//    Exit;
//  end;

  AGPColor:=TGPColor.CreateFromColorRef(ADrawPathData.PenColor.Color);
//  TGPColor.SetAlpha(AGPColor.FArgb,ADrawPathData.PenColor.Alpha);
  AGPColor.Alpha:=ADrawPathData.PenColor.Alpha;

  AGPPen:=TGPPen.Create(AGPColor, ADrawPathData.PenWidth);

//  AGPPathData:=ADrawPathData.PathData;
//
//  AGPGraphicsPath:=TGPGraphicsPath.Create(
//                     TGPPointArray(AGPPathData.PointPtr),
//                     TByteArray(AGPPathData.TypePtr)
//                     );

//  TGDIPlusDrawPathData(ADrawPathData).Path.FillMode
  FGraphics.DrawPath(AGPPen,TGDIPlusDrawPathData(ADrawPathData).Path);

  Result:=True;
end;

function TGDIPlusDrawCanvas.DrawSkinPicture(const ADrawPictureParam:TDrawPictureParam;
                            const ASkinPicture:TSkinPicture;
                            const ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF
                            ):Boolean;
var
  ABitmap:IGPBitmap;


  BDrawRect:TRectF;
  BImageDestDrawRect:TRectF;
  BImageSrcRect:TRectF;


  ALargeImageDestDrawRect:TRectF;
  ALargeImageSrcDrawRect:TRectF;
  AGPColorMatrix:TGPColorMatrix;
  AGPImageAttributes:IGPImageAttributes;
begin
  Result:=True;



//
//  ABitmap:=nil;
//  if ASkinPicture.SkinPictureEngine is TGDIPlusSkinPictureEngine then
//  begin
//    ABitmap:=TGDIPlusSkinPictureEngine(ASkinPicture.SkinPictureEngine).Bitmap;
//  end
//  else
//  if ASkinPicture.SkinPictureEngine is TGDIPlusSkinGIFPictureEngine then
//  begin
//    ABitmap:=TGDIPlusSkinGIFPictureEngine(ASkinPicture.SkinPictureEngine).Bitmap;
//  end
//  ;
//
//  if ABitmap=nil then
//  begin
//    Exit;
//  end;

  if (RectWidthF(ADrawRect)<=0) or (RectHeightF(ADrawRect)<=0) then Exit;




  BDrawRect:=ADrawPictureParam.CalcDrawRect(ADrawRect);
  BImageDestDrawRect:=AImageDestDrawRect;
  BImageSrcRect:=AImageSrcRect;

//
//  if ASkinPicture.FSVGObject<>nil then
//  begin
//    if Assigned(GlobalOnDrawSVGImage) then
//    begin
//      GlobalOnDrawSVGImage(Self,ASkinPicture,ADrawPictureParam,ASkinPicture.FSVGObject,BDrawRect,AIsUseSrcRectAndDestDrawRect,AImageSrcRect,AImageDestDrawRect);
//    end;
//    Exit;
//  end;
//

  if Not AIsUseSrcRectAndDestDrawRect then
  begin
//    Self.CalcImageDrawRect(ADrawPictureParam,ASkinPicture.Width,ASkinPicture.Height,BDrawRect,AImageDestDrawRect);
    //计算最终绘制的矩形
    CalcImageDrawRect(ADrawPictureParam,
                          ASkinPicture.Width,
                          ASkinPicture.Height,
                          BDrawRect,
                          BImageDestDrawRect
                          );
    BImageSrcRect:=RectF(0,0,ASkinPicture.Width,ASkinPicture.Height);
  end;




  ABitmap:=nil;
  if ASkinPicture.SkinPictureEngine is TGDIPlusSkinPictureEngine then
  begin
    ABitmap:=TGDIPlusSkinPictureEngine(ASkinPicture.SkinPictureEngine).Bitmap;
  end
  else
  if ASkinPicture.SkinPictureEngine is TGDIPlusSkinGIFPictureEngine then
  begin
    ABitmap:=TGDIPlusSkinGIFPictureEngine(ASkinPicture.SkinPictureEngine).Bitmap;
  end
  ;

  if ABitmap=nil then
  begin
    Exit;
  end;


  AGPImageAttributes:=nil;

  { #todo : 需要处理,在FPC下面不支持透明度不然图片显示不出来 }
  {$IFDEF DELPHI}
  if //ADrawPictureParam.IsGray or
  (ADrawPictureParam.CurrentEffectAlpha<>255) then
  begin

//    TGPColorMatrix.SetToIdentity(AGPColorMatrix);
    AGPColorMatrix.SetToIdentity();

//    if ADrawPictureParam.IsGray then
//    begin
//      AGPColorMatrix.M[0, 0]:=0.3;
//      AGPColorMatrix.M[0, 1]:=0.3;
//      AGPColorMatrix.M[0, 2]:=0.3;
//      AGPColorMatrix.M[1, 0]:=0.59;
//      AGPColorMatrix.M[1, 1]:=0.59;
//      AGPColorMatrix.M[1, 2]:=0.59;
//      AGPColorMatrix.M[2, 0]:=0.11;
//      AGPColorMatrix.M[2, 1]:=0.11;
//      AGPColorMatrix.M[2, 2]:=0.11;
//    end;

    if ADrawPictureParam.CurrentEffectAlpha<>255 then
    begin
      AGPColorMatrix.M[3, 3]:=ADrawPictureParam.CurrentEffectAlpha / 255;
    end;

    AGPImageAttributes:=TGPImageAttributes.Create;
    AGPImageAttributes.SetColorMatrix(AGPColorMatrix);

  end
  else
  begin
    AGPImageAttributes:=nil;
  end;
  {$ENDIF}



  if ADrawPictureParam.IsStretch then
  begin

    case ADrawPictureParam.StretchStyle of
      issThreePartHorz:
      begin
        if (RectWidthF(BImageSrcRect)>=ADrawPictureParam.StretchMargins.Left+ADrawPictureParam.StretchMargins.Right)
          and (RectWidthF(BImageDestDrawRect)>=RectWidthF(BImageSrcRect)) then
        begin
          //DrawLeftSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Top,ADrawPictureParam.StretchMargins.Left,Ceil(RectHeightF(BImageDestDrawRect))),
                    BImageSrcRect.Left,BImageSrcRect.Top,ADrawPictureParam.StretchMargins.Left,BImageSrcRect.Bottom,
                    UnitPixel);
          //DrawRightSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Right-ADrawPictureParam.StretchMargins.Right,BImageDestDrawRect.Top,ADrawPictureParam.StretchMargins.Right,RectHeightF(BImageDestDrawRect)),
                    BImageSrcRect.Right-ADrawPictureParam.StretchMargins.Right,BImageSrcRect.Top,ADrawPictureParam.StretchMargins.Right,BImageSrcRect.Bottom,
                    UnitPixel);

          //DrawCenterBlock
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left+ADrawPictureParam.StretchMargins.Left,BImageDestDrawRect.Top,RectWidthF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,RectHeightF(BImageDestDrawRect)),
                    BImageSrcRect.Left+ADrawPictureParam.StretchMargins.Left,BImageSrcRect.Top,
                    RectWidthF(BImageSrcRect)-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,
                    RectHeightF(BImageSrcRect),
                    UnitPixel);
        end
        else
        begin
          case ADrawPictureParam.PictureTooSmallProcessType of
            itsptTensile:
            begin
              FGraphics.DrawImage(ABitmap,
                                  TGPRectF_CreateF(BImageDestDrawRect),
                                  BImageSrcRect.Left,BImageSrcRect.Top,RectWidthF(BImageSrcRect),RectHeightF(BImageSrcRect),
                                  UnitPixel,
                                  AGPImageAttributes);
            end;
            itsptPart:
            begin
              //DrawLeftSide
              FGraphics.DrawImage(ABitmap,
                        TGPRectF_CreateF(BImageDestDrawRect),
                        BImageSrcRect.Left,BImageSrcRect.Top,
                        RectWidthF(BImageDestDrawRect),
                        BImageSrcRect.Bottom,
                        UnitPixel);

            end;
          end;
        end;

      end;
      issThreePartVert:
      begin
        if (RectHeightF(BImageSrcRect)>=ADrawPictureParam.StretchMargins.Top+ADrawPictureParam.StretchMargins.Bottom)
          and (RectHeightF(BImageDestDrawRect)>=RectHeightF(BImageSrcRect)) then
        begin

          //DrawTopSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Top,
                                  RectWidthF(BImageDestDrawRect),ADrawPictureParam.StretchMargins.Top),
                    BImageSrcRect.Left,BImageSrcRect.Top,
                    RectWidthF(BImageSrcRect),ADrawPictureParam.StretchMargins.Top,
                    UnitPixel);
          //DrawBottomSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,
                                    RectWidthF(BImageDestDrawRect),ADrawPictureParam.StretchMargins.Bottom),
                    BImageSrcRect.Left,BImageSrcRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,
                    RectWidthF(BImageSrcRect),ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);

          //DrawCenterBlock
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Top+ADrawPictureParam.StretchMargins.Top,RectWidthF(BImageDestDrawRect),RectHeightF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom),
                                  BImageSrcRect.Left,BImageSrcRect.Top+ADrawPictureParam.StretchMargins.Top,
                    RectWidthF(BImageSrcRect),
                    RectHeightF(BImageSrcRect)-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);
        end
        else
        begin
          case ADrawPictureParam.PictureTooSmallProcessType of
            itsptTensile:
            begin
              FGraphics.DrawImage(ABitmap,
                                  TGPRectF_CreateF(BImageDestDrawRect),
                                  BImageSrcRect.Left,BImageSrcRect.Top,RectWidthF(BImageSrcRect),RectHeightF(BImageSrcRect),
                                  UnitPixel,
                                  AGPImageAttributes);
            end;
            itsptPart:
            begin
              //DrawTopSide
              FGraphics.DrawImage(ABitmap,
                        TGPRectF_CreateF(BImageDestDrawRect),
                        BImageSrcRect.Left,BImageSrcRect.Top,
                        BImageSrcRect.Right,
                        RectHeightF(BImageDestDrawRect),
                        UnitPixel);

            end;
          end;
        end;

      end;

      issSquare:
      begin

        if (RectWidthF(BImageSrcRect)>=ADrawPictureParam.StretchMargins.Left+ADrawPictureParam.StretchMargins.Right)
        and (RectHeightF(BImageSrcRect)>=ADrawPictureParam.StretchMargins.Top+ADrawPictureParam.StretchMargins.Bottom)
          and ((RectWidthF(BImageDestDrawRect)>=RectWidthF(BImageSrcRect)))
            or ((RectHeightF(BImageDestDrawRect)>=RectHeightF(BImageSrcRect))) then
        begin

          //DrawLeftTopBlock
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Top,ADrawPictureParam.StretchMargins.Left,ADrawPictureParam.StretchMargins.Top),
                    BImageSrcRect.Left,BImageSrcRect.Top,ADrawPictureParam.StretchMargins.Left,ADrawPictureParam.StretchMargins.Top,
                    UnitPixel);
          //DrawRightTopBlock
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Right-ADrawPictureParam.StretchMargins.Right,BImageDestDrawRect.Top,ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Top),
                    BImageSrcRect.Right-ADrawPictureParam.StretchMargins.Right,BImageSrcRect.Top,ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Top,
                    UnitPixel);
          //DrawLeftBottomBlock
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,ADrawPictureParam.StretchMargins.Left,ADrawPictureParam.StretchMargins.Bottom),
                    BImageSrcRect.Left,BImageSrcRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,ADrawPictureParam.StretchMargins.Left,ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);
          //DrawRightBottomBlock
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Right-ADrawPictureParam.StretchMargins.Right,BImageDestDrawRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Bottom),
                    BImageSrcRect.Right-ADrawPictureParam.StretchMargins.Right,BImageSrcRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);

          //DrawTopSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left+ADrawPictureParam.StretchMargins.Left,BImageDestDrawRect.Top,RectWidthF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Top),
                    BImageSrcRect.Left+ADrawPictureParam.StretchMargins.Left,BImageSrcRect.Top,BImageSrcRect.Right-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Top,
                    UnitPixel);
          //DrawBottomSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left+ADrawPictureParam.StretchMargins.Left,BImageDestDrawRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,RectWidthF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Bottom),
                    BImageSrcRect.Left+ADrawPictureParam.StretchMargins.Left,BImageSrcRect.Bottom-ADrawPictureParam.StretchMargins.Bottom,BImageSrcRect.Right-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);

          //DrawLeftSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Left,BImageDestDrawRect.Top+ADrawPictureParam.StretchMargins.Top,ADrawPictureParam.StretchMargins.Left,RectHeightF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom),
                    BImageSrcRect.Left,BImageSrcRect.Top+ADrawPictureParam.StretchMargins.Top,ADrawPictureParam.StretchMargins.Left,BImageSrcRect.Bottom-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);
          //DrawRightSide
          FGraphics.DrawImage(ABitmap,
                    TGPRectF.Create(BImageDestDrawRect.Right-ADrawPictureParam.StretchMargins.Right,BImageDestDrawRect.Top+ADrawPictureParam.StretchMargins.Top,ADrawPictureParam.StretchMargins.Right,RectHeightF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom),
                    BImageSrcRect.Right-ADrawPictureParam.StretchMargins.Right,BImageSrcRect.Top+ADrawPictureParam.StretchMargins.Top,ADrawPictureParam.StretchMargins.Right,BImageSrcRect.Bottom-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom,
                    UnitPixel);



          //DrawCenterBlock
//          if ADrawPictureParam.IsDrawSquareCenterBlock then
//          begin
            FGraphics.DrawImage(ABitmap,
                      TGPRectF.Create(BImageDestDrawRect.Left+ADrawPictureParam.StretchMargins.Left,BImageDestDrawRect.Top+ADrawPictureParam.StretchMargins.Top,RectWidthF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,RectHeightF(BImageDestDrawRect)-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom),
                      BImageSrcRect.Left+ADrawPictureParam.StretchMargins.Left,BImageSrcRect.Top+ADrawPictureParam.StretchMargins.Top,
                      RectWidthF(BImageSrcRect)-ADrawPictureParam.StretchMargins.Left-ADrawPictureParam.StretchMargins.Right,
                      RectHeightF(BImageSrcRect)-ADrawPictureParam.StretchMargins.Top-ADrawPictureParam.StretchMargins.Bottom,
                      UnitPixel);
//          end;


        end
        else
        begin
          FGraphics.DrawImage(ABitmap,
                              TGPRectF_CreateF(BImageDestDrawRect),
                              BImageSrcRect.Left,BImageSrcRect.Top,RectWidthF(BImageSrcRect),RectHeightF(BImageSrcRect),
                              UnitPixel,
                              AGPImageAttributes);
        end;

      end
      else
      begin
        //FGraphics.DrawImage(ABitmap,
        //                    TGPRectF.Create(BImageDestDrawRect),
        //                    BImageSrcRect.Left,BImageSrcRect.Top,RectWidthF(BImageSrcRect),RectHeightF(BImageSrcRect),
        //                    UnitPixel,
        //                    AGPImageAttributes);
        FGraphics.DrawImage(ABitmap,
                            //TGPRectF.Create(BImageDestDrawRect),
                            BImageDestDrawRect.Left,BImageDestDrawRect.Top,RectWidthF(BImageDestDrawRect),RectHeightF(BImageDestDrawRect),
                            BImageSrcRect.Left,BImageSrcRect.Top,RectWidthF(BImageSrcRect),RectHeightF(BImageSrcRect),
                            UnitPixel,
                            AGPImageAttributes);
      end;
    end;

  end
  else
  begin

    //没有拉伸,原图比较大
    if
      (
        (RectWidthF(BImageDestDrawRect)>RectWidthF(BDrawRect))
        or (RectHeightF(BImageDestDrawRect)>RectHeightF(BDrawRect))
      )
      and (ADrawPictureParam.PictureTooLargeProcessType=itlptPart) then
    begin
        //(0, 0, 694, 585, (0, 0), (694, 585))
        //超出
        //BDrawRect (-299, -76, 395, 509, (-299, -76), (395, 509))

        //在里面
        //BDrawRect (79, 41, 773, 626, (79, 41), (773, 626))


        //目标矩形(不会超出控件的区域)
        ALargeImageDestDrawRect:=BDrawRect;
        if BDrawRect.Left>=0 then
        begin
          ALargeImageDestDrawRect.Left:=BDrawRect.Left;
          ALargeImageDestDrawRect.Right:=RectWidthF(BDrawRect);
        end
        else
        begin
          ALargeImageDestDrawRect.Left:=0;
          ALargeImageDestDrawRect.Right:=RectWidthF(BDrawRect)-ALargeImageDestDrawRect.Left;
        end;
        if BDrawRect.Top>=0 then
        begin
          ALargeImageDestDrawRect.Top:=BDrawRect.Top;
          ALargeImageDestDrawRect.Bottom:=RectHeightF(BDrawRect);
        end
        else
        begin
          ALargeImageDestDrawRect.Top:=0;
          ALargeImageDestDrawRect.Bottom:=RectHeightF(BDrawRect)-ALargeImageDestDrawRect.Top;
        end;


        //源图片的绘制矩形
        ALargeImageSrcDrawRect:=BDrawRect;
        if BDrawRect.Left>=0 then
        begin
          ALargeImageSrcDrawRect.Left:=0;
          ALargeImageSrcDrawRect.Right:=RectWidthF(BDrawRect)-BDrawRect.Left;
        end
        else
        begin
          ALargeImageSrcDrawRect.Left:=-BDrawRect.Left;
          ALargeImageSrcDrawRect.Right:=ALargeImageSrcDrawRect.Left+RectWidthF(BDrawRect);
        end;
        if BDrawRect.Top>=0 then
        begin
          ALargeImageSrcDrawRect.Top:=0;
          ALargeImageSrcDrawRect.Bottom:=RectHeightF(BDrawRect)-BDrawRect.Top;
        end
        else
        begin
          ALargeImageSrcDrawRect.Top:=-BDrawRect.Top;
          ALargeImageSrcDrawRect.Bottom:=ALargeImageSrcDrawRect.Top+RectHeightF(BDrawRect);
        end;





        //Left,Top小于0的时候,超出范围

        FGraphics.DrawImage(ABitmap,

                            //TGPRectF.Create(ALargeImageDestDrawRect),
                            ALargeImageDestDrawRect.Left,ALargeImageDestDrawRect.Top,RectWidthF(ALargeImageDestDrawRect),RectHeightF(ALargeImageDestDrawRect),

                            ALargeImageSrcDrawRect.Left,
                            ALargeImageSrcDrawRect.Top,
                            RectWidthF(ALargeImageSrcDrawRect),
                            RectHeightF(ALargeImageSrcDrawRect),
  //                          RectWidthF(BDrawRect),
  //                          RectHeightF(BDrawRect),

                            UnitPixel,
                            AGPImageAttributes);
    end
    else
    begin
      FGraphics.DrawImage(ABitmap,
                          //TGPRectF.Create(BImageDestDrawRect),
                          BImageDestDrawRect.Left,BImageDestDrawRect.Top,RectWidthF(BImageDestDrawRect),RectHeightF(BImageDestDrawRect),
//                          0,0,64,64,
                          BImageSrcRect.Left,BImageSrcRect.Top,RectWidthF(BImageSrcRect),RectHeightF(BImageSrcRect),
                          UnitPixel,
                          AGPImageAttributes);
    end;

  end;

end;

//function TGDIPlusDrawCanvas.DrawPolygon(ADrawPolygonParam:TDrawPolygonParam;const ADrawPoints: array of TPoint):Boolean;
//var
//  AGPPointF: array of TGPPointF;
//  AGPPath:IGPGraphicsPath;
//  AGPPen:IGPPen;
//  AGPBrush:IGPBrush;
//  AGPFillColor:TGPColor;
//  AGPBorderColor:TGPColor;
//  AGPLinearGradientFillColor1:TGPColor;
//  AGPLinearGradientFillColor2:TGPColor;
//  AGPLinearGradientMode:TGPLinearGradientMode;
//  I: Integer;
//begin
//
//  if Not ADrawPolygonParam.IsFill
//    and (ADrawPolygonParam.CurrentEffectBorderWidth=0)
//  then
//  begin
//    Exit;
//  end;
//
//
//  SetLength(AGPPointF,Length(ADrawPoints));
//  for I := 0 to Length(ADrawPoints) - 1 do
//  begin
//    AGPPointF[I].X:=ADrawPoints[I].X;
//    AGPPointF[I].Y:=ADrawPoints[I].Y;
//  end;
//
//  AGPPath:=TGPGraphicsPath.Create(FillModeAlternate);
//  AGPPath.AddPolygon(AGPPointF);
//
//
//  if ADrawPolygonParam.IsFill then
//  begin
//    //创建画刷
//    if  ADrawPolygonParam.LinearGradientType=lgtNone then
//    begin
//      AGPFillColor:=TGPColor.CreateFromColorRef(ADrawPolygonParam.FillColor.Color);
//      TGPColor.SetAlpha(AGPFillColor.FArgb,ADrawPolygonParam.FillColor.Alpha);
//      AGPBrush:=TGPSolidBrush.Create(AGPFillColor);
//    end
//    else
//    begin
//      AGPLinearGradientFillColor1:=TGPColor.CreateFromColorRef(ADrawPolygonParam.LinearGradientFillColor1.Color);
//      TGPColor.SetAlpha(AGPLinearGradientFillColor1.FArgb,ADrawPolygonParam.LinearGradientFillColor1.Alpha);
//      AGPLinearGradientFillColor2:=TGPColor.CreateFromColorRef(ADrawPolygonParam.LinearGradientFillColor2.Color);
//      TGPColor.SetAlpha(AGPLinearGradientFillColor2.FArgb,ADrawPolygonParam.LinearGradientFillColor2.Alpha);
//      case ADrawPolygonParam.LinearGradientType of
//        lgtVert: AGPLinearGradientMode:=LinearGradientModeVertical;
//        lgtHorz: AGPLinearGradientMode:=LinearGradientModeHorizontal;
//      end;
//    end;
//
//    FGraphics.FillPath(AGPBrush,AGPPath);
//  end;
//
//  if (ADrawPolygonParam.CurrentEffectBorderWidth>0) then
//  begin
//    //创建画笔
//    AGPBorderColor:=TGPColor.CreateFromColorRef(ADrawPolygonParam.BorderColor.Color);
//    TGPColor.SetAlpha(AGPBorderColor.FArgb,ADrawPolygonParam.BorderColor.Alpha);
//    AGPPen:=TGPPen.Create(AGPBorderColor, ADrawPolygonParam.CurrentEffectBorderWidth);
//    AGPPen.Alignment:=PenAlignmentInset;
//
//    FGraphics.DrawPath(AGPPen,AGPPath);
//  end;
//
//  SetLength(AGPPointF,0);
//end;

procedure AddRoundRectPath(AGPPath:IGPGraphicsPath;ADrawRectParam:TDrawRectParam;ARoundDrawRect:TRectF;
  ADrawRectParam_RoundWidth:Double;
  ADrawRectParam_RoundHeight:Double
);
var
  ALineFix:Integer;
begin


          if rcTopLeft in ADrawRectParam.RectCorners then
          begin
            //左上角
            AGPPath.AddArc(ARoundDrawRect.Left,
                            ARoundDrawRect.Top,
                            ADrawRectParam_RoundWidth*2,
                            ADrawRectParam_RoundHeight*2,
                            180, 90);
          end
          else
          begin
            AGPPath.AddLine(ARoundDrawRect.Left,ARoundDrawRect.Top-ADrawRectParam_RoundHeight,
                            ARoundDrawRect.Left,ARoundDrawRect.Top);
            AGPPath.AddLine(ARoundDrawRect.Left,ARoundDrawRect.Top,
                            ARoundDrawRect.Left+ADrawRectParam_RoundWidth,ARoundDrawRect.Top);
          end;


          if rcTopRight in ADrawRectParam.RectCorners then
          begin
            //右上角
            AGPPath.AddArc(ARoundDrawRect.Right - ADrawRectParam_RoundWidth*2,
                            ARoundDrawRect.Top,
                            ADrawRectParam_RoundWidth*2,
                            ADrawRectParam_RoundHeight*2,
                            270, 90);
          end
          else
          begin
            AGPPath.AddLine(ARoundDrawRect.Right - ADrawRectParam_RoundWidth,ARoundDrawRect.Top,
                            ARoundDrawRect.Right,ARoundDrawRect.Top);
            AGPPath.AddLine(ARoundDrawRect.Right,ARoundDrawRect.Top,
                            ARoundDrawRect.Right,ARoundDrawRect.Top-ADrawRectParam_RoundHeight);
          end;



          if rcBottomRight in ADrawRectParam.RectCorners then
          begin
            if ADrawRectParam.RoundWidth=-1 then
            begin
              AGPPath.AddArc(ARoundDrawRect.Right - ADrawRectParam_RoundWidth*2,
                            ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight*2,
                            ADrawRectParam_RoundWidth*2,
                            ADrawRectParam_RoundHeight*2,
                            0, 90);
            end
            else
            begin
              //右下角，由２改３，因为２不够大
//              AGPPath.AddArc(ARoundDrawRect.Right - ADrawRectParam_RoundWidth*3,
//                            ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight*3,
//                            ADrawRectParam_RoundWidth*3,
//                            ADrawRectParam_RoundHeight*3,
//                            0, 90);
              AGPPath.AddArc(ARoundDrawRect.Right - ADrawRectParam_RoundWidth*2,
                            ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight*2,
                            ADrawRectParam_RoundWidth*2,
                            ADrawRectParam_RoundHeight*2,
                            0, 90);
            end;

          end
          else
          begin
            AGPPath.AddLine(ARoundDrawRect.Right,ARoundDrawRect.Bottom-ADrawRectParam_RoundHeight,
                            ARoundDrawRect.Right,ARoundDrawRect.Bottom);
            AGPPath.AddLine(ARoundDrawRect.Right,ARoundDrawRect.Bottom,
                            ARoundDrawRect.Right - ADrawRectParam_RoundWidth,ARoundDrawRect.Bottom);
          end;


          if rcBottomLeft in ADrawRectParam.RectCorners then
          begin
            //左下圆角
            AGPPath.AddArc(ARoundDrawRect.Left,
                          ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight*2,
                          ADrawRectParam_RoundWidth*2,
                          ADrawRectParam_RoundHeight*2,
                          90, 90);
          end
          else
          begin
            AGPPath.AddLine(ARoundDrawRect.Left + ADrawRectParam_RoundWidth,ARoundDrawRect.Bottom,
                            ARoundDrawRect.Left,ARoundDrawRect.Bottom);
            AGPPath.AddLine(ARoundDrawRect.Left,ARoundDrawRect.Bottom,
                            ARoundDrawRect.Left,ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight);
          end;



          AGPPath.CloseFigure;


          ALineFix:=1;
      //    //顶部横线
      //    AGPPath.AddLine(ARoundDrawRect.Left+ADrawRectParam_RoundWidth/2-ALineFix,
      //                      ARoundDrawRect.Top,
      //                      ARoundDrawRect.Right-ADrawRectParam_RoundWidth/2+ALineFix,
      //                      ARoundDrawRect.Top);
      //
      //    //右部竖线
      //    AGPPath.AddLine(ARoundDrawRect.Right,
      //                      ARoundDrawRect.Top+ADrawRectParam_RoundHeight/2-ALineFix,
      //                      ARoundDrawRect.Right,
      //                      ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight/2+ALineFix);
      //
      //    //底部横线
      //    AGPPath.AddLine(ARoundDrawRect.Right-ADrawRectParam_RoundWidth/2+ALineFix,
      //                      ARoundDrawRect.Bottom,
      //                      ARoundDrawRect.Left+ADrawRectParam_RoundWidth/2-ALineFix,
      //                      ARoundDrawRect.Bottom
      //                      );

          //左部竖线
          AGPPath.AddLine(ARoundDrawRect.Left,
                            ARoundDrawRect.Bottom - ADrawRectParam_RoundHeight+ALineFix,
                            ARoundDrawRect.Left,
                            ARoundDrawRect.Top+ADrawRectParam_RoundHeight-ALineFix);
end;

function TGDIPlusDrawCanvas.DrawRect(const ADrawRectParam:TDrawRectParam;
                      const ADrawRect:TRectF):Boolean;
var
  ASides:TSides;


  AGPPath:IGPGraphicsPath;
  AShadowGPPath:IGPGraphicsPath;
  AGPPen:IGPPen;

  BDrawRect:TRectF;
  CDrawRect:TRectF;
  AFillRect:TRectF;
  ABorderRect:TRectF;
  ARoundDrawRect:TRectF;
  AGPRoundDrawRect:TGPRectF;


  AGPBrush:IGPBrush;
  AGPFillColor:TGPColor;
  AGPBorderColor:TGPColor;
  AGPLinearGradientFillColor1:TGPColor;
  AGPLinearGradientFillColor2:TGPColor;
  AGPLinearGradientMode:TGPLinearGradientMode;

  ADrawRectParam_RoundWidth:Double;
  ADrawRectParam_RoundHeight:Double;
  AGPRegion:IGPRegion;
  AShadowGPRegion:IGPRegion;
  AShadowGPColor:TGPColor;
  AShadowGPColor1:TGPColor;
  AShadowGPBrush:IGPPathGradientBrush;
  AShadowGPPoints: array of TGPPoint;
  I: Integer;
begin
  AGPPath:=nil;


  //如果不填充并且没有边框,则不需要绘制
  if Not ADrawRectParam.CurrentEffectIsFill
    and (ADrawRectParam.CurrentEffectBorderWidth=0)
  then
  begin
    Exit;
  end;


  BDrawRect:=ADrawRectParam.CalcDrawRect(ADrawRect);
  CDrawRect:=BDrawRect;

  //是否需要阴影的效果
//  ADrawRectParam.ShadowSize:=5;
  if ADrawRectParam.ShadowSize>0 then
  begin
    InflateRect(BDrawRect,-ADrawRectParam.ShadowSize,-ADrawRectParam.ShadowSize);
  end;


  AFillRect:=BDrawRect;




  //圆角
  //生成圆角Path
  if ADrawRectParam.IsRound then
  begin
//      FGraphics.SetSmoothingMode(TGPSmoothingMode.SmoothingModeHighQuality);
      AGPPath:=TGPGraphicsPath.Create(FillModeAlternate);


      ARoundDrawRect:=BDrawRect;


      ADrawRectParam_RoundWidth:=ADrawRectParam.RoundWidth;
      ADrawRectParam_RoundHeight:=ADrawRectParam.RoundHeight;


      //如果角半径为-1,那么默认为圆形
      if IsSameDouble(ADrawRectParam_RoundWidth,-1) or IsSameDouble(ADrawRectParam_RoundHeight,-1) then
      begin
          ADrawRectParam_RoundWidth:=AFillRect.Width/2;
          ADrawRectParam_RoundHeight:=AFillRect.Height/2;
          //圆角保持一致,取最小的半径
          if ADrawRectParam_RoundWidth<ADrawRectParam_RoundHeight then
          begin
            ADrawRectParam_RoundHeight:=ADrawRectParam_RoundWidth;
          end
          else
          begin
            ADrawRectParam_RoundWidth:=ADrawRectParam_RoundHeight;
          end;


      end;

      //要减一,不然右底边框被会挡住
      ARoundDrawRect.Right:=ARoundDrawRect.Right-1;
      ARoundDrawRect.Bottom:=ARoundDrawRect.Bottom-1;

//      if (AFillRect.Width=AFillRect.Height) and () then
//      begin
//          //纯圆
//          AGPRoundDrawRect:=TGPRectF.Create(ARoundDrawRect);
//          AGPPath.AddEllipse(AGPRoundDrawRect);
//
//      end
//      else
//      begin
          //圆角矩形

//      if ADrawRectParam_RoundWidth=-1 then
//      begin
//          //纯圆
//          ADrawRectParam_RoundWidth:=AFillRect.Width / 2;
//          ADrawRectParam_RoundHeight:=AFillRect.Height / 2;
//
//
////          AGPPath.AddEllipse(ARoundDrawRect.Left,ARoundDrawRect.Top,ARoundDrawRect.Width,ARoundDrawRect.Height);
//      end;
////      else
//      begin
          //只是圆角


//          //要减一,不然右底边框被会挡住
//          ARoundDrawRect.Right:=ARoundDrawRect.Right-1;
//          ARoundDrawRect.Bottom:=ARoundDrawRect.Bottom-1;
//


          AddRoundRectPath(AGPPath,ADrawRectParam,ARoundDrawRect,ADrawRectParam_RoundWidth,ADrawRectParam_RoundHeight);

//      end;





//    end;

  end;



  //当前需要填充
  if ADrawRectParam.CurrentEffectIsFill then
  begin

      //去掉边框
      if ADrawRectParam.CurrentEffectBorderWidth>0 then
      begin
        if TSide.Left in ASides then
        begin
          AFillRect.Left:=BDrawRect.Left+ADrawRectParam.CurrentEffectBorderWidth-1;
        end;
        if TSide.Top in ASides then
        begin
          AFillRect.Top:=BDrawRect.Top+ADrawRectParam.CurrentEffectBorderWidth-1;
        end;
        if TSide.Right in ASides then
        begin
          AFillRect.Right:=BDrawRect.Right-ADrawRectParam.CurrentEffectBorderWidth;
        end;
        if TSide.Bottom in ASides then
        begin
          AFillRect.Bottom:=BDrawRect.Bottom-ADrawRectParam.CurrentEffectBorderWidth;
        end;
      end;


      //创建画刷
      AGPFillColor:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectFillDrawColor.Color);
//      TGPColor.SetAlpha(AGPFillColor.FArgb,Ceil(ADrawRectParam.CurrentEffectFillDrawColor.Alpha*ADrawRectParam.DrawAlpha/255));
      AGPFillColor.Alpha:=Ceil(ADrawRectParam.CurrentEffectFillDrawColor.Alpha*ADrawRectParam.DrawAlpha/255);
      AGPBrush:=TGPSolidBrush.Create(AGPFillColor);

      if Not ADrawRectParam.IsRound then
      begin
          //不是圆角,直接用FillRectangle
          FGraphics.FillRectangle(AGPBrush, TGPRectF_CreateF(AFillRect));
      end
      else
      begin
          //圆角则用FillPath
          if (ADrawRectParam.RoundWidth=-1) and (ADrawRectParam.RoundHeight=-1) then
          begin
            //纯圆,有钜齿
//            FGraphics.FillEllipse(AGPBrush,TGPRectF.Create(AFillRect));
//            Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeHighQuality;
//            Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeAntiAlias;
//            Self.FGraphics.CompositingQuality:=TGPCompositingQuality.CompositingQualityHighQuality;
//            FGraphics.FillEllipse(AGPBrush,AFillRect.Left,AFillRect.Top,AFillRect.Width-1,AFillRect.Height-1);
//            Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeDefault;

          end;
//          else
          begin
            //圆角
            //要画边框
            Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeHighQuality;
            FGraphics.FillPath(AGPBrush,AGPPath);
            Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeDefault;
          end;

//        //测试
//        AGPBorderColor:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectBorderColor.Color);
//        TGPColor.SetAlpha(AGPBorderColor.FArgb,ADrawRectParam.BorderColor.Alpha);
//        AGPPen:=TGPPen.Create(AGPBorderColor, 1);
//        AGPPen.Alignment:=PenAlignmentInset;
//        FGraphics.DrawPath(AGPPen,AGPPath);
      end;

  end;






  //边
  ASides:=[TSide.Top, TSide.Left, TSide.Bottom, TSide.Right];
  if not (beLeft in ADrawRectParam.BorderEadges) then ASides:=ASides-[TSide.Left];
  if not (beTop in ADrawRectParam.BorderEadges) then ASides:=ASides-[TSide.Top];
  if not (beRight in ADrawRectParam.BorderEadges) then ASides:=ASides-[TSide.Right];
  if not (beBottom in ADrawRectParam.BorderEadges) then ASides:=ASides-[TSide.Bottom];






  //边框
  if (ADrawRectParam.CurrentEffectBorderWidth>0) then
  begin

      //边框做较正
      if (ADrawRectParam.CurrentEffectBorderWidth=1) then
      begin
        ABorderRect.Left:=BDrawRect.Left;
        ABorderRect.Top:=BDrawRect.Top;
        ABorderRect.Right:=BDrawRect.Right-1;
        ABorderRect.Bottom:=BDrawRect.Bottom-1;
      end
      else
      begin
        ABorderRect.Left:=BDrawRect.Left;
        ABorderRect.Top:=BDrawRect.Top;
        ABorderRect.Right:=BDrawRect.Right;
        ABorderRect.Bottom:=BDrawRect.Bottom;
      end;



      if ASides=[TSide.Top, TSide.Left, TSide.Bottom, TSide.Right] then
      begin

          //四边都全
          if ADrawRectParam.IsRound then
          begin
//            ABorderRect:=BDrawRect;
//            AGPPath:=TGPGraphicsPath.Create(FillModeAlternate);
//            AGPPath.AddArc(ABorderRect.Left,
//                            ABorderRect.Top,
//                            ADrawRectParam_RoundWidth*2,
//                            ADrawRectParam_RoundHeight*2,
//                            180, 90);
//            AGPPath.AddArc(ABorderRect.Left+RectWidthF(ABorderRect) - ADrawRectParam_RoundWidth*2,
//                            ABorderRect.Top,
//                            ADrawRectParam_RoundWidth*2,
//                            ADrawRectParam_RoundHeight*2,
//                            270, 90);
//            AGPPath.AddArc(ABorderRect.Left+RectWidthF(ABorderRect) - ADrawRectParam_RoundWidth*2,
//                          ABorderRect.Bottom - ADrawRectParam_RoundHeight*2,
//                          ADrawRectParam_RoundWidth*2,
//                          ADrawRectParam_RoundHeight*2, 0, 90);
//            AGPPath.AddArc(ABorderRect.Left,
//                            ABorderRect.Bottom - ADrawRectParam_RoundHeight*2,
//                            ADrawRectParam_RoundWidth*2,
//                            ADrawRectParam_RoundHeight*2,
//                            90, 90);
//            AGPPath.AddLine(ABorderRect.Left,
//                            ABorderRect.Top+ADrawRectParam_RoundHeight,
//                            ABorderRect.Left,
//                            ABorderRect.Bottom - ADrawRectParam_RoundHeight);
          end;


      end
      else
      begin
          //少边
          AGPPath:=TGPGraphicsPath.Create(FillModeAlternate);

//          if ADrawRectParam.IsRound then
//          begin
//
//          end
//          else
//          begin
              if TSide.Left in ASides then
              begin
                AGPPath.AddLine(ABorderRect.Left, ABorderRect.Bottom, ABorderRect.Left, ABorderRect.Top);
              end;
              if TSide.Top in ASides then
              begin
                AGPPath.AddLine(ABorderRect.Left, ABorderRect.Top, ABorderRect.Right, ABorderRect.Top);
              end;
              if TSide.Right in ASides then
              begin
                AGPPath.AddLine(ABorderRect.Right, ABorderRect.Top, ABorderRect.Right, ABorderRect.Bottom);
              end;
              if TSide.Bottom in ASides then
              begin
                AGPPath.AddLine(ABorderRect.Right, ABorderRect.Bottom, ABorderRect.Left, ABorderRect.Bottom);
              end;
//          end;

      end;

      //创建画笔
      AGPBorderColor:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectBorderColor.Color);
//      TGPColor.SetAlpha(AGPBorderColor.FArgb,ADrawRectParam.BorderColor.Alpha);
      AGPBorderColor.Alpha:=ADrawRectParam.BorderColor.Alpha;
      AGPPen:=TGPPen.Create(AGPBorderColor, ADrawRectParam.CurrentEffectBorderWidth);
      AGPPen.Alignment:=PenAlignmentInset;



      if AGPPath=nil then
      begin
        FGraphics.DrawRectangle(AGPPen, TGPRectF_CreateF(ABorderRect));
      end
      else
      begin
        //SmoothingModeAntiAlias会糊,还是用图片吧
//        Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeAntiAlias;
        FGraphics.DrawPath(AGPPen,AGPPath);
//        Self.FGraphics.SmoothingMode:=TGPSmoothingMode.SmoothingModeDefault;
      end;



  end;


  //画阴影
  //是否需要阴影的效果
  if (ADrawRectParam.ShadowSize>0) then
  begin
      AShadowGPPath:=TGPGraphicsPath.Create(FillModeAlternate);


      AShadowGPRegion:=TGPRegion.Create(TGPRectF_CreateF(CDrawRect));
      if Not ADrawRectParam.IsRound then
      begin
        //直角矩形
        AShadowGPPath.AddRectangle(TGPRectF_CreateF(CDrawRect));

        AGPRegion:=TGPRegion.Create(TGPRectF_CreateF(BDrawRect));
      end
      else
      begin
        //圆角矩形
        AddRoundRectPath(AShadowGPPath,ADrawRectParam,CDrawRect,ADrawRectParam_RoundWidth,ADrawRectParam_RoundHeight);

        AGPRegion:=TGPRegion.Create(AGPPath);
      end;
      AShadowGPRegion.Exclude(AGPRegion);


      //创建阴影渐变画刷
      AShadowGPColor:=TGPColor.CreateFromColorRef(clBlack);
//      TGPColor.SetAlpha(AShadowGPColor.FArgb,100);
      AShadowGPColor.Alpha:=100;

      AShadowGPColor1:=TGPColor.CreateFromColorRef(clBlack);
//      TGPColor.SetAlpha(AShadowGPColor1.FArgb,0);
      AShadowGPColor1.Alpha:=0;

      //阴影颜色的自动比较难,因为有时候白色的也需要阴影，难道弄个白色的阴影，那效果都看不出来
//      if ADrawRectParam.BorderWidth>0 then
//      begin
//        //创建阴影渐变画刷
//        AShadowGPColor:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectBorderColor.Color);
//        TGPColor.SetAlpha(AShadowGPColor.FArgb,150);
//
//        AShadowGPColor1:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectBorderColor.Color);
//        TGPColor.SetAlpha(AShadowGPColor1.FArgb,0);
//      end
//      else
//      begin
//        //创建阴影渐变画刷
//        AShadowGPColor:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectFillDrawColor.Color);
//        TGPColor.SetAlpha(AShadowGPColor.FArgb,150);
//
//        AShadowGPColor1:=TGPColor.CreateFromColorRef(ADrawRectParam.CurrentEffectFillDrawColor.Color);
//        TGPColor.SetAlpha(AShadowGPColor1.FArgb,0);
//      end;


//      AShadowGPBrush:=TGPPathGradientBrush.Create(AShadowGPPath);
//      AShadowGPPoints;
//      if CDrawRect.Width>=CDrawRect.Height then
//      begin
//
//          for I := 0 to CDrawRect.Width div CDrawRect.Height do
//          begin
//
//          end;
//
//      end
//      else
//      begin
//
//      end;

      AShadowGPBrush:=TGPPathGradientBrush.Create(AShadowGPPath);
      AShadowGPBrush.CenterColor:=AShadowGPColor;
      AShadowGPBrush.SetSurroundColors([AShadowGPColor1]);
//      AShadowGPBrush.SetFocusScales(0.75,0.75);
      //越小,阴影越浅
//      AShadowGPBrush.SetFocusScales(0.5,0.5);


      FGraphics.FillRegion(AShadowGPBrush,AShadowGPRegion);
  end;





end;

function TGDIPlusDrawCanvas.DrawText(const ADrawTextParam:TDrawTextParam;
                      const AText:String;
                      const ADrawRect:TRectF;
                      const AColorTextList:IColorTextList=nil):Boolean;
var
  AGPFont:IGPFont;
  AGPBrush:IGPBrush;

  BDrawRect:TRectF;

  AGPStringFormat:IGPStringFormat;

  I:Integer;
  ADrawFont:TDrawFont;
  ADrawFontColor:TDrawColor;
  ADrawTextWidth:Double;
  ADrawTextSumWidth:Double;
  AColorTextItem:TBaseColorTextItem;
  ADrawStartLeft:Double;
  ARect:TGPRectF;
begin
  Result:=False;

  if AText='' then Exit;

  BDrawRect:=ADrawTextParam.CalcDrawRect(ADrawRect);


  CreateGPStringFormat(ADrawTextParam,AGPStringFormat);

  if (AColorTextList<>nil) then
  begin
        //仅用于演示
        //一个字一个字的绘制
        //先计算出宽度
        ADrawTextSumWidth:=0;
        for I := 0 to AColorTextList.GetColorTextCount-1 do
        begin
              AColorTextItem:=AColorTextList.Items[I];

              ADrawFont:=AColorTextItem.FDrawFont;
              ADrawFontColor:=AColorTextItem.FDrawFont.FontColor;
              if AColorTextItem.FIsUseDefaultDrawFont then
              begin
                ADrawFont:=ADrawTextParam.DrawFont;
              end;
              if AColorTextItem.FIsUseDefaultDrawFontColor then
              begin
                ADrawFontColor:=ADrawTextParam.CurrentEffectFontColor;
              end;

//              FCanvas.Font.Assign(ADrawFont);
//              FCanvas.Fo.Color:=ADrawFontColor.Color;

//              CreateGPFont(ADrawTextParam,AGPFont);
//              CreateGPBrush(ADrawTextParam,AGPBrush);
//              CreateGPStringFormat(ADrawTextParam,AGPStringFormat);

              //  CreateGPFont(ADrawTextParam,AGPFont);
              CreateGPFont(ADrawFont.FontSize,ADrawFont.FontStyle,ADrawFont.FontName,AGPFont);

              //  CreateGPBrush(ADrawTextParam,AGPBrush);
              CreateGPBrush(ADrawFontColor,ADrawTextParam.DrawAlpha,AGPBrush);


//              ARect:=FGraphics.MeasureString(AText,AGPFont,ADrawRectF,AGPStringFormat);
              ARect:=FGraphics.MeasureString(AColorTextItem.FText,AGPFont,TGPPointF.Create(0,0),AGPStringFormat);

//              ADrawWidth:=Ceil(ARect.Width);
//              ADrawHeight:=Ceil(ARect.Height);

//              AColorTextItem.DrawWidth:=FCanvas.TextWidth(AColorTextItem.FText);
//              AColorTextItem.DrawHeight:=FCanvas.TextHeight(AColorTextItem.FText);
              AColorTextItem.DrawWidth:=Ceil(ARect.Width);//FCanvas.TextWidth(AColorTextItem.FText);
              AColorTextItem.DrawHeight:=Ceil(ARect.Height);//FCanvas.TextHeight(AColorTextItem.FText);

              ADrawTextSumWidth:=ADrawTextSumWidth+AColorTextItem.DrawWidth;

              AColorTextItem.DrawTop:=0;
              case ADrawTextParam.FontVertAlign of
                fvaTop: ;
                fvaCenter: AColorTextItem.DrawTop:=Ceil(BDrawRect.Height-AColorTextItem.DrawHeight) div 2;
                fvaBottom:
                begin
                  AColorTextItem.DrawTop:=Ceil(BDrawRect.Height-AColorTextItem.DrawHeight);
                  if AColorTextItem.DrawTop<0 then
                  begin
                    AColorTextItem.DrawTop:=0;
                  end;
                end;
              end;

        end;


        //水平居中
        ADrawStartLeft:=0;
        case ADrawTextParam.FontHorzAlign of
          fhaLeft:
          begin
          end;
          fhaCenter:
          begin
            ADrawStartLeft:=Ceil(BDrawRect.Width-ADrawTextSumWidth) div 2;
          end;
          fhaRight:
          begin
            ADrawStartLeft:=Ceil(BDrawRect.Width-ADrawTextSumWidth);
          end;
        end;

        for I := 0 to AColorTextList.GetColorTextCount-1 do
        begin
          AColorTextItem:=AColorTextList.Items[I];

          ADrawFont:=AColorTextItem.FDrawFont;
          ADrawFontColor:=AColorTextItem.FDrawFont.FontColor;
          if AColorTextItem.FIsUseDefaultDrawFont then
          begin
            ADrawFont:=ADrawTextParam.DrawFont;
          end;
          if AColorTextItem.FIsUseDefaultDrawFontColor then
          begin
            ADrawFontColor:=ADrawTextParam.CurrentEffectFontColor;
          end;


//          FCanvas.Font.Assign(ADrawFont);
//          FCanvas.Fill.Color:=ADrawFontColor.Color;

          //  CreateGPFont(ADrawTextParam,AGPFont);
          CreateGPFont(ADrawFont.FontSize,ADrawFont.FontStyle,ADrawFont.FontName,AGPFont);

          //  CreateGPBrush(ADrawTextParam,AGPBrush);
          CreateGPBrush(ADrawFontColor,ADrawTextParam.DrawAlpha,AGPBrush);


//          FCanvas.FillText(RectF(BDrawRect.Left+ADrawStartLeft,
//                                 BDrawRect.Top+AColorTextItem.DrawTop,
//                                 BDrawRect.Left+ADrawStartLeft+AColorTextItem.DrawWidth,
//                                 BDrawRect.Top+AColorTextItem.DrawTop+AColorTextItem.DrawHeight
//                                 ),
//                                 AColorTextItem.FText,
//                                 False,
//                                 1,
//                                 [],
//                                 TTextAlign.{$IF CompilerVersion >= 35.0}Leading{$ELSE}taLeading{$IFEND},
//                                 AVTextAlign
//                                 );

          FGraphics.SetTextRenderingHint(GlobalGPTextRenderingHint);//TGPTextRenderingHint.TextRenderingHintAntiAliasGridFit);
          //绘制文本
          FGraphics.DrawString(AColorTextItem.FText,
                              AGPFont,
                              TGPRectF.Create(
                                              BDrawRect.Left+ADrawStartLeft,
                                              BDrawRect.Top+AColorTextItem.DrawTop,
                                              AColorTextItem.DrawWidth,
                                              AColorTextItem.DrawHeight),
                              AGPStringFormat,
                              AGPBrush);

          ADrawStartLeft:=ADrawStartLeft+AColorTextItem.DrawWidth;
        end;


        Exit;
  end;


  //  CreateGPFont(ADrawTextParam,AGPFont);
  CreateGPFont(ADrawTextParam.CurrentEffectFontSize,ADrawTextParam.CurrentEffectFontStyle,ADrawTextParam.CurrentEffectFontName,AGPFont);

  //  CreateGPBrush(ADrawTextParam,AGPBrush);
  CreateGPBrush(ADrawTextParam.CurrentEffectFontColor,ADrawTextParam.DrawAlpha,AGPBrush);




//  FGraphics.SetTextRenderingHint(GlobalGPTextRenderingHint);//TGPTextRenderingHint.TextRenderingHintAntiAliasGridFit);
  FGraphics.SetTextRenderingHint(GlobalGPTextRenderingHint);//TGPTextRenderingHint.TextRenderingHintAntiAliasGridFit);


  //绘制文本
  FGraphics.DrawString(AText,
                      AGPFont,
                      TGPRectF.Create(
                                      BDrawRect.Left,
                                      BDrawRect.Top,
                                      RectWidthF(BDrawRect),
                                      RectHeightF(BDrawRect)),
                      AGPStringFormat,
                      AGPBrush);


  Result:=True;
end;

function TGDIPlusDrawCanvas.FillPathData(ADrawPathParam:TDrawPathParam;ADrawPathData: TBaseDrawPathData): Boolean;
var
  AGPBrush:IGPBrush;
  AGPColor:TGPColor;
//  AGPPathData:IGPPathData;
//  AGPGraphicsPath:IGPGraphicsPath;
//begin
//  ACanvas.FCanvas.Stroke.Thickness:=ADrawPathData.PenWidth;
//  ACanvas.FCanvas.Stroke.Kind := TBrushKind.Solid;
//  ACanvas.FCanvas.Stroke.Color := ADrawPathData.PenColor.Color;
//  ACanvas.FCanvas.DrawPath(ADrawPathData.PathData,1,ACanvas.FCanvas.Stroke);
begin
  Result:=False;
//  Self.FCanvas.Stroke.Thickness:=ADrawPathData.PenWidth;
//  Self.FCanvas.Stroke.Kind := TBrushKind.Solid;
//  Self.FCanvas.Stroke.Color := ADrawPathData.PenColor.Color;
//  Self.FCanvas.DrawPath(TGDIPlusDrawPathData(ADrawPathData).Path,1,Self.FCanvas.Stroke);

//  if (ADrawLineParam.PenWidth=0)
//  then
//  begin
//    Exit;
//  end;

  AGPColor:=TGPColor.CreateFromColorRef(ADrawPathParam.CurrentEffectFillDrawColor.Color);
//  TGPColor.SetAlpha(AGPColor.FArgb,Ceil(ADrawPathParam.CurrentEffectFillDrawColor.Alpha*ADrawPathParam.DrawAlpha/255));
  AGPColor.Alpha:=Ceil(ADrawPathParam.CurrentEffectFillDrawColor.Alpha*ADrawPathParam.DrawAlpha/255);

  AGPBrush:=TGPSolidBrush.Create(AGPColor);

//  AGPPathData:=ADrawPathData.PathData;
//
//  AGPGraphicsPath:=TGPGraphicsPath.Create(
//                     TGPPointArray(AGPPathData.PointPtr),
//                     TByteArray(AGPPathData.TypePtr)
//                     );

  FGraphics.FillPath(AGPBrush,TGDIPlusDrawPathData(ADrawPathData).Path);

  Result:=True;
end;

{ TGDIPlusDrawPathData }

procedure TGDIPlusDrawPathData.AddArc(const ARect: TRectF; AStartAngle,
  ASweepAngle: Double);
begin
  Path.AddArc(TGPRectF_CreateF(ARect),AStartAngle,ASweepAngle);

end;

procedure TGDIPlusDrawPathData.AddEllipse(const ARect: TRectF);
begin
  Path.AddEllipse(TGPRectF_CreateF(ARect));
end;

procedure TGDIPlusDrawPathData.AddPie(const ARect: TRectF; AStartAngle,
  ASweepAngle: Double);
begin
  Path.AddPie(TGPRectF_CreateF(ARect),AStartAngle,ASweepAngle);
end;

procedure TGDIPlusDrawPathData.AddRect(const ARect: TRectF);
begin
  Path.AddRectangle(TGPRectF_CreateF(ARect));
end;

procedure TGDIPlusDrawPathData.Clear;
begin
  Path:=TGPGraphicsPath.Create();
//  Region:=nil;
end;

//procedure TGDIPlusDrawPathData.Close;
//begin
//  Path.CloseFigure;
//end;

constructor TGDIPlusDrawPathData.Create;
begin
  inherited;
  Path:=TGPGraphicsPath.Create();
end;

destructor TGDIPlusDrawPathData.Destroy;
begin
  //创建了Path之后，释放会报错
//  Path:=nil;
  inherited;
end;

//procedure TGDIPlusDrawPathData.GetRegion;
//begin
//  Region:=TGPRegion.Create(Path);
//
//end;
//
//function TGDIPlusDrawPathData.IsInRegion(const APoint: TPointF): Boolean;
//begin
//  Result:=False;
//  if Self.Region<>nil then
//  begin
//    Result:=Region.IsVisible(APoint.X,APoint.Y);
//  end;
//end;

procedure TGDIPlusDrawPathData.LineTo(const X:Double;const Y:Double);
begin
  Path.AddLine(OriginX,OriginY,X,Y);
  OriginX:=X;
  OriginY:=Y;
end;

procedure TGDIPlusDrawPathData.MoveTo(const X:Double;const Y:Double);
begin
  OriginX:=X;
  OriginY:=Y;
end;


initialization
//  TGPTextRenderingHint = (
//    TextRenderingHintSystemDefault = 0,            // Glyph with system default rendering hint
//    TextRenderingHintSingleBitPerPixelGridFit,     // Glyph bitmap with hinting
//    TextRenderingHintSingleBitPerPixel,            // Glyph bitmap without hinting
//    TextRenderingHintAntiAliasGridFit,             // Glyph anti-alias bitmap with hinting
//    TextRenderingHintAntiAlias,                    // Glyph anti-alias bitmap without hinting
//    TextRenderingHintClearTypeGridFit);            // Glyph CT bitmap with hinting

  GlobalGPTextRenderingHint:=TGPTextRenderingHint.TextRenderingHintClearTypeGridFit;


end.
