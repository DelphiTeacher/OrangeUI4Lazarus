unit BaseQueryFrame2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  Types,
  uDrawEngine,
  uGraphicCommon,
  //公共素材模块
  EasyServiceCommonMaterialDataMoudle_VCL,
  GridSwitchPage2Frame,
  BaseForm,
  uComponentType,
  uDrawCanvas,
  uDrawParam,
  uFuncCommon,
  uSkinItems,
  uTimerTask,
  uFileCommon,
  XSuperObject,
//  WaitingForm,
  uWaitingForm,
  uJsonToDataset,
  uRestInterfaceCall,
  uSkinVirtualListType,
  uCxDBGridColumnItemDesignerPanelManager,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl,
  uSkinPanelType, uSkinButtonType, Vcl.StdCtrls, uSkinWindowsEdit, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, cxLabel, GridSwitchPageFrame, uSkinLabelType,
  Vcl.ComCtrls, uSkinWindowsDateEdit, uSkinItemDesignerPanelType, uSkinMaterial,
   cxButtonEdit, cxTextEdit, //FireDAC.Phys.SQLiteWrapper.Stat,
  uSkinWindowsComboBox, uSkinWindowsMyComboBox, uTimerTaskEvent;

type
  TFrameBaseQuery2 = class(TFrame)
    pnlToolbar: TSkinWinPanel;
    btnEdit: TSkinWinButton;
    btnAdd: TSkinWinButton;
    SkinWinButton2: TSkinWinButton;
    pnlClient: TSkinWinPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DataSource1: TDataSource;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    btnDel: TSkinWinButton;
    btnSave: TSkinWinButton;
    btnCancel: TSkinWinButton;
    pnlSearchBar: TSkinWinPanel;
    btnExport: TSkinWinButton;
    btnRefresh: TSkinWinButton;
    edtFilter: TSkinWinEdit;
    btnMore: TSkinWinButton;
    btnSetting: TSkinWinButton;
    SkinWinButton3: TSkinWinButton;
    btnSearch: TSkinWinButton;
    btnClearSelect: TSkinWinButton;
    btnSelectAll: TSkinWinButton;
    SkinWinButton5: TSkinWinButton;
    idpOperation: TSkinWinItemDesignerPanel;
    btnDeleteItem: TSkinWinButton;
    btnEditItem: TSkinWinButton;
    btnItemDetail: TSkinWinButton;
    cxStyle4: TcxStyle;
    idpState: TSkinWinItemDesignerPanel;
    lblItemState: TSkinWinLabel;
    SkinWinMyComboBox1: TSkinWinMyComboBox;
    SkinWinMyComboBox2: TSkinWinMyComboBox;
    SkinWinButton1: TSkinWinButton;
    SkinWinButton4: TSkinWinButton;
    FDMemTable1: TFDMemTable;
    tteLoadData: TTimerTaskEvent;
    cxGrid1DBTableView1FDMemTable1_fid: TcxGridDBColumn;
    cxGrid1DBTableView1FDMemTable1_createtime: TcxGridDBColumn;
    cxGrid1DBTableView1FDMemTable1_caption: TcxGridDBColumn;
    cxGrid1DBTableView1FDMemTable1_user_name: TcxGridDBColumn;
    cxGrid1DBTableView1FDMemTable1_important: TcxGridDBColumn;
    cxGrid1DBTableView1FDMemTable1_read_count: TcxGridDBColumn;
    cxGrid1DBTableView1FDMemTable1_state: TcxGridDBColumn;
    cxGrid1DBTableView1Column_operation: TcxGridDBColumn;
    cxGrid1DBTableView1Column_test: TcxGridDBColumn;
    procedure cxGrid1DBTableView1Column2CustomDrawHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure cxGrid1DBTableView1Column10CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure cxGrid1DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGrid1DBTableView1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnItemDetailClick(Sender: TObject);
    procedure btnDeleteItemClick(Sender: TObject);
    procedure btnEditItemClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure idpOperationPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRectF);
    procedure idpStatePrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItemDesignerPanel: TSkinItemDesignerPanel; AItem: TSkinItem;
      AItemDrawRect: TRectF);
    procedure cxGrid1DBTableView1Column2CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure idpStateResize(Sender: TObject);
    procedure tteLoadDataBegin(ATimerTask: TTimerTask);
    procedure tteLoadDataExecute(ATimerTask: TTimerTask);
    procedure tteLoadDataExecuteEnd(ATimerTask: TTimerTask);
    procedure btnSearchClick(Sender: TObject);
    procedure cxGrid1DBTableView1Column_operationCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1FDMemTable1_stateCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
//    //当前鼠标停靠信息
//    FHitTest:TcxCustomGridHitTest;
//    FIsMouseDown:Boolean;
    FGridSwitchPage2Frame:TFrameGridSwitchPage2;
//    FCurrentRowServerColValue:String;

    FOperationColumnItemDesignerPanelManager:TCxDBGridColumnItemDesignerPanelManager;
    FStateColumnItemDesignerPanelManager:TCxDBGridColumnItemDesignerPanelManager;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  BaseEditForm;

{ TFrameCxGrid }

procedure TFrameBaseQuery2.btnDeleteItemClick(Sender: TObject);
begin
  ShowMessage('删除');

end;

procedure TFrameBaseQuery2.btnEditClick(Sender: TObject);
//var
//  AForm:TfrmBaseQuery;
begin
//  AForm:=TfrmBaseQuery.Create(Application);
//  AForm.Show;
end;

procedure TFrameBaseQuery2.btnEditItemClick(Sender: TObject);
begin
  ShowMessage('编辑');

end;

constructor TFrameBaseQuery2.Create(AOwner: TComponent);
begin
  inherited;

  FOperationColumnItemDesignerPanelManager:=TCxDBGridColumnItemDesignerPanelManager.Create(
    cxGrid1DBTableView1,
    Self.cxGrid1DBTableView1Column_operation,
    Self.idpOperation);

  FStateColumnItemDesignerPanelManager:=TCxDBGridColumnItemDesignerPanelManager.Create(
    cxGrid1DBTableView1,
    'state',
    Self.idpState);

  FDMemTable1.Active:=False;
  FDMemTable1.CreateDataSet;
  tteLoadData.Run();
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1Column10CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
//var
//  AItemDrawRect:TRectF;
//  AItemPaintData:TPaintData;
//  ADrawCanvas:TDrawCanvas;
//  AItemEffectStates:TDPEffectStates;
begin
//  Exit;

//  OutputDebugString(PWideChar('cxGrid1DBTableView1Column10CustomDrawCell '+StdDateTimeToStr(Now)));



//  AItemDrawRect:=RectF(AViewInfo.Bounds.Left,AViewInfo.Bounds.Top,AViewInfo.Bounds.Right,AViewInfo.Bounds.Bottom);
//  uSkinVirtualListType.AutoAdjustItemDesignerPanelSize(idpOperation,nil,AItemDrawRect);
//  idpOperation.Material.IsTransparent:=False;
//  idpOperation.Material.BackColor.IsFill:=False;
//
//  ADrawCanvas:=CreateDrawCanvas('CustomDrawCell');
//  try
//    ADrawCanvas.Prepare(ACanvas.Handle);
//
//              AItemEffectStates:=[];
//              if AViewInfo.Focused then
//              begin
//                AItemEffectStates:=AItemEffectStates+[TDPEffectState.dpstPushed];
//              end;
//
//              if Self.FHitTest<>nil then
//              begin
//                if AViewInfo.GridRecord=TcxGridRecordCellHitTest(FHitTest).GridRecord then
//                begin
//                  AItemEffectStates:=AItemEffectStates+[TDPEffectState.dpstMouseOver];
//                  if FIsMouseDown then
//                  begin
//                    AItemEffectStates:=AItemEffectStates+[TDPEffectState.dpstMouseDown];
//                  end;
//                end;
//              end;
//
//              idpOperation.SkinControlType.IsUseCurrentEffectStates:=True;
//              idpOperation.SkinControlType.CurrentEffectStates:=AItemEffectStates;
//
//
//              //绘制ItemDesignerPanel的背景,背景色
//              AItemPaintData:=GlobalNullPaintData;
//              AItemPaintData.IsDrawInteractiveState:=True;
//              AItemPaintData.IsInDrawDirectUI:=True;
//              idpOperation.SkinControlType.Paint(ADrawCanvas,
//                        idpOperation.SkinControlType.GetPaintCurrentUseMaterial,
//                        AItemDrawRect,
//                        AItemPaintData);
//
//              //绘制ItemDesignerPanel的子控件
//              AItemPaintData:=GlobalNullPaintData;
//              AItemPaintData.IsDrawInteractiveState:=(FHitTest<>nil) and (AViewInfo.GridRecord=TcxGridRecordCellHitTest(FHitTest).GridRecord);//False;///True;//AIsDrawItemInteractiveState;
//              AItemPaintData.IsInDrawDirectUI:=True;
//              //正在编辑的绑定控件不绘制
////              ACustomListItemPaintOtherData.IsEditingItem:=(Self.FSkinVirtualListIntf.Prop.FEditingItem=ASkinItem);
////              ACustomListItemPaintOtherData.EditingItemDataType:=Self.FSkinVirtualListIntf.Prop.FEditingItem_DataType;
////              ACustomListItemPaintOtherData.EditingSubItemsIndex:=Self.FSkinVirtualListIntf.Prop.FEditingItem_SubItemsIndex;
////              ACustomListItemPaintOtherData.EditingItemDataType:=Self.FSkinVirtualListIntf.Prop.FEditingItem_DataType;
////              ACustomListItemPaintOtherData.EditingItemFieldName:=Self.FSkinVirtualListIntf.Prop.FEditingItem_FieldName;
////              AItemPaintData.OtherData:=@ACustomListItemPaintOtherData;
//              idpOperation.SkinControlType.DrawChildControls(ADrawCanvas,AItemDrawRect,AItemPaintData,RectF(0,0,Self.cxGrid1.Width,Self.cxGrid1.Height));
//
//  finally
//    FreeAndNil(ADrawCanvas);
//  end;
//  ADone:=True;
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1Column2CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  //自绘单元格
  FStateColumnItemDesignerPanelManager.ColumnCustomDrawCell(Sender,ACanvas,AViewInfo,ADone);
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1Column2CustomDrawHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  AViewInfo.Borders:=[];
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1Column_operationCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  //交给设计面板去自绘单元格
  FOperationColumnItemDesignerPanelManager.ColumnCustomDrawCell(
    Sender,ACanvas,AViewInfo,ADone);
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  if AViewInfo.Focused then
//  begin
    acanvas.Brush.Color:=clWhite;
    acanvas.Font.Color:=clBlack;

//    if TcxGridDBColumn(AViewInfo.Item).DataBinding.FieldName='name' then
//    begin
//      FCurrentRowServerColValue:=AViewInfo.Value;
//    end;
//  end;
end;
//  if FStateColumnItemDesignerPanelManager.FDrawCellViewInfo=nil then
//  begin
//    Exit;
//  end;
//
////  ACellValue:=FStateColumnItemDesignerPanelManager.cxGrid1DBTableView1.DataController.GetValue(
////            FStateColumnItemDesignerPanelManager.FDrawCellViewInfo.GridRecord.RecordIndex,
////            1//TcxGridRecordCellHitTest(FHitTest).Item.Index
////            );
//  Self.lblItemState.Caption:=FStateColumnItemDesignerPanelManager.FDrawCellViewInfo.Value;
//  if FStateColumnItemDesignerPanelManager.FDrawCellViewInfo.Value='运行中' then
//  begin
//    Self.lblItemState.Material.BackColor.FillColor.FColor:=$00FF6E00;
//  end
//  else
//  begin
//    Self.lblItemState.Material.BackColor.FillColor.FColor:=$006C6CF5;
//  end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1FDMemTable1_stateCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  //自绘单元格
  if AViewInfo.Value=0 then
  begin
    Self.lblItemState.StaticCaption:='草稿';
    Self.lblItemState.Material.BackColor.FillColor.FColor:=$00F4F4F4;
    Self.lblItemState.Material.BackColor.BorderColor.FColor:=$00ebe9e9;
    Self.lblItemState.Material.DrawCaptionParam.FontColor:=$00999390;
  end
  else
  begin
    Self.lblItemState.StaticCaption:='已发布';
    Self.lblItemState.Material.BackColor.FillColor.FColor:=$00F0FAE7;
    Self.lblItemState.Material.BackColor.BorderColor.FColor:=$00e0f5d0;
    Self.lblItemState.Material.DrawCaptionParam.FontColor:=$0066ce13;
  end;
  FStateColumnItemDesignerPanelManager.ColumnCustomDrawCell(Sender,
    ACanvas,AViewInfo,ADone);
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //设计面板处理鼠标点击事件
  FOperationColumnItemDesignerPanelManager.MouseDown(Sender,Button,Shift,X,Y);
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  //设计面板处理鼠标移动事件
  FOperationColumnItemDesignerPanelManager.MouseMove(Sender,Shift,X,Y);
end;

procedure TFrameBaseQuery2.cxGrid1DBTableView1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //设计面板处理鼠标弹起事件
  FOperationColumnItemDesignerPanelManager.MouseUp(Sender,Button,Shift,X,Y);
end;

destructor TFrameBaseQuery2.Destroy;
begin
  FreeAndNil(FOperationColumnItemDesignerPanelManager);
  FreeAndNil(FStateColumnItemDesignerPanelManager);
  inherited;
end;

procedure TFrameBaseQuery2.idpOperationPrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRectF);
var
  ACellValue:String;
begin
//  OutputDebugString('Begin');
  if FOperationColumnItemDesignerPanelManager.FDrawCellViewInfo=nil then
  begin
    Exit;
  end;

//  ACellValue:='';
//  ACellValue:=FOperationColumnItemDesignerPanelManager.cxGrid1DBTableView1.DataController.GetValue(
//            FOperationColumnItemDesignerPanelManager.FDrawCellViewInfo.GridRecord.RecordIndex,
//            0//TcxGridRecordCellHitTest(FHitTest).Item.Index
//            );
  //AViewInfo.GridRecord.Values 返回的是一整行记录的数组
  //你也可以使用arr[0]这样的方式返回,但是如果用户移动列位置的时候,程序就会出错
  //所以还是用index来定位比较稳
  //字段名.Index 返回字段所在的位置,比如下面的ID.Index,反回的是ID字段排在第几列
  //这会造成报错
  ACellValue:=FOperationColumnItemDesignerPanelManager.FDrawCellViewInfo.GridRecord.Values[0];

  if ACellValue='orangeui' then
  begin
    //用Visible:=True;双击窗体Grid重绘制报错
    Self.btnDeleteItem.DirectUIVisible:=False;
  end
  else
  begin
    Self.btnDeleteItem.DirectUIVisible:=True;
  end;
//  OutputDebugString('End');
end;

procedure TFrameBaseQuery2.idpStatePrepareDrawItem(Sender: TObject;
  ACanvas: TDrawCanvas; AItemDesignerPanel: TSkinItemDesignerPanel;
  AItem: TSkinItem; AItemDrawRect: TRectF);
//var
//  ACellValue:String;
begin
//  if FStateColumnItemDesignerPanelManager.FDrawCellViewInfo=nil then
//  begin
//    Exit;
//  end;
//
////  ACellValue:=FStateColumnItemDesignerPanelManager.cxGrid1DBTableView1.DataController.GetValue(
////            FStateColumnItemDesignerPanelManager.FDrawCellViewInfo.GridRecord.RecordIndex,
////            1//TcxGridRecordCellHitTest(FHitTest).Item.Index
////            );
//  Self.lblItemState.Caption:=FStateColumnItemDesignerPanelManager.FDrawCellViewInfo.Value;
//  if FStateColumnItemDesignerPanelManager.FDrawCellViewInfo.Value='运行中' then
//  begin
//    Self.lblItemState.Material.BackColor.FillColor.FColor:=$00FF6E00;
//  end
//  else
//  begin
//    Self.lblItemState.Material.BackColor.FillColor.FColor:=$006C6CF5;
//  end;

end;

procedure TFrameBaseQuery2.idpStateResize(Sender: TObject);
begin
  Self.lblItemState.Left:=(idpState.Width-lblItemState.Width) div 2;
end;

procedure TFrameBaseQuery2.tteLoadDataBegin(ATimerTask: TTimerTask);
begin
  ShowWaitingFrame(nil,'加载中...');
end;

procedure TFrameBaseQuery2.tteLoadDataExecute(ATimerTask: TTimerTask);
begin
  //出错
  TTimerTask(ATimerTask).TaskTag:=TASK_FAIL;
  try
    TTimerTask(ATimerTask).TaskDesc:=
        SimpleCallAPI('get_content_list',
            nil,
            'http://www.orangeui.cn:10020/contentcenter/',
            ['appid',
            'user_fid',
            'key',
            'pageindex',
            'pagesize'
            ],
            [1000,
            '2',
            '',
            1,
            20],
            GlobalRestAPISignType,
            GlobalRestAPIAppSecret
            );
    if TTimerTask(ATimerTask).TaskDesc<>'' then
    begin
      TTimerTask(ATimerTask).TaskTag:=TASK_SUCC;
    end;

  except
    on E:Exception do
    begin
      //异常
      TTimerTask(ATimerTask).TaskDesc:=E.Message;
    end;
  end;

end;

procedure TFrameBaseQuery2.tteLoadDataExecuteEnd(ATimerTask: TTimerTask);
var
  I:Integer;
  ASuperObject:ISuperObject;
  ASuperArray:ISuperArray;
begin
  try
    if TTimerTask(ATimerTask).TaskTag=TASK_SUCC then
    begin
      ASuperObject:=TSuperObject.Create(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin
          //获取列表成功
          ASuperArray:=ASuperObject.O['Data'].A['RecordList'];

          Self.FDMemTable1.DisableControls;
          try
            FDMemTable1.EmptyDataSet;
            for I := 0 to ASuperArray.Length-1 do
            begin
              FDMemTable1.Append;
              FDMemTable1.FieldByName('fid').AsInteger:=ASuperArray.O[I].I['fid'];
              FDMemTable1.FieldByName('createtime').AsString:=ASuperArray.O[I].S['createtime'];
              FDMemTable1.FieldByName('caption').AsString:=ASuperArray.O[I].S['caption'];
              FDMemTable1.FieldByName('user_name').AsString:=ASuperArray.O[I].S['user_name'];
              FDMemTable1.FieldByName('important').AsInteger:=I mod 4 +1;//1,2,3
              FDMemTable1.FieldByName('read_count').AsInteger:=ASuperArray.O[I].I['read_count'];
              FDMemTable1.FieldByName('state').AsInteger:=I mod 2;//0 draft 1 published
              FDMemTable1.Post;
            end;
            FDMemTable1.First;
          finally
            Self.FDMemTable1.EnableControls;
          end;

      end
      else
      begin
//          //获取失败
//          ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
      end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
//      //网络异常
//      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
    end;
  finally
    HideWaitingFrame;


//    if FPageIndex>1 then
//    begin
//        //加载更多
//        if (TTimerTask(ATimerTask).TaskTag=TASK_SUCC) and (ASuperObject.O['Data'].A['RecordList'].Length>0) then
//        begin
//          Self.lvData.Prop.StopPullUpLoadMore('加载成功!',0,True);
//        end
//        else
//        begin
//          Self.lvData.Prop.StopPullUpLoadMore('下面没有了!',600,False);
//        end;
//    end
//    else
//    begin
//        //刷新
//        Self.lvData.Prop.StopPullDownRefresh('刷新成功!',600);
//    end;

  end;

end;

procedure TFrameBaseQuery2.btnItemDetailClick(Sender: TObject);
begin
  ShowMessage('详情'
              +cxGrid1DBTableView1.DataController.GetValue(
                FOperationColumnItemDesignerPanelManager.FHitTest.GridRecord.RecordIndex,
                0
                )
        );
end;

procedure TFrameBaseQuery2.btnSearchClick(Sender: TObject);
begin
  //加载数据
  tteLoadData.Run();
end;

procedure TFrameBaseQuery2.btnAddClick(Sender: TObject);
var
  AForm:TfrmBaseEdit;
begin
  AForm:=TfrmBaseEdit.Create(Application);
  AForm.Show;
end;

end.
