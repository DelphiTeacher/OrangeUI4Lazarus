unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uSkinListBoxType,
  uSkinTreeViewType, ListItemStyle_IconCaptionLeft_ArrowRight;

type

  { TForm1 }

  TForm1 = class(TForm)
    SkinTreeView1: TSkinTreeView;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
   ASkinTreeViewItem:TSkinTreeViewItem;
   AChildItem:TSkinTreeViewItem;
begin
  Self.SkinTreeView1.Prop.Items.Clear;

  Self.SkinTreeView1.Prop.Items.BeginUpdate;
  try

    ASkinTreeViewItem:=Self.SkinTreeView1.Prop.Items.Add;
    ASkinTreeViewItem.Caption:='父节点';
    //ASkinTreeViewItem.Icon.LoadFromFile('D:\MyFiles\OrangeUI Samples(VCL) - New\TestListBox_VCL_Lazarus\sb.jpg');

    AChildItem:=ASkinTreeViewItem.Childs.Add;
    AChildItem.Caption:='子节点';

    AChildItem:=ASkinTreeViewItem.Childs.Add;
    AChildItem.Caption:='子节点';



  finally
    Self.SkinTreeView1.Prop.Items.EndUpdate;
  end;
end;

end.

