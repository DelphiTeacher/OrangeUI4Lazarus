unit uTestOrangeUIDesignTime;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uSkinLabelType,
  Windows,
  ActiveX,
  //GDIPlus,
  uSkinGDIPlus, uGDIPlusSkinPictureEngine, uSkinImageType, uSkinButtonType,
  uSkinPanelType, uSkinCheckBoxType, uSkinListBoxType;

type

  { TForm1 }

  TForm1 = class(TForm)
    SkinImage1: TSkinImage;
    SkinLabel1: TSkinLabel;
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
var
  AGraphics:IGPGraphics;
  ABitmap:IGPBitmap;
  ADC:HDC;
  //AStream:TFileStream;
  AStream:TMemoryStream;
  AAdapter:IStream;
  AGPRectF:uSkinGDIPlus.TGPRectF;
  ABitmapWidth:Single;
  ABitmapHeight:Single;
  //AGPFont:IGPFont;
  //AGPBrush:IGPBrush;
  AGPImageAttributes:IGPImageAttributes;
begin
  //
  //Canvas.Draw(0,0,Self.SkinImage1.Properties.Picture.Graphic);

  ADC:=Canvas.Handle;
  AGraphics:=TGPGraphics.Create(ADC);

  //AGPFont:=TGPFont.Create('Tahoma',20,[],UnitPixel);
  //AGPBrush:=TGPSolidBrush.Create(TGPColor_CreateFromColorRef(clBlack));
  //AGraphics.DrawString('Hello',
  //                    AGPFont,
  //                    TGPPointF_Create(0,0),
  //                    AGPBrush);

  //AGPBitmap:=TGPBitmap.Create('C:\Users\Administrator\Pictures\aa.jpg');
  //AStream:=TFileStream.Create('C:\Users\Administrator\Pictures\aa.jpg',fmOpenRead);

  AStream:=TMemoryStream.Create;
  Self.SkinImage1.Properties.Picture.SaveToStream(AStream);
  AStream.Position:=0;
  AAdapter:=TCFStreamAdapter.Create(AStream, soReference);
  ABitmap:=TGPBitmap.Create(AAdapter, True);


  //AGraphics.DrawImage(ABitmap,0,0);
  //AGPImageAttributes:=TGPImageAttributes.Create;

  ABitmapWidth:=ABitmap.Width;
  ABitmapHeight:=ABitmap.Height;

  AGPRectF:=TGPRectF_Create(0,0,ABitmapWidth,ABitmapHeight);

  AGraphics.DrawImage(ABitmap,
                      AGPRectF,
                      0,0,ABitmapWidth,ABitmapHeight,
                      UnitPixel,
                      nil);


  //可以
  //AGraphics.DrawImage(ABitmap,TGPRectF_Create(0,0,ABitmap.Width,ABitmap.Height));
  //可以
  //AGraphics.DrawImage(ABitmap,0,0,ABitmap.Width,ABitmap.Height,
  //0,0,ABitmap.Width,ABitmap.Height,TGPUnit.UnitPixel);

  AStream.Free;



end;

end.

