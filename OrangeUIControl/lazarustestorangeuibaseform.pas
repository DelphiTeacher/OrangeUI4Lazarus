unit LazarusTestOrangeUIBaseForm;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  uSkinLabelType,
  uSkinButtonType,
  uDrawEngine,
  uDrawCanvas,
  uDrawTextParam,
  uGraphicCommon,
  uFileCommon, uFuncCommon, uTestOrangeUIBase;

type
  TMyObject = class;
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
  private
    FLabel:TSkinLabel;
    FButton:TSkinButton;
    procedure DoButtonClick(Sender:TObject);
  public

  end;


  TMyObject = class
    FMember:Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

  FLabel:=TSkinLabel.Create(Self);
  FLabel.Caption:='Label';
  FLabel.Parent:=Self.Panel1;
  //背景透明
  FLabel.Material.IsTransparent:=True;
  FLabel.Material.BackColor.IsFill:=False;


  FButton:=TSkinButton.Create(Self);
  FButton.Caption:='Button';
  FButton.Parent:=Self.Panel1;
  FButton.Left:=200;
  //背景透明
  FButton.Material.IsTransparent:=True;
  FButton.Material.BackColor.IsFill:=False;




  //   {$IFDEF FPC}
  //   ShowMessage('Lazarus');
  //   {$ENDIF}
  //ShowMessage(GetApplicationPath);
  Test(Self.Memo1.Lines);
  //Self.Color:=clRed;
  Button1.OnClick := DoButtonClick;



end;

procedure TForm1.Panel1Paint(Sender: TObject);
var
  ADrawCanvas:TDrawCanvas;
  ADrawTextParam:TDrawTextParam;
begin
//  //显示不出来
//  ADrawCanvas:=CreateDrawCanvas('');
//  ADrawTextParam:=TDrawTextParam.Create('','');
//  ADrawCanvas.Prepare(Panel1.Canvas);
//
////  ACanvas.DrawText(Self.GetSkinMaterial.FDrawCaptionParam,
//////                        Self.FSkinLabelIntf.Prop.FPrefix+
////                    GetDrawCaption,
////                    GetProcessedDrawRect(ADrawRect));
//
//  //GlobalIsUseDefaultFontFamily:=True;
//  ////如果为default则用GDI+显示不出来
//  //GlobalDefaultFontFamily:='微软雅黑';
//
//  ADrawCanvas.DrawText(ADrawTextParam,'Hello',RectF(100,20,200,80));
//
//
//  ADrawCanvas.Free;
//  ADrawTextParam.Free;
//

  //正常
  //Panel1.Canvas.TextOut(100,20,Panel1.Canvas.Font.Name );

end;

procedure TForm1.DoButtonClick(Sender: TObject);
begin
  ShowMessage('Clicked');
end;

end.

