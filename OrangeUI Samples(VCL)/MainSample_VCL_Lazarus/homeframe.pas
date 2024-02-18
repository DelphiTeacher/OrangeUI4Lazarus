unit HomeFrame;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, uSkinListViewType;

type

  { TFrameHome }

  TFrameHome = class(TFrame)
    SkinListView1: TSkinListView;
  private

  public

  end;

implementation

{$R *.lfm}

end.

