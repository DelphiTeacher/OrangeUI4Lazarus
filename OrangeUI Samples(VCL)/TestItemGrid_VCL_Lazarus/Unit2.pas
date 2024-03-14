unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  GoodsGridFrame,
  OrderGridFrame,
  EditGridFrame,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
//    FGoodsGridFrame:TFrameGoodsGrid;
//    FOrderGridFrame:TFrameOrderGrid;
    FEditGridFrame:TFrameEditGrid;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
//  FGoodsGridFrame:=TFrameGoodsGrid.Create(Self);
//  FGoodsGridFrame.Parent:=Self;
//  FGoodsGridFrame.Align:=alClient;
//  Exit;
//  FOrderGridFrame:=TFrameOrderGrid.Create(Self);
//  FOrderGridFrame.Parent:=Self;
//  FOrderGridFrame.Align:=alClient;
//  Exit;

  FEditGridFrame:=TFrameEditGrid.Create(Self);
  FEditGridFrame.Parent:=Self;
  FEditGridFrame.Align:=alClient;


end;

end.
