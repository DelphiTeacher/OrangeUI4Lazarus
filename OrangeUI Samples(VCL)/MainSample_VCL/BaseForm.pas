unit BaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  uGraphicCommon,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsForm, uSkinWindowsControl,
  uSkinPanelType;

type
  TfrmBase = class(TForm)
    fsdForm: TSkinWinForm;
    pnlClient: TSkinWinPanel;
    procedure fsdFormSyncSystemControls(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.dfm}

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  //高分屏处理
  Self.Padding.Top:=uGraphicCommon.ScreenScaleSizeInt(Self.Padding.Top);
  //高分屏处理
  fsdForm.FormSysIcon.Top:=uGraphicCommon.ScreenScaleSizeInt(fsdForm.FormSysIcon.Top);
  fsdForm.FormSysIcon.Height:=uGraphicCommon.ScreenScaleSizeInt(fsdForm.FormSysIcon.Height);
  fsdForm.FormSysIcon.Width:=uGraphicCommon.ScreenScaleSizeInt(fsdForm.FormSysIcon.Width);

  fsdForm.FormSysCaption.Top:=uGraphicCommon.ScreenScaleSizeInt(fsdForm.FormSysCaption.Top);
  fsdForm.FormSysCaption.Height:=uGraphicCommon.ScreenScaleSizeInt(fsdForm.FormSysCaption.Height);
  fsdForm.FormSysCaption.Left:=fsdForm.FormSysIcon.Left+fsdForm.FormSysIcon.Width+4;;
//  fsdForm.FormSysCaption.Hi
end;

procedure TfrmBase.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_SYSCOMMAND, $F011, 0);

end;

procedure TfrmBase.fsdFormSyncSystemControls(Sender: TObject);
begin
  fsdForm.CloseSysBtn.DirectUIVisible:=True;
  fsdForm.MaxRestoreSysBtn.DirectUIVisible:=True;
  fsdForm.MinSysBtn.DirectUIVisible:=True;


end;

end.
