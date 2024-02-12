unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls,
  ListItemStyle_TreeMainMenu_LabelAndArrow,
  ListItemStyle_Default,
  ListItemStyle_IconCaptionLeft_DetailRight,
  ListItemStyle_IconCaptionLeft_NotifyNumberRight,
  ListItemStyle_IconCaptionLeft_NotifyIconRight,
  ListItemStyle_IconCaptionLeft_ArrowRight,
  uSkinTreeViewType, uSkinImageType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    imgItemIcon: TSkinWinImage;
    lbSubMenu: TSkinWinTreeView;
    Panel1: TPanel;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

