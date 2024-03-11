//convert pas to utf8 by ¥
unit ComboBoxFrame;

interface

uses
    {$IFDEF MSWINDOWS}
      Windows,
    {$ENDIF}

    Messages, SysUtils, Variants, Classes,
  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}

  ListItemStyle_IconLeft_CaptionRight_CloseBtnRight,
  ListItemStyle_Caption_CheckBoxRight_Selected,
  uSkinCustomListType,

  Graphics, Controls, Forms, Dialogs, StdCtrls,
  uSkinWindowsControl, uSkinComboBoxType, uSkinMaterial;

type
  TFrameComboBox = class(TFrame)
    cmbTextAndMultiSelect: TSkinComboBox;
    cmbTextAndSingleSelect: TSkinComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbListAndSingleSelect: TSkinComboBox;
    Label4: TLabel;
    cmbListAndMultiSelect: TSkinComboBox;
    procedure cmbTextAndMultiSelectlvMultiSelectedItemsNewListItemStyleFrameCacheInit(
      Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameComboBox }

constructor TFrameComboBox.Create(AOwner: TComponent);
begin
  inherited;
  //
  Self.cmbListAndMultiSelect.lvMultiSelectedItems.Prop.DefaultItemStyle:='IconLeft_CaptionRight_CloseBtnRight';
  Self.cmbListAndMultiSelect.lvPopupItems.Prop.DefaultItemStyle:='Caption_CheckBoxRight_Selected';

  //
  Self.cmbListAndSingleSelect.lvMultiSelectedItems.Prop.DefaultItemStyle:='IconLeft_CaptionRight_CloseBtnRight';
  Self.cmbListAndSingleSelect.lvPopupItems.Prop.DefaultItemStyle:='Caption_CheckBoxRight_Selected';

end;

procedure TFrameComboBox.cmbTextAndMultiSelectlvMultiSelectedItemsNewListItemStyleFrameCacheInit(
  Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
  ANewListItemStyleFrameCache: TListItemStyleFrameCache);
var
  AFrame:TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight;
begin
  if ANewListItemStyleFrameCache.FItemStyleFrame is TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight then
  begin
    AFrame:=TFrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight(ANewListItemStyleFrameCache.FItemStyleFrame);
    AFrame.imgItemIcon.Visible:=False;

    AFrame.btnDelete.AlignWithMargins:=True;
    AFrame.btnDelete.Margins.Right:=10;

    AFrame.btnDelete.Width:=16;

    AFrame.ItemDesignerPanel.Material.IsTransparent:=False;

    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.DrawRectSetting.Enabled:=True;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.DrawRectSetting.SetBounds(0,3,0,0);
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.BorderWidth:=1;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.BorderColor.Color:=clSilver;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.FillColor.Color:=$EDEDED;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.IsFill:=True;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.IsRound:=True;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.RoundWidth:=2;
    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.RoundHeight:=2;
//    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.DrawEffectSetting.PushedEffect.EffectTypes:=[drpetIsFillChange,drpetFillColorChange];
//    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.DrawEffectSetting.PushedEffect.IsFill:=True;
//    AFrame.ItemDesignerPanel.Material.DrawBackColorParam.DrawEffectSetting.PushedEffect.FillColor.UseThemeColor:=TUseThemeColorType.ctThemeColor;
//
//    AFrame.imgItemCaption.Material.DrawCaptionParam.DrawEffectSetting.PushedEffect.EffectTypes:=[dtpetFontColorChange];
//    AFrame.imgItemCaption.Material.DrawCaptionParam.DrawEffectSetting.PushedEffect.FontColor.Color:=clWhite;

  end;

end;

end.
