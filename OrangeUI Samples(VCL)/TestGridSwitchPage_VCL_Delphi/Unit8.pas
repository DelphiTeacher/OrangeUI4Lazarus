unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,

  GridSwitchPageFrame,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm8 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FGridSwitchPageFrame:TFrameGridSwitchPage;
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  FGridSwitchPageFrame.LoadFinished(StrToInt(Self.ComboBox1.Text));
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  FGridSwitchPageFrame:=TFrameGridSwitchPage.Create(Self);
  FGridSwitchPageFrame.Parent:=Self;
  FGridSwitchPageFrame.LoadFinished(0);
//  FGridSwitchPageFrame.LoadFinished(1000);
end;

end.
