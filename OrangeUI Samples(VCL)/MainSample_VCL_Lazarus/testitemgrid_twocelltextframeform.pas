//convert pas to utf8 by ¥
unit TestItemGrid_TwoCellTextFrameForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DashBoard_Analyse_ItemGrid_TwoCellTextFrame;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private

  public
    FWinControl:TWinControl;
    FItemGrid_TwoCellTextFrame:TFrameItemGrid_TwoCellText;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FItemGrid_TwoCellTextFrame:=TFrameItemGrid_TwoCellText.Create(Self);
  FItemGrid_TwoCellTextFrame.Parent:=Self;

  //FItemGrid_TwoCellTextFrame.pnlClient.Material.BackColor.ShadowSize:=5;
  //{$IFDEF DELPHI}
  //FItemGrid_TwoCellTextFrame.Padding.SetBounds(0,10,0,-5);
  //{$ENDIF}

end;

end.

