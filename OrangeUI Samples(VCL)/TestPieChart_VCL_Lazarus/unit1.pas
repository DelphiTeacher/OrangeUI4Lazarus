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

  DashBoard_Projects_PieChart_ProjectStatusFrame;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public
    FPieChartFrame:TFramePieChart_ProjectStatus;
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

  FPieChartFrame:=TFramePieChart_ProjectStatus.Create(Self);
  FPieChartFrame.Parent:=Self;
  FPieChartFrame.Align:=alClient;

end;

end.

