unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  uNativeDrawCanvas,
  uNativeSkinPictureEngine,
  uDrawEngine,
  uSkinPicture,
  uBasePathData,
  uDrawCanvas,
  TestDrawCanvasFrame,
  uSkinProgressBarType,
//  DashBoard_Projects_PieChart_ProjectStatusFrame,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FSkinRoundProgressBar:TSkinRoundProgressBar;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  ATestDrawCanvasFrame:TFrameTestDrawCanvas;
//  APieChart_ProjectStatusFrame:TFramePieChart_ProjectStatus;
begin
  GlobalDrawCanvasClass:=TNativeDrawCanvas;
  GlobalSkinPictureClass:=TSkinPicture;
  GlobalSkinPictureEngineClass:=TSkinPictureEngine;
  GlobalSkinGIFPictureEngineClass:=TNativeSkinGIFPictureEngine;
  GlobalDrawPathDataClass:=TNativeDrawPathData;

//  APieChart_ProjectStatusFrame:=TFramePieChart_ProjectStatus.Create(Self);
//  APieChart_ProjectStatusFrame.Parent:=Self;
//  APieChart_ProjectStatusFrame.Align:=alClient;


//  ATestDrawCanvasFrame:=TFrameTestDrawCanvas.Create(Self);
//  ATestDrawCanvasFrame.Parent:=Self;
//  ATestDrawCanvasFrame.Align:=alClient;


  FSkinRoundProgressBar:=TSkinRoundProgressBar.Create(Self);
  FSkinRoundProgressBar.Parent:=Self;
  FSkinRoundProgressBar.SetBounds(0,0,100,100);
  FSkinRoundProgressBar.Properties.Position:=50;
  FSkinRoundProgressBar.SelfOwnMaterial.MaxAngle:=120;
  FSkinRoundProgressBar.SelfOwnMaterial.BackColor.IsFill:=True;
  FSkinRoundProgressBar.SelfOwnMaterial.BackColor.Color:=clRed;

  //µ×É«
  FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.IsFill:=True;
  FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.FillColor.Color:=clGreen;
  FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.PenWidth:=1;
  FSkinRoundProgressBar.SelfOwnMaterial.DrawBackPathParam.PenColor.Color:=clYellow;

  //½ø¶È
  FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.IsFill:=True;
  FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.FillColor.Color:=clYellow;
  FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.PenWidth:=1;
  FSkinRoundProgressBar.SelfOwnMaterial.DrawForePathParam.PenColor.Color:=clBlue;





end;

end.
