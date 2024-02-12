unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, uSkinCheckBoxType, EasyServiceCommonMaterialDataMoudle_VCL_Lazarus;

type

  { TForm1 }

  TForm1 = class(TForm)
    chkDefaultCheckBoxMaterial: TSkinCheckBoxDefaultMaterial;
    chkDefaultFillRectCheckBoxMaterial: TSkinCheckBoxDefaultMaterial;
    chkDefaultRectCheckBoxMaterial: TSkinCheckBoxDefaultMaterial;
    chkHookMaterial: TSkinCheckBoxDefaultMaterial;
    SkinWinCheckBox2: TSkinWinCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
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

end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  Canvas.TextOut(0,0,'Hello world!');
end;

end.

