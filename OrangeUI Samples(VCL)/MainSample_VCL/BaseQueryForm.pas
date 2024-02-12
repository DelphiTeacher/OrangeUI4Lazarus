unit BaseQueryForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  BaseQueryFrame,

  //¹«¹²ËØ²ÄÄ£¿é
  EasyServiceCommonMaterialDataMoudle_VCL,
  GridSwitchPage2Frame,
  BaseForm,
  uGraphicCommon,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsForm,
  uSkinWindowsControl, uSkinPanelType, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxLabel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, cxClasses,
  GridSwitchPageFrame, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, Vcl.StdCtrls, uSkinWindowsEdit,
  uSkinButtonType;

type
  TfrmBaseQuery = class(TfrmBase)
    procedure FormCreate(Sender: TObject);  private
    { Private declarations }
  public
    FcxGridFrame:TFrameBaseQuery;
    { Public declarations }
  end;

var
  frmBaseQuery: TfrmBaseQuery;

implementation

{$R *.dfm}

procedure TfrmBaseQuery.FormCreate(Sender: TObject);
begin
  inherited;

  //
  FcxGridFrame:=TFrameBaseQuery.Create(Self);
  FcxGridFrame.Align:=alClient;
  FcxGridFrame.Parent:=Self.pnlClient;
end;

end.
