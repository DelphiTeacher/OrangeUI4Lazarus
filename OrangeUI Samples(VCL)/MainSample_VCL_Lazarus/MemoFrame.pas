//convert pas to utf8 by ¥
unit MemoFrame;

interface

uses
  {$IFDEF MSWINDOWS}
    Windows,
  {$ENDIF}

  Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,

  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,

  uSkinWindowsMemo;

type
  TFrameMemo = class(TFrame)
    SkinWinMemo1: TSkinWinMemo;
    Memo1: TMemo;
    SkinWinMemo2: TSkinWinMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
