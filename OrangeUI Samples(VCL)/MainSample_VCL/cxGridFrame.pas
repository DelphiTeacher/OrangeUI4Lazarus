unit cxGridFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,

  //公共素材模块
  EasyServiceCommonMaterialDataMoudle_VCL,
  GridSwitchPage2Frame,
  BaseForm,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSkinWindowsControl,
  uSkinPanelType, uSkinButtonType, Vcl.StdCtrls, uSkinWindowsEdit, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, cxLabel, GridSwitchPageFrame;

type
  TFrameCxGrid = class(TFrame)
    pnlToolbar: TSkinWinPanel;
    btnNew: TSkinWinButton;
    SkinWinButton1: TSkinWinButton;
    SkinWinButton2: TSkinWinButton;
    btnSetting: TSkinWinButton;
    btnMore: TSkinWinButton;
    SkinWinButton3: TSkinWinButton;
    edtFilter: TSkinWinEdit;
    btnSearch: TSkinWinButton;
    pnlClient: TSkinWinPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DataSource1: TDataSource;
    FDTable1: TFDTable;
    FDConnection1: TFDConnection;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    FrameGridSwitchPage21: TFrameGridSwitchPage2;
    procedure cxGrid1Resize(Sender: TObject);
    procedure cxGrid1DBTableView1Column2CustomDrawHeader(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure btnNewClick(Sender: TObject);
  private
    FGridSwitchPage2Frame:TFrameGridSwitchPage2;
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  BaseQueryForm;

{ TFrameCxGrid }

procedure TFrameCxGrid.btnNewClick(Sender: TObject);
var
  AForm:TfrmBaseQuery;
begin
  AForm:=TfrmBaseQuery.Create(Application);
  AForm.Show;
end;

constructor TFrameCxGrid.Create(AOwner: TComponent);
begin
  inherited;
  Self.cxGrid1DBTableView1.OptionsView.GridLineColor:=clWhite;
  Self.cxGrid1DBTableView1.OptionsView.GridLines:=TcxGridLines.glNone;
  //记录下初始表格列宽

//  FGridSwitchPage2Frame:=TFrameGridSwitchPage2.Create(Self);
//  FGridSwitchPage2Frame.Parent:=Self.pnlClient;
//  FGridSwitchPage2Frame.Align:=alBottom;
end;

procedure TFrameCxGrid.cxGrid1DBTableView1Column2CustomDrawHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  AViewInfo.Borders:=[];
end;

procedure TFrameCxGrid.cxGrid1Resize(Sender: TObject);
begin
  //自动调整表格列宽,填满控件

end;

end.
