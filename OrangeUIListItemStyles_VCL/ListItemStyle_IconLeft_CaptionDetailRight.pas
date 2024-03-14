unit ListItemStyle_IconLeft_CaptionDetailRight;

interface

uses
  Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType;

type
  TFrameListItemStyle_IconLeft_CaptionDetailRight = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    imgItemIcon: TSkinWinImage;
    lblItemCaption: TSkinWinLabel;
    lblItemDetail: TSkinWinLabel;
    procedure ItemDesignerPanelResize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_IconLeft_CaptionDetailRight }

function TFrameListItemStyle_IconLeft_CaptionDetailRight.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


procedure TFrameListItemStyle_IconLeft_CaptionDetailRight.ItemDesignerPanelResize(
  Sender: TObject);
begin
//  imgItemIcon.Width:=imgItemIcon.Height;
  //»√Caption∫Õdetailæ”÷–
  Self.lblItemCaption.Top:=(Self.ItemDesignerPanel.Height-Self.lblItemCaption.Height-Self.lblItemDetail.Height) div 2;
  Self.lblItemDetail.Top:=Self.lblItemCaption.Top+Self.lblItemCaption.Height;
end;

initialization
  RegisterListItemStyle('IconLeft_CaptionDetailRight',TFrameListItemStyle_IconLeft_CaptionDetailRight);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_IconLeft_CaptionDetailRight);

end.
