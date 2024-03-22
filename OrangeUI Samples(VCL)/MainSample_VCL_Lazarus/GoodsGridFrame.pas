//convert pas to utf8 by ¥
//convert pas to utf8 by ¥

unit GoodsGridFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}
  Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, uDrawCanvas, uSkinItems,

  uDrawParam,
  uDrawTextParam,

  uSkinSuperObject,
  uSkinItemJsonHelper,


  //公共素材模块
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  Vcl.Imaging.jpeg,Vcl.Imaging.pngimage,
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualGridType, uSkinItemGridType, uSkinPanelType, StdCtrls,
  uSkinButtonType;

type
  TFrameGoodsGrid = class(TFrame)
    gridData: TSkinWinItemGrid;
    procedure gridDataResize(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameGoodsGrid.gridDataResize(Sender: TObject);
begin
  //Self.Color:=clDefault;

  //如果表格列是按比例的,那么每次拖动尺寸,都要重新计算
  Self.gridData.Prop.Columns.GetListLayoutsManager.DoItemSizeChange(nil);

end;

constructor TFrameGoodsGrid.Create(AOwner:TComponent);
var
  I:Integer;
  AGoodsJson:ISuperObject;
  AGoodsJsonArray:ISuperArray;
  ARow:TSkinJsonItemGridRow;
begin

  Inherited;


  //不允许鼠标按下拖动
//  Self.gridData.Prop.VertControlGestureManager.FIsEnableMouseDragScroll:=False;
//  Self.gridData.Prop.HorzControlGestureManager.FIsEnableMouseDragScroll:=False;



  AGoodsJsonArray:=SA();

  AGoodsJson:=SO();
  AGoodsJson.S['name']:='Book';
  AGoodsJson.F['price']:=100;
  AGoodsJson.F['count']:=10;
  AGoodsJson.F['amount']:=AGoodsJson.F['price']*AGoodsJson.F['count'];
  AGoodsJsonArray.O[AGoodsJsonArray.Length]:=AGoodsJson;

  //ShowMessage(AGoodsJson.AsJson);
  ////在Lazarus下面Contains无效
  //if AGoodsJson.Contains('price') then
  //begin
  //  ShowMessage('exist price');
  //end
  //else
  //begin
  //  ShowMessage('not exist price');
  //end;

  AGoodsJson:=SO();
  AGoodsJson.S['name']:='Pen';
  AGoodsJson.F['price']:=9;
  AGoodsJson.F['count']:=20;
  AGoodsJson.F['amount']:=AGoodsJson.F['price']*AGoodsJson.F['count'];
  AGoodsJsonArray.O[AGoodsJsonArray.Length]:=AGoodsJson;


  Self.gridData.Prop.Columns.BeginUpdate;
  try
    Self.gridData.Prop.Columns[0].BindItemFieldName:='';
    Self.gridData.Prop.Columns[1].BindItemFieldName:='name';
    Self.gridData.Prop.Columns[2].BindItemFieldName:='price';
    Self.gridData.Prop.Columns[3].BindItemFieldName:='count';
    Self.gridData.Prop.Columns[4].BindItemFieldName:='amount';

  finally
    Self.gridData.Prop.Columns.EndUpdate;
  end;


  Self.gridData.Prop.Items.BeginUpdate;
  try
    Self.gridData.Prop.Items.Clear;
    for I:=0 to AGoodsJsonArray.Length-1 do
    begin
      ARow:=TSkinJsonItemGridRow.Create(Self.gridData.Prop.Items);
      ARow.Json:=AGoodsJsonArray.O[I];
      //Self.gridData.Prop.Items.Add(ARow);
    end;

  finally
    Self.gridData.Prop.Items.EndUpdate;
  end;


end;



end.




















