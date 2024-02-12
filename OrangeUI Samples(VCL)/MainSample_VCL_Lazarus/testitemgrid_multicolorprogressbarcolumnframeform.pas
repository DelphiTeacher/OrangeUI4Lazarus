//convert pas to utf8 by ¥
//convert pas to utf8 by ¥
unit TestItemGrid_MultiColorProgressBarColumnFrameForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public
    FItemGrid_MultiColorProgressBarColumnFrame:TFrameItemGrid_MultiColorProgressBarColumn;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin


  FItemGrid_MultiColorProgressBarColumnFrame:=TFrameItemGrid_MultiColorProgressBarColumn.Create(Self);
  FItemGrid_MultiColorProgressBarColumnFrame.Name:='FItemGrid_MultiColorProgressBarColumnFrame';
  FItemGrid_MultiColorProgressBarColumnFrame.Parent:=Self;
  FItemGrid_MultiColorProgressBarColumnFrame.pnlClient.Material.BackColor.ShadowSize:=5;


end;

end.

