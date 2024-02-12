unit ListBoxFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDrawCanvas, uSkinItems,

  ListItemStyle_IconLeft_CaptionLeft,
  ListItemStyle_CheckBoxIconLeft_CaptionRight,
  EasyServiceCommonMaterialDataMoudle_VCL,

  uSkinWindowsControl, uSkinScrollControlType, uSkinCustomListType,
  uSkinVirtualListType, uSkinListBoxType, uSkinLabelType, uSkinPanelType;

type
  TFrameListBox = class(TFrame)
    lbMainMenu: TSkinWinListBox;
    lbContact: TSkinWinListBox;
    pnlSample1: TSkinWinPanel;
    SkinWinLabel1: TSkinWinLabel;
    SkinWinListBox1: TSkinWinListBox;
    pnlSample2: TSkinWinPanel;
    SkinWinLabel2: TSkinWinLabel;
    SkinWinListBox2: TSkinWinListBox;
    pnlSample3: TSkinWinPanel;
    SkinWinLabel3: TSkinWinLabel;
    SkinWinListBox3: TSkinWinListBox;  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
