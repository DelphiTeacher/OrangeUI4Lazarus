unit ListItemStyle_TreeHistoryMadicalList_Item;

interface

uses
  Messages, SysUtils, Variants, Classes,


  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,


  Graphics, Controls, Forms, Dialogs, uSkinButtonType,
  uSkinLabelType, uSkinWindowsControl, uSkinItemDesignerPanelType;

type
  TFrameListItemStyle_TreeHistoryMadicalList_Item = class(TFrame,IFrameBaseListItemStyle)
    swidpnlItem: TSkinWinItemDesignerPanel;
    swlblEndtime: TSkinWinLabel;
    swlblStarttime: TSkinWinLabel;
    swlblDiag: TSkinWinLabel;
    swlblDoctor: TSkinWinLabel;
    swlblroom: TSkinWinLabel;
    swlblZlh: TSkinWinLabel;
    swlblName: TSkinWinLabel;
    swbtnCopy: TSkinWinButton;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TreeHistoryMadicalList_Item }

function TFrameListItemStyle_TreeHistoryMadicalList_Item.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=swidpnlItem;
end;

initialization
  RegisterListItemStyle('TreeHistoryMadicalParentItem',TFrameListItemStyle_TreeHistoryMadicalList_Item);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TreeHistoryMadicalList_Item);


end.
