program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Types, Controls, uDrawCanvas, uSkinPicture, uDrawPicture, uBasePathData,
  Forms,

  uSkinBufferBitmap,
  uBGRABufferBitmap, uBGRADrawCanvas, uBGRASkinPictureEngine, uNativeDrawCanvas,
  uNativeSkinPictureEngine,


  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus, uBGRASVGSupport,
  uRestInterfaceCall, uDataSetToJson, uIdHttpControl, uOpenClientCommon,
  ListItemStyle_Default, indylaz, MainForm, ButtonFrame, CheckBoxFrame,
  DashBoard_AnalyseFrame, DashBoard_ProjectsFrame,
  DashBoard_Analyse_BarChart_MonthSummaryFrame,
  DashBoard_Projects_PieChart_ProjectStatusFrame,
  DashBoard_Analyse_ItemGrid_TwoCellTextFrame,
  DashBoard_Projects_ItemGrid_TwoCellTextHasBackColorFrame, LoginForm,
  HomeFrame, EditFrame, uConst;

{$R *.res}

begin
  RequireDerivedFormResource:=True;

  //GlobalDrawCanvasClass:=TNativeDrawCanvas;
  //GlobalSkinPictureClass:=TSkinPicture;
  //GlobalSkinPictureEngineClass:=TSkinPictureEngine;
  //GlobalSkinGIFPictureEngineClass:=TNativeSkinGIFPictureEngine;
  //GlobalDrawPathDataClass:=TNativeDrawPathData;

  GlobalDrawCanvasClass:=TBGRADrawCanvas;
  GlobalSkinPictureClass:=TSkinPicture;
  GlobalSkinPictureEngineClass:=TBGRASkinPictureEngine;
  GlobalSkinGIFPictureEngineClass:=TBGRASkinGIFPictureEngine;
  GlobalDrawPathDataClass:=TBGRADrawPathData;
  GlobalBufferBitmapClass:=TBGRABufferBitmap;



  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmEasyServiceCommonMaterial, dmEasyServiceCommonMaterial);
  Application.CreateForm(TfrmMain, frmMain);
  //Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin:=TfrmLogin.Create(nil);
  if frmLogin.ShowModal=mrOK then
  begin
    Application.Run;
  end;


  //frmMain.Free;
  //dmEasyServiceCommonMaterial.Free;
end.

