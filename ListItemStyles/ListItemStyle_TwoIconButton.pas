unit ListItemStyle_TwoIconButton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  uSkinCustomListType,
  EasyServiceCommonMaterialDataMoudle_VCL,
  Graphics, Controls, Forms, Dialogs, uSkinWindowsControl,
  uSkinItemDesignerPanelType, uSkinLabelType, uSkinButtonType, uSkinPanelType,
  uSkinMaterial;

type
  TFrameListItemStyle_TwoIconButton = class(TFrame,IFrameBaseListItemStyle)
    SkinWinItemDesignerPanel1: TSkinWinItemDesignerPanel;
    pnlButtons: TSkinWinPanel;
    btnButton1: TSkinWinButton;
    btnButton2: TSkinWinButton;
    procedure SkinWinItemDesignerPanel1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetItemDesignerPanel:TSkinItemDesignerPanel;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameListItemStyle_TwoIconButton }

function TFrameListItemStyle_TwoIconButton.GetItemDesignerPanel: TSkinItemDesignerPanel;
begin
  Result:=SkinWinItemDesignerPanel1;
end;

procedure TFrameListItemStyle_TwoIconButton.SkinWinItemDesignerPanel1Resize(
  Sender: TObject);
begin
  pnlButtons.Left:=(Self.SkinWinItemDesignerPanel1.Width-pnlButtons.Width) div 2;
  pnlButtons.Top:=(Self.SkinWinItemDesignerPanel1.Height-pnlButtons.Height) div 2;
end;

initialization
  RegisterListItemStyle('TwoIconButton',TFrameListItemStyle_TwoIconButton);


finalization
  UnRegisterListItemStyle(TFrameListItemStyle_TwoIconButton);

end.
