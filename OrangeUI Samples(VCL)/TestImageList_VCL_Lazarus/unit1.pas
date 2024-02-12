unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uSkinImageList,
  uSkinImageType;

type

  { TForm1 }

  TForm1 = class(TForm)
    SkinImage1: TSkinImage;
    SkinImage2: TSkinImage;
    SkinImageList1: TSkinImageList;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  //SkinImageList1.PictureList.Clear;
  //SkinImageList1.PictureList.Add.FDrawPicture.LoadFromFile('D:\MyFiles\OrangeUI Samples(VCL) - New\TestImageList_VCL_Lazarus\sb.jpg');
  //
  //SkinImage1.Prop.Picture.SkinImageList:=SkinImageList1;
  //SkinImage1.Prop.Picture.ImageIndex:=0;
end;

end.

