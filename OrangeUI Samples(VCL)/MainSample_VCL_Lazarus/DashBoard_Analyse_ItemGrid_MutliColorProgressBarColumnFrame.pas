//convert pas to utf8 by ¥
unit DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}

  Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  Types,

  uGraphicCommon,
  uDrawTextParam,
  uSkinItemDesignerPanelType,
  uDrawParam,
  uComponentType,
  ListItemStyle_ProgressBar,
  //公共素材模块
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}
  uSkinProgressBarType,

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinButtonType, StdCtrls,
  uSkinPanelType;

type
  TFrameItemGrid_MultiColorProgressBarColumn = class(TFrame)
    pnlClient: TSkinWinPanel;
    lblCaption: TLabel;
    gridData: TSkinWinItemGrid;
    SkinWinButton1: TSkinWinButton;
    procedure gridDataResize(Sender: TObject);
    procedure gridDataPrepareDrawItem(Sender: TObject; ACanvas: TDrawCanvas;
      AItem: TBaseSkinItem; AItemDrawRect: TRect);
    procedure gridDataCustomPaintCellBegin(ACanvas: TDrawCanvas;
      ARowIndex: Integer; ARow: TBaseSkinItem; ARowDrawRect: TRectF;
      AColumn: TSkinVirtualGridColumn; AColumnIndex: Integer;
      ACellDrawRect: TRectF; ARowEffectStates: TDPEffectStates;
      ASkinVirtualGridMaterial: TSkinVirtualGridDefaultMaterial;
      ADrawColumnMaterial: TSkinVirtualGridColumnMaterial;
      ASkinItemColDesignerPanel: TSkinItemDesignerPanel;
      const ADrawRect: TRectF; AVirtualGridPaintData: TPaintData);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

constructor TFrameItemGrid_MultiColorProgressBarColumn.Create(
  AOwner: TComponent);
begin
  inherited;

  Self.gridData.ColumnHeader.Material.IsTransparent:=False;
  Self.gridData.ColumnHeader.Material.BackColor.Color:=$00F7F2EE;
  Self.gridData.ColumnHeader.Material.BackColor.IsFill:=True;

  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontSize:=12;
  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontVertAlign:=fvaCenter;
  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.DrawRectSetting.Enabled:=True;
  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.DrawRectSetting.SizeType:=TDPSizeType.dpstPixel;
  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.DrawRectSetting.Left:=10;
//  Self.gridData.ColumnHeader.Material.DrawItemCaptionParam.FontHorzAlign:=fhaCenter;


end;

procedure TFrameItemGrid_MultiColorProgressBarColumn.gridDataCustomPaintCellBegin(
  ACanvas: TDrawCanvas; ARowIndex: Integer; ARow: TBaseSkinItem;
  ARowDrawRect: TRectF; AColumn: TSkinVirtualGridColumn; AColumnIndex: Integer;
  ACellDrawRect: TRectF; ARowEffectStates: TDPEffectStates;
  ASkinVirtualGridMaterial: TSkinVirtualGridDefaultMaterial;
  ADrawColumnMaterial: TSkinVirtualGridColumnMaterial;
  ASkinItemColDesignerPanel: TSkinItemDesignerPanel; const ADrawRect: TRectF;
  AVirtualGridPaintData: TPaintData);
const
  PROGRESSBAR_COLORS:array [0..3] of integer=($00F57C72,$00D1AF39,$0000BCFF,$007C5CFA);
begin
  //自定义进度条的颜色
  if AColumn.GetBindItemFieldName='ItemDetail1' then
  begin
    if ASkinItemColDesignerPanel<>nil then
    begin
      //TFrameListItemStyle_ProgressBar(ASkinItemColDesignerPanel.Parent).SkinWinProgressBar1.Prop.StaticPosition:=20;
      TSkinProgressBarColorMaterial(TFrameListItemStyle_ProgressBar(ASkinItemColDesignerPanel.Parent).SkinWinProgressBar1.SelfOwnMaterial).ForeColor.FillColor.FColor:=PROGRESSBAR_COLORS[ARowIndex mod 4];
    end;
  end;
end;

procedure TFrameItemGrid_MultiColorProgressBarColumn.gridDataPrepareDrawItem(
  Sender: TObject; ACanvas: TDrawCanvas; AItem: TBaseSkinItem;
  AItemDrawRect: TRect);
begin
  //



end;

procedure TFrameItemGrid_MultiColorProgressBarColumn.gridDataResize(
  Sender: TObject);
begin
  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);

end;

end.
