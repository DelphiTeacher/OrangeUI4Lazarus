unit uBGRASVGSupport;

interface
{$mode delphi}{$H+}

uses
  //Windows,
  Messages, SysUtils, Variants, Classes, Graphics,
  //GDIPOBJ
  //, GDIPAPI
  //, SVGTypes,
  //  SVG,
    uSkinWindowsControl,
  //Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  BGRABitmap,BGRABitmapTypes,BGRASVG,BGRASVGType,BGRASVGShapes,
  uSkinPicture,
  uBGRADrawCanvas,
  Types,
  UITypes,
  uFuncCommon,
  uGraphicCommon,
  uDrawPictureParam,
  Math,
  uDrawCanvas,
  uDrawPicture, uSkinImageType;

type

  { TLCLSVGSupport }

  TLCLSVGSupport=class
  public
    FFixedColor:TColor;
    procedure ChangeFill(AElement: TSVGElement; AData: pointer;
      var ARecursive: boolean);
  end;


var
  GlobalLCLSVGSupport:TLCLSVGSupport;

function CreateSVGObject(Sender:TObject;ASVGStream:TStream):TObject;
procedure DrawSVGImage(ADrawCanvas:TDrawCanvas;ASkinPicture:TSkinPicture;ADrawPictureParam:TDrawPictureParam;ASVGObject:TObject;ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF;
                            AOwnerDrawPicture:TBaseDrawPicture);


implementation

function CreateSVGObject(Sender:TObject;ASVGStream:TStream):TObject;
var
  AStringStream:TStringStream;
begin
  //Result:=TSVG.Create;
  //TSVG(Result).LoadFromStream(ASVGStream);
  AStringStream:=TStringStream.Create('',TEncoding.UTF8);
  AStringStream.LoadFromStream(ASVGStream);
  Result:= TBGRASVG.CreateFromString(AStringStream.DataString);
  //Result:= TBGRASVG.CreateFromString(GetStringFromStream(ASVGStream));
end;

procedure DrawSVGImage(ADrawCanvas:TDrawCanvas;ASkinPicture:TSkinPicture;ADrawPictureParam:TDrawPictureParam;ASVGObject:TObject;ADrawRect:TRectF;
                            const AIsUseSrcRectAndDestDrawRect:Boolean;
                            const AImageSrcRect:TRectF;
                            const AImageDestDrawRect:TRectF;
                            AOwnerDrawPicture:TBaseDrawPicture);
var
  svg:TBGRASVG;
  //bmp: TBGRABitmap;
  //AFixedColor:TColor;
  //GPRectF: TGPRectF;
//  RectArray: TRectarray;
begin
  svg:=TBGRASVG(ASVGObject);

  //GPRectF.X := AImageDestDrawRect.Left;
  //GPRectF.Y := AImageDestDrawRect.Top;
  //GPRectF.Width := AImageDestDrawRect.Width;
  //GPRectF.Height := AImageDestDrawRect.Height;
  //bmp:= TBGRABitmap.Create();

  try
    //bmp.SetSize(Round(AImageDestDrawRect.Width),Round(AImageDestDrawRect.Height));
    //bmp.Fill(clBlack);
    //bmp.TransparentColor:=clWhite;


    //TSVG(ASVGObject).SetBounds(GPRectF);
    //bmp.SetSize(Round(GPRectF.Width),Round(GPRectF.Height));
    //svg.StretchDraw(bmp.Canvas2D, taCenter, tlCenter, 0,0,Image1.Width,Image1.Height);
    //Image1.Picture.Bitmap.Assign(bmp);

  //  RectArray := TRectArray.Create(TRect.Create(0, 0, ABitmap.Width, ABitmap.Height));
  //  RectArray := TRectArray.Create(TRect.Create(Ceil(ADrawRect.Left), Ceil(ADrawRect.Top), Ceil(ADrawRect.Width), Ceil(ADrawRect.Height)));
  //  RectArray := TRectArray.Create(TRect.Create(0,0, Ceil(ADrawRect.Width), Ceil(ADrawRect.Height)));
  //  RectArray := TRectArray.Create(TRect.Create(0,0, 50, 50));

    if ADrawPictureParam.CurrentEffectFixedColor.Color<>clDefault then
    begin
      GlobalLCLSVGSupport.FFixedColor:=ADrawPictureParam.CurrentEffectFixedColor.Color;
    end
    else
    begin
      GlobalLCLSVGSupport.FFixedColor:=AOwnerDrawPicture.FixedColor.Color;
    end;
    //bmp.Fill(AFixedColor);

    //TSVG(ASVGObject).PaintTo(ADrawCanvas.FHandle,GPRectF,nil,0);

    //ASkinPicture.Assign(ASkinPicture);
    //ADrawCanvas.Canvas.StretchDraw(RectF2Rect(AImageDestDrawRect),ASkinPicture);
    svg.IterateElements(GlobalLCLSVGSupport.ChangeFill, nil, true);

    //svg.StretchDraw(TBGRADrawCanvas(ADrawCanvas).FCanvas2D, taCenter, tlCenter, 0,0,bmp.Width,bmp.Height);
    svg.StretchDraw(TBGRADrawCanvas(ADrawCanvas).FBGRACanvas2D, taCenter, tlCenter, AImageDestDrawRect.Left,AImageDestDrawRect.Top,AImageDestDrawRect.Width,AImageDestDrawRect.Height);

    //svg.StretchDraw(bmp.Canvas2D, taCenter, tlCenter, 0,0,bmp.Width,bmp.Height);

    //bmp.ReplaceColor(clBlack,BGRAPixelTransparent);
    //ADrawCanvas.Canvas.Transparent


    //bmp.Draw(ADrawCanvas.Canvas,RectF2Rect(AImageDestDrawRect),True);

  finally
    //FreeAndNil(bmp);
  end;
end;

{ TLCLSVGSupport }

procedure TLCLSVGSupport.ChangeFill(AElement: TSVGElement; AData: pointer;
  var ARecursive: boolean);
begin
  if AElement is TSVGDefine then
    ARecursive:= false
  else
  begin
   if not AElement.isFillNone then AElement.fillColor := FFixedColor;//CSSSkyBlue;
   if not AElement.isStrokeNone then AElement.strokeColor := FFixedColor;//CSSSkyBlue;
  end;

end;

initialization
  GlobalOnCreateSVGObject:=CreateSVGObject;
  GlobalOnDrawSVGImage:=DrawSVGImage;
  GlobalLCLSVGSupport:=TLCLSVGSupport.Create;

finalization
  FreeAndNil(GlobalLCLSVGSupport);

end.
