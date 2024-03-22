//convert pas to utf8 by ¥
//convert pas to utf8 by ¥

unit ItemGrid_DefaultFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  uDrawParam,
  uDrawTextParam,
  uDrawRectParam,

  uSkinSuperObject,
  uSkinItemJsonHelper,
  uSkinLabelType,
  Types,
  uSkinItemDesignerPanelType,
  uSkinRepeatImageType,
  uComponentType,


  //公共素材模块
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  Vcl.Imaging.pngimage,
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}


  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinPanelType, StdCtrls,
  uSkinButtonType, ExtCtrls;

type
  TFrameDefaultItemGrid = class(TFrame)
    gridData: TSkinWinItemGrid;
    lblPublished: TSkinLabel;
    lblDraft: TSkinLabel;
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
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;

    procedure InitColumns(AGrid:TSkinItemGrid);
    procedure InitRows(AGrid:TSkinItemGrid);
    { Public declarations }
  end;

procedure InitGridMaterial(AGrid:TSkinItemGrid);

implementation

{$R *.dfm}



procedure InitGridMaterial(AGrid:TSkinItemGrid);
begin
  //init column header caption style
//  AGrid.Material.DrawColumnMaterial.DrawCaptionParam.FontSize:=16;
//  AGrid.Material.DrawColumnMaterial.DrawCaptionParam.FontStyle:=[fsBold];
//  AGrid.Material.DrawColumnMaterial.DrawCaptionParam.FontVertAlign:=fvaCenter;
//  AGrid.Material.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.Enabled:=True;
//  AGrid.Material.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.SizeType:=TDPSizeType.dpstPixel;
//  AGrid.Material.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.Left:=10;

//  AGrid.Material.BackColor.Color:=clRed;


  //表头高度设置为50
  //set Columns height to 50
  AGrid.Prop.ColumnsHeaderHeight:=50;
//  AGrid.Prop.ItemHeight:=50;


  //列头背景透明
  AGrid.ColumnHeader.Material.IsTransparent:=True;
  AGrid.ColumnHeader.Material.BackColor.IsFill:=False;


  //列头分隔线的实现方式1
//  //列分隔线
//  AGrid.ColumnHeaderMaterial.DrawItemDevideParam.IsFill:=True;
//  //首列前分隔线
//  AGrid.ColumnHeaderMaterial.DrawGroupBeginDevideParam.IsFill:=True;
//  //末列后分隔线
//  AGrid.ColumnHeaderMaterial.DrawGroupEndDevideParam.IsFill:=True;
//  AGrid.ColumnHeaderMaterial.IsSimpleDrawGroupRoundRect:=True;
//
//  //表头Item有边框
//  //Column item has border
//  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderWidth:=1;
//  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderColor.Color:=$EDEDED;
//  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderEadges:=[TDRPBorderEadge.beTop,TDRPBorderEadge.beBottom];
//  //列背景不填充
//  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.IsFill:=False;




  //列头分隔线的实现方式2
  //表头Item有边框
  //Column item has border
  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderWidth:=1;
  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderColor.Color:=$EDEDED;
  //列背景不填充
  AGrid.Material.DrawColumnMaterial.DrawItemBackColorParam.IsFill:=False;





  //no col line
//  AGrid.Material.DrawGridCellDevideMaterial.IsDrawColLine:=False;


  //Grid devide line
  //表格有分隔线
  AGrid.Material.DrawGridCellDevideMaterial.DrawRowLineParam.PenDrawColor.Color:=$EDEDED;
  AGrid.Material.DrawGridCellDevideMaterial.DrawColLineParam.PenDrawColor.Color:=$EDEDED;
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawColEndLine:=True;




  //设置列标题的字体
  AGrid.Material.DrawColumnMaterial.DrawItemCaptionParam.FontVertAlign:=TFontVertAlign.fvaCenter;
  AGrid.Material.DrawColumnMaterial.DrawItemCaptionParam.FontHorzAlign:=TFontHorzAlign.fhaCenter;
  AGrid.Material.DrawColumnMaterial.DrawItemCaptionParam.FontSize:=12;


  //设置单元格的字段
  AGrid.Material.DrawColumnMaterial.DrawCellTextParam.FontVertAlign:=TFontVertAlign.fvaCenter;
  AGrid.Material.DrawColumnMaterial.DrawCellTextParam.FontHorzAlign:=TFontHorzAlign.fhaCenter;
  AGrid.Material.DrawColumnMaterial.DrawCellTextParam.FontSize:=12;


  //设置行分隔线
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawRowLine:=True;
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawRowBeginLine:=True;
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawRowEndLine:=True;


  //设置列分隔线
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawColLine:=True;
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawColBeginLine:=True;
  AGrid.Material.DrawGridCellDevideMaterial.IsDrawColEndLine:=True;

  //设置列分隔线
  AGrid.Prop.ItemHeight:=50;


  //设置鼠标停靠的背景色
  AGrid.Material.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.EffectTypes:=[TDRPEffectType.drpetFillColorChange,TDRPEffectType.drpetIsFillChange];
  AGrid.Material.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.IsFill:=True;
  AGrid.Material.RowBackColorMaterial.BackColor.DrawEffectSetting.MouseOverEffect.FillColor.Color:=$00FAF3F1;



  AGrid.VertScrollBar.Material.IsTransparent:=True;
  AGrid.VertScrollBar.Material.BackColor.IsFill:=False;


end;

procedure TFrameDefaultItemGrid.gridDataClickCellItemDesignerPanelChild(
  Sender: TObject; ARow: TBaseSkinItem; AColumn: TSkinVirtualGridColumn;
  AItemDesignerPanel: TSkinItemDesignerPanel; AChild: TControl);
begin
  if AColumn.Caption='Action' then
  begin
    if Self.gridData.Prop.EditingItem=nil then
    begin
      //开始编辑
      Self.gridData.Prop.StartEditingCell(ARow,Self.gridData.Prop.Columns.Find('title'),0,0);
    end
    else
    begin
      //结束编辑
      Self.gridData.Prop.StopEditingItem;
    end;
    
  end;

end;

procedure TFrameDefaultItemGrid.gridDataCustomPaintCellBegin(ACanvas: TDrawCanvas;
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
  if AColumn.GetBindItemFieldName='ItemDetail3' then
  begin
    AStatus:=ARow.GetValueByBindItemField('ItemDetail3');
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

procedure TFrameDefaultItemGrid.gridDataResize(Sender: TObject);
begin
  //Self.Color:=clDefault;

//  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
//  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);

end;

procedure TFrameDefaultItemGrid.InitColumns(AGrid: TSkinItemGrid);
var
  AColumn:TSkinItemGridColumn;
begin
  //Create Columns
  AGrid.Prop.Columns.BeginUpdate;
  AGrid.Prop.Items.BeginUpdate;
  try
    AGrid.Prop.Columns.Clear;

    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='ItemCaption';
    AColumn.Caption:='ID';
    AColumn.Width:=100;


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='ItemDetail';
    AColumn.Caption:='Date';
    AColumn.Width:=150;


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='ItemDetail1';
    AColumn.Caption:='Author';
    AColumn.Width:=100;

    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='ItemDetail2';
    AColumn.Caption:='Importance';
    AColumn.Width:=100;
    AColumn.ControlType:='RepeatImage';
    TSkinRepeatImage(AColumn.FSkinControl).Prop.Picture.Assign(imgStar.Picture);



    //make column status to Label
    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='ItemDetail3';
    AColumn.Caption:='Status';
    AColumn.Width:=100;
    //create AColumn.FSkinControl as TSkinLabel
    AColumn.ControlType:='Label';
//    TSkinLabelMaterial(AColumn.FSkinControlIntf.GetSelfOwnMaterial).BackColor.BorderWidth:=1;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderColor.Color:=$66CE13;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.BorderWidth:=1;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsRound:=True;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundWidth:=4;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.RoundHeight:=4;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.IsFill:=True;
    TSkinLabel(AColumn.FSkinControl).Material.BackColor.FillColor.Color:=$F0FAE7;

    TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontVertAlign:=fvaCenter;
    TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontHorzAlign:=fhaCenter;
    TSkinLabel(AColumn.FSkinControl).Material.DrawCaptionParam.FontColor:=$66CE13;

    {$IFDEF FPC}
    //AColumn.FSkinControl.Margins.SetBounds(20,10,20,10);
    AColumn.FSkinControl.BorderSpacing.Left:=20;
    AColumn.FSkinControl.BorderSpacing.Top:=10;
    AColumn.FSkinControl.BorderSpacing.Right:=20;
    AColumn.FSkinControl.BorderSpacing.Bottom:=10;
    {$ELSE}
    AColumn.FSkinControl.AlignWithMargins:=True;
    AColumn.FSkinControl.Margins.SetBounds(20,10,20,10);
    {$ENDIF}




    //自定义标题列的字体对齐
    //set column title text align to left
    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='ItemDetail4';
    AColumn.Caption:='Title';
    AColumn.Width:=300;
//    AColumn.IsUseDefaultGridColumnMaterial:=False;
//    AColumn.IsUseDefaultGridColumnCaptionParam:=False;
//
//    AColumn.Material.DrawItemBackColorParam.IsFill:=False;
//    AColumn.Material.DrawItemBackColorParam.BorderWidth:=1;
//    AColumn.Material.DrawItemBackColorParam.BorderColor.Color:=$EDEDED;
//
//    AColumn.Material.DrawCaptionParam.DrawRectSetting.Enabled:=True;
//    AColumn.Material.DrawCaptionParam.DrawRectSetting.Left:=10;
//    AColumn.Material.DrawCaptionParam.FontVertAlign:=fvaCenter;
//    AColumn.Material.DrawCaptionParam.FontSize:=12;
//
//    AColumn.Material.DrawCellTextParam.DrawRectSetting.Enabled:=True;
//    AColumn.Material.DrawCellTextParam.DrawRectSetting.Left:=10;
//    AColumn.Material.DrawCellTextParam.FontVertAlign:=fvaCenter;
//    AColumn.Material.DrawCellTextParam.FontSize:=12;




  finally
    AGrid.Prop.Columns.EndUpdate;
    AGrid.Prop.Items.EndUpdate;
  end;
end;

procedure TFrameDefaultItemGrid.InitRows(AGrid: TSkinItemGrid);
var
  ARow:TSkinItemGridRow;
begin
  AGrid.Prop.Items.BeginUpdate;
  try
    AGrid.Prop.Items.Clear;

    ARow:=TSkinJsonItemGridRow(AGrid.Prop.Items.Add);
    ARow.Caption:='1';
    ARow.Detail:='1997-04-27 18:24';
    ARow.Detail1:='Jennifer';
    ARow.Detail2:='1';
    ARow.Detail3:='draft';
    ARow.Detail4:='Who is your best friend?';



    ARow:=TSkinJsonItemGridRow(AGrid.Prop.Items.Add);
    ARow.Caption:='2';
    ARow.Detail:='2012-01-04 16:29';
    ARow.Detail1:='Brenda';
    ARow.Detail2:='3';
    ARow.Detail3:='draft';
    ARow.Detail4:='Merry christmas!!!';


    ARow:=TSkinJsonItemGridRow(AGrid.Prop.Items.Add);
    ARow.Caption:='3';
    ARow.Detail:='2001-07-18 01:54';
    ARow.Detail1:='Steven';
    ARow.Detail2:='2';
    ARow.Detail3:='published';
    ARow.Detail4:='Today is rainning.';





  finally
    AGrid.Prop.Items.EndUpdate;
  end;

end;

constructor TFrameDefaultItemGrid.Create(AOwner:TComponent);
//var
//  I:Integer;
//  AOrderJson:ISuperObject;
//  AOrderJsonArray:ISuperArray;
begin

  Inherited;


  //不允许鼠标按下拖动
//  Self.gridData.Prop.VertControlGestureManager.FIsEnableMouseDragScroll:=False;
//  Self.gridData.Prop.HorzControlGestureManager.FIsEnableMouseDragScroll:=False;


//  InitGridMaterial(Self.gridData);

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


//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='332850CE-D5D0-DF39-e22C-aFEb41';
//  AOrderJson.F['price']:=1698.3;
//  AOrderJson.S['status']:='pending';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='6DAD8f58-683F-aa47-a3de-BBcacC';
//  AOrderJson.F['price']:=9512;
//  AOrderJson.S['status']:='pending';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='eBAB4Ce5-36AF-7feB-9fcf-f5ccbc';
//  AOrderJson.F['price']:=11078.4;
//  AOrderJson.S['status']:='pending';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='eCcc5B4E-DB21-5D7A-c425-4E139F';
//  AOrderJson.F['price']:=4810.4;
//  AOrderJson.S['status']:='success';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='F2fcEC5B-9f53-61BA-42F6-187463';
//  AOrderJson.F['price']:=8686.42;
//  AOrderJson.S['status']:='pending';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='2Dea2c4D-C4AD-6Dbd-B18F-b26BdD';
//  AOrderJson.F['price']:=1341.7;
//  AOrderJson.S['status']:='success';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;
//
//  AOrderJson:=SO();
//  AOrderJson.S['orderno']:='eF23fF9e-eE70-87fC-1d07-c643b5';
//  AOrderJson.F['price']:=14215;
//  AOrderJson.S['status']:='success';
//  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;



//  Self.gridData.Prop.Items.BeginUpdate;
//  try
//    Self.gridData.Prop.Items.Clear;
//    for I:=0 to AOrderJsonArray.Length-1 do
//    begin
//      ARow:=TSkinJsonItemGridRow.Create(Self.gridData.Prop.Items);
//      ARow.Json:=AOrderJsonArray.O[I];
//    end;
//
//  finally
//    Self.gridData.Prop.Items.EndUpdate;
//  end;


end;



end.




















