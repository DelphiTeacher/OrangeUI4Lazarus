unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,

  //ListItemStyle_IconTop_CaptionDetailBottom,
  uGDIPlusDrawCanvas,
  uDrawPictureParam,

  uSkinListViewType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    lvData: TSkinWinListView;
    procedure Button1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
begin
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  AGDIPlusDrawCanvas:TGDIPlusDrawCanvas;
  ADrawPictureParam:TDrawPictureParam;
begin
  //ShowMessage(IntToStr(lvData.Prop.Items[0].Icon.Width));
  ////Canvas.Draw(0,0,TGraphic(lvData.Prop.Items[1].Icon.Graphic));
  //AGDIPlusDrawCanvas:=TGDIPlusDrawCanvas.Create();
  //AGDIPlusDrawCanvas.Prepare(Canvas);
  //ADrawPictureParam:=TDrawPictureParam.Create;
  //try
  //  AGDIPlusDrawCanvas.DrawSkinPicture(ADrawPictureParam,lvData.Prop.Items[1].Icon,RectF(),);
  //finally
  //  AGDIPlusDrawCanvas.Free;
  //  ADrawPictureParam.Free;
  //end;
end;

end.

