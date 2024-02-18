unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,


  BGRACanvas,
  BGRABitmap,
  uDrawCanvas,
  uSkinPicture,
  uDrawPicture,
  uBasePathData,
  uSkinBufferBitmap,
  uBGRADrawCanvas,
  uBGRABufferBitmap,
  uBGRASkinPictureEngine,

  DashBoard_Analyse_LineChart_MonthSummaryFrame;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public
    FLineChartFrame:TFrameLineChart_MonthSummary;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

  GlobalDrawCanvasClass:=TBGRADrawCanvas;
  GlobalSkinPictureClass:=TSkinPicture;
  GlobalSkinPictureEngineClass:=TBGRASkinPictureEngine;
  GlobalSkinGIFPictureEngineClass:=TBGRASkinGIFPictureEngine;
  GlobalDrawPathDataClass:=TBGRADrawPathData;
  GlobalBufferBitmapClass:=TBGRABufferBitmap;

  FLineChartFrame:=TFrameLineChart_MonthSummary.Create(Self);
  FLineChartFrame.Parent:=Self;
  FLineChartFrame.Align:=alClient;



end;

end.

