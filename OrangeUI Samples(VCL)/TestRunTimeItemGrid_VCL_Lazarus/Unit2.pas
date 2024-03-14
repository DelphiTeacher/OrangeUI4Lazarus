unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSkinItemGridType,uSkinListBoxType,uSkinScrollControlType,uSkinScrollBarType,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure DBGrid1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    FItemGrid:TSkinItemGrid;
    FListBox:TSkinListBox;
    FScrollBar:TSkinScrollBar;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.DBGrid1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  //
end;

procedure TForm2.DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  //
end;

procedure TForm2.DBGrid1EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  //
end;

procedure TForm2.DBGrid1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  //
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  AColumn:TSkinItemGridColumn;
  AItem:TSkinItemGridRow;
  I: Integer;
  AListBoxItem:TSkinListBoxItem;
begin
  Exit;
//  FScrollBar:=TSkinScrollBar.Create(Self);
//  FScrollBar.Parent:=Self;
//  FScrollBar.Align:=alRight;


//  FListBox:=TSkinListBox.Create(Self);
//  FListBox.Parent:=Self;
//  FListBox.Align:=alClient;
//  FListBox.VertScrollBar.Prop.Position;
//  FListBox.VertScrollBar.SkinControlType;
//  FListBox.Prop.VertScrollBarShowType:=sbstAlwaysCoverShow;
//
//  FListBox.Prop.Items.BeginUpdate;
//  try
//    for I := 0 to 100 do
//    begin
//      AListBoxItem:=FListBox.Prop.Items.Add;
//
//      AListBoxItem.Caption:='Item'+IntToStr(I)+'Caption';
//      AListBoxItem.Detail:='Item'+IntToStr(I)+'1Detail';
//      AListBoxItem.Detail1:='Item'+IntToStr(I)+'Detail1';
//      AListBoxItem.Detail2:='Item'+IntToStr(I)+'Detail2';
//      AListBoxItem.Detail3:='Item'+IntToStr(I)+'Detail3';
//      AListBoxItem.Detail4:='Item'+IntToStr(I)+'Detail4';
//
//    end;
//  finally
//    FListBox.Prop.Items.EndUpdate;
//  end;
//





  FItemGrid:=TSkinItemGrid.Create(Self);
  FItemGrid.Parent:=Self;
  FItemGrid.Align:=alClient;
  FItemGrid.ColumnHeader.Material.BackColor.IsFill:=True;
  FItemGrid.ColumnHeader.Material.BackColor.FillColor.Color:=clWhite;

  //±íÍ·±ß¿ò
  FItemGrid.ColumnHeader.Material.BackColor.BorderWidth:=1;
  FItemGrid.ColumnHeader.Material.BackColor.BorderColor.Color:=clSilver;

  FItemGrid.ColumnHeader.Material.DrawItemDevideParam.IsFill:=True;
  FItemGrid.ColumnHeader.Material.DrawItemDevideParam.FillColor.Color:=clSilver;
//  FItemGrid.VertScrollBar;
  FItemGrid.Prop.VertScrollBarShowType:=sbstAlwaysCoverShow;



  FItemGrid.Prop.Columns.BeginUpdate;
  try
    AColumn:=FItemGrid.Prop.Columns.Add;
    AColumn.Caption:='Col1';
    AColumn.BindItemFieldName:='ItemCaption';

    AColumn:=FItemGrid.Prop.Columns.Add;
    AColumn.Caption:='Col2';
    AColumn.BindItemFieldName:='ItemDetail';


    AColumn:=FItemGrid.Prop.Columns.Add;
    AColumn.Caption:='Col3';
    AColumn.BindItemFieldName:='ItemDetail1';


    AColumn:=FItemGrid.Prop.Columns.Add;
    AColumn.Caption:='Col4';
    AColumn.BindItemFieldName:='ItemDetail2';


    AColumn:=FItemGrid.Prop.Columns.Add;
    AColumn.Caption:='Col5';
    AColumn.BindItemFieldName:='ItemDetail3';



  finally
    FItemGrid.Prop.Columns.EndUpdate;
  end;



  FItemGrid.Prop.Items.BeginUpdate;
  try
    for I := 0 to 100 do
    begin
      AItem:=FItemGrid.Prop.Items.Add;

      AItem.Caption:='Item'+IntToStr(I)+'Caption';
      AItem.Detail:='Item'+IntToStr(I)+'1Detail';
      AItem.Detail1:='Item'+IntToStr(I)+'Detail1';
      AItem.Detail2:='Item'+IntToStr(I)+'Detail2';
      AItem.Detail3:='Item'+IntToStr(I)+'Detail3';
      AItem.Detail4:='Item'+IntToStr(I)+'Detail4';
    end;


//    AItem:=FItemGrid.Prop.Items.Add;
//
//    AItem.Caption:='Item2Caption';
//    AItem.Detail:='Item2Detail';
//    AItem.Detail1:='Item2Detail1';
//    AItem.Detail2:='Item2Detail2';
//    AItem.Detail3:='Item2Detail3';
//    AItem.Detail4:='Item2Detail4';
//
//
//    AItem:=FItemGrid.Prop.Items.Add;
//
//    AItem.Caption:='Item3Caption';
//    AItem.Detail:='Item3Detail';
//    AItem.Detail1:='Item3Detail1';
//    AItem.Detail2:='Item3Detail2';
//    AItem.Detail3:='Item3Detail3';
//    AItem.Detail4:='Item3Detail4';
//

  finally
    FItemGrid.Prop.Items.EndUpdate;
  end;




end;

end.
