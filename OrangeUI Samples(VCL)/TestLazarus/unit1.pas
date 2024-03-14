unit Unit1;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure DoButtonClick(Sender:TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.OnClick:=DoButtonClick;
end;

procedure TForm1.DoButtonClick(Sender: TObject);
begin
  ShowMessage('Hello Lazarus!');
end;

end.

