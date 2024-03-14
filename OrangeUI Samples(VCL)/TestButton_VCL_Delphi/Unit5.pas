unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl, uSkinButtonType,
  uSkinLabelType, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListViewType, uGraphicCommon;

type
  TForm5 = class(TForm)
    SkinButton1: TSkinButton;
    SkinLabel1: TSkinLabel;
    SkinListView1: TSkinListView;
    SkinTheme1: TSkinTheme;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

end.
