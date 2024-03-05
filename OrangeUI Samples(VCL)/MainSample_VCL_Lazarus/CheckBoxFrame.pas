//convert pas to utf8 by ¥
unit CheckBoxFrame;

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
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  uSkinWindowsControl, uSkinCheckBoxType, uSkinMaterial;

type
  TFrameCheckBox = class(TFrame)
    SkinWinCheckBox2: TSkinWinCheckBox;
    SkinWinCheckBox3: TSkinWinCheckBox;
    SkinWinCheckBox5: TSkinWinCheckBox;
    SkinWinCheckBox6: TSkinWinCheckBox;
    chkRightFillRectCheckBoxMaterial: TSkinCheckBoxDefaultMaterial;
    SkinWinCheckBox1: TSkinWinCheckBox;
    SkinWinCheckBox4: TSkinWinCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
