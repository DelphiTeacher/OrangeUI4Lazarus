unit ListItemStyle_Caption_CheckBoxRight_Selected;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, uSkinLabelType,
  uSkinImageType, uSkinWindowsControl, uSkinItemDesignerPanelType,
  ImgList, uDrawPicture, uSkinImageList, uSkinButtonType, Vcl.StdCtrls,
  uSkinCheckBoxType;

type
  TFrameListItemStyle_Caption_CheckBoxRight_Selected = class(TFrame,IFrameBaseListItemStyle)
    ItemDesignerPanel: TSkinWinItemDesignerPanel;
    lblItemCaption: TSkinWinLabel;
    chkItemSelected: TSkinWinCheckBox;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_Caption_CheckBoxRight_Selected }

function TFrameListItemStyle_Caption_CheckBoxRight_Selected.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=ItemDesignerPanel;
end;


initialization
  RegisterListItemStyle('Caption_CheckBoxRight_Selected',TFrameListItemStyle_Caption_CheckBoxRight_Selected);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_Caption_CheckBoxRight_Selected);

end.
