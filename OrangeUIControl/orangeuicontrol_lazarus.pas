{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit OrangeUIControl_Lazarus;

{$warn 5023 off : no warning about unused units}
interface

uses
  MD5_OrangeUI, uBasePageStructure, uBasePathData, uBinaryObjectList, 
  uDownloadPictureManager, uFrameContext, uLang, uSkinBufferBitmap, 
  uSkinGIFImage, uUIFunction, uUrlPicture, uVersion, uBaseHttpControl, 
  uBaseList, uBaseLog, uBinaryTreeDoc, uComponentType, uDrawCanvas, 
  uDrawEngine, uDrawLineParam, uDrawParam, uDrawPathParam, uDrawPicture, 
  uDrawPictureParam, uDrawRectParam, uDrawTextParam, uFileCommon, uFuncCommon, 
  uGraphicCommon, uSkinAnimator, uSkinImageList, uSkinItems, uSkinListLayouts, 
  uSkinMaterial, uSkinPicture, uSkinPublic, uSkinRegManager, uTimerTask, 
  uTimerTaskEvent, uSkinButtonType, uSkinLabelType, uBaseSkinControl, 
  uSkinWindowsControl, uSkinCheckBoxType, uComponentTypeRegister, 
  uSkinCalloutRectType, uSkinComboBoxType, uSkinComboEditType, 
  uSkinControlGestureManager, uSkinControlPanDragGestureManager, 
  uSkinCustomListType, uSkinDateEditType, uSkinDBGridType, uSkinDrawPanelType, 
  uSkinEditType, uSkinFrameImageType, uSkinImageListPlayerType, 
  uSkinImageListViewerType, uSkinImageType, uSkinItemDesignerPanelType, 
  uSkinItemGridType, uSkinListBoxType, uSkinListViewType, uSkinMemoType, 
  uSkinMultiColorLabelType, uSkinNotifyNumberIconType, uSkinPageControlType, 
  uSkinPanelType, uSkinPopupType, uSkinProgressBarType, 
  uSkinPullLoadPanelType, uSkinRadioButtonType, uSkinRoundImageType, 
  uSkinScrollBarType, uSkinScrollBoxContentType, uSkinScrollBoxType, 
  uSkinScrollControlCornerType, uSkinScrollControlType, uSkinSwitchBarType, 
  uSkinSwitchPageListControlGestureManager, uSkinSwitchPageListPanelType, 
  uSkinSwitchType, uSkinTimeEditType, uSkinTrackBarType, uSkinTreeViewType, 
  uSkinVirtualChartType, uSkinVirtualGridType, uSkinVirtualListType, 
  uskinsuperobject, uComponentTypeNameEditor, uDrawPictureEditor, 
  uNativeDrawCanvas, uNativeSkinPictureEngine, uSkinFormType, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('uComponentTypeRegister', @uComponentTypeRegister.Register);
  RegisterUnit('uComponentTypeNameEditor', @uComponentTypeNameEditor.Register);
  RegisterUnit('uDrawPictureEditor', @uDrawPictureEditor.Register);
end;

initialization
  RegisterPackage('OrangeUIControl_Lazarus', @Register);
end.
