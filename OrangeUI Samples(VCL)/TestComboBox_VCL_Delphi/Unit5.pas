unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  EasyServiceCommonMaterialDataMoudle_VCL,
  ListItemStyle_IconLeft_CaptionRight_CloseBtnRight,
  ListItemStyle_Caption_CheckBoxRight_Selected,
  uSkinCustomListType,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl, uSkinComboBoxType,
  Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    SkinComboBox1: TSkinComboBox;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure SkinComboBox1lvMultiSelectedItemsNewListItemStyleFrameCacheInit(
      Sender: TObject; AListItemTypeStyleSetting: TListItemTypeStyleSetting;
      ANewListItemStyleFrameCache: TListItemStyleFrameCache);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params:TCreateParams);override;

  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  with Params do
//  begin
////    if (Owner<>nil) and (Owner is TForm) then
////    begin
////      Params.WndParent:=TForm(Owner).Handle;
////    end;
//    // we cannot just use WS_POPUP style
//    // WS_THICKFRAME: without this the window cannot be resized and so aero snap, de-maximizing and minimizing won't work
//    // WS_SYSMENU: enables the context menu with the move, close, maximize, minize... commands (shift + right-click on the task bar item)
//    // WS_CAPTION: enables aero minimize animation/transition
//    // WS_MAXIMIZEBOX, WS_MINIMIZEBOX: enable minimize/maximize
////    enum class Style : DWORD {
////        windowed         = WS_OVERLAPPEDWINDOW | WS_THICKFRAME | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
////        aero_borderless  = WS_POPUP            | WS_THICKFRAME | WS_CAPTION | WS_SYSMENU | WS_MAXIMIZEBOX | WS_MINIMIZEBOX,
////        basic_borderless = WS_POPUP            | WS_THICKFRAME              | WS_SYSMENU | WS_MAXIMIZEBOX | WS_MINIMIZEBOX
////    };
//    Style:=WS_POPUP or WS_THICKFRAME;
//
//    ExStyle:=ExStyle or WS_EX_TOOLWINDOW;
//  end;

end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  //
  Self.SkinComboBox1.lvMultiSelectedItems.Prop.DefaultItemStyle:='IconLeft_CaptionRight_CloseBtnRight';
  Self.SkinComboBox1.lvPopupItems.Prop.DefaultItemStyle:='Caption_CheckBoxRight_Selected';
end;

procedure TForm5.SkinComboBox1lvMultiSelectedItemsNewListItemStyleFrameCacheInit(
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
