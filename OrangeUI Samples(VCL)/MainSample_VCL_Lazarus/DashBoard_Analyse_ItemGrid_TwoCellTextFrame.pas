//convert pas to utf8 by ¥
unit DashBoard_Analyse_ItemGrid_TwoCellTextFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  uDrawParam,
  uDrawTextParam,

  //公共素材模块
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinPanelType, StdCtrls,
  uSkinButtonType;

type
  TFrameItemGrid_TwoCellText = class(TFrame)
    gridData: TSkinWinItemGrid;
    pnlClient: TSkinWinPanel;
    lblCaption: TLabel;
    SkinWinButton1: TSkinWinButton;
    procedure gridDataResize(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameItemGrid_TwoCellText.gridDataResize(Sender: TObject);
begin
  //Self.Color:=clDefault;
  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);
end;

constructor TFrameItemGrid_TwoCellText.Create(AOwner:TComponent);
begin
  Inherited;



end;

end.
