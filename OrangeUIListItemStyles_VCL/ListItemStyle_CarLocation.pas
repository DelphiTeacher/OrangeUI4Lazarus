unit ListItemStyle_CarLocation;

interface

uses
  Messages, SysUtils, Variants, Classes,


  uSkinItems,
  uSkinVirtualListType,
  uSkinCustomListType,


  Graphics, Controls, Forms, Dialogs, uSkinButtonType,
  uSkinLabelType, uSkinWindowsControl, uSkinItemDesignerPanelType, uSkinMaterial,
  uSkinPanelType;

type
  TFrameListItemStyle_CarLocation = class(TFrame,IFrameBaseListItemStyle)
    swidpnlItem: TSkinWinItemDesignerPanel;
    lblLevel: TSkinWinLabel;
    lblWorkTime: TSkinWinLabel;
    swlblDoctor: TSkinWinLabel;
    lblAlreadyNumber: TSkinWinLabel;
    lblMoney: TSkinWinLabel;
    SkinWinLabel1: TSkinWinLabel;
    SkinWinLabel2: TSkinWinLabel;
    SkinWinPanel1: TSkinWinPanel;
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_CarLocation }

function TFrameListItemStyle_CarLocation.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=swidpnlItem;
end;

initialization
  RegisterListItemStyle('CarLocation',TFrameListItemStyle_CarLocation);

finalization
  UnRegisterListItemStyle(TFrameListItemStyle_CarLocation);


end.
