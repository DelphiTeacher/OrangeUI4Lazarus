unit DelphiTestOrangeUIBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uTestOrangeUIBase,
  uSkinLabelType,
  uSkinGDIPlus,
  Vcl.ExtCtrls, Vcl.DBCtrls, uSkinWindowsControl, uSkinScrollControlType,
  uSkinCustomListType, uSkinVirtualListType, uSkinListBoxType;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    DBComboBox1: TDBComboBox;
    SkinListBox1: TSkinListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    FLabel:TSkinLabel;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLabel:=TSkinLabel.Create(Self);
  FLabel.Caption:='Hello';
  FLabel.Parent:=Self.Panel1;

  Test(Self.Memo1.Lines);
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  AGraphics:IGPGraphics;
  AGPBitmap:IGPBitmap;
begin
  //
  //Canvas.Draw(0,0,Self.SkinImage1.Properties.Picture.Graphic);

  AGraphics:=TGPGraphics.Create(Canvas.Handle);
  AGPBitmap:=TGPBitmap.Create('C:\Users\Administrator\Pictures\QQͼƬ20231218110743.jpg');
  AGraphics.DrawImage(AGPBitmap,0,0);
//                      TGPRectF_Create(0,0,AGPBitmap.Width,AGPBitmap.Height),
//                      0,0,AGPBitmap.Width,AGPBitmap.Height,
//                      UnitPixel,
//                      nil);

end;

end.
