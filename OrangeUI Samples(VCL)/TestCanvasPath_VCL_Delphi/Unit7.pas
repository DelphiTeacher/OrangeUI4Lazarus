unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm7 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.PaintBox1Paint(Sender: TObject);
var
  APoints:array of TPoint;
  I: Integer;
begin
  //

  SetLength(APoints,3);
  APoints[0]:=Point(50,0);
  APoints[1]:=Point(0,50);
  APoints[2]:=Point(100,50);

  BeginPath(PaintBox1.Canvas.Handle);

  PaintBox1.Canvas.MoveTo(APoints[0].X,APoints[0].Y);

  for I := 1 to Length(APoints)-1 do
  begin
    PaintBox1.Canvas.LineTo(APoints[I].X,APoints[I].Y);
  end;

  PaintBox1.Canvas.Pen.Color:=clBlue;
  PaintBox1.Canvas.Pen.Style:=TPenStyle.psSolid;
  PaintBox1.Canvas.Pen.Width:=1;

  PaintBox1.Canvas.Brush.Color:=clYellow;
  PaintBox1.Canvas.Brush.Style:=TBrushStyle.bsSolid;

  EndPath(PaintBox1.Canvas.Handle);

  StrokeAndFillPath(PaintBox1.Canvas.Handle);
end;

end.
