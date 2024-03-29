﻿//convert pas to utf8 by ¥
//convert pas to utf8 by ¥

unit ItemGrid_ContentFrame;

interface

{$IFDEF FPC}
  //Lazarus
  //{$mode objfpc}{$H+}
  {$mode delphi}{$H+}
{$ELSE}
  {$DEFINE DELPHI}
{$ENDIF}


uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Messages, SysUtils, Variants, Classes, StrUtils,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  uDrawParam,
  uDrawTextParam,
  uDrawRectParam,

  uSkinSuperObject,
  uSkinItemJsonHelper,
  uSkinLabelType,
  Types,
  uSkinItemDesignerPanelType,
  uComponentType,
  GridSwitchPageFrame,
  WaitingForm,
  uFuncCommon,
  Math,

  uManager,
  uRestInterfaceCall,
  uOpenClientCommon,
  uSkinRepeatImageType,


  //公共素材模块
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  Vcl.Imaging.jpeg,Vcl.Imaging.pngimage,
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}


  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinPanelType, StdCtrls,
  uSkinButtonType, ExtCtrls, uSkinComboBoxType, uTimerTask, uTimerTaskEvent;

type
  TFrameContentItemGrid = class(TFrame)
    gridData: TSkinWinItemGrid;
    lblPublished: TSkinLabel;
    lblDraft: TSkinLabel;
    btnEditCell: TSkinButton;
    btnSaveCell: TSkinButton;
    pnlToolbar: TPanel;
    edtTitle: TEdit;
    cmbImportance: TSkinComboBox;
    btnSearch: TSkinButton;
    btnAdd: TSkinButton;
    SkinButton1: TSkinButton;
    cmbType: TSkinComboBox;
    tteLoadData: TTimerTaskEvent;
    idpAction: TSkinItemDesignerPanel;
    btnEditRow: TSkinButton;
    btnDeleteRow: TSkinButton;
    SkinItemGrid1: TSkinItemGrid;
    imgStar: TImage;
    procedure gridDataResize(Sender: TObject);
    procedure gridDataCustomPaintCellBegin(ACanvas: TDrawCanvas;
      ARowIndex: Integer; ARow: TBaseSkinItem; ARowDrawRect: TRectF;
      AColumn: TSkinVirtualGridColumn; AColumnIndex: Integer;
      ACellDrawRect: TRectF; ARowEffectStates: TDPEffectStates;
      ASkinVirtualGridMaterial: TSkinVirtualGridDefaultMaterial;
      ADrawColumnMaterial: TSkinVirtualGridColumnMaterial;
      AColItemDesignerPanel: TSkinItemDesignerPanel;
      const ADrawRect: TRectF; AVirtualGridPaintData: TPaintData);
    procedure gridDataClickCellItemDesignerPanelChild(Sender: TObject;
      ARow: TBaseSkinItem; AColumn: TSkinVirtualGridColumn;
      AItemDesignerPanel: TSkinItemDesignerPanel; AChild: TControl);
    procedure tteLoadDataBegin(ATimerTask: TTimerTask);
    procedure tteLoadDataExecute(ATimerTask: TTimerTask);
    procedure tteLoadDataExecuteEnd(ATimerTask: TTimerTask);
    procedure btnEditRowClick(Sender: TObject);
    procedure btnDeleteRowClick(Sender: TObject);
  private
    { Private declarations }
    FGridSwitchPageFrame:TFrameGridSwitchPage;
    procedure DoGridSwitchPageFrameLoadData(Sender:Tobject;APageIndex:Integer;APageSize:Integer);
  public
    constructor Create(AOwner:TComponent);override;

    procedure InitColumns(AGrid:TSkinItemGrid);
    procedure InitRows(AGrid:TSkinItemGrid);
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ItemGrid_DefaultFrame;


procedure TFrameContentItemGrid.DoGridSwitchPageFrameLoadData(Sender: Tobject;
  APageIndex, APageSize: Integer);
begin
  Self.tteLoadData.Run();
end;

procedure TFrameContentItemGrid.gridDataClickCellItemDesignerPanelChild(
  Sender: TObject; ARow: TBaseSkinItem; AColumn: TSkinVirtualGridColumn;
  AItemDesignerPanel: TSkinItemDesignerPanel; AChild: TControl);
begin
//  if AColumn.Caption='Action' then
//  begin
//    if Self.gridData.Prop.EditingItem=nil then
//    begin
//      //开始编辑
//      Self.gridData.Prop.StartEditingCell(ARow,Self.gridData.Prop.Columns.Find('title'),0,0);
//    end
//    else
//    begin
//      //结束编辑
//      Self.gridData.Prop.StopEditingItem;
//    end;
//
//  end;

end;

procedure TFrameContentItemGrid.gridDataCustomPaintCellBegin(ACanvas: TDrawCanvas;
  ARowIndex: Integer; ARow: TBaseSkinItem; ARowDrawRect: TRectF;
  AColumn: TSkinVirtualGridColumn; AColumnIndex: Integer; ACellDrawRect: TRectF;
  ARowEffectStates: TDPEffectStates;
  ASkinVirtualGridMaterial: TSkinVirtualGridDefaultMaterial;
  ADrawColumnMaterial: TSkinVirtualGridColumnMaterial;
  AColItemDesignerPanel: TSkinItemDesignerPanel; const ADrawRect: TRectF;
  AVirtualGridPaintData: TPaintData);
var
  AStatus:String;
begin
  if AColumn.GetBindItemFieldName='status' then
  begin
    AStatus:=ARow.GetValueByBindItemField('status');
    //switch color by value

//    if AStatus='success' then
//    begin
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderColor.Color:=$66CE13;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderWidth:=1;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsRound:=True;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundWidth:=4;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundHeight:=4;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsFill:=True;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.FillColor.Color:=$F0FAE7;
//
//      TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontVertAlign:=fvaCenter;
//      TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontHorzAlign:=fhaCenter;
//      TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontColor:=$66CE13;
//    end
//    else
//    begin
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderColor.Color:=$4949FF;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderWidth:=1;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsRound:=True;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundWidth:=4;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundHeight:=4;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsFill:=True;
//      TSkinLabel(AColumn.FSkinControl).Material.BackColor.FillColor.Color:=$EDEDFF;
//
//      TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontVertAlign:=fvaCenter;
//      TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontHorzAlign:=fhaCenter;
//      TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontColor:=$4949FF;
//    end;

    //or
    if (AColumn.FSkinControl<>nil) then
    begin
      if (AStatus='published') then
      begin
        TSkinLabel(AColumn.FSkinControl).RefMaterial:=Self.lblPublished.SelfOwnMaterial;
      end
      else
      begin
        TSkinLabel(AColumn.FSkinControl).RefMaterial:=Self.lblDraft.SelfOwnMaterial;
      end;
    end;

  end;

//  if AColumn.Caption='Action' then
//  begin
//    if (AColumn.FSkinControl<>nil) then
//    begin
//      if (Self.gridData.Prop.EditingItem=ARow) then
//      begin
//        //已经开始编辑了
//        //Started Edit
//        TSkinButton(AColumn.FSkinControl).RefMaterial:=Self.btnSaveCell.RefMaterial;
//        TSkinButton(AColumn.FSkinControl).Caption:='Save';
//      end
//      else
//      begin
//        //尚未开启编辑
//        //not Started Edit
//        TSkinButton(AColumn.FSkinControl).RefMaterial:=Self.btnEditCell.RefMaterial;
//        TSkinButton(AColumn.FSkinControl).Caption:='Edit';
//      end;
//    end;
//  end;
end;

procedure TFrameContentItemGrid.gridDataResize(Sender: TObject);
begin
  //Self.Color:=clDefault;


//  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
//  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);
  Self.gridData.Prop.SetColumnsAutoFitControlWidth;

end;

procedure TFrameContentItemGrid.InitColumns(AGrid: TSkinItemGrid);
var
  AColumn:TSkinItemGridColumn;
begin
  //Create Columns
  AGrid.Prop.Columns.BeginUpdate;
  AGrid.Prop.Items.BeginUpdate;
  try
    AGrid.Prop.Columns.Clear;

    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='fid';
    AColumn.Caption:='ID';
    AColumn.Width:=100;


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='createtime';
    AColumn.Caption:='Date';
    AColumn.Width:=180;


    //自定义标题列的字体对齐
    //set column title text align to left
    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='content';
    AColumn.Caption:='Title';
    AColumn.Width:=300;

    AColumn.IsUseDefaultGridColumnMaterial:=False;
    AColumn.IsUseDefaultGridColumnCaptionParam:=False;

    AColumn.Material.DrawItemBackColorParam.IsFill:=False;
    AColumn.Material.DrawItemBackColorParam.BorderWidth:=1;
    AColumn.Material.DrawItemBackColorParam.BorderColor.Color:=$EDEDED;

    AColumn.Material.DrawCaptionParam.DrawRectSetting.Enabled:=True;
    AColumn.Material.DrawCaptionParam.DrawRectSetting.Left:=10;
    AColumn.Material.DrawCaptionParam.FontVertAlign:=fvaCenter;
    AColumn.Material.DrawCaptionParam.FontSize:=12;

    AColumn.Material.DrawCellTextParam.DrawRectSetting.Enabled:=True;
    AColumn.Material.DrawCellTextParam.DrawRectSetting.Left:=10;
    AColumn.Material.DrawCellTextParam.FontVertAlign:=fvaCenter;
    AColumn.Material.DrawCellTextParam.FontSize:=12;



    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='user_name';
    AColumn.Caption:='Author';
    AColumn.Width:=150;


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='importance';
    AColumn.Caption:='Importance';
    AColumn.Width:=100;
    AColumn.ControlType:='RepeatImage';
    TSkinRepeatImage(AColumn.FSkinControl).Prop.Picture.Assign(imgStar.Picture);


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='read_count';
    AColumn.Caption:='ReadCount';
    AColumn.Width:=100;


//    AColumn:=AGrid.Prop.Columns.Add;
//    AColumn.BindItemFieldName:='status';
//    AColumn.Caption:='Status';
//    AColumn.Width:=100;




//    //make column status to Label
//    AColumn:=AGrid.Prop.Columns.Add;
//    AColumn.BindItemFieldName:='status';
//    AColumn.Caption:='Status';
//    AColumn.Width:=100;
//    //create AColumn.FSkinControl as TSkinLabel
//    AColumn.ControlType:='Label';
////    TSkinLabelMaterial(AColumn.FSkinControlIntf.GetSelfOwnMaterial).BackColor.BorderWidth:=1;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderColor.Color:=$66CE13;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderWidth:=1;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsRound:=True;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundWidth:=4;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundHeight:=4;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsFill:=True;
//    TSkinLabel(AColumn.FSkinControl).Material.BackColor.FillColor.Color:=$F0FAE7;
//
//    TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontVertAlign:=fvaCenter;
//    TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontHorzAlign:=fhaCenter;
//    TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontColor:=$66CE13;
//
//    {$IFDEF FPC}
//    //AColumn.FSkinControl.Margins.SetBounds(20,10,20,10);
//    AColumn.FSkinControl.BorderSpacing.Left:=20;
//    AColumn.FSkinControl.BorderSpacing.Top:=10;
//    AColumn.FSkinControl.BorderSpacing.Right:=20;
//    AColumn.FSkinControl.BorderSpacing.Bottom:=10;
//    {$ELSE}
//    AColumn.FSkinControl.AlignWithMargins:=True;
//    AColumn.FSkinControl.Margins.SetBounds(20,10,20,10);
//    {$ENDIF}



    //自定义操作列的控件类型为Button
    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='';
    AColumn.Caption:='Action';
    AColumn.ItemDesignerPanel:=idpAction;
    AColumn.Width:=160;
//    //create AColumn.FSkinControl as TSkinButton
//    AColumn.ControlType:='Button';
//    TSkinButton(AColumn.FSkinControl).Caption:='Edit';
//    TSkinButton(AColumn.FSkinControl).RefMaterial:=dmEasyServiceCommonMaterial.btnSkinThemeColorMaterial;
//    {$IFDEF FPC}
//    //AColumn.FSkinControl.Margins.SetBounds(20,10,20,10);
//    AColumn.FSkinControl.BorderSpacing.Left:=20;
//    AColumn.FSkinControl.BorderSpacing.Top:=10;
//    AColumn.FSkinControl.BorderSpacing.Right:=20;
//    AColumn.FSkinControl.BorderSpacing.Bottom:=10;
//    {$ELSE}
//    AColumn.FSkinControl.AlignWithMargins:=True;
//    AColumn.FSkinControl.Margins.SetBounds(20,10,20,10);
//    {$ENDIF}



  finally
    AGrid.Prop.Columns.EndUpdate;
    AGrid.Prop.Items.EndUpdate;
  end;



end;

procedure TFrameContentItemGrid.InitRows(AGrid: TSkinItemGrid);
var
  I:Integer;
  AOrderJson:ISuperObject;
  AOrderJsonArray:ISuperArray;
  ARow:TSkinJsonItemGridRow;
begin

  //init data
  AOrderJsonArray:=SA();

  AOrderJson:=SO();
  AOrderJson.I['fid']:=1;
  AOrderJson.S['createtime']:='2023-02-27 10:40:51';
  AOrderJson.S['content']:='Who is your best friend?';
  AOrderJson.S['user_name']:='Jennifer';
  AOrderJson.I['importance']:=1;
  AOrderJson.I['read_count']:=27;
  AOrderJson.S['status']:='draft';
  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;

  AOrderJson:=SO();
  AOrderJson.I['fid']:=2;
  AOrderJson.S['createtime']:='2012-01-04 16:29';
  AOrderJson.S['content']:='Merry christmas!!!';
  AOrderJson.S['user_name']:='Brenda';
  AOrderJson.I['importance']:=3;
  AOrderJson.I['read_count']:=2;
  AOrderJson.S['status']:='draft';
  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;

  AOrderJson:=SO();
  AOrderJson.I['fid']:=3;
  AOrderJson.S['createtime']:='2001-07-18 01:54';
  AOrderJson.S['content']:='Today is rainning.';
  AOrderJson.S['author']:='Steven';
  AOrderJson.I['importance']:=2;
  AOrderJson.I['read_count']:=5;
  AOrderJson.S['status']:='published';
  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;




  AGrid.Prop.Items.BeginUpdate;
  try
    AGrid.Prop.Items.Clear;
    for I:=0 to AOrderJsonArray.Length-1 do
    begin
      ARow:=TSkinJsonItemGridRow.Create(AGrid.Prop.Items);
      ARow.Json:=AOrderJsonArray.O[I];
    end;

  finally
    AGrid.Prop.Items.EndUpdate;
  end;



end;

procedure TFrameContentItemGrid.tteLoadDataBegin(ATimerTask: TTimerTask);
begin
  ShowWaitingFrame(nil,'Loading...');
end;

procedure TFrameContentItemGrid.tteLoadDataExecute(ATimerTask: TTimerTask);
//var
begin
//  if FFilterIsBest='1' then
//  begin
//    //精选,不显示寻获什么的
//    FFilterTypes:='user_photo,photo,article';
//  end
//  else
//  begin
//    //附近
////    FFilterTypes:='user_photo,photo,article,_lost,_find';
//    FFilterTypes:='';
//  end;

//  //目前全部显示
//  FFilterTypes:='';

//  if FFilterIsNearby='1' then
//  begin
//    FFilterProvince:=GlobalManager.Province;
//  end;


  //出错
  TTimerTask(ATimerTask).TaskTag:=TASK_FAIL;
  try
    TTimerTask(ATimerTask).TaskDesc:=
        SimpleCallAPI('get_content_list',
                      nil,
                      ContentCenterInterfaceUrl,
                      ['appid',
                      'user_fid',
                      'key',
                      'pageindex',
                      'pagesize',

                      //资讯、社区、圈子
                      'filter_big_type',
                      //导航菜单名称
                      'filter_name',

                      'filter_is_nearby',
                      'filter_province',
                      'filter_city',
                      'filter_longitude',
                      'filter_latitude',


                      //子分类：
                      'filter_type',

                      //推荐
                      'filter_is_best',
                      //热门
                      'filter_is_hot',
                      //我的关注
                      'filter_is_my_focus',
                      //名人
                      'filter_is_famous_man_published',

                      'filter_user_fid',

                      'filter_is_small_video',
                      'filter_topic',
                      'filter_keyword',
                      //其他过滤参数(整个过滤分组)
                      'filter_classify_json',

                      //谁的收藏
                      'filter_who_favourited',
                      //谁的浏览
                      'filter_who_readed',

                      //不需要详情
                      'is_no_detail'
                      ],
                      [AppID,
                      GlobalManager.User.fid,
                      GlobalManager.User.key,
                      FGridSwitchPageFrame.FPageIndex,
                      FGridSwitchPageFrame.GetPageSize,

                      '',//FFilterBigType,
                      '',//FFilterName,

                      '',//Self.FFilterIsNearby,
                      '',//Self.FFilterProvince,
                      '',//Self.FFilterCity,
                      '',//Self.FFilterLongitude,
                      '',//Self.FFilterLatitude,

                      '',//FFilterType,


                      '',//Self.FFilterIsBest,
                      '',//Self.FFilterIsHot,
                      '',//Self.FFilterIsMyFocus,
                      '',//Self.FFilterIsFamousManPublished,

                      '',//Self.FFilterUserFID,

                      '',//Self.FFilterIsSmallVideo,
                      '',//Self.FFilterTopic,
                      '',//Self.FFilterKeyword,
                      '',//Self.FFilterClassifyJson,

                      //谁收藏的内容
                      '',//Self.FFilterWhoFavourited,
                      //谁浏览过的内容
                      '',//FFilterWhoReaded,

                      //不需要详情
                      1
                      ],
                      GlobalRestAPISignType,
                      GlobalRestAPIAppSecret,
                      False,
                      nil,
                      '',
                      []
                      );

    //SaveStringToFile(TTimerTask(ATimerTask).TaskDesc,'D:\aaaa.json',TEncoding.UTF8);
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

procedure TFrameContentItemGrid.tteLoadDataExecuteEnd(ATimerTask: TTimerTask);
var
  I:Integer;
  ASuperObject:ISuperObject;
  ASuperArray:ISuperArray;
//  AHomeAd:ISuperObject;
//  AHomeAdArray:ISuperArray;
  AListViewItem:TSkinJsonItemGridRow;
begin
  try
    if TTimerTask(ATimerTask).TaskTag=TASK_SUCC then
    begin
      ASuperObject:=SO(TTimerTask(ATimerTask).TaskDesc);
      if ASuperObject.I['Code']=200 then
      begin
          //获取列表成功
          ASuperArray:=ASuperObject.O['Data'].A['RecordList'];
//          AHomeAd:=ASuperObject.O['Data'].O['HomeAd'];
//          AHomeAdArray:=AHomeAd.A['HomeAdList'];

//

          Self.gridData.Prop.Items.BeginUpdate;
          try
//            if FPageIndex=1 then
//            begin
              Self.gridData.Prop.Items.Clear(True);//ItemsByType(sitDefault);
//            end;
//
//
//            //判断是否存在广告
//            if (AHomeAdArray<>nil) and (AHomeAdArray.Length>0) then
//            begin
//              Self.gridData.Prop.Item1ItemStyle:='ImageListViewer';
//              AListViewItem:=Self.gridData.Prop.Items.Add;//Insert(APromotionTypeIndex+1);
//              AListViewItem.ItemType:=sitItem1;
//              AListViewItem.Json:=AHomeAd;
//              AListViewItem.Height:=
//                Self.gridData.Width/AListViewItem.Json.F['size_rate'];
//              for I := 0 to AHomeAdArray.Length-1 do
//              begin
//                AListViewItem.SubItems.Add(GetImageUrl(AHomeAdArray.O[I].S['picpath']));
//              end;
//            end;


            for I := 0 to ASuperArray.Length-1 do
            begin

              AListViewItem:=TSkinJsonItemGridRow.Create(Self.gridData.Prop.Items);
              ASuperArray.O[I].I['importance']:=Ceil(ASuperArray.O[I].I['read_count'] / 10);
              ASuperArray.O[I].S['content']:=ReplaceStr(ASuperArray.O[I].S['content'],#13#10,'');
              if ASuperArray.O[I].I['importance']>4 then ASuperArray.O[I].I['importance']:=4;
              
              AListViewItem.Json:=ASuperArray.O[I];

//              LoadContentItem(AListViewItem,
//                              ASuperArray.O[I],
//                              gridData,
//                              FFilterClassifyJsonObject,
//                              FIsAutoSizeItem);
            end;

          finally
            Self.gridData.Prop.Items.EndUpdate();
          end;


          Self.FGridSwitchPageFrame.LoadFinished(ASuperObject.O['Data'].I['SumCount']);

      end
      else
      begin
          //获取失败
//          ShowMessageBoxFrame(Self,ASuperObject.S['Desc'],'',TMsgDlgType.mtInformation,['确定'],nil);
          ShowMessage(ASuperObject.S['Desc']);
     end;

    end
    else if TTimerTask(ATimerTask).TaskTag=1 then
    begin
      //网络异常
//      ShowMessageBoxFrame(Self,'网络异常,请检查您的网络连接!',TTimerTask(ATimerTask).TaskDesc,TMsgDlgType.mtInformation,['确定'],nil);
      ShowMessage('网络异常,请检查您的网络连接!');
    end;
  finally
    HideWaitingFrame;


//    if FPageIndex>1 then
//    begin
//        //加载更多
//        if (TTimerTask(ATimerTask).TaskTag=TASK_SUCC) and (ASuperObject.O['Data'].A['RecordList'].Length>0) then
//        begin
//          Self.gridData.Prop.StopPullUpLoadMore('加载成功!',0,True);
//        end
//        else
//        begin
//          Self.gridData.Prop.StopPullUpLoadMore('下面没有了!',600,False);
//        end;
//    end
//    else
//    begin
//        //刷新
//        Self.gridData.Prop.StopPullDownRefresh('刷新成功!',600);
//    end;

  end;

end;

procedure TFrameContentItemGrid.btnDeleteRowClick(Sender: TObject);
begin
  if Self.gridData.Prop.InteractiveItem<>nil then
  begin
    Self.gridData.Prop.Items.BeginUpdate;
    try
      Self.gridData.Prop.InteractiveItem.Free;
    finally
      Self.gridData.Prop.Items.EndUpdate;
    end;
  end;

end;

procedure TFrameContentItemGrid.btnEditRowClick(Sender: TObject);
begin
  if Self.gridData.Prop.InteractiveItem<>nil then
  begin
    ShowMessage(Self.gridData.Prop.InteractiveItem.GetValueByBindItemField('content'));
  end;
end;

constructor TFrameContentItemGrid.Create(AOwner:TComponent);
//var
//  I:Integer;
//  AOrderJson:ISuperObject;
//  AOrderJsonArray:ISuperArray;
//  ARow:TSkinJsonItemGridRow;
//  AColumn:TSkinItemGridColumn;
begin

  Inherited;

  FGridSwitchPageFrame:=TFrameGridSwitchPage.Create(Self);
  FGridSwitchPageFrame.Parent:=Self;
  FGridSwitchPageFrame.Align:=alBottom;
  FGridSwitchPageFrame.FOnLoadData:=DoGridSwitchPageFrameLoadData;

  Self.tteLoadData.Run();




  InitGridMaterial(SkinItemGrid1);
  InitColumns(SkinItemGrid1);
  InitRows(SkinItemGrid1);












//  //init data
//  AOrderJsonArray:=SA();
//
//  AOrderJson:=SO();
//  AOrderJson.I['id']:=1;
//  AOrderJson.S['date']:='1997-04-27 18:24';
//  AOrderJson.S['author']:='Jennifer';
//  AOrderJson.I['importance']:=1;
//  AOrderJson.S['status']:='draft';
//  AOrderJson.S['title']:='Who is your best friend?';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.I['id']:=2;
//  AOrderJson.S['date']:='2012-01-04 16:29';
//  AOrderJson.S['author']:='Brenda';
//  AOrderJson.I['importance']:=3;
//  AOrderJson.S['status']:='draft';
//  AOrderJson.S['title']:='Merry christmas!!!';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.I['id']:=3;
//  AOrderJson.S['date']:='2001-07-18 01:54';
//  AOrderJson.S['author']:='Steven';
//  AOrderJson.I['importance']:=2;
//  AOrderJson.S['status']:='published';
//  AOrderJson.S['title']:='Today is rainning.';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//
//
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='332850CE-D5D0-DF39-e22C-aFEb41';
////  AOrderJson.F['price']:=1698.3;
////  AOrderJson.S['status']:='pending';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
////
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='6DAD8f58-683F-aa47-a3de-BBcacC';
////  AOrderJson.F['price']:=9512;
////  AOrderJson.S['status']:='pending';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
////
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='eBAB4Ce5-36AF-7feB-9fcf-f5ccbc';
////  AOrderJson.F['price']:=11078.4;
////  AOrderJson.S['status']:='pending';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
////
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='eCcc5B4E-DB21-5D7A-c425-4E139F';
////  AOrderJson.F['price']:=4810.4;
////  AOrderJson.S['status']:='success';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
////
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='F2fcEC5B-9f53-61BA-42F6-187463';
////  AOrderJson.F['price']:=8686.42;
////  AOrderJson.S['status']:='pending';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
////
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='2Dea2c4D-C4AD-6Dbd-B18F-b26BdD';
////  AOrderJson.F['price']:=1341.7;
////  AOrderJson.S['status']:='success';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
////
////  AOrderJson:=SO();
////  AOrderJson.S['orderno']:='eF23fF9e-eE70-87fC-1d07-c643b5';
////  AOrderJson.F['price']:=14215;
////  AOrderJson.S['status']:='success';
////  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//


  Self.gridData.Prop.Items.BeginUpdate;
  try
    Self.gridData.Prop.Items.Clear;
//    for I:=0 to AOrderJsonArray.Length-1 do
//    begin
//      ARow:=TSkinJsonItemGridRow.Create(Self.gridData.Prop.Items);
//      ARow.Json:=AOrderJsonArray.O[I];
//    end;

  finally
    Self.gridData.Prop.Items.EndUpdate;
  end;


end;



end.




















