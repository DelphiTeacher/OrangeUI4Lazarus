program MainSample_VCL_D10_3;





uses
  Forms,
  Windows,
  Controls,
  uDrawTextParam,
  uSkinVirtualListType,
  ListItemStyle_IconLeft_CaptionRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionRight.pas',
  EasyServiceCommonMaterialDataMoudle_VCL in '..\..\OrangeProjectCommon\EasyServiceCommonMaterialDataMoudle_VCL.pas' {dmEasyServiceCommonMaterial: TDataModule},
  ListItemStyle_IconButton in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconButton.pas',
  ListItemStyle_TreeMainMenu_LabelAndArrow in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_TreeMainMenu_LabelAndArrow.pas',
  uIdHttpControl in '..\..\OrangeProjectCommon\uIdHttpControl.pas',
  ListItemStyle_CaptionDetailItem in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_CaptionDetailItem.pas',
  ListItemStyle_MailList in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_MailList.pas',
  uSkinItemJsonHelper in '..\..\OrangeProjectCommon\uSkinItemJsonHelper.pas',
  uDataSetToJson in '..\..\OrangeProjectCommon\uDataSetToJson.pas',
  uOpenCommon in '..\..\OrangeProjectCommon\uOpenCommon.pas',
  uDataInterface in '..\..\OrangeProjectCommon\uDataInterface.pas',
  uRestInterfaceCall in '..\..\OrangeProjectCommon\uRestInterfaceCall.pas',
  uSelectMediaDialog in '..\..\OrangeProjectCommon\uSelectMediaDialog.pas',
  uFuncCommon_Copy in '..\..\OrangeProjectCommon\OrangeUI_Copy\uFuncCommon_Copy.pas',
  uBaseList_Copy in '..\..\OrangeProjectCommon\OrangeUI_Copy\uBaseList_Copy.pas',
  uFileCommon_Copy in '..\..\OrangeProjectCommon\OrangeUI_Copy\uFileCommon_Copy.pas',
  uBaseLog_Copy in '..\..\OrangeProjectCommon\OrangeUI_Copy\uBaseLog_Copy.pas',
  uSelectMediaUI_OpenDialog in '..\..\OrangeProjectCommon\uSelectMediaUI_OpenDialog.pas',
  ListItemStyle_IconLeft_CaptionRight_CloseBtnRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionRight_CloseBtnRight.pas',
  uOpenClientCommon in '..\..\OrangeProjectCommon\uOpenClientCommon.pas',
  uGPSUtils in '..\..\OrangeProjectCommon\uGPSUtils.pas',
  ViewPictureListFrame_VCL in '..\..\OrangeProjectCommon\VCLFrames\ViewPictureListFrame_VCL.pas',
  uViewPictureListFrame in '..\..\OrangeProjectCommon\uViewPictureListFrame.pas',
  ClipHeadFrame_VCL in '..\..\OrangeProjectCommon\VCLFrames\ClipHeadFrame_VCL.pas',
  ButtonFrame in 'ButtonFrame.pas' {FrameButton: TFrame},
  EditFrame in 'EditFrame.pas' {FrameEdit: TFrame},
  XSuperJSON in '..\..\OrangeProjectCommon\XSuperObject\XSuperJSON.pas',
  XSuperObject in '..\..\OrangeProjectCommon\XSuperObject\XSuperObject.pas',
  uMultiSelectFrame in '..\..\OrangeProjectCommon\uMultiSelectFrame.pas',
  MultiSelectFrame_VCL in '..\..\OrangeProjectCommon\VCLFrames\MultiSelectFrame_VCL.pas',
  MessageBoxFrame_VCL in '..\..\OrangeProjectCommon\VCLFrames\MessageBoxFrame_VCL.pas',
  uVirtualListDataController in '..\..\OrangeProjectCommon\uVirtualListDataController.pas',
  CheckBoxFrame in 'CheckBoxFrame.pas' {FrameCheckBox: TFrame},
  HintFrame_VCL in '..\..\OrangeProjectCommon\VCLFrames\HintFrame_VCL.pas',
  FrameParentForm_VCL in '..\..\OrangeProjectCommon\VCLFrames\FrameParentForm_VCL.pas',
  ListItemStyle_Default in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_Default.pas',
  ListItemStyle_IconCaptionLeft_NotifyNumberRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconCaptionLeft_NotifyNumberRight.pas' {FrameListItemStyle_IconCaptionLeft_NotifyNumberRight: TFrame},
  ListItemStyle_IconCaptionLeft_NotifyIconRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconCaptionLeft_NotifyIconRight.pas' {FrameListItemStyle_IconCaptionLeft_NotifyIconRight: TFrame},
  ListItemStyle_IconCaptionLeft_DetailRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconCaptionLeft_DetailRight.pas' {FrameListItemStyle_IconCaptionLeft_DetailRight: TFrame},
  ListItemStyle_IconCaptionLeft_ArrowRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconCaptionLeft_ArrowRight.pas' {FrameListItemStyle_IconCaptionLeft_ArrowRight: TFrame},
  DashBoard_AnalyseFrame in 'DashBoard_AnalyseFrame.pas' {FrameDashBoard_Analyse: TFrame},
  ListItemStyle_DashBoardSummaryItem in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_DashBoardSummaryItem.pas',
  DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame in 'DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame.pas' {FrameItemGrid_MultiColorProgressBarColumn: TFrame},
  DashBoard_Analyse_ItemGrid_TwoCellTextFrame in 'DashBoard_Analyse_ItemGrid_TwoCellTextFrame.pas' {FrameItemGrid_TwoCellText: TFrame},
  ListItemStyle_ProgressBar in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_ProgressBar.pas',
  ListItemStyle_IconTop_CaptionDetailBottom in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconTop_CaptionDetailBottom.pas',
  DashBoard_ProjectsFrame in 'DashBoard_ProjectsFrame.pas' {FrameDashBoard_Projects},
  DashBoard_Analyse_BarChart_MonthSummaryFrame in 'DashBoard_Analyse_BarChart_MonthSummaryFrame.pas',
  DashBoard_Projects_PieChart_ProjectStatusFrame in 'DashBoard_Projects_PieChart_ProjectStatusFrame.pas' {FramePieChart_ProjectStatus},
  DashBoard_Projects_ItemGrid_TwoCellTextHasBackColorFrame in 'DashBoard_Projects_ItemGrid_TwoCellTextHasBackColorFrame.pas' {FrameItemGrid_TwoCellTextHasBackColor},
  ListItemStyle_TwoIconButton in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_TwoIconButton.pas',
  ItemGridFrame in 'ItemGridFrame.pas',
  ListItemStyle_IconLeft_CaptionLeft in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionLeft.pas',
  ListItemStyle_CheckBoxIconLeft_CaptionRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_CheckBoxIconLeft_CaptionRight.pas',
  uRestIntfMemTable in '..\..\OrangeProjectCommon\RestIntfMemTable\uRestIntfMemTable.pas',
  uJsonToDataset in '..\..\OrangeProjectCommon\uJsonToDataset.pas',
  MainForm in 'MainForm.pas' {frmMain},
  GridSwitchPage2Frame in '..\..\OrangeProjectCommon\VCLFrames\GridSwitchPage2Frame.pas',
  GridSwitchPageFrame in '..\..\OrangeProjectCommon\VCLFrames\GridSwitchPageFrame.pas',
  uWaitingForm in '..\..\OrangeProjectCommon\VCLFrames\uWaitingForm.pas',
  uWaiting in '..\..\OrangeProjectCommon\VCLFrames\uWaiting.pas',
  FormWaiting in '..\..\OrangeProjectCommon\VCLFrames\FormWaiting.pas';

{$R *.res}
var
  I:Integer;
begin
  ReportMemoryLeaksONShutdown:=DebugHook<>0;


  Application.Initialize;
  Application.MainFormOnTaskbar := True;
//  Application.CreateForm(TfrmLogin, frmLogin);
//  frmLogin:=TfrmLogin.Create(nil);
//  if frmLogin.ShowModal=mrOK then
//  begin
  Application.CreateForm(TdmEasyServiceCommonMaterial, dmEasyServiceCommonMaterial);
  Application.CreateForm(TfrmMain, frmMain);
  //  Application.CreateForm(TfrmWhiteMain, frmWhiteMain);
  //  Application.CreateForm(TfrmBaseQuery, frmBaseQuery);
  //  Application.CreateForm(TfrmBase, frmBase);
  //    Application.CreateForm(TForm5, Form5);
  Application.Run;


//  dmEasyServiceCommonMaterial.Free;
//  FreeAndNil(GlobalSkinItemMaterialStylePackage);
//
//  for I := 0 to GlobalDrawTextParamList.Count-1 do
//  begin
//
//  end;


//  end
//  else
//  begin
//    frmLogin.Hide;
//    frmLogin.Free;
//  end;
end.
