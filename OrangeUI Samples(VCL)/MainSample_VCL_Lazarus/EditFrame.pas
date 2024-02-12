//convert pas to utf8 by ¥
unit EditFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,

  Graphics, Controls, Forms, Dialogs, uSkinWindowsEdit,
  StdCtrls;

type
  TFrameEdit = class(TFrame)
    Edit1: TEdit;
    SkinWinEdit1: TSkinWinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
