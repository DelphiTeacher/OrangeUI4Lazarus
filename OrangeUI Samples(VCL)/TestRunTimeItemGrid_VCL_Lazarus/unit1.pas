unit Unit1;

//{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,uSkinItemGridType,uSkinScrollControlType,uSkinScrollBarType;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public
    FItemGrid:TSkinItemGrid;
    FScrollBar:TSkinScrollBar;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  AColumn:TSkinItemGridColumn;
  AItem:TSkinItemGridRow;
  I: Integer;
begin

  //test Scroll bar
  FScrollBar:=TSkinScrollBar.Create(Self);
  FScrollBar.Parent:=Self;
  FScrollBar.Align:=alRight;

  Exit;


  FItemGrid:=TSkinItemGrid.Create(Self);
  FItemGrid.Parent:=Self;
  FItemGrid.Align:=alClient;
  FItemGrid.ColumnHeader.Material.BackColor.IsFill:=True;
  FItemGrid.ColumnHeader.Material.BackColor.FillColor.Color:=clWhite;

  //表头边框
  FItemGrid.ColumnHeader.Material.BackColor.BorderWidth:=1;
  FItemGrid.ColumnHeader.Material.BackColor.BorderColor.Color:=clSilver;

  FItemGrid.ColumnHeader.Material.DrawItemDevideParam.IsFill:=True;
  FItemGrid.ColumnHeader.Material.DrawItemDevideParam.FillColor.Color:=clSilver;
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

