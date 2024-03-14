//convert pas to utf8 by ¥
unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  Math,
  ImgList,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSkinItemGridType,uSkinListBoxType,uSkinScrollControlType,uSkinScrollBarType,
  uGraphicCommon, CommCtrl, uSkinItems, uSkinCustomListType, uDrawCanvas, uComponentType,Types,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;



type
  TMyDragObject = class(TDragObjectEx)
  private
    FDragImages: TDragImageList;
    FImageControl: TWinControl;
  protected
    function GetDragImages: TDragImageList; override;
  public
    constructor Create(ImageControl: TWinControl);
    destructor Destroy; override;
  end;


  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Button1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Button2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Button2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    FDragObject: TDragObject;

  public
    FListItemDragObject: TDragObject;
    FListBox:TSkinListBox;
    procedure FListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FListBoxStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure FListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

constructor TMyDragObject.Create(ImageControl: TWinControl);
begin
  inherited Create;
  FImageControl := ImageControl;
end;

destructor TMyDragObject.Destroy;
begin
  FDragImages.Free;
  inherited;
end;

function TMyDragObject.GetDragImages: TDragImageList;
var
  Bmp: TBitmap;
  Pt: TPoint;
begin
  if not Assigned(FDragImages) then begin
    Bmp := TBitmap.Create;
    try
      Bmp.PixelFormat := pf32bit;
      Bmp.Canvas.Brush.Color := clFuchsia;

      // 2px margin at each side just to show image can have transparency.
      Bmp.Width := FImageControl.Width + 4;
      Bmp.Height := FImageControl.Height + 4;
      Bmp.Canvas.Lock;
      FImageControl.PaintTo(Bmp.Canvas.Handle, 2, 2);
      Bmp.Canvas.Unlock;

      FDragImages := TDragImageList.Create(nil);
      FDragImages.Width := Bmp.Width;
      FDragImages.Height := Bmp.Height;
      Pt := Mouse.CursorPos;
      MapWindowPoints(HWND_DESKTOP, FImageControl.Handle, Pt, 1);
      FDragImages.DragHotspot := Pt;
      FDragImages.Masked := True;
      FDragImages.AddMasked(Bmp, clFuchsia);
    finally
      Bmp.Free;
    end;
  end;
  Result := FDragImages;
end;


//--

procedure TForm3.Button1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=True;
end;

procedure TForm3.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TWinControl).BeginDrag(False);

  // OnStartDrag is called during the above call so FDragImages is
  // assigned now.
  // The below is the only difference with a normal drag image implementation.
  ImageList_SetDragCursorImage(
      (FDragObject as TMyDragObject).GetDragImages.Handle, 0, 0, 0);
end;

procedure TForm3.Button1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  //
//  FDragControlObject:=TDragControlObject.Create(Self.Button1);
//  DragObject:=FDragControlObject;
  DragObject := TMyDragObject.Create(Sender as TWinControl);
  DragObject.AlwaysShowDragImages := True;
  FDragObject := DragObject;
end;

procedure TForm3.Button2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  ShowMessage(Source.ClassName);
end;

procedure TForm3.Button2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=True;

end;

procedure TForm3.Button3Click(Sender: TObject);
var
  Bmp: TBitmap;
  Pt: TPoint;
  ADrawCanvas:TDrawCanvas;
  APaintData:TPaintData;
  FItem:TBaseSkinItem;
begin
  FItem:=Self.FListBox.Prop.Items[0];

  //paint item to bitmap
    Bmp := TBitmap.Create;
    try
      Bmp.PixelFormat := pf32bit;
      Bmp.Canvas.Brush.Color := clFuchsia;

      // 2px margin at each side just to show image can have transparency.
      Bmp.Width := Ceil(FListBox.Prop.CalcItemWidth(FItem)) + 4;
      Bmp.Height := Ceil(FListBox.Prop.CalcItemHeight(FItem)) + 4;

      ADrawCanvas:=CreateDrawCanvas('');
      ADrawCanvas.Prepare(Bmp.Canvas);
      Bmp.Canvas.Lock;
      //将Item绘制在bmp上面
      //.FItem.PaintTo(Bmp.Canvas.Handle, 2, 2);
//    //绘制Item
//    function PaintItem(ACanvas: TDrawCanvas;
//                        AItemIndex:Integer;
//                        AItem:TBaseSkinItem;
//                        AItemDrawRect:TRectF;
//                        ASkinMaterial:TSkinCustomListDefaultMaterial;
//                        const ADrawRect: TRectF;
//                        ACustomListPaintData:TPaintData
//                        ): Boolean;

      TSkinCustomListDefaultType(FListBox.SkinControlType).PaintItem(ADrawCanvas,
                                  FItem.Index,
                                  FItem,
                                  RectF(0,0,Bmp.Width-2,Bmp.Height-2),
                                  FListBox.Material,
                                  RectF(0,0,FListBox.Width,FListBox.Height),
                                  APaintData);


      Bmp.Canvas.Unlock;

//      Bmp.SaveToFile('D:\item.bmp');

      ADrawCanvas.UnPrepare;
      FreeAndNil(ADrawCanvas);

//      FDragImages := TDragImageList.Create(nil);
//      FDragImages.Width := Bmp.Width;
//      FDragImages.Height := Bmp.Height;
//      Pt := Mouse.CursorPos;
//      MapWindowPoints(HWND_DESKTOP, FListControl.Handle, Pt, 1);
//      FDragImages.DragHotspot := Pt;
//      FDragImages.Masked := True;
//      FDragImages.AddMasked(Bmp, clFuchsia);
    finally
      Bmp.Free;
    end;
//  end;
//  Result := FDragImages;

end;

procedure TForm3.FListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=True;
end;

procedure TForm3.FListBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TWinControl).BeginDrag(False);

  // OnStartDrag is called during the above call so FDragImages is
  // assigned now.
  // The below is the only difference with a normal drag image implementation.
  ImageList_SetDragCursorImage(
      (FListItemDragObject as TMyListItemDragObject).GetDragImages.Handle, 0, 0, 0);

end;

procedure TForm3.FListBoxStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  //
//  FDragControlObject:=TDragControlObject.Create(Self.Button1);
//  DragObject:=FDragControlObject;
  DragObject := TMyListItemDragObject.Create(Sender as TSkinCustomList,TSkinCustomList(Sender).Prop.MouseOverItem);
  DragObject.AlwaysShowDragImages := True;
  FListItemDragObject := DragObject;

end;

procedure TForm3.FormCreate(Sender: TObject);
var
  AColumn:TSkinItemGridColumn;
  AItem:TSkinItemGridRow;
  I: Integer;
  AListBoxItem:TSkinListBoxItem;
begin


//  FScrollBar:=TSkinScrollBar.Create(Self);
//  FScrollBar.Parent:=Self;
//  FScrollBar.Align:=alRight;


  FListBox:=TSkinListBox.Create(Self);
  FListBox.Parent:=Self;
  FListBox.Align:=alClient;
  FListBox.VertScrollBar.Prop.Position;
  FListBox.VertScrollBar.SkinControlType;

  FListBox.Prop.VertControlGestureManager.FIsEnableMouseDragScroll:=False;

  FListBox.Prop.VertScrollBarShowType:=sbstAlwaysCoverShow;

  FListBox.OnMouseDown:=Self.FListBoxMouseDown;
  FListBox.OnStartDrag:=Self.FListBoxStartDrag;
  FListBox.OnDragOver:=Self.FListBoxDragOver;
  FListBox.DragMode:=dmManual;
  FListBox.Material.DrawItemBackColorParam.IsFill:=True;
  FListBox.Material.DrawItemBackColorParam.FillColor.Color:=clWhite;
  FListBox.Material.DrawItemBackColorParam.FillColor.Alpha:=120;


//  FListBox.Prop.FCanVertResize:=True;

//  //test resize item width
//  FListBox.Prop.FCanResizeItemWidth:=True;
//  FListBox.Prop.ItemLayoutType:=iltHorizontal;
//  FListBox.Prop.ItemWidth:=100;
//  FListBox.Material.DrawItemDevideParam.IsFill:=True;




  //test resize item height
//  FListBox.Prop.FCanResizeItemHeight:=True;
//  FListBox.Prop.ItemLayoutType:=iltVertical;
//  FListBox.Material.DrawItemDevideParam.IsFill:=True;





  FListBox.Prop.Items.BeginUpdate;
  try
    for I := 0 to 100 do
    begin
      AListBoxItem:=FListBox.Prop.Items.Add;

      AListBoxItem.Caption:='Item'+IntToStr(I)+'Caption';
      AListBoxItem.Detail:='Item'+IntToStr(I)+'Detail';
      AListBoxItem.Detail1:='Item'+IntToStr(I)+'Detail1';
      AListBoxItem.Detail2:='Item'+IntToStr(I)+'Detail2';
      AListBoxItem.Detail3:='Item'+IntToStr(I)+'Detail3';
      AListBoxItem.Detail4:='Item'+IntToStr(I)+'Detail4';

    end;
  finally
    FListBox.Prop.Items.EndUpdate;
  end;




  //测试是否可以控制某个Item不允许改变尺寸
  //test specify item can not resize
//  FListBox.Prop.Items[0].FCanResizeWidth:=False;



  //测试是否可以控制某个Item不允许改变尺寸
  //test specify item can not resize
//  FListBox.Prop.Items[0].FCanResizeHeight:=False;




end;

procedure TForm3.FormDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=True;

end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  Self.FListBox.Invalidate;
end;


end.
