//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     控件类型注册
///   </para>
///   <para>
///     Component type register
///   </para>
/// </summary>
unit uComponentTypeRegister;





interface
{$I FrameWork.inc}
{$I Version.inc}



uses
  Classes,
  SysUtils,
  uBaseList,
  {$IFDEF FMX}
  FMX.Controls,
  {$ENDIF}

  //组件
  uGraphicCommon,
  uTimerTask,
  uTimerTaskEvent,

  {$IFDEF FMX}
  uFrameContext,
  uSkinCommonFrames,
  uSkinCalloutRectType,
  {$ENDIF}

  uSkinAnimator,
  uSkinImageList,
  uSkinRegManager,
  uDownloadPictureManager,
  uSkinControlGestureManager,
  uSkinControlPanDragGestureManager,
  uSkinSwitchPageListControlGestureManager,


  //控件
  uSkinCheckBoxType,
  uSkinSwitchType,
  uSkinRadioButtonType,
  uSkinLabelType,
  uSkinMultiColorLabelType,
  uSkinPanelType,
  uSkinDrawPanelType,
  uSkinPageControlType,
  uSkinItemDesignerPanelType,
//  uSkinDirectUIParentType,
  uSkinImageType,
  uSkinFrameImageType,
  uSkinRepeatImageType,
  uSkinRoundImageType,
  uSkinImageListPlayerType,
  uSkinImageListViewerType,
  uSkinSwitchPageListPanelType,
//  uSkinCalloutRectType,

  uSkinEditType,
  uSkinComboBoxType,
  uSkinDateEditType,
  uSkinTimeEditType,
  uSkinPopupType,
  uSkinComboEditType,
  uSkinMemoType,

  {$IFDEF FMX}
  uSkinRoundRectType,
  uProcessNativeControlModalShowPanel,
  uSkinRegExTagLabelViewType,
  {$ENDIF}


  uSkinButtonType,
  uSkinNotifyNumberIconType,
  uSkinTrackBarType,
  uSkinSwitchBarType,
  uSkinProgressBarType,


  uSkinScrollBarType,

  uSkinScrollControlType,
  uSkinScrollControlCornerType,

  uSkinScrollBoxType,
  uSkinScrollBoxContentType,

  uSkinCustomListType,

  uSkinVirtualListType,
  uSkinListBoxType,


  {$IFDEF OPENSOURCE_VERSION}
  //开源版没有ListView,TreeView,Grid
  {$ELSE}
  uSkinListViewType,
  uSkinTreeViewType,
//  uSkinVirtualGridType,
  uSkinItemGridType,
  uSkinDBGridType,
  {$ENDIF}

  uSkinPullLoadPanelType,
  uSkinVirtualChartType,

  {$IFDEF VCL}
  uSkinFormType,
  {$ENDIF}


//  {$IFDEF FMX}
//  uSkinFireMonkeyButton,
//  uSkinFireMonkeyLabel,
//  uSkinFireMonkeyMultiColorLabel,
//  uSkinFireMonkeyEdit,
//  uSkinFireMonkeyComboBox,
////  uSkinFireMonkeyMyComboBox,
//  uSkinFireMonkeyDateEdit,
//  uSkinFireMonkeyTimeEdit,
//  uSkinFireMonkeyPopup,
//  uSkinFireMonkeyComboEdit,
//  uSkinFireMonkeyMemo,
//  uSkinFireMonkeyPanel,
//  uSkinFireMonkeyDrawPanel,
////  uSkinFireMonkeyDirectUIParent,
//  uSkinFireMonkeyPageControl,
//  uSkinFireMonkeyItemDesignerPanel,
//  uSkinFireMonkeyImage,
//  uSkinFireMonkeyRoundRect,
//  uSkinFireMonkeyImageListPlayer,
//  uSkinFireMonkeyImageListViewer,
//  uSkinFireMonkeyRoundImage,
//  uSkinFireMonkeyFrameImage,
//  uSkinFireMonkeyTrackBar,
//  uSkinFireMonkeySwitchBar,
//  uSkinFireMonkeyProgressBar,
//  uSkinFireMonkeyScrollBar,
//  uSkinFireMonkeyPullLoadPanel,
//  uSkinFireMonkeyScrollBox,
//  uSkinFireMonkeyScrollBoxContent,
//  uSkinFireMonkeyScrollControl,
//  uSkinFireMonkeyScrollControlCorner,
//  uSkinFireMonkeySwitchPageListPanel,
//
//  uSkinFireMonkeyCustomList,
////  uSkinFireMonkeyVirtualList,
//  uSkinFireMonkeyListBox,
//
//  {$IFDEF OPENSOURCE_VERSION}
//  //开源版没有ListView,TreeView,Grid
//  {$ELSE}
//  uSkinFireMonkeyListView,
//  uSkinFireMonkeyTreeView,
//
////  uSkinFireMonkeyVirtualGrid,
//  uSkinFireMonkeyItemGrid,
//  uSkinFireMonkeyDBGrid,
////  uSkinRegExTagLabelViewType,
//  {$ENDIF}
//
//
//  uSkinFireMonkeyRadioButton,
//  uSkinFireMonkeyNotifyNumberIcon,
//  uSkinFireMonkeyCheckBox,
////  uSkinFireMonkeyCalloutRect,
//  uSkinFireMonkeySwitch,
//  {$ENDIF}


  {$IFDEF VCL}


  {$IFDEF MSWINDOWS}
//  uSkinFormPictureType,
//  uSkinFormColorType,

  //uSkinWindowsForm,
//  uSkinWindowsMultiColorLabel,
  //uSkinWindowsEdit,
  //uSkinWindowsComboBox,
  //uSkinWindowsMyComboBox,
  //uSkinWindowsMyComboBox,
  //uSkinWindowsDateEdit,
//  uSkinWindowsTimeEdit,
//  uSkinWindowsPopup,
//  uSkinWindowsComboEdit,
  //uSkinWindowsMemo,
//  uSkinWindowsRoundRect,
//  uSkinWindowsRoundImage,
//  uSkinWindowsSwitchBar,
//  uSkinWindowsStringGrid,
//  uSkinWindowsSwitch,
//  uSkinWindowsButton,
//  uSkinWindowsLabel,
//  uSkinWindowsPanel,
//  uSkinWindowsDrawPanel,
//  uSkinWindowsDirectUIParent,
//  uSkinWindowsPageControl,
//  uSkinWindowsItemDesignerPanel,
//  uSkinWindowsImage,
//  uSkinWindowsImageListPlayer,
//  uSkinWindowsImageListViewer,
//  uSkinWindowsFrameImage,
//  uSkinWindowsTrackBar,
//  uSkinWindowsProgressBar,
//  uSkinWindowsScrollBar,
//  uSkinWindowsPullLoadPanel,
//  uSkinWindowsScrollBox,
//  uSkinWindowsScrollBoxContent,
//  uSkinWindowsScrollControl,
//  uSkinWindowsScrollControlCorner,
//  uSkinWindowsSwitchPageListPanel,
//  uSkinWindowsListView,
//  uSkinWindowsTreeView,
//  uSkinWindowsDBGrid,
//  uSkinWindowsListBox,
//  uSkinWindowsRadioButton,
//  uSkinWindowsNotifyNumberIcon,
//  uSkinWindowsCheckBox,
//  uSkinWindowsCalloutRect,
  {$ENDIF}
  {$ENDIF}




  uSkinMaterial,
  uComponentType;





type
  TPersistentClassArray=Array of TPersistentClass;



////注册组件类型
//procedure RegisterComponentTypes;
////注册组件类
//procedure RegisterComponentClasses;
//
//
//
//
//
//var
//  //组件
//  OrangeUI_ComponentArray:Array of TComponentClass;
//  //控件
//  OrangeUI_ControlArray:Array of TComponentClass;
//  //素材
//  OrangeUI_MaterialArray:Array of TComponentClass;

var
  GlobalRegisteredClassList:TStringList;


//把控件数组转换成Persistent数组
function ConvertComponentArrayToPersistentArray(AComponentArray:Array of TComponentClass):TPersistentClassArray;


procedure Register;

implementation

{$R OrangeUI.dcr}


uses
  uDrawCanvas;


procedure Register;
var
  I: Integer;
  J: Integer;
  AControlClassifyReg:TControlClassifyReg;
begin
  //  I:=0;OrangeUI_ComponentArray[I]:=TSkinTheme;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinAnimator;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TControlEffectAnimator;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinControlMoveAnimator;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinImageList;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TTimerTaskEvent;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TDrawCanvasSetting;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TDownloadPictureManager;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinControlGestureManager;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinControlPanDragGestureManager;
  //  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinSwitchPageListControlGestureManager;


  RegisterComponents('OrangeUIComponent',[TSkinTheme]);
  RegisterComponents('OrangeUIComponent',[TSkinAnimator]);
  RegisterComponents('OrangeUIComponent',[TControlEffectAnimator]);
  RegisterComponents('OrangeUIComponent',[TSkinControlMoveAnimator]);
  RegisterComponents('OrangeUIComponent',[TSkinImageList]);
  RegisterComponents('OrangeUIComponent',[TTimerTaskEvent]);
  RegisterComponents('OrangeUIComponent',[TDrawCanvasSetting]);
  RegisterComponents('OrangeUIComponent',[TDownloadPictureManager]);
//  RegisterComponents('OrangeUIComponent',[TSkinControlGestureManager]);
//  RegisterComponents('OrangeUIComponent',[TSkinControlPanDragGestureManager]);
//  RegisterComponents('OrangeUIComponent',[TSkinSwitchPageListControlGestureManager]);



  /////////////////////////////////////////////////////
  RegisterComponents('OrangeUIConrol',[TSkinButton]);
  RegisterComponents('OrangeUIConrol',[TSkinButtonGroup]);
  RegisterComponents('OrangeUIConrol',[TSkinSelectDateAreaButton]);
  RegisterComponents('OrangeUIConrol',[TSkinLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinRollLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinHintLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinMultiColorLabel]);

//  {$IFDEF MSWINDOWS}
//  RegisterComponents('OrangeUIConrol',[TSkinEdit]);
  RegisterComponents('OrangeUIConrol',[TSkinComboBox]);
//  //RegisterComponents('OrangeUIConrol',[TSkinDateEdit]);
////  RegisterComponents('OrangeUIConrol',[TSkinTimeEdit]);
////  RegisterComponents('OrangeUIConrol',[TSkinPopup]);
////  RegisterComponents('OrangeUIConrol',[TSkinComboEdit]);
//  RegisterComponents('OrangeUIConrol',[TSkinMemo]);
//  {$ENDIF}

  RegisterComponents('OrangeUIConrol',[TSkinImage]);
  RegisterComponents('OrangeUIConrol',[TSkinRepeatImage]);
  RegisterComponents('OrangeUIConrol',[TSkinFrameImage]);
  RegisterComponents('OrangeUIConrol',[TSkinRoundImage]);
  //RegisterComponents('OrangeUIConrol',[TSkinRoundRect]);
  RegisterComponents('OrangeUIConrol',[TSkinImageListPlayer]);
  RegisterComponents('OrangeUIConrol',[TSkinImageListViewer]);
  RegisterComponents('OrangeUIConrol',[TSkinPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinDrawPanel]);
  //RegisterComponents('OrangeUIConrol',[TSkinDirectUIParent]);
  RegisterComponents('OrangeUIConrol',[TSkinPageControl]);
  RegisterComponents('OrangeUIConrol',[TSkinTabSheet]);
  RegisterComponents('OrangeUIConrol',[TSkinItemDesignerPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinCheckBox]);
  //RegisterComponents('OrangeUIConrol',[TSkinCalloutRect]);
  RegisterComponents('OrangeUIConrol',[TSkinSwitch]);
  RegisterComponents('OrangeUIConrol',[TSkinTrackBar]);
  RegisterComponents('OrangeUIConrol',[TSkinSwitchBar]);
  RegisterComponents('OrangeUIConrol',[TSkinProgressBar]);
  RegisterComponents('OrangeUIConrol',[TSkinScrollBar]);
  RegisterComponents('OrangeUIConrol',[TSkinPullLoadPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinNotifyNumberIcon]);

  RegisterComponents('OrangeUIConrol',[TSkinScrollBox]);
  RegisterComponents('OrangeUIConrol',[TSkinScrollBoxContent]);
  RegisterComponents('OrangeUIConrol',[TSkinScrollControl]);
  RegisterComponents('OrangeUIConrol',[TSkinScrollControlCorner]);

  RegisterComponents('OrangeUIConrol',[TSkinSwitchPageListPanel]);


  RegisterComponents('OrangeUIConrol',[TSkinCustomList]);
  RegisterComponents('OrangeUIConrol',[TSkinVirtualList]);
  RegisterComponents('OrangeUIConrol',[TSkinListBox]);
  {$IFDEF OPENSOURCE_VERSION}
  //开源版没有ListView、TreeView、Grid
  {$ELSE}
  RegisterComponents('OrangeUIConrol',[TSkinListView]);
  RegisterComponents('OrangeUIConrol',[TSkinTreeView]);

  //RegisterComponents('OrangeUIConrol',[TSkinVirtualGrid]);
  RegisterComponents('OrangeUIConrol',[TSkinItemGrid]);

  RegisterComponents('OrangeUIConrol',[TSkinDBGrid]);
  {$ENDIF}

  RegisterComponents('OrangeUIConrol',[TSkinRadioButton]);


  RegisterComponents('OrangeUIConrol',[TSkinVirtualChart]);





  {$IFDEF FMX}
  RegisterComponents('OrangeUIConrol',[TSkinFMXButton]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXCheckBox]);

  RegisterComponents('OrangeUIConrol',[TSkinFMXButton]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXButtonGroup]);
  TSkinFMXSelectDateAreaButton]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXRollLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXHintLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXMultiColorLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXEdit]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXComboBox]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXDateEdit]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXTimeEdit]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXPopup]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXComboEdit]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXMemo]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXImage]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXFrameImage]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXRoundImage]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXRoundRect]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXImageListPlayer]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXImageListViewer]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXDrawPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXDirectUIParent]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXPageControl]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXTabSheet]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXItemDesignerPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXCheckBox]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXCalloutRect]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXSwitch]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXTrackBar]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXSwitchBar]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXProgressBar]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXScrollBar]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXPullLoadPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXNotifyNumberIcon]);

  RegisterComponents('OrangeUIConrol',[TSkinFMXScrollBox]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXScrollBoxContent]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXScrollControl]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXScrollControlCorner]);

  RegisterComponents('OrangeUIConrol',[TSkinFMXSwitchPageListPanel]);


  RegisterComponents('OrangeUIConrol',[TSkinFMXCustomList]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXVirtualList]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXListBox]);
  {$IFDEF OPENSOURCE_VERSION}
  开源版没有ListView]);TreeView]);Grid
  {$ELSE}
  RegisterComponents('OrangeUIConrol',[TSkinFMXListView]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXTreeView]);
  TSkinFMXRegExTagLabelView]);

  RegisterComponents('OrangeUIConrol',[TSkinFMXVirtualGrid]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXItemGrid]);

  RegisterComponents('OrangeUIConrol',[TSkinFMXDBGrid]);
  {$ENDIF}

  RegisterComponents('OrangeUIConrol',[TSkinFMXRadioButton]);


  TProcessNativeControlModalShowPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinFMXVirtualChart];


  {$ENDIF}


  {$IFDEF VCL}

//  {$IFDEF MSWINDOWS}
//  RegisterComponents('OrangeUIConrol',[TSkinWinForm]);
//  RegisterComponents('OrangeUIConrol',[TSkinWinEdit]);
//  RegisterComponents('OrangeUIConrol',[TSkinWinComboBox]);
//  RegisterComponents('OrangeUIConrol',[TSkinWinMyComboBox]);
////  RegisterComponents('OrangeUIConrol',[TSkinWinDateEdit]);
////  RegisterComponents('OrangeUIConrol',[TSkinWinTimeEdit]);
////  RegisterComponents('OrangeUIConrol',[TSkinWinPopup]);
////  RegisterComponents('OrangeUIConrol',[TSkinWinComboEdit]);
//  RegisterComponents('OrangeUIConrol',[TSkinWinMemo]);
//  {$ENDIF}


  RegisterComponents('OrangeUIConrol',[TSkinWinButton]);
  RegisterComponents('OrangeUIConrol',[TSkinWinButtonGroup]);
  //RegisterComponents('OrangeUIConrol',[TSkinWinSelectDateAreaButton]);
  RegisterComponents('OrangeUIConrol',[TSkinWinLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinRollLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinHintLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinMultiColorLabel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinImage]);
  RegisterComponents('OrangeUIConrol',[TSkinWinFrameImage]);
  RegisterComponents('OrangeUIConrol',[TSkinWinRoundImage]);
  //RegisterComponents('OrangeUIConrol',[TSkinWinRoundRect]);
  RegisterComponents('OrangeUIConrol',[TSkinWinImageListPlayer]);
  RegisterComponents('OrangeUIConrol',[TSkinWinImageListViewer]);
  RegisterComponents('OrangeUIConrol',[TSkinWinPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinDrawPanel]);
  //RegisterComponents('OrangeUIConrol',[TSkinWinDirectUIParent]);
  RegisterComponents('OrangeUIConrol',[TSkinWinPageControl]);
  RegisterComponents('OrangeUIConrol',[TSkinWinTabSheet]);
  RegisterComponents('OrangeUIConrol',[TSkinWinItemDesignerPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinCheckBox]);
  //RegisterComponents('OrangeUIConrol',[TSkinWinCalloutRect]);
  RegisterComponents('OrangeUIConrol',[TSkinWinSwitch]);
  RegisterComponents('OrangeUIConrol',[TSkinWinTrackBar]);
  RegisterComponents('OrangeUIConrol',[TSkinWinSwitchBar]);
  RegisterComponents('OrangeUIConrol',[TSkinWinProgressBar]);
  RegisterComponents('OrangeUIConrol',[TSkinWinScrollBar]);
  RegisterComponents('OrangeUIConrol',[TSkinWinPullLoadPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinNotifyNumberIcon]);

  RegisterComponents('OrangeUIConrol',[TSkinWinScrollBox]);
  RegisterComponents('OrangeUIConrol',[TSkinWinScrollBoxContent]);
  RegisterComponents('OrangeUIConrol',[TSkinWinScrollControl]);
  RegisterComponents('OrangeUIConrol',[TSkinWinScrollControlCorner]);

  RegisterComponents('OrangeUIConrol',[TSkinWinSwitchPageListPanel]);


  //RegisterComponents('OrangeUIConrol',[TSkinWinCustomList]);
  //RegisterComponents('OrangeUIConrol',[TSkinWinVirtualList]);
  RegisterComponents('OrangeUIConrol',[TSkinWinListBox]);
  {$IFDEF OPENSOURCE_VERSION}
  //开源版没有ListView、TreeView、Grid
  {$ELSE}
  RegisterComponents('OrangeUIConrol',[TSkinWinListView]);
  RegisterComponents('OrangeUIConrol',[TSkinWinTreeView]);
  //TSkinWinRegExTagLabelView]);

  //RegisterComponents('OrangeUIConrol',[TSkinWinVirtualGrid]);
  RegisterComponents('OrangeUIConrol',[TSkinWinItemGrid]);

  RegisterComponents('OrangeUIConrol',[TSkinWinDBGrid]);
  {$ENDIF}

  RegisterComponents('OrangeUIConrol',[TSkinWinRadioButton]);


  //TProcessNativeControlModalShowPanel]);
  RegisterComponents('OrangeUIConrol',[TSkinWinVirtualChart]);
  {$ENDIF}



  //注释素材组件
  for I := 0 to GlobalControlTypeRegManager.ControlClassifyRegList.Count-1 do
  begin
    //GlobalControlTypeRegManager.ControlClassifyRegList[I].ControlTypeRegList
    AControlClassifyReg:=GlobalControlTypeRegManager.ControlClassifyRegList[I];
    for J := 0 to AControlClassifyReg.ControlTypeRegList.Count-1 do
    begin
      //不能重复注册
      if GlobalRegisteredClassList.IndexOf(AControlClassifyReg.ControlTypeRegList[J].MaterialClass.ClassName)=-1 then
      begin
           GlobalRegisteredClassList.Add(AControlClassifyReg.ControlTypeRegList[J].MaterialClass.ClassName);
           //RegisterClasses([AMaterialClass]);
           RegisterComponents('OrangeUIMaterial',[AControlClassifyReg.ControlTypeRegList[J].MaterialClass]);

      end;


    end;
  end;



end;

function ConvertComponentArrayToPersistentArray(AComponentArray:Array of TComponentClass):TPersistentClassArray;
var
  I: Integer;
begin

  SetLength(Result,Length(AComponentArray));
  for I := Low(AComponentArray) to High(AComponentArray) do
  begin
    Result[I]:=AComponentArray[I];
  end;

end;

//
//procedure RegisterComponentClasses;
//var
//  I:Integer;
//begin
//  {$IF CompilerVersion >= 30.0}
//  OrangeUI_ComponentArray:=[
//                        {$IFDEF FMX}
//                        TFrameContext,
//                        TSkinMessageBox,
//                        {$ENDIF}
//
//
//                        TSkinTheme,
//                        TSkinAnimator,
//                        TControlEffectAnimator,
//                        TSkinControlMoveAnimator,
//                        TSkinImageList,
//                        TTimerTaskEvent,
////                        TCallRestAPITimerTaskEvent,
//                        TDrawCanvasSetting,
//                        TDownloadPictureManager,
//                        TSkinControlGestureManager,
//                        TSkinControlPanDragGestureManager,
//                        TSkinSwitchPageListControlGestureManager
//                        ];
//  {$ELSE}
//  SetLength(OrangeUI_ComponentArray,11);
//  I:=0;OrangeUI_ComponentArray[I]:=TSkinTheme;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinAnimator;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TControlEffectAnimator;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinControlMoveAnimator;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinImageList;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TTimerTaskEvent;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TDrawCanvasSetting;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TDownloadPictureManager;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinControlGestureManager;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinControlPanDragGestureManager;
//  I:=I+1;OrangeUI_ComponentArray[I]:=TSkinSwitchPageListControlGestureManager;
//  {$IFEND}
//  RegisterClasses(ConvertComponentArrayToPersistentArray(OrangeUI_ComponentArray));
//
//
//
//
//
//  {$IFDEF FMX}
//  OrangeUI_ControlArray:=[
//
//                          TSkinFMXButton,
//                          TSkinFMXButtonGroup,
//                          TSkinSelectDateAreaButton,
//                          TSkinFMXLabel,
//                          TSkinFMXRollLabel,
//                          TSkinFMXHintLabel,
//                          TSkinFMXMultiColorLabel,
//                          TSkinFMXEdit,
//                          TSkinFMXComboBox,
//                          TSkinFMXDateEdit,
//                          TSkinFMXTimeEdit,
//                          TSkinFMXPopup,
//                          TSkinFMXComboEdit,
//                          TSkinFMXMemo,
//                          TSkinFMXImage,
//                          TSkinFMXFrameImage,
//                          TSkinFMXRoundImage,
//                          TSkinFMXRoundRect,
//                          TSkinFMXImageListPlayer,
//                          TSkinFMXImageListViewer,
//                          TSkinFMXPanel,
//                          TSkinFMXDrawPanel,
////                          TSkinFMXDirectUIParent,
//                          TSkinFMXPageControl,
//                          TSkinFMXTabSheet,
//                          TSkinFMXItemDesignerPanel,
//                          TSkinFMXCheckBox,
//                          TSkinFMXCalloutRect,
//                          TSkinFMXSwitch,
//                          TSkinFMXTrackBar,
//                          TSkinFMXSwitchBar,
//                          TSkinFMXProgressBar,
//                          TSkinFMXScrollBar,
//                          TSkinFMXPullLoadPanel,
//                          TSkinFMXNotifyNumberIcon,
//
//                          TSkinFMXScrollBox,
//                          TSkinFMXScrollBoxContent,
//                          TSkinFMXScrollControl,
////                          TSkinFMXScrollControlCorner,
//
//                          TSkinFMXSwitchPageListPanel,
//
//
////                          TSkinFMXCustomList,
////                          TSkinFMXVirtualList,
//                          TSkinFMXListBox,
//                          {$IFDEF OPENSOURCE_VERSION}
//                          //开源版没有ListView,TreeView,Grid
//                          {$ELSE}
//                          TSkinFMXListView,
//                          TSkinFMXTreeView,
//                          TSkinRegExTagLabelView,
//
////                          TSkinFMXVirtualGrid,
//                          TSkinFMXItemGrid,
//
//                          TSkinFMXDBGrid,
//                          {$ENDIF}
//
//                          TSkinFMXRadioButton,
//
//
//                          TProcessNativeControlModalShowPanel,
//                          TSkinFMXVirtualChart];
//
//  RegisterClasses(ConvertComponentArrayToPersistentArray(OrangeUI_ControlArray));
//
//  RegisterClass(TSkinFMXScrollControlCorner);
//  RegisterClass(TSkinRadioButton);
//  {$ENDIF}
//
//
//
//  {$IFDEF VCL}
//    {$IF CompilerVersion >= 30.0}
//        OrangeUI_ControlArray:=[
//                          TSkinWinForm,
//                          TSkinWinNormalForm,
//                          TSkinWinMultiColorLabel,
//                          TSkinWinEdit,
//                          TSkinWinComboBox,
//                          TSkinWinMyComboBox,
//                          TSkinWinDateEdit,
//  //                        TSkinWinTimeEdit,
//  //                        TSkinWinPopup,
//  //                        TSkinWinComboEdit,
//                          TSkinWinMemo,
//                          TSkinWinRoundImage,
//  //                        TSkinWinRoundRect,
//  //                        TSkinWinSwitch,
//  //                        TSkinWinSwitchBar,
//  //                        TSkinWinStringGrid,
//
//
//                          TSkinWinButton,
//                          TSkinWinButtonGroup,
//                          TSkinWinLabel,
//                          TSkinWinImage,
//                          TSkinWinFrameImage,
//                          TSkinWinImageListPlayer,
//                          TSkinWinImageListViewer,
//                          TSkinWinPanel,
//                          TSkinWinDrawPanel,
//  //                        TSkinWinDirectUIParent,
//                          TSkinWinPageControl,
//                          TSkinWinTabSheet,
//                          TSkinWinItemDesignerPanel,
//                          TSkinWinCheckBox,
//  //                        TSkinWinCalloutRect,
//                          TSkinWinTrackBar,
//                          TSkinWinProgressBar,
//                          TSkinWinScrollBar,
//                          TSkinWinPullLoadPanel,
//                          TSkinWinNotifyNumberIcon,
//
//                          TSkinWinScrollBox,
//                          TSkinWinScrollBoxContent,
//                          TSkinWinScrollControl,
//                          TSkinWinScrollControlCorner,
//
//                          TSkinWinSwitchPageListPanel,
//                          TSkinWinListBox,
//
//
//                          {$IFDEF OPENSOURCE_VERSION}
//                          //开源版没有ListView,TreeView,Grid
//                          {$ELSE}
//                          TSkinWinDBGrid,
//                          TSkinWinItemGrid,
//                          TSkinWinListView,
//                          TSkinWinTreeView,
//                          {$ENDIF}
//
//
//                          TSkinWinRadioButton,
//                          TSkinWinVirtualChart
//                          ];
//    {$ELSE}
//        {$IFDEF OPENSOURCE_VERSION}
//        //开源版没有ListView,TreeView,Grid
//        SetLength(OrangeUI_ControlArray,29);
//        {$ELSE}
//        SetLength(OrangeUI_ControlArray,33);
//        {$ENDIF}
//        I:=0;OrangeUI_ControlArray[I]:=TSkinWinForm;
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinNormalForm;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinEdit;//,
//                          TSkinWinMultiColorLabel,
//  //                        TSkinWinComboBox,
//  //                        TSkinWinDateEdit,
//  //                        TSkinWinTimeEdit,
//  //                        TSkinWinPopup,
//  //                        TSkinWinComboEdit,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinMemo;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinRoundImage;//,
//  //                        ,
//  //                        TSkinWinRoundRect,
//  //                        TSkinWinSwitch,
//  //                        TSkinWinSwitchBar,
//  //                        TSkinWinStringGrid,
//
//
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinButton;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinButtonGroup;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinLabel;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinImage;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinFrameImage;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinImageListPlayer;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinImageListViewer;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinPanel;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinDrawPanel;//,
//  //                        TSkinWinDirectUIParent,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinPageControl;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinTabSheet;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinItemDesignerPanel;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinCheckBox;//,
//  //                        TSkinWinCalloutRect,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinTrackBar;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinProgressBar;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinScrollBar;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinPullLoadPanel;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinNotifyNumberIcon;//,
//
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinScrollBox;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinScrollBoxContent;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinScrollControl;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinScrollControlCorner;//,
//
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinSwitchPageListPanel;//,
//
//                          {$IFDEF OPENSOURCE_VERSION}
//                          //开源版没有ListView,TreeView,Grid
//                          {$ELSE}
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinDBGrid;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinListBox;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinListView;//,
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinTreeView;//,
//                          {$ENDIF}
//
//
//
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinRadioButton;//
//                          I:=I+1;OrangeUI_ControlArray[I]:=TSkinWinChart;//
//
//    {$IFEND}
//
//    RegisterClasses(ConvertComponentArrayToPersistentArray(OrangeUI_ControlArray));
//
//    RegisterClass(TSkinWinScrollControlCorner);
//  {$ENDIF VCL}
//
//
//
//
//
//  {$IF CompilerVersion >= 30.0}
//    OrangeUI_MaterialArray:=[
//                        TSkinButtonDefaultMaterial,
//
//                        TSkinButtonGroupDefaultMaterial,
//
//                        TSkinLabelDefaultMaterial,
//                        TSkinMultiColorLabelDefaultMaterial,
//                        TSkinImageDefaultMaterial,
//                        TSkinFrameImageDefaultMaterial,
//                        TSkinRoundImageDefaultMaterial,
//
//                        TSkinDrawPanelDefaultMaterial,
//                        TSkinEditDefaultMaterial,
//                        TSkinMemoDefaultMaterial,
//                        TSkinComboBoxDefaultMaterial,
//                        TSkinComboEditDefaultMaterial,
//                        TSkinDateEditDefaultMaterial,
//                        TSkinTimeEditDefaultMaterial,
//
//
//                        {$IFDEF VCL}
//                        TSkinFormDefaultMaterial,
//                        TSkinFormNormalMaterial,
//                        {$ENDIF}
//                        {$IFDEF FMX}
//                        TSkinRoundRectDefaultMaterial,
//                        {$ENDIF}
//
//                        TSkinImageListPlayerDefaultMaterial,
//                        TSkinImageListViewerDefaultMaterial,
//                        TSkinPanelDefaultMaterial,
////                        TSkinDirectUIParentDefaultMaterial,
//                        TSkinPageControlDefaultMaterial,
//                        TSkinTabSheetDefaultMaterial,
//                        TSkinItemDesignerPanelDefaultMaterial,
//
//                        TSkinCheckBoxDefaultMaterial,
//                        TSkinCheckBoxColorMaterial,
//                        {$IFDEF FMX}
//                        TSkinCalloutRectDefaultMaterial,
//                        TSkinPopupDefaultMaterial,
//                        {$ENDIF FMX}
//                        TSkinRadioButtonDefaultMaterial,
//                        TSkinRadioButtonColorMaterial,
//
//                        TSkinSwitchDefaultMaterial,
//                        TSkinSwitchBarDefaultMaterial,
//                        TSkinTrackBarDefaultMaterial,
//                        TSkinTrackBarProgressBarMaterial,
//
//                        TSkinProgressBarDefaultMaterial,
//                        TSkinProgressBarColorMaterial,
//                        TSkinScrollBarDefaultMaterial,
//                        TSkinScrollBarMobileMaterial,
//
////                        TSkinPullLoadPanelDefaultMaterial,
////                        TSkinPullLoadPanelDefaultMaterial,
////                        TSkinPullLoadPanelDefaultProMaterial,
//
//                        TSkinNotifyNumberIconDefaultMaterial,
//                        TSkinNotifyNumberIconColorMaterial,
//
//                        TSkinScrollBoxDefaultMaterial,
//                        TSkinScrollBoxContentDefaultMaterial,
//                        TSkinScrollControlDefaultMaterial,
//                        TSkinScrollControlCornerDefaultMaterial,
//
//                        TSkinSwitchPageListPanelDefaultMaterial,
//
//                        {$IFDEF OPENSOURCE_VERSION}
//                        //开源版没有ListView,TreeView,Grid
//                        {$ELSE}
////                        TSkinVirtualGridColumnMaterial,
////                        TSkinVirtualGridDefaultMaterial,
//                        TSkinItemGridDefaultMaterial,
//                        TSkinDBGridDefaultMaterial,
//
//                        TSkinTreeViewDefaultMaterial,
////                        {$IFDEF FMX}
//                        TSkinRegExTagLabelViewDefaultMaterial,
////                        {$ENDIF}
//                        {$ENDIF}
//
//
//                        TSkinListViewDefaultMaterial,
//                        TSkinListBoxDefaultMaterial,
//                        TSkinVirtualChartDefaultMaterial
//
//                        ];
//  {$ELSE}
//    {$IFDEF VCL}
//    SetLength(OrangeUI_MaterialArray,46);
//    {$ENDIF}
//    {$IFDEF FMX}
//    SetLength(OrangeUI_MaterialArray,44);
//    {$ENDIF}
//    I:=0;OrangeUI_MaterialArray[I]:=TSkinButtonDefaultMaterial;
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinButtonGroupDefaultMaterial;//,
//
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinLabelDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinMultiColorLabelDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinImageDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinFrameImageDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinRoundImageDefaultMaterial;//,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinDrawPanelDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinEditDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinMemoDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinComboBoxDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinComboEditDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinDateEditDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinTimeEditDefaultMaterial;//,
//                        {$IFDEF VCL}
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinFormDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinFormNormalMaterial;//,
//                        {$ENDIF}
////                        {$IFDEF FMX}
////                        TSkinRoundRectDefaultMaterial,
////                        {$ENDIF}
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinImageListPlayerDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinImageListViewerDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinPanelDefaultMaterial;//,
////                        TSkinDirectUIParentDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinPageControlDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinTabSheetDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinItemDesignerPanelDefaultMaterial;//,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinCheckBoxDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinCheckBoxColorMaterial;//,
////                        {$IFDEF FMX}
////                        TSkinCalloutRectDefaultMaterial,
////                        TSkinPopupDefaultMaterial,
////                        TSkinRegExTagLabelViewDefaultMaterial,
////                        {$ENDIF FMX}
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinRadioButtonDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinRadioButtonColorMaterial;//,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinSwitchDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinSwitchBarDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinTrackBarDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinTrackBarProgressBarMaterial;//,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinProgressBarDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinProgressBarColorMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinScrollBarDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinScrollBarMobileMaterial;//,
//
////                        TSkinPullLoadPanelDefaultMaterial,
////                        TSkinPullLoadPanelDefaultMaterial,
////                        TSkinPullLoadPanelDefaultProMaterial,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinNotifyNumberIconDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinNotifyNumberIconColorMaterial;//,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinScrollBoxDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinScrollBoxContentDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinScrollControlDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinScrollControlCornerDefaultMaterial;//,
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinSwitchPageListPanelDefaultMaterial;//,
//
//                        {$IFDEF OPENSOURCE_VERSION}
//                        //开源版没有ListView,TreeView,Grid
//                        {$ELSE}
////                        TSkinVirtualGridColumnMaterial,
////                        TSkinVirtualGridDefaultMaterial,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinItemGridDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinDBGridDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinTreeViewDefaultMaterial;//
//                        {$ENDIF}
//
//
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinListViewDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinListBoxDefaultMaterial;//,
//                        I:=I+1;OrangeUI_MaterialArray[I]:=TSkinVirtualChartDefaultMaterial;//,
//
//
//
//
//  {$IFEND}
//  RegisterClasses(ConvertComponentArrayToPersistentArray(OrangeUI_MaterialArray));
//
//
//
//end;
//
//
//procedure RegisterComponentTypes;
//begin
//
//  {$IFDEF VCL}
//  //窗体
//  RegisterSkinControlStyle('SkinForm',TSkinFormDefaultType,TSkinFormDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinForm',TSkinFormNormalType,TSkinFormNormalMaterial,'Normal',False);
//  {$ENDIF}
//
//
//  //按钮
//  RegisterSkinControlStyle('SkinButton',TSkinButtonDefaultType,TSkinButtonDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinButton',TSkinButtonDefaultType,TSkinButtonDefaultMaterial,'Normal',False);
//  RegisterSkinControlStyle('SkinButton',TSkinButtonDefaultType,TSkinButtonDefaultMaterial,'NormalPushed',False);
//
//
//  //按钮分组
//  RegisterSkinControlStyle('SkinButtonGroup',TSkinButtonGroupDefaultType,TSkinButtonGroupDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinButtonGroup',TSkinButtonGroupDefaultType,TSkinButtonGroupDefaultMaterial,'Normal',False);
//  RegisterSkinControlStyle('SkinButtonGroup',TSkinButtonGroupDefaultType,TSkinButtonGroupDefaultMaterial,'NormalPushed',False);
//
//
//  //复选框
//  RegisterSkinControlStyle('SkinCheckBox',TSkinCheckBoxDefaultType,TSkinCheckBoxDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinCheckBox',TSkinCheckBoxColorType,TSkinCheckBoxColorMaterial,'Color',False);
//
//
//  //单选框
//  RegisterSkinControlStyle('SkinRadioButton',TSkinRadioButtonDefaultType,TSkinRadioButtonDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinRadioButton',TSkinRadioButtonColorType,TSkinRadioButtonColorMaterial,'Color',False);
//
//
//  {$IFDEF FMX}
//  //聊天框
//  RegisterSkinControlStyle('SkinCalloutRect',TSkinCalloutRectDefaultType,TSkinCalloutRectDefaultMaterial,Const_Default_ComponentType,True);
////  GlobalFrameworkControlTypeClasses.Add('CalloutRect',TSkinCalloutRect);
//  {$ENDIF FMX}
//
//
//  //切换框
//  RegisterSkinControlStyle('SkinSwitch',TSkinSwitchDefaultType,TSkinSwitchDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  //标签
//  RegisterSkinControlStyle('SkinLabel',TSkinLabelDefaultType,TSkinLabelDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinRollLabel',TSkinRollLabelType,TSkinLabelDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinHintLabel',TSkinHintLabelType,TSkinHintLabelMaterial,Const_Default_ComponentType,True);
//
//
//  //多彩标签
//  RegisterSkinControlStyle('SkinMultiColorLabel',TSkinMultiColorLabelDefaultType,TSkinMultiColorLabelDefaultMaterial,Const_Default_ComponentType,True);
//
//
//
//  //面板
//  RegisterSkinControlStyle('SkinPanel',TSkinPanelDefaultType,TSkinPanelDefaultMaterial,Const_Default_ComponentType,True);
//
//
//
//  //画板
//  RegisterSkinControlStyle('SkinDrawPanel',TSkinDrawPanelDefaultType,TSkinDrawPanelDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  {$IFDEF FMX}
//  //圆形矩形
//  RegisterSkinControlStyle('SkinRoundRect',TSkinRoundRectDefaultType,TSkinRoundRectDefaultMaterial,Const_Default_ComponentType,True);
//  {$ENDIF}
//
//
//
//  //滚动加载面板
//  RegisterSkinControlStyle('SkinPullLoadPanel',TSkinPullLoadPanelDefaultType,TSkinPullLoadPanelDefaultMaterial,Const_Default_ComponentType,True);//False);
//  RegisterSkinControlStyle('SkinPullLoadPanel',TSkinPullLoadPanelDefaultType,TSkinPullLoadPanelDefaultMaterial,'DefaultEx',False);
//  RegisterSkinControlStyle('SkinPullLoadPanel',TSkinPullLoadPanelDefaultProType,TSkinPullLoadPanelDefaultProMaterial,'DefaultPro',False);
//
//
//
//  //多页控件
//  RegisterSkinControlStyle('SkinTabSheet',TSkinTabSheetDefaultType,TSkinTabSheetDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinPageControl',TSkinPageControlDefaultType,TSkinPageControlDefaultMaterial,Const_Default_ComponentType,True);
//
//
//
//  //项目设计面板
//  RegisterSkinControlStyle('SkinItemDesignerPanel',TSkinItemDesignerPanelDefaultType,TSkinItemDesignerPanelDefaultMaterial,Const_Default_ComponentType,True);
//
//
//
//
//  //移动条
//  RegisterSkinControlStyle('SkinTrackBar',TSkinTrackBarDefaultType,TSkinTrackBarDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinTrackBar',TSkinTrackBarProgressBarType,TSkinTrackBarProgressBarMaterial,'ProgressBar',False);
//
//
//
//  //开关条
//  RegisterSkinControlStyle('SkinSwitchBar',TSkinSwitchBarDefaultType,TSkinSwitchBarDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  //进度条
//  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarDefaultType,TSkinProgressBarDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarColorType,TSkinProgressBarColorMaterial,'Color',False);
//  RegisterSkinControlStyle('SkinProgressBar',TSkinProgressBarHalfCircleType,TSkinProgressBarHalfCircleMaterial,'HalfCircle',False);
//
//
//  //滚动条
//  RegisterSkinControlStyle('SkinScrollBar',TSkinScrollBarDefaultType,TSkinScrollBarDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinScrollBar',TSkinScrollBarMobileType,TSkinScrollBarMobileMaterial,'Mobile',False);
//  RegisterSkinControlStyle('SkinScrollBar',TSkinScrollBarDesktopType,TSkinScrollBarDesktopMaterial,'Desktop',False);
//
//
//
//  //滚动控件
//  RegisterSkinControlStyle('SkinScrollControl',TSkinScrollControlDefaultType,TSkinScrollControlDefaultMaterial,Const_Default_ComponentType,True);


//  //滚动角
//  RegisterSkinControlStyle('SkinScrollControlCorner',TSkinScrollControlCornerDefaultType,TSkinScrollControlCornerDefaultMaterial,Const_Default_ComponentType,True);


//  //滚动框内容
//  RegisterSkinControlStyle('SkinScrollBoxContent',TSkinScrollBoxContentDefaultType,TSkinScrollBoxContentDefaultMaterial,Const_Default_ComponentType,True);


//  //滚动框
//  RegisterSkinControlStyle('SkinScrollBox',TSkinScrollBoxDefaultType,TSkinScrollBoxDefaultMaterial,Const_Default_ComponentType,True);
//
//
//
//
//
//  //切换分页
//  RegisterSkinControlStyle('SkinSwitchPageListPanel',TSkinSwitchPageListPanelType,TSkinSwitchPageListPanelMaterial,Const_Default_ComponentType,True);
//
//
//  //提醒数字图标
//  RegisterSkinControlStyle('SkinNotifyNumberIcon',TSkinNotifyNumberIconDefaultType,TSkinNotifyNumberIconDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinNotifyNumberIcon',TSkinNotifyNumberIconColorType,TSkinNotifyNumberIconColorMaterial,'Color',False);
//
//
//  //图片
//  RegisterSkinControlStyle('SkinImage',TSkinImageDefaultType,TSkinImageDefaultMaterial,Const_Default_ComponentType,True);
//
//  RegisterSkinControlStyle('SkinFrameImage',TSkinFrameImageDefaultType,TSkinFrameImageDefaultMaterial,Const_Default_ComponentType,True);
//
//  RegisterSkinControlStyle('SkinRoundImage',TSkinRoundImageDefaultType,TSkinRoundImageDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  //图片播放
//  RegisterSkinControlStyle('SkinImageListPlayer',TSkinImageListPlayerDefaultType,TSkinImageListPlayerDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  RegisterSkinControlStyle('SkinImageListViewer',TSkinImageListViewerDefaultType,TSkinImageListViewerDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  //列表框
////  RegisterSkinControlStyle('SkinCustomList',TSkinCustomListDefaultType,TSkinCustomListDefaultMaterial,Const_Default_ComponentType,True);
////  GlobalFrameworkControlTypeClasses.Add('CustomList',TSkinCustomList);
//
////  RegisterSkinControlStyle('SkinVirtualList',TSkinVirtualListDefaultType,TSkinVirtualListDefaultMaterial,Const_Default_ComponentType,True);
////  GlobalFrameworkControlTypeClasses.Add('VirtualList',TSkinVirtualList);
//
//
//  RegisterSkinControlStyle('SkinListBox',TSkinListBoxDefaultType,TSkinListBoxDefaultMaterial,Const_Default_ComponentType,True);
//
//  {$IFDEF OPENSOURCE_VERSION}
//  //开源版没有ListView,TreeView,Grid
//  {$ELSE}
//  //列表视图
//  RegisterSkinControlStyle('SkinListView',TSkinListViewDefaultType,TSkinListViewDefaultMaterial,Const_Default_ComponentType,True);
//  RegisterSkinControlStyle('SkinListView',TSkinListViewDefaultType,TSkinListViewDefaultMaterial,Const_Default_ComponentType,True);
//
//  //树型视图
//  RegisterSkinControlStyle('SkinTreeView',TSkinTreeViewDefaultType,TSkinTreeViewDefaultMaterial,Const_Default_ComponentType,True);
//
//
//
//  //数据表格
////  RegisterSkinControlStyle('SkinVirtualGrid',TSkinVirtualGridDefaultType,TSkinVirtualGridDefaultMaterial,Const_Default_ComponentType,True);
////  GlobalFrameworkControlTypeClasses.Add('VirtualGrid',TSkinVirtualGrid);
//
//  RegisterSkinControlStyle('SkinItemGrid',TSkinItemGridDefaultType,TSkinItemGridDefaultMaterial,Const_Default_ComponentType,True);
//
//
//  RegisterSkinControlStyle('SkinDBGrid',TSkinDBGridDefaultType,TSkinDBGridDefaultMaterial,Const_Default_ComponentType,True);
////  {$IFDEF FMX}
//  RegisterSkinControlStyle('SkinRegExTagLabelView',TSkinRegExTagLabelViewDefaultType,TSkinRegExTagLabelViewDefaultMaterial,Const_Default_ComponentType,True);
////  {$ENDIF}
//
//  {$ENDIF}
//
//
//
//  //图表视图
//  RegisterSkinControlStyle('SkinVirtualChart',TSkinVirtualChartDefaultType,TSkinVirtualChartDefaultMaterial,Const_Default_ComponentType,True);
//
//  RegisterSkinControlStyle('ProcessNativeControlModalShowPanel',
//                            TSkinControlType,
//                            TSkinControlMaterial,
//                            Const_Default_ComponentType,True);
//
//
//
//  //文本框
//  RegisterSkinControlStyle('SkinEdit',TSkinEditDefaultType,TSkinEditDefaultMaterial,Const_Default_ComponentType,True);
//  //组合框
//  RegisterSkinControlStyle('SkinComboBox',TSkinComboBoxDefaultType,TSkinComboBoxDefaultMaterial,Const_Default_ComponentType,True);
//  //日期框
//  RegisterSkinControlStyle('SkinDateEdit',TSkinDateEditDefaultType,TSkinDateEditDefaultMaterial,Const_Default_ComponentType,True);
//  //日期框
//  RegisterSkinControlStyle('SkinTimeEdit',TSkinTimeEditDefaultType,TSkinTimeEditDefaultMaterial,Const_Default_ComponentType,True);
//  //弹出框
//  RegisterSkinControlStyle('SkinPopup',TSkinPopupDefaultType,TSkinPopupDefaultMaterial,Const_Default_ComponentType,True);
//  //组合编辑框
//  RegisterSkinControlStyle('SkinComboEdit',TSkinComboEditDefaultType,TSkinComboEditDefaultMaterial,Const_Default_ComponentType,True);
//  //备注框
//  RegisterSkinControlStyle('SkinMemo',TSkinMemoDefaultType,TSkinMemoDefaultMaterial,Const_Default_ComponentType,True);
//  {$IFDEF FMX}
//  {$ENDIF}
//
//end;


initialization
  GlobalRegisteredClassList:=TStringList.Create;

finalization
  FreeAndNil(GlobalRegisteredClassList);



end.

