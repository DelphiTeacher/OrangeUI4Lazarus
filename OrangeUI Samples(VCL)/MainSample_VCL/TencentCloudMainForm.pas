unit TencentCloudMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSkinWindowsForm, ExtCtrls, pngimage, uSkinWindowsControl,
  uSkinPanelType, uDrawCanvas, uSkinItems, uSkinScrollControlType,

  System.Types,
  Math,
  uSkinBufferBitmap,
  uGraphicCommon,
  uDrawTextParam,
  ListItemStyle_Default,
  ListItemStyle_IconLeft_CaptionRight,
  ListItemStyle_MailList,
//  ListItemStyle_MailListWithTag,
  uSkinItemDesignerPanelType,

//  ListItemStyle_CustomerInfo,
//  ListItemStyle_ContactInfo,
//  ListItemStyle_CompanyInfo,
  ListItemStyle_TreeMainMenu_LabelAndArrow,
  ListItemStyle_IconCaptionLeft_DetailRight,
  ListItemStyle_IconCaptionLeft_NotifyNumberRight,
  ListItemStyle_IconCaptionLeft_NotifyIconRight,
  ListItemStyle_IconCaptionLeft_ArrowRight,
  EasyServiceCommonMaterialDataMoudle_VCL,
  uGDIPlusDrawCanvas,
  uUrlPicture,
  uIdHttpControl,


  cxGridFrame,

  //���ݿ���
  DashBoard_AnalyseFrame,
  DashBoard_ProjectsFrame,


  //�����ؼ�
//  CustomerInfoFrame,
//  uAddPictureListSubFrame,
  ButtonFrame,
  MemoFrame,
  EditFrame,
  CheckBoxFrame,
  PageControlFrame,
  TestChartFrame,
  ItemGridFrame,
  ListBoxFrame,



  MultiSelectFrame_VCL,
  uMultiSelectFrame,

  uSkinCustomListType, uSkinVirtualListType, uSkinListBoxType, uSkinButtonType,
  uSkinMaterial, uSkinPageControlType, uSkinImageType, uSkinLabelType, StdCtrls,
  uSkinWindowsMemo, uSkinWindowsEdit, uSkinEditType, Menus, uSkinListViewType,
  uSkinTreeViewType, Vcl.ExtDlgs, uSkinNotifyNumberIconType;


type
  TfrmTencentCloudMain = class(TForm)
    fsdForm: TSkinWinForm;
    lbSubMenu: TSkinWinTreeView;
    imgUserHead: TImage;
    SkinTheme1: TSkinTheme;
    DrawCanvasSetting1: TDrawCanvasSetting;
    sbClient: TScrollBox;
    imgLogo: TSkinWinImage;
    lblCaption: TSkinWinLabel;
    pnlToolBar: TSkinWinPanel;
    btnMy: TSkinWinButton;
    btnSelectCountry: TSkinWinButton;
    SkinWinButton1: TSkinWinButton;
    SkinWinButton2: TSkinWinButton;
    btnMore: TSkinWinButton;
    btnSetting: TSkinWinButton;
    nniMessage: TSkinWinNotifyNumberIcon;
    SkinWinButton3: TSkinWinButton;
    procedure btnMinClick(Sender: TObject);
    procedure btnNormalClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lbMainMenuClickItem(AItem: TSkinItem);
    procedure lbSubMenuClickItem(AItem: TSkinItem);
    procedure lbSubMenuPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
    procedure lbSubMenuMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbSubMenuClickItemDesignerPanelChild(Sender: TObject;
      AItem: TBaseSkinItem; AItemDesignerPanel: TSkinItemDesignerPanel;
      AChild: TControl);
    procedure btnAddSubMenuClick(Sender: TObject);
    procedure btnCreateCustomerClick(Sender: TObject);
    procedure fsdFormSyncSystemControls(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure lbContactClickItemDesignerPanelChild(Sender: TObject;
      AItem: TBaseSkinItem; AItemDesignerPanel: TSkinItemDesignerPanel;
      AChild: TControl);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnAddRightTabSheetClick(Sender: TObject);
    procedure lbSubMenuMouseLeave(Sender: TObject);
    procedure lbContactPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectCountryClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sbClientResize(Sender: TObject);
  private
    FLastHintItem:TSkinItem;
    FCurrentFrame:TFrame;
//    FCustomerInfoFrame:TFrameCustomerInfo;
//    FCustomerInfoFrame:TFrameCustomerInfo;
//    OpenPictureDialog1: TOpenPictureDialog;
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure Load;
    { Public declarations }
  end;

var
  frmTencentCloudMain: TfrmTencentCloudMain;

implementation

{$R *.dfm}

procedure TfrmTencentCloudMain.btnAddRightTabSheetClick(Sender: TObject);
//var
//  ATabSheet: TSkinWinTabSheet;
begin
//  ATabSheet:=TSkinWinTabSheet.Create(Self);
//  ATabSheet.Prop.PageControl:=Self.pcRightInfo;
//  ATabSheet.Caption:='�·�ҳ';
//  Self.pcRightInfo.Prop.ActivePage:=ATabSheet;
end;

procedure TfrmTencentCloudMain.btnAddSubMenuClick(Sender: TObject);
//var
//  ASkinItem:TSkinItem;
begin
//  Self.lbSubMenu.Prop.Items.BeginUpdate;
//  try
//    ASkinItem:=Self.lbSubMenu.Prop.Items.Add;
//    ASkinItem.Icon.Assign(Self.imgCustomerUserHead.Prop.Picture);
//    ASkinItem.Caption:='����';
//  finally
//    Self.lbSubMenu.Prop.Items.EndUpdate;
//  end;
end;

procedure TfrmTencentCloudMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTencentCloudMain.btnCreateCustomerClick(Sender: TObject);
begin
  //
end;

procedure TfrmTencentCloudMain.btnMinClick(Sender: TObject);
begin
  WindowState:=wsMinimized;
end;

procedure TfrmTencentCloudMain.btnNormalClick(Sender: TObject);
begin
  if WindowState=wsNormal then
  begin
    WindowState:=wsMaximized;
  end
  else
  begin
    WindowState:=wsNormal;
  end;
end;

procedure TfrmTencentCloudMain.btnSearchClick(Sender: TObject);
begin
  ShowMessage('����');
end;

procedure TfrmTencentCloudMain.btnSelectCountryClick(Sender: TObject);
begin
  //
end;

procedure TfrmTencentCloudMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  //�ޱ߿�,��Ҳ��������
//  Params.Style:=Params.Style and not WS_THICKFRAME;// or WS_MINIMIZEBOX or WS_MAXIMIZEBOX;
end;

procedure TfrmTencentCloudMain.FormCreate(Sender: TObject);
var
  ASkinItem:TSkinItem;
  ACaptionArray:Array of String;
  AColorArray:Array of TColor;
  I: Integer;
begin
//  Color:=$003E2F26;
//  Self.lbSubMenu.SelfOwnMaterial.BackColor.Color:=$002D221E;

  dmEasyServiceCommonMaterial.btnThemeColorIconLeftCaptionRight.BackColor.IsRound:=False;
  dmEasyServiceCommonMaterial.btnDropDownGrayBorderBlackCaptionMaterial.BackColor.IsRound:=False;
  dmEasyServiceCommonMaterial.btnSmallIconMaterial.IsTransparent:=True;
  dmEasyServiceCommonMaterial.btnSmallIconMaterial.BackColor.IsFill:=False;
  dmEasyServiceCommonMaterial.btnWhiteColorGrayBorderThemeCaptionMaterial.BackColor.IsRound:=False;

  /// <summary>
  ///   <para>
  ///     �Ƿ�ʹ��ϵͳĬ�ϵ�����
  ///   </para>
  ///   <para>
  ///     Whetehr use default font
  ///   </para>
  /// </summary>
  GlobalIsUseDefaultFontFamily:=True;

  /// <summary>
  ///   <para>
  ///     Ĭ�ϵ���������
  ///   </para>
  ///   <para>
  ///     Default font name
  ///   </para>
  /// </summary>
  GlobalDefaultFontFamily:='΢���ź�';


//  //�ͻ���Ϣ
//  FCustomerInfoFrame:=TFrameCustomerInfo.Create(Self);
//  FCustomerInfoFrame.Parent:=tsInformation;
//  FCustomerInfoFrame.Align:=alClient;



//  //�ͻ���ǩ����
//  ACaptionArray:=['�ɽ��ͻ�','����ͻ�','����˹�Ӧ��','����SAP','a','��Լ�ͻ�','�ļ��������'];
//  AColorArray:=[clBlue,clBlack,clRed,clGray,clGreen];
//  Self.lbCustomerTags.Prop.Items.BeginUpdate;
//  try
//    for I := 0 to Length(ACaptionArray)-1 do
//    begin
//      ASkinItem:=Self.lbCustomerTags.Prop.Items.Add;
//      ASkinItem.Caption:=ACaptionArray[I];
//      ASkinItem.Width:=Ceil(uSkinBufferBitmap.GetStringWidth(ACaptionArray[I],8))+50;
//      ASkinItem.Color:=AColorArray[I mod Length(AColorArray)]
//    end;
//
//  finally
//    lbCustomerTags.Prop.Items.EndUpdate();
//  end;




//  //ͨѶ¼��ǩ����
//  Self.lbContact.Prop.Items.BeginUpdate;
//  try
//    for I := 0 to Self.lbContact.Prop.Items.Count-1 do
//    begin
//      if i mod 3 = 0 then Self.lbContact.Prop.Items[I].SubItems.Values['tags']:='[10159,10979,11016,10159,10979,11016]';
//      if i mod 3 = 1 then Self.lbContact.Prop.Items[I].SubItems.Values['tags']:='[10979,11016]';
//      if i mod 3 = 2 then Self.lbContact.Prop.Items[I].SubItems.Values['tags']:='[11016]';
//
//      //����Item�ĸ߶�
//      Self.lbContact.Prop.CalcItemAutoSize(Self.lbContact.Prop.Items[I])
//    end;
//  finally
//    Self.lbContact.Prop.Items.EndUpdate();
//  end;



  Self.lbSubMenu.Prop.FDefaultItemStyleSetting.IsUseCache:=False;

//  RoundSkinPicture(imgHead.Prop.Picture
//
//                    );
end;

procedure TfrmTencentCloudMain.FormShow(Sender: TObject);
begin
  Load;
end;

procedure TfrmTencentCloudMain.fsdFormSyncSystemControls(Sender: TObject);
begin
  fsdForm.CloseSysBtn.DirectUIVisible:=True;
  fsdForm.MaxRestoreSysBtn.DirectUIVisible:=True;
  fsdForm.MinSysBtn.DirectUIVisible:=True;


end;

procedure TfrmTencentCloudMain.lbMainMenuClickItem(AItem: TSkinItem);
begin
  ShowMessage(AItem.Caption);
end;

procedure TfrmTencentCloudMain.lbSubMenuClickItem(AItem: TSkinItem);
var
  ACurrentFrame:TFrame;
begin
  //ShowMessage(AItem.Caption);

//  FreeAndNil(ACurrentFrame);

  if FCurrentFrame<>nil then
  begin
    FCurrentFrame.Visible:=False;
  end;

  ACurrentFrame:=TFrame(AItem.DataObject);

  if ACurrentFrame=nil then
  begin
      //���ݿ���
      if (AItem.Caption='ר��������') then
      begin
        ACurrentFrame:=TFrameCxGrid.Create(Self);
      end;


      //����
      if (AItem.Name='dashboard_analyse') or (AItem.Caption='����') or (AItem.Caption='����') then
      begin
        ACurrentFrame:=TFrameDashBoard_Analyse.Create(Self);
      end;
      //��Ŀ
      if (AItem.Name='dashboard_projects') then
      begin
        ACurrentFrame:=TFrameDashBoard_Projects.Create(Self);
      end;






      //��ť
      if AItem.Name='button' then
      begin
        ACurrentFrame:=TFrameButton.Create(Self);
      end;
      //�ı���
      if AItem.Name='edit' then
      begin
        ACurrentFrame:=TFrameEdit.Create(Self);
      end;
      //��ע��
      if AItem.Name='memo' then
      begin
        ACurrentFrame:=TFrameMemo.Create(Self);
      end;
      //��ѡ��
      if AItem.Name='checkbox' then
      begin
        ACurrentFrame:=TFrameCheckBox.Create(Self);
      end;
      //��ҳ�ؼ�
      if AItem.Name='pagecontrol' then
      begin
        ACurrentFrame:=TFramePageControl.Create(Self);
      end;
      //���ؼ�
      if AItem.Name='itemgrid' then
      begin
        ACurrentFrame:=TFrameItemGrid.Create(Self);
      end;
      //�б�ؼ�
      if AItem.Name='listbox' then
      begin
        ACurrentFrame:=TFrameListBox.Create(Self);
      end;






      //ͼƬ��ѡ��
      if AItem.Name='add_picture_list_sub_frame' then
      begin
    //      Self.ACurrentFrame:=TFrameAddPictureListSub.Create(Self);
    //
    //      TFrameAddPictureListSub(ACurrentFrame).pnlToolBar.Visible:=False;
    //      TFrameAddPictureListSub(ACurrentFrame).lvPictures.Align:=alClient;
    //      TFrameAddPictureListSub(ACurrentFrame).lvPictures.Margins.Left:=0;
    //      TFrameAddPictureListSub(ACurrentFrame).Init(
    //                                                  '',
    //                                                  [],//
    //                                                  [],//
    //                                                  False,//���ü�
    //                                                  0,
    //                                                  0,
    //                                                  3//���3��
    //                                                  );




      end;
      //��ѡҳ��
      if AItem.Name='multi_select_frame' then
      begin
        ACurrentFrame:=TFrameMultiSelect.Create(Self);
        TFrameMultiSelect(ACurrentFrame).lbList.Prop.ItemDesignerPanel:=nil;
        TFrameMultiSelect(ACurrentFrame).lbList.Prop.DefaultItemStyle:='IconCaptionLeft_DetailRight';
        TFrameMultiSelect(ACurrentFrame).Init('���','������˿,������,���ѳ���','������');
        ACurrentFrame.Parent:=Self.sbClient;
        ACurrentFrame.Left:=Self.lbSubMenu.Width;
        ACurrentFrame.Top:=0;
        Exit;
      end;

  end;

  if ACurrentFrame=nil then
  begin
    Exit;
  end;

  ACurrentFrame.Visible:=True;

  AItem.DataObject:=ACurrentFrame;

  ACurrentFrame.Parent:=Self.sbClient;
  ACurrentFrame.Align:=alTop;

  FCurrentFrame:=ACurrentFrame;
  FCurrentFrame.Height:=Self.sbClient.Height;
end;

procedure TfrmTencentCloudMain.lbSubMenuClickItemDesignerPanelChild(Sender: TObject;
  AItem: TBaseSkinItem; AItemDesignerPanel: TSkinItemDesignerPanel;
  AChild: TControl);
begin
  if AChild.Name='imgRefresh' then
  begin
    ShowMessage('ˢ��');
  end;
end;

procedure TfrmTencentCloudMain.lbSubMenuMouseLeave(Sender: TObject);
begin
//  //����뿪��ʱ��,MouseOverItemҪ����Ϊ0,Ҫ�ػ�һ��
//  if lbSubMenu.Prop.MouseOverItem<>nil then
//  begin
//    lbSubMenu.Prop.MouseOverItem.IsBufferNeedChange:=True;
//    lbSubMenu.Prop.MouseOverItem:=nil;
//  end;
//  Self.lbSubMenu.Repaint;
end;

procedure TfrmTencentCloudMain.lbSubMenuMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
//var
//  I: Integer;
//  AItem:TSkinItem;
//  AScreenPos:TPoint;
begin
//  AItem:=Self.lbSubMenu.Prop.VisibleItemAt(X,Y);
//  if FLastHintItem<>AItem then
//  begin
//    FLastHintItem:=AItem;
//    if AItem<>nil then
//    begin
//      //������ʾ
//      Self.lbSubMenu.Hint:=AItem.Caption;
//      Self.lbSubMenu.ShowHint:=True;
//      //��ʾ��ʾ
//      AScreenPos:=Point(X,Y);
//      AScreenPos:=Self.lbSubMenu.ClientToScreen(AScreenPos);
//      Application.ActivateHint(AScreenPos);
//
//
//    end
//    else
//    begin
//      //����ʾ��ʾ
//      Self.lbSubMenu.Hint:='';
//      Self.lbSubMenu.ShowHint:=False;
//    end;
//  end;
//
//
//
//  //����ƶ���ʱ��,Ҫ�л�MouseOverItem,Ҫ�ػ�һ��
//  for I := 0 to lbSubMenu.Prop.Items.Count - 1 do
//  begin
//    lbSubMenu.Prop.Items[I].IsBufferNeedChange:=True;
//  end;
//  lbSubMenu.Repaint;
end;

procedure TfrmTencentCloudMain.lbSubMenuPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
begin

//  if (AItemDesignerPanel<>nil) and (AItemDesignerPanel.Parent is TFrameListItemStyle_IconLeft_CaptionRight) then
//  begin
//    //�����ǰ���Ƶ�ItemΪ������ڵ�Item����ʾ
//    TFrameListItemStyle_IconLeft_CaptionRight(AItemDesignerPanel.Parent).imgRefresh.Visible:=(AItem=lbSubMenu.Prop.MouseOverItem);
//    TFrameListItemStyle_IconLeft_CaptionRight(AItemDesignerPanel.Parent).btnDelete.Visible:=(AItem=lbSubMenu.Prop.MouseOverItem);
//
//
//  end;

end;

procedure TfrmTencentCloudMain.Load;
var
  ATestChartFrame:TFrameTestChart;
begin
//  Self.FCustomerInfoFrame.Load;

  Self.lbSubMenu.Prop.Items.FindItemByName('dashboard_analyse').Selected:=True;
  Self.lbSubMenuClickItem(Self.lbSubMenu.Prop.Items.FindItemByName('dashboard_analyse'));


//  ATestChartFrame:=TFrameTestChart.Create(Self);
//  ATestChartFrame.Parent:=Self.sbClient;
//  ATestChartFrame.Align:=alClient;


end;


procedure TfrmTencentCloudMain.N1Click(Sender: TObject);
begin
  ShowMessage('�����¼');
end;

procedure TfrmTencentCloudMain.N2Click(Sender: TObject);
begin
  ShowMessage('ɾ��');
end;

procedure TfrmTencentCloudMain.N3Click(Sender: TObject);
begin
  ShowMessage('ת��');
end;

procedure TfrmTencentCloudMain.N4Click(Sender: TObject);
begin
  ShowMessage('��Ⱥ');
end;

procedure TfrmTencentCloudMain.N5Click(Sender: TObject);
begin
  ShowMessage('�ͻ�����');
end;

procedure TfrmTencentCloudMain.sbClientResize(Sender: TObject);
begin
  if FCurrentFrame<>nil then FCurrentFrame.Height:=Self.sbClient.Height;
end;

procedure TfrmTencentCloudMain.Timer1Timer(Sender: TObject);
begin
  Self.lbSubMenu.Invalidate;
end;

procedure TfrmTencentCloudMain.lbContactClickItemDesignerPanelChild(Sender: TObject;
  AItem: TBaseSkinItem; AItemDesignerPanel: TSkinItemDesignerPanel;
  AChild: TControl);
var
  AItemRectF:TRectF;
  APopupPoint:TPoint;
begin
  if AChild.Name='btnChat' then
  begin

    ShowMessage('����');
//    TSkinWinButton(AChild).Properties.IsPushed:=False;
//    AItem.IsBufferNeedChange:=True;

  end;

//  if AChild.Name='btnMenu' then
//  begin
//
//    AItemRectF:=AItem.ItemDrawRect;
//    APopupPoint.X:=Ceil(AItemRectF.Right-AChild.Width);
//    APopupPoint.Y:=Ceil(AItemRectF.Bottom);
//    APopupPoint:=Self.lbContact.ClientToScreen(APopupPoint);
//
////    ShowMessage('�����˵�');
//    Self.pmMore.Popup(APopupPoint.X,APopupPoint.Y);
////    TSkinWinButton(AChild).Properties.IsPushed:=False;
////    AItem.IsBufferNeedChange:=True;
//
//  end;

end;

procedure TfrmTencentCloudMain.lbContactPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRect);
//var
//  AListItemStyle_MailListFrame:TFrameListItemStyle_MailList;
//  AListItemStyle_MailListWithTagFrame:TFrameListItemStyle_MailListWithTag;
begin

//  if AItemDesignerPanel.Parent is TFrameListItemStyle_MailListWithTag then
//  begin
//    AListItemStyle_MailListWithTagFrame:=TFrameListItemStyle_MailListWithTag(AItemDesignerPanel.Parent);
////    AListItemStyle_MailListWithTagFrame.Load
//  end;

//  //��OnPrepareDrawItem�¼�������������
//  AListItemStyle_MailListFrame:=TFrameListItemStyle_MailList(AItemDesignerPanel.Parent);
//
//  AListItemStyle_MailListFrame.lblTag1.Visible:=False;
//  AListItemStyle_MailListFrame.lblTag2.Visible:=False;
//
//  if AItem.Caption='Mike' then
//  begin
//    AListItemStyle_MailListFrame.lblTag1.Visible:=True;
//    AListItemStyle_MailListFrame.lblTag1.Material.BackColor.FillColor.Color:=clGreen;
//    AListItemStyle_MailListFrame.lblTag1.Caption:='�¿ͻ�';
//
//    AListItemStyle_MailListFrame.lblTag2.Visible:=True;
//    AListItemStyle_MailListFrame.lblTag2.Material.BackColor.FillColor.Color:=clBlue;
//    AListItemStyle_MailListFrame.lblTag2.Caption:='�³ɽ�';
//  end;
//
//
//  if AItem.Caption='who' then
//  begin
//    AListItemStyle_MailListFrame.lblTag1.Visible:=True;
//    AListItemStyle_MailListFrame.lblTag1.Material.BackColor.FillColor.Color:=clBlack;
//    AListItemStyle_MailListFrame.lblTag1.Caption:='������';
//
//  end;

end;

end.
