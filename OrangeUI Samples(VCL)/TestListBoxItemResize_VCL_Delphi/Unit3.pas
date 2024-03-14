//convert pas to utf8 by ¥
unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uSkinItemGridType,uSkinListBoxType,uSkinScrollControlType,uSkinScrollBarType,
  uGraphicCommon,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm3 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FListBox:TSkinListBox;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

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
  FListBox.Prop.VertScrollBarShowType:=sbstAlwaysCoverShow;
//  FListBox.Prop.FCanVertResize:=True;

//  //test resize item width
//  FListBox.Prop.FCanResizeItemWidth:=True;
//  FListBox.Prop.ItemLayoutType:=iltHorizontal;
//  FListBox.Prop.ItemWidth:=100;
//  FListBox.Material.DrawItemDevideParam.IsFill:=True;




  //test resize item height
  FListBox.Prop.FCanResizeItemHeight:=True;
  FListBox.Prop.ItemLayoutType:=iltVertical;
  FListBox.Material.DrawItemDevideParam.IsFill:=True;





  FListBox.Prop.Items.BeginUpdate;
  try
    for I := 0 to 100 do
    begin
      AListBoxItem:=FListBox.Prop.Items.Add;

      AListBoxItem.Caption:='Item'+IntToStr(I)+'Caption';
      AListBoxItem.Detail:='Item'+IntToStr(I)+'1Detail';
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
  FListBox.Prop.Items[0].FCanResizeHeight:=False;




end;

end.
