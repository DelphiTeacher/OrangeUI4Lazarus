//convert pas to utf8 by ¥
unit EditFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,

  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}

  Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFrameEdit = class(TFrame)
    Edit1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
