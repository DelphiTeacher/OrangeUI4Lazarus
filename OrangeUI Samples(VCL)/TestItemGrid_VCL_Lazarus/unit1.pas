unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, GoodsGridFrame;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public
    FGoodsGridFrame:TFrameGoodsGrid;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FGoodsGridFrame:=TFrameGoodsGrid.Create(Self);
  FGoodsGridFrame.Parent:=Self;
  FGoodsGridFrame.Align:=alClient;


end;

end.

