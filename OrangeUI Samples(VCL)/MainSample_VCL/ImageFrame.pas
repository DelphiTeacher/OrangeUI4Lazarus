unit ImageFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl,

  //�����ز�ģ��
  EasyServiceCommonMaterialDataMoudle_VCL,

  uSkinImageType, uSkinButtonType;

type
  TFrameImage = class(TFrame)
    SkinWinButton23: TSkinWinButton;
    SkinWinButton27: TSkinWinButton;
    SkinWinButton1: TSkinWinButton;
    SkinWinButton2: TSkinWinButton;
    btnGroup: TSkinWinButton;
    SkinWinButton3: TSkinWinButton;
    SkinWinButton4: TSkinWinButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
