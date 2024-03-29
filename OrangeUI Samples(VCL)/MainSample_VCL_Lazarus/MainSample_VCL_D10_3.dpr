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
  ListItemStyle_CaptionDetailItem in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_CaptionDetailItem.pas',
  ListItemStyle_MailList in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_MailList.pas',
  ListItemStyle_IconLeft_CaptionRight_CloseBtnRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionRight_CloseBtnRight.pas',
  ButtonFrame in 'ButtonFrame.pas' {FrameButton: TFrame},
  EditFrame in 'EditFrame.pas' {FrameEdit: TFrame},
  XSuperJSON in '..\..\OrangeProjectCommon\XSuperObject\XSuperJSON.pas',
  XSuperObject in '..\..\OrangeProjectCommon\XSuperObject\XSuperObject.pas',
  CheckBoxFrame in 'CheckBoxFrame.pas' {FrameCheckBox: TFrame},
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
  ListItemStyle_IconLeft_CaptionLeft in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionLeft.pas',
  ListItemStyle_CheckBoxIconLeft_CaptionRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_CheckBoxIconLeft_CaptionRight.pas',
  MainForm in 'MainForm.pas' {frmMain},
  uVCLSVGSupport in '..\..\OrangeProjectCommon\uVCLSVGSupport.pas',
  HomeFrame in 'HomeFrame.pas' {FrameHome: TFrame},
  ListItemStyle_IconLeft_CaptionDetailRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionDetailRight.pas',
  DashBoard_LineChart_WeekSummaryFrame in 'DashBoard_LineChart_WeekSummaryFrame.pas' {FrameLineChart_WeekSummary: TFrame},
  OrderGridFrame in 'OrderGridFrame.pas' {FrameOrderGrid: TFrame},
  uSkinItemJsonHelper in '..\..\OrangeProjectCommon\uSkinItemJsonHelper.pas',
  ItemGrid_JsonItemEditFrame in 'ItemGrid_JsonItemEditFrame.pas' {FrameEditJsonItemGrid: TFrame},
  ItemGrid_ColumnControlTypeFrame in 'ItemGrid_ColumnControlTypeFrame.pas' {FrameItemGrid_ColumnControlType: TFrame},
  ItemGrid_DefaultFrame in 'ItemGrid_DefaultFrame.pas' {FrameDefaultItemGrid: TFrame},
  ItemGrid_FixedColsFrame in 'ItemGrid_FixedColsFrame.pas' {FrameFixedColsItemGrid: TFrame},
  ComboBoxFrame in 'ComboBoxFrame.pas' {FrameComboBox: TFrame},
  ItemGrid_ContentFrame in 'ItemGrid_ContentFrame.pas' {FrameContentItemGrid: TFrame},
  ListItemStyle_Caption_CheckBoxRight_Selected in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_Caption_CheckBoxRight_Selected.pas',
  GridSwitchPageFrame in '..\..\OrangeProjectCommon\VCLFrames_Lazarus\GridSwitchPageFrame.pas',
  WaitingForm in '..\..\OrangeProjectCommon\VCLFrames\WaitingForm_VCL\WaitingForm.pas' {frmWaiting},
  uconst in 'uconst.pas',
  uOpenUISetting in '..\..\OrangeProjectCommon\uOpenUISetting.pas',
  uOpenCommon in '..\..\OrangeProjectCommon\uOpenCommon.pas',
  uRestInterfaceCall in '..\..\OrangeProjectCommon\uRestInterfaceCall.pas',
  uDataSetToJson in '..\..\OrangeProjectCommon\uDataSetToJson.pas',
  uOpenClientCommon in '..\..\OrangeProjectCommon\uOpenClientCommon.pas',
  LoginForm in 'LoginForm.pas' {frmLogin},
  uManager in 'uManager.pas';

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
  //  Application.CreateForm(TfrmLogin, frmLogin);
  //  Application.CreateForm(TfrmLogin, frmLogin);

  frmLogin:=TfrmLogin.Create(nil);
  if frmLogin.ShowModal=mrOK then
  begin
    Application.CreateForm(TfrmMain, frmMain);
    //  Application.CreateForm(TfrmWhiteMain, frmWhiteMain);
    //  Application.CreateForm(TfrmBaseQuery, frmBaseQuery);
    //  Application.CreateForm(TfrmBase, frmBase);
    //    Application.CreateForm(TForm5, Form5);
  end;
  frmLogin.Free;

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
