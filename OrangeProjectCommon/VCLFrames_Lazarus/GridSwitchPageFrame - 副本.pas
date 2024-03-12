//convert pas to utf8 by ¥
//convert pas to utf8 by ¥
unit GridSwitchPageFrame;

interface


//{$IFDEF FPC}
//  //Lazarus
//  //{$mode objfpc}{$H+}
//  {$mode delphi}{$H+}
//{$ELSE}
//  {$DEFINE DELPHI}
//{$ENDIF}


uses
  Messages, SysUtils, Variants, Types,
  Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, Grids, DBGrids, uSkinWindowsControl,
  uSkinButtonType, ExtCtrls,
//  uManager,
//  uOpenClientCommon,
//  uJsonToDataset,
  //XSuperObject,

  StrUtils,
  uSkinItems,
  uUIFunction,


  Math,
//  uWaitingForm,
//  EasyServiceCommonMaterialDataMoudle_VCL,

  //kbmMemTable,
//  uRestInterfaceCall,
  DateUtils, //Data.Win.ADODB,
  //FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  //FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  //FireDAC.Comp.Client,
//  uRestIntfMemTable,
  uSkinMaterial, uDrawPicture, uSkinImageList,
  uSkinImageListPlayerType, uSkinLabelType, uSkinPanelType,
  uSkinScrollControlType, uSkinCustomListType, uSkinVirtualListType,
  uSkinListBoxType;



type
  TGridSwitchPageFrameLoadDataEvent=procedure(Sender:Tobject;APageIndex:Integer;APageSize:Integer) of object;

  TFrameGridSwitchPage = class(TFrame)
    btnNextPage: TSkinWinButton;
    btnPriorPage: TSkinWinButton;
    edtPageIndex: TEdit;
    cmbPageSize: TComboBox;
    pnlClient: TPanel;
    lblSumCount: TSkinWinLabel;
    lblGoTo: TSkinWinLabel;
    lbPageIndexs: TSkinListBox;
    pnlGoTo: TSkinPanel;
    pnlPageSize: TSkinPanel;
    pnlSwitchPageIndex: TSkinPanel;
    procedure btnFirstPageClick(Sender: TObject);virtual;
    procedure btnPriorPageClick(Sender: TObject);virtual;
    procedure btnNextPageClick(Sender: TObject);virtual;
    procedure btnLastPageClick(Sender: TObject);virtual;
    procedure btnRefreshClick(Sender: TObject);virtual;
    procedure cmbPageSizePropertiesChange(Sender: TObject);
    procedure edtPageIndexKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);virtual;
    procedure lbPageIndexsClickItem(AItem: TSkinItem);
  private
//    //有几个下标
//    FPageIndexItemCount:Integer;
    procedure SyncPageIndexItemCount;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    //总记录数
    FSumCount:Integer;
    FPageCount:Integer;
    FPageIndex:Integer;

    FOnChange:TNotifyEvent;
    FOnLoadData:TGridSwitchPageFrameLoadDataEvent;
    procedure DoChange;
    //按钮点击加载数据
    procedure LoadData();virtual;
    procedure DoCustomLoadData;virtual;
    //数据加载结束,设置数据总数
    procedure LoadFinished(ASumCount:Integer);virtual;

    procedure Clear_cmbPageSizePropertiesChange;
    procedure Restore_cmbPageSizePropertiesChange;
    function GetPageSize:Integer;
    procedure SetPageIndex(AValue:Integer);
    { Public declarations }
  end;



//  TFrameGridSwitchPage=TFrameGridSwitchPage;




//  TFrameEventGridSwitchPage=class(TFrameGridSwitchPage)
//    procedure btnFirstPageClick(Sender: TObject);override;
//    procedure btnPriorPageClick(Sender: TObject);override;
//    procedure btnNextPageClick(Sender: TObject);override;
//    procedure btnLastPageClick(Sender: TObject);override;
//    procedure btnRefreshClick(Sender: TObject);override;
//    procedure edtPageIndexKeyUp(Sender: TObject; var Key: Word;
//      Shift: TShiftState);override;
//  public
//    procedure LoadData();override;
////    procedure DoRestMemTableChange(Sender:TObject);override;
////    procedure LoadFinished(ASumCount:Integer);override;
//  public
//    constructor Create(AOwner: TComponent); override;
//    destructor Destroy; override;
//  end;




implementation

//uses
//  HomeForm;

{$R *.dfm}

{ TFrameGridSwitchPage }

//第一页
procedure TFrameGridSwitchPage.btnFirstPageClick(Sender: TObject);
begin
//  Self.edtPageIndex.Text:='1';
//  LoadData();
//  DoChange;
  SetPageIndex(1);
end;

//最后一页
procedure TFrameGridSwitchPage.btnLastPageClick(Sender: TObject);
begin
//  if StrToInt(Self.lblPageCount.Caption)>0 then
//  begin
//    Self.edtPageIndex.Text:=Self.lblPageCount.Caption;
//    LoadData();
//    DoChange;
//  end;
  SetPageIndex(FPageCount);

end;

//下一页
procedure TFrameGridSwitchPage.btnNextPageClick(Sender: TObject);
var
  ANewPageIndex:Integer;
begin
  ANewPageIndex:=StrToInt(Self.edtPageIndex.Text)+1;
  SetPageIndex(ANewPageIndex);
//  if ANewPageIndex<=StrToInt(Self.lblPageCount.Caption) then
//  begin
//    Self.edtPageIndex.Text:=IntToStr(ANewPageIndex);
//
//    LoadData();
//    DoChange;
//  end;
end;

//上一页
procedure TFrameGridSwitchPage.btnPriorPageClick(Sender: TObject);
var
  ANewPageIndex:Integer;
begin
  ANewPageIndex:=StrToInt(Self.edtPageIndex.Text)-1;
  SetPageIndex(ANewPageIndex);
//  if ANewPageIndex>0 then
//  begin
//    Self.edtPageIndex.Text:=IntToStr(StrToInt(Self.edtPageIndex.Text)-1);
//
//    LoadData();
//    DoChange;
//  end;
end;

//刷新
procedure TFrameGridSwitchPage.btnRefreshClick(Sender: TObject);
begin
  LoadData;
  DoChange;
end;

procedure TFrameGridSwitchPage.Clear_cmbPageSizePropertiesChange;
begin
  cmbPageSize.OnChange:=nil;
end;

procedure TFrameGridSwitchPage.cmbPageSizePropertiesChange(Sender: TObject);
begin
  //重新
  LoadFinished(FSumCount);
  //重新设置下页数
  SetPageIndex(FPageIndex);
//  //需要重新获取数据
//  Self.LoadData;
//  Self.DoChange;
end;

constructor TFrameGridSwitchPage.Create(AOwner: TComponent);
begin
  inherited;

  FPageIndex:=1;
//  FPageIndexItemCount:=8;

  //清空
  LoadFinished(0);
end;

destructor TFrameGridSwitchPage.Destroy;
begin

  inherited;
end;

procedure TFrameGridSwitchPage.DoChange;
begin
  if Assigned(Self.FOnChange) then
  begin
    FOnChange(Self);
  end;
end;

procedure TFrameGridSwitchPage.DoCustomLoadData;
begin
  if Assigned(FOnLoadData) then
  begin
    FOnLoadData(Self,StrToInt(Self.edtPageIndex.Text),StrToInt(Self.cmbPageSize.Text));
  end;

end;

procedure TFrameGridSwitchPage.edtPageIndexKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=13 then
  begin
    LoadData();
    DoChange;
  end;
end;

function TFrameGridSwitchPage.GetPageSize: Integer;
begin
  Result:=StrToInt(Self.cmbPageSize.Text);
end;

procedure TFrameGridSwitchPage.lbPageIndexsClickItem(AItem: TSkinItem);
begin
  //
  Self.SetPageIndex(StrToInt(AItem.Name));

end;

procedure TFrameGridSwitchPage.LoadData;
begin
  //Self.btnRefresh.Visible:=False;
  //Self.imgWaiting.Prop.Picture.SkinImageList:=Self.imglistWaiting;
  //Self.imgWaiting.Visible:=True;
  //imgWaiting.Prop.ImageListAnimated:=True;
  DoCustomLoadData;
end;

procedure TFrameGridSwitchPage.Restore_cmbPageSizePropertiesChange;
begin
  cmbPageSize.OnChange:=cmbPageSizePropertiesChange;

end;

procedure TFrameGridSwitchPage.SetPageIndex(AValue: Integer);
begin
  if (AValue<1) then AValue:=1;
  if (AValue>FPageCount) then AValue:=FPageCount;
  if (AValue>0) and (AValue<=Self.FPageCount) then
  begin
    Self.edtPageIndex.Text:=IntToStr(AValue);
    FPageIndex:=AValue;
    SyncPageIndexItemCount;
    LoadData();
    DoChange;
  end;

end;

procedure TFrameGridSwitchPage.SyncPageIndexItemCount;
var
  I: Integer;
  ASkinItem:TSkinItem;
  AStart,AStop:Integer;
begin
//  if Self.FPageCount<Self.FPageIndexItemCount then
//  begin
//      //全部显示出来
//      Self.lbPageIndexs.Prop.Items.BeginUpdate;
//      try
//        Self.lbPageIndexs.Prop.Items.Clear;
//
//        for I := 0 to FPageCount-1 do
//        begin
//          Self.lbPageIndexs.Prop.Items.Add.Caption:=IntToStr(I+1);
//        end;
//
//      finally
//        Self.lbPageIndexs.Prop.Items.EndUpdate;
//      end;
//  end
//  else
//  begin

      //中间显示不出来的下标用...来表示
      Self.lbPageIndexs.Prop.Items.BeginUpdate;
      try
        Self.lbPageIndexs.Prop.Items.Clear;

        //第一个Item和最后一个Item是肯定要显示出来的
        ASkinItem:=Self.lbPageIndexs.Prop.Items.Add;
        ASkinItem.Caption:='1';
        ASkinItem.Name:='1';

        //当前PageIndex和首页超过3个Item,就要显示出...
        if (FPageCount>6) and (Self.FPageIndex-1>3) then
        begin

          ASkinItem:=Self.lbPageIndexs.Prop.Items.Add;
          ASkinItem.Caption:='...';
          ASkinItem.Name:=IntToStr(FPageIndex-5);

          AStart:=FPageIndex-2;
          AStop:=FPageIndex+2;


          //当前PageIndex和末页超过3个Item,就要显示出...
          if FPageCount-Self.FPageIndex>3 then
          begin
          end
          else
          begin
            //右边能显示全,如共100页,95,96,97,98,99,100
            AStart:=FPageCount-5;
            AStop:=FPageCount-1;
          end;

        end
        else
        begin
          //左边能显示全,不需要...，显示出1,2,3,4,5,6
          AStart:=2;
          AStop:=AStart+4;
        end;




        //以当前PageIndex为中心点,将左边显示出两个Item,右边也显示出两个Item
        //如果当前页是5,那么就是3,4,5,6,7
        for I := AStart to AStop do
        begin
          if (I>1) and (I<FPageCount) then
          begin
            ASkinItem:=Self.lbPageIndexs.Prop.Items.Add;
            ASkinItem.Caption:=IntToStr(I);
            ASkinItem.Name:=IntToStr(I);
          end;
        end;

        //当前PageIndex和末页超过3个Item,就要显示出...
        if (AStop<FPageCount-1) and (FPageCount-Self.FPageIndex>3) then
        begin
          ASkinItem:=Self.lbPageIndexs.Prop.Items.Add;
          ASkinItem.Caption:='...';
          ASkinItem.Name:=IntToStr(FPageIndex+5);
        end
        else
        begin
          //右边能显示全,则不需要...
        end;

        //第一个Item和最后一个Item是肯定要显示出来的
        if FPageCount>1 then
        begin
          ASkinItem:=Self.lbPageIndexs.Prop.Items.Add;
          ASkinItem.Caption:=IntToStr(FPageCount);
          ASkinItem.Name:=IntToStr(FPageCount);
        end;

        //将当前的PageIndex的这个Item选中
        ASkinItem:=Self.lbPageIndexs.Prop.Items.FindItemByCaption(IntToStr(Self.FPageIndex));
        if ASkinItem<>nil then ASkinItem.Selected:=True;


      finally
        Self.lbPageIndexs.Prop.Items.EndUpdate;
      end;

      Self.lbPageIndexs.Width:=Ceil(Self.lbPageIndexs.Prop.CalcContentWidth);
      Self.btnNextPage.Left:=Self.lbPageIndexs.Left+Self.lbPageIndexs.Width;
      Self.pnlSwitchPageIndex.Width:=Self.lbPageIndexs.Width+Self.btnPriorPage.Width+Self.btnNextPage.Width;


      Self.lblGoTo.Left:=Self.pnlSwitchPageIndex.Left+Self.pnlSwitchPageIndex.Width;
      Self.pnlGoTo.Left:=Self.lblGoTo.Left+Self.lblGoTo.Width;

//  end;

end;


//procedure TFrameGridSwitchPage.DoRestMemTableExecuteBegin(Sender: TObject);
//begin
//  ShowWaitingFrame(nil,'加载中');
//end;
//
//procedure TFrameGridSwitchPage.DoRestMemTableExecuteEnd(Sender: TObject);
//begin
//  HideWaitingFrame;
//end;

procedure TFrameGridSwitchPage.LoadFinished(ASumCount: Integer);
begin
  FSumCount:=ASumCount;
  Self.lblSumCount.Caption:='Total '+IntToStr(ASumCount);
  FPageCount:=Ceil(Self.FSumCount/StrToInt(Self.cmbPageSize.Text));
//  Self.lblPageCount.Caption:=IntToStr(Ceil(Self.FSumCount/StrToInt(Self.cmbPageSize.Text)));

  //imgWaiting.Prop.ImageListAnimated:=False;
  //Self.imgWaiting.Visible:=False;
  //Self.btnRefresh.Visible:=True;

  //生成下标列表
  SyncPageIndexItemCount;


end;

//{ TFrameEventGridSwitchPage }
//
//procedure TFrameEventGridSwitchPage.btnFirstPageClick(Sender: TObject);
//begin
//  Inherited;
//end;
//
//procedure TFrameEventGridSwitchPage.btnLastPageClick(Sender: TObject);
//begin
//  Inherited;
//end;
//
//procedure TFrameEventGridSwitchPage.btnNextPageClick(Sender: TObject);
//begin
//  Inherited;
//end;
//
//procedure TFrameEventGridSwitchPage.btnPriorPageClick(Sender: TObject);
//begin
//  Inherited;
//end;
//
//procedure TFrameEventGridSwitchPage.btnRefreshClick(Sender: TObject);
//begin
//  Inherited;
//
//end;
//
//constructor TFrameEventGridSwitchPage.Create(AOwner: TComponent);
//begin
//  inherited;
//  FSumCount:=0;
//  Self.lblPageCount.Caption:='1';
//
//  Self.Label1.Visible:=True;
//  Self.Label2.Visible:=True;
//  Self.lblPageCount.Visible:=True;
//  Self.Label5.Visible:=True;
//  Self.Label3.Visible:=True;
//  Self.cmbPageSize.Visible:=True;
//
//end;
//
//destructor TFrameEventGridSwitchPage.Destroy;
//begin
//
//  inherited;
//end;
//
//procedure TFrameEventGridSwitchPage.LoadData();
//begin
//  Inherited;
//end;
//
////procedure TFrameEventGridSwitchPage.DoRestMemTableChange(Sender: TObject);
////begin
//////  Self.edtPageIndex.Text:=IntToStr(FPageIndex);
//////  Self.lblPageCount.Caption:=IntToStr(FPageCount);
////
////end;
//
//procedure TFrameEventGridSwitchPage.edtPageIndexKeyUp(Sender: TObject;
//  var Key: Word; Shift: TShiftState);
//begin
////  FPageIndex:=StrToInt(Self.edtPageIndex.Text);
//  Inherited;
//end;
//
////procedure TFrameEventGridSwitchPage.LoadFinished(ASumCount: Integer);
////begin
////  Inherited;
////  Self.lblPageCount.Caption:=IntToStr(Ceil(Self.FSumCount/StrToInt(Self.cmbPageSize.Text)));
////end;
//



end.

