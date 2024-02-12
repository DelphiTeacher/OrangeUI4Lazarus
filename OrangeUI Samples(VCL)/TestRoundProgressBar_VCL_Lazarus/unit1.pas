unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics,


    uNativeDrawCanvas,
    uNativeSkinPictureEngine,
    uDrawEngine,
    uSkinPicture,
    uBasePathData,
    uDrawCanvas,
    //TestDrawCanvasFrame,
    uSkinProgressBarType,
  //  DashBoard_Projects_PieChart_ProjectStatusFrame,


  Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public
    FSkinRoundProgressBar:TSkinRoundProgressBar;

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
    GlobalDrawCanvasClass:=TNativeDrawCanvas;
    GlobalSkinPictureClass:=TSkinPicture;
    GlobalSkinPictureEngineClass:=TSkinPictureEngine;
    GlobalSkinGIFPictureEngineClass:=TNativeSkinGIFPictureEngine;
    GlobalDrawPathDataClass:=TNativeDrawPathData;


    FSkinRoundProgressBar:=TSkinRoundProgressBar.Create(Self);
    FSkinRoundProgressBar.Parent:=Self;
    FSkinRoundProgressBar.SetBounds(0,0,100,100);
    FSkinRoundProgressBar.Properties.Position:=50;
    FSkinRoundProgressBar.SelfOwnMaterial.MaxAngle:=120;
    FSkinRoundProgressBar.SelfOwnMaterial.BackColor.IsFill:=True;
    FSkinRoundProgressBar.SelfOwnMaterial.BackColor.Color:=clRed;

    //底色
    FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.IsFill:=True;
    FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.FillColor.Color:=clGreen;
    FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.PenWidth:=1;
    FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.PenColor.Color:=clYellow;

    //进度
    FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.IsFill:=True;
    FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.FillColor.Color:=clYellow;
    FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.PenWidth:=1;
    FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.PenColor.Color:=clBlue;




end;

end.

