﻿//convert pas to utf8 by ¥
unit EditGoodsFrame;

interface

uses
  Messages, SysUtils, Variants, Classes,

  {$IFDEF FPC}
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus,
  {$ELSE}
  EasyServiceCommonMaterialDataMoudle_VCL,
  {$ENDIF}
  uSkinListViewType,

  Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, uSkinPanelType, uSkinButtonType,
  uSkinWindowsControl;

type

  { TFrameEditGoods }

  TFrameEditGoods = class(TFrame)
    btnCancel: TSkinButton;
    btnSave: TSkinButton;
    cmbCategory: TComboBox;
    edtHeight: TEdit;
    edtLength: TEdit;
    edtName: TEdit;
    edtPrice: TEdit;
    edtWeight: TEdit;
    edtWidth: TEdit;
    lblCategory: TLabel;
    lblDate: TLabel;
    lblHeight: TLabel;
    lblLength: TLabel;
    lblMemo: TLabel;
    lblName: TLabel;
    lblPrice: TLabel;
    lblWeight: TLabel;
    lblWidth: TLabel;
    memMemo: TMemo;
    pnlClient: TPanel;
    pnlToolBar: TSkinPanel;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    FControlLayoutItems:TControlLayoutItems;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameEditGoods }

procedure TFrameEditGoods.FrameResize(Sender: TObject);
begin
  if FControlLayoutItems<>nil then
  begin
    //FControlLayoutItems.FListLayoutsManager.ControlWidth:=Self.Width;
    //FControlLayoutItems.FListLayoutsManager.ControlHeight:=Self.Height;
    //FControlLayoutItems.FListLayoutsManager.DoItemSizeChange(nil);
    FControlLayoutItems.AlignControls;
    //Height:=Ceil(FControlLayoutItems.FListLayoutsManager.CalcContentHeight);
  end;

end;

constructor TFrameEditGoods.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);



  //布局排列
  //能自动根据位置来生成排列
  FControlLayoutItems:=TControlLayoutItems.Create;
  FControlLayoutItems.Parent:=pnlClient;
  FControlLayoutItems.FListLayoutsManager.FIsStrictItemCountPerLine:=False;
  FControlLayoutItems.FListLayoutsManager.ItemWidth:=250;
  FControlLayoutItems.FListLayoutsManager.ItemHeight:=40;
  FControlLayoutItems.FListLayoutsManager.ItemSpace:=10;


  FControlLayoutItems.Add(lblName,edtName);

  FControlLayoutItems.Add(lblPrice,edtPrice);

  FControlLayoutItems.Add(lblCategory,cmbCategory);

//  FControlLayoutItems.Add(lblDate,dedtDate);

  FControlLayoutItems.Add(lblLength,edtLength);

  FControlLayoutItems.Add(lblWidth,edtWidth);

  FControlLayoutItems.Add(lblHeight, edtHeight);

  FControlLayoutItems.Add(lblWeight, edtWeight);

  FControlLayoutItems.Add(lblMemo, memMemo, -2, 60);




end;

destructor TFrameEditGoods.Destroy;
begin
  FreeAndNil(FControlLayoutItems);
  inherited Destroy;
end;

end.
