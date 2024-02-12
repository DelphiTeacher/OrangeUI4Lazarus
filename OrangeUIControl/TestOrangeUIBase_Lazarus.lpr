program TestOrangeUIBase_Lazarus;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, LazarusTestOrangeUIBaseForm, uTestOrangeUIBase, uskinsuperobject,
  uFileCommon, uFuncCommon, uBaseLog, uBaseList, uBaseHttpControl,
  uGraphicCommon, uBinaryTreeDoc, uDrawParam, uDrawCanvas, uDrawEngine,
  uDrawLineParam, uDrawPathParam, uDrawPicture, uDrawPictureParam,
  uDrawRectParam, uDrawTextParam, uComponentType, uSkinListLayouts,
  uSkinMaterial, uSkinPicture, uTimerTask, uTimerTaskEvent, uSkinRegManager,
  uSkinPublic, uSkinItems, uSkinAnimator, uSkinImageList, uSkinWindowsControl,
  uBaseSkinControl, uSkinWindowsLabel, uSkinGDIPlus, uGDIPlusDrawCanvas,
  uGDIPlusSkinPictureEngine, uSkinLabelType, uSkinButtonType;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

