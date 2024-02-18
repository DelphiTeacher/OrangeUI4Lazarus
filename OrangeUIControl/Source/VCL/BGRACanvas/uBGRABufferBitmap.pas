//convert pas to utf8 by ¥

/// <summary>
///   <para>
///     缓存位图
///   </para>
///   <para>
///     Buffer bitmap
///   </para>
/// </summary>
unit uBGRABufferBitmap;


interface
{$I FrameWork.inc}




uses
  Classes,
  SysUtils,
  Math,

//  {$IF CompilerVersion>=30.0}
  Types,//定义了TRectF
//  {$IFEND}

  {$IFDEF VCL}
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Graphics,
  {$ENDIF}

  {$IFDEF FMX}
  FMX.Types,
  FMX.Objects,
  FMX.Graphics,
  FMX.Platform,
  {$ENDIF}

  uBaseList,
  uBaseLog,
  uDrawCanvas,
  uFuncCommon,
  uDrawEngine,
  BGRABitmap,
  uSkinBufferBitmap,
  uGraphicCommon,
  uDrawTextParam;





type


  //缓存位图

  { TBGRABufferBitmap }

  TBGRABufferBitmap=class(TBaseBufferBitmap)
  private
    FBGRABitmap:TBGRABitmap;
  public
    //constructor Create;
    destructor Destroy;override;
  public
    //创建位图
    procedure CreateBufferBitmap(AWidth:Integer;AHeight:Integer;AScale:Single=1);override;
    procedure DrawTo(ACanvas:TCanvas);override;
  end;






implementation





{ TBGRABufferBitmap }

procedure TBGRABufferBitmap.CreateBufferBitmap(AWidth:Integer;AHeight:Integer;AScale:Single=1);
begin
  Width:=AWidth;
  Height:=AHeight;

  FreeAndNil(FBGRABitmap);
  FreeAndNil(FDrawCanvas);

  Self.FBGRABitmap:=TBGRABitmap.Create;
  FBGRABitmap.SetSize(AWidth,AHeight);

  FDrawCanvas:=CreateDrawCanvas('TBufferBitmap');
  FDrawCanvas.PrepareBitmap(FBGRABitmap);
end;

procedure TBGRABufferBitmap.DrawTo(ACanvas: TCanvas);
begin
  FBGRABitmap.Draw(ACanvas,0,0);
end;

destructor TBGRABufferBitmap.Destroy;
begin
  FreeAndNil(FBGRABitmap);
  FreeAndNil(FDrawCanvas);

  inherited;
end;






end.


