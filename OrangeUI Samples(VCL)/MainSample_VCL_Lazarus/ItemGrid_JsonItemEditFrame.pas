//convert pas to utf8 by ¥
//convert pas to utf8 by ¥

unit ItemGrid_JsonItemEditFrame;

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
  uSkinRepeatImageType,


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
  TFrameEditJsonItemGrid = class(TFrame)
    gridData: TSkinWinItemGrid;
    lblPublished: TSkinLabel;
    lblDraft: TSkinLabel;
    btnEditCell: TSkinButton;
    btnSaveCell: TSkinButton;
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

implementation

{$R *.dfm}

uses
  ItemGrid_DefaultFrame;

procedure TFrameEditJsonItemGrid.gridDataClickCellItemDesignerPanelChild(
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

procedure TFrameEditJsonItemGrid.gridDataCustomPaintCellBegin(ACanvas: TDrawCanvas;
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

procedure TFrameEditJsonItemGrid.gridDataResize(Sender: TObject);
begin
  //Self.Color:=clDefault;

//  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
//  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);

end;

procedure TFrameEditJsonItemGrid.InitColumns(AGrid: TSkinItemGrid);
var
  AColumn:TSkinItemGridColumn;
begin
  //Create Columns
  AGrid.Prop.Columns.BeginUpdate;
  AGrid.Prop.Items.BeginUpdate;
  try
    AGrid.Prop.Columns.Clear;

    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='id';
    AColumn.Caption:='ID';
    AColumn.Width:=100;


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='date';
    AColumn.Caption:='Date';
    AColumn.Width:=150;


    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='author';
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


    //自定义标题列的字体对齐
    //set column title text align to left
    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='title';
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



    //自定义操作列的控件类型为Button
    AColumn:=AGrid.Prop.Columns.Add;
    AColumn.BindItemFieldName:='';
    AColumn.Caption:='Action';
    //create AColumn.FSkinControl as TSkinButton
    AColumn.ControlType:='Button';
    TSkinButton(AColumn.FSkinControl).Caption:='Edit';
    TSkinButton(AColumn.FSkinControl).RefMaterial:=dmEasyServiceCommonMaterial.btnSkinThemeColorMaterial;
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



  finally
    AGrid.Prop.Columns.EndUpdate;
    AGrid.Prop.Items.EndUpdate;
  end;


end;

procedure TFrameEditJsonItemGrid.InitRows(AGrid: TSkinItemGrid);
var
  I:Integer;
  AOrderJson:ISuperObject;
  AOrderJsonArray:ISuperArray;
  ARow:TSkinJsonItemGridRow;
begin

  //init data
  AOrderJsonArray:=SA();

  AOrderJson:=SO();
  AOrderJson.I['id']:=1;
  AOrderJson.S['date']:='1997-04-27 18:24';
  AOrderJson.S['author']:='Jennifer';
  AOrderJson.I['importance']:=1;
  AOrderJson.S['status']:='draft';
  AOrderJson.S['title']:='Who is your best friend?';
  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;

  AOrderJson:=SO();
  AOrderJson.I['id']:=2;
  AOrderJson.S['date']:='2012-01-04 16:29';
  AOrderJson.S['author']:='Brenda';
  AOrderJson.I['importance']:=3;
  AOrderJson.S['status']:='draft';
  AOrderJson.S['title']:='Merry christmas!!!';
  AOrderJsonArray.O[AOrderJsonArray.Length]:=AOrderJson;

  AOrderJson:=SO();
  AOrderJson.I['id']:=3;
  AOrderJson.S['date']:='2001-07-18 01:54';
  AOrderJson.S['author']:='Steven';
  AOrderJson.I['importance']:=2;
  AOrderJson.S['status']:='published';
  AOrderJson.S['title']:='Today is rainning.';
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

constructor TFrameEditJsonItemGrid.Create(AOwner:TComponent);
begin

  Inherited;

  InitRows(gridData);

  InitGridMaterial(SkinItemGrid1);
  InitColumns(SkinItemGrid1);
  InitRows(SkinItemGrid1);

end;



end.




















