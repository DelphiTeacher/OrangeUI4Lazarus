//convert pas to utf8 by ¥
//convert pas to utf8 by ¥

unit ItemGrid_ColumnControlTypeFrame;

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
  uComponentType,


  //公共素材模块
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}


  uSkinCheckBoxType,
  uSkinComboBoxType,
  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinPanelType, StdCtrls,
  uSkinButtonType, Vcl.ExtCtrls, uSkinMaterial, uSkinProgressBarType;

type
  TFrameItemGrid_ColumnControlType = class(TFrame)
    gridData: TSkinWinItemGrid;
    lblPublished: TSkinLabel;
    lblDraft: TSkinLabel;
    btnEditCell: TSkinButton;
    btnSaveCell: TSkinButton;
    SkinWinProgressBar1_Material: TSkinProgressBarDefaultMaterial;
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
    procedure gridDataClickColumn(Sender: TObject;
      ACol: TSkinVirtualGridColumn);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameItemGrid_ColumnControlType.gridDataClickCellItemDesignerPanelChild(
  Sender: TObject; ARow: TBaseSkinItem; AColumn: TSkinVirtualGridColumn;
  AItemDesignerPanel: TSkinItemDesignerPanel; AChild: TControl);
begin
  if AColumn.Caption='Button' then
  begin
    ShowMessage('Edit');
  end;
//  if AChild is TSkinCheckBox then
//  begin
//    Self.gridData.Prop.StartEditingCell(ARow,AColumn,0,0,AChild);
//  end;
//  if AChild is TSkinComboBox then
//  begin
////    TSkinComboBox(AChild).AutoDropDown:=True;
//    Self.gridData.Prop.StartEditingCell(ARow,AColumn,0,0,AChild);
//  end;

end;

procedure TFrameItemGrid_ColumnControlType.gridDataClickColumn(Sender: TObject;
  ACol: TSkinVirtualGridColumn);
begin
  ShowMessage('You clicked Col '+ACol.Caption);
end;

procedure TFrameItemGrid_ColumnControlType.gridDataCustomPaintCellBegin(ACanvas: TDrawCanvas;
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

  if AColumn.Caption='Action' then
  begin
    if (AColumn.FSkinControl<>nil) then
    begin
      if (Self.gridData.Prop.EditingItem=ARow) then
      begin
        //已经开始编辑了
        //Started Edit
        TSkinButton(AColumn.FSkinControl).RefMaterial:=Self.btnSaveCell.RefMaterial;
        TSkinButton(AColumn.FSkinControl).Caption:='Save';
      end
      else
      begin
        //尚未开启编辑
        //not Started Edit
        TSkinButton(AColumn.FSkinControl).RefMaterial:=Self.btnEditCell.RefMaterial;
        TSkinButton(AColumn.FSkinControl).Caption:='Edit';
      end;
    end;
  end;
end;

procedure TFrameItemGrid_ColumnControlType.gridDataResize(Sender: TObject);
begin
  //Self.Color:=clDefault;

//  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
//  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);

end;

constructor TFrameItemGrid_ColumnControlType.Create(AOwner:TComponent);
var
  I:Integer;
  AOrderJson:ISuperObject;
  AOrderJsonArray:ISuperArray;
  ARow:TSkinJsonItemGridRow;
  AColumn:TSkinItemGridColumn;
begin

  Inherited;


  //不允许鼠标按下拖动
//  Self.gridData.Prop.VertControlGestureManager.FIsEnableMouseDragScroll:=False;
//  Self.gridData.Prop.HorzControlGestureManager.FIsEnableMouseDragScroll:=False;





  //Create Columns
  Self.gridData.Prop.Columns.BeginUpdate;
  try
//    Self.gridData.Prop.Columns.Clear;
//
//    AColumn:=Self.gridData.Prop.Columns.Add;
//    AColumn.BindItemFieldName:='orderno';
//    AColumn.Caption:='Order_no';
//    AColumn.Width:=0.65;
//
//
//    AColumn:=Self.gridData.Prop.Columns.Add;
//    AColumn.BindItemFieldName:='price';
//    AColumn.Caption:='Price';
//    AColumn.Width:=0.20;




    //make column status to Label
    AColumn:=Self.gridData.Prop.Columns.Find('status');
    if AColumn<>nil then
    begin
      AColumn.BindItemFieldName:='status';
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
    end;


    //自定义标题列的字体对齐
    //set column title text align to left
    AColumn:=Self.gridData.Prop.Columns.Find('title');
    if AColumn<>nil then
    begin
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
    end;


    //自定义操作列的控件类型为Button
    AColumn:=TSkinItemGridColumn(Self.gridData.Prop.Columns.FindByCaption('Action'));
    if AColumn<>nil then
    begin
      //create AColumn.FSkinControl as TSkinButton
      AColumn.ControlType:='Button';
      TSkinButton(AColumn.FSkinControl).Caption:='Edit';
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
    end;



  finally
    Self.gridData.Prop.Columns.EndUpdate;
  end;


  //init column header caption style
//  Self.gridData.Material.DrawColumnMaterial.DrawCaptionParam.FontSize:=16;
//  Self.gridData.Material.DrawColumnMaterial.DrawCaptionParam.FontStyle:=[fsBold];
//  Self.gridData.Material.DrawColumnMaterial.DrawCaptionParam.FontVertAlign:=fvaCenter;
//  Self.gridData.Material.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.Enabled:=True;
//  Self.gridData.Material.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.SizeType:=TDPSizeType.dpstPixel;
//  Self.gridData.Material.DrawColumnMaterial.DrawCaptionParam.DrawRectSetting.Left:=10;

  Self.gridData.Prop.ColumnsHeaderHeight:=50;
  Self.gridData.Prop.ItemHeight:=50;


  //表头有分隔线
  //has column header devide line
  Self.gridData.ColumnHeader.Material.DrawItemDevideParam.IsFill:=True;

//  Self.gridData.ColumnHeader.Material.BackColor.BorderWidth:=1;
////  Self.gridData.ColumnHeader.Material.BackColor.BorderEadges:=[TDRPBorderEadge.beBottom];
//  Self.gridData.ColumnHeader.Material.BackColor.BorderColor.Color:=$EDEDED;
//  Self.gridData.ColumnHeader.Material.BackColor.FillColor.Color:=$EDEDED;

  //表头不填充背景色
  //Column header no fill
  Self.gridData.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderWidth:=1;
  Self.gridData.Material.DrawColumnMaterial.DrawItemBackColorParam.BorderColor.Color:=$EDEDED;
  Self.gridData.Material.DrawColumnMaterial.DrawItemBackColorParam.IsFill:=False;


//  Self.gridData.ColumnHeader.Material.DrawItemBackColorParam.IsFill:=False;
//
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontColor:=clGray;
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontSize:=11;
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontStyle:=[fsBold];
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontVertAlign:=fvaCenter;
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.DrawRectSetting.Enabled:=True;
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.DrawRectSetting.SizeType:=TDPSizeType.dpstPixel;
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.DrawRectSetting.Left:=10;




//  Self.gridData.Material.IsSimpleDrawGroupBeginDevide:=True;
//  Self.gridData.Material.DrawGroupBeginDevideParam.IsFill:=True;

  //no col line
//  Self.gridData.Material.DrawGridCellDevideMaterial.IsDrawColLine:=False;


  //Grid devide line
  //表格有分隔线
  Self.gridData.Material.DrawGridCellDevideMaterial.DrawRowLineParam.PenDrawColor.Color:=$EDEDED;
  Self.gridData.Material.DrawGridCellDevideMaterial.DrawColLineParam.PenDrawColor.Color:=$EDEDED;
  Self.gridData.Material.DrawGridCellDevideMaterial.IsDrawColEndLine:=True;


  //单元格内容水平居中
//  Self.gridData.Material.DrawColumnMaterial.DrawCellTextParam.IsFill:=False;



  Self.gridData.VertScrollBar.Material.IsTransparent:=True;
  Self.gridData.VertScrollBar.Material.BackColor.IsFill:=False;


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




















