program TestItemGrid_VCL_D10_3;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  GoodsGridFrame in '..\MainSample_VCL_Lazarus\GoodsGridFrame.pas' {FrameGoodsGrid: TFrame},
  uSkinItemJsonHelper in '..\..\OrangeProjectCommon\uSkinItemJsonHelper.pas',
  OrderGridFrame in '..\MainSample_VCL_Lazarus\OrderGridFrame.pas' {FrameOrderGrid: TFrame},
  ItemGrid_JsonItemEditFrame in '..\MainSample_VCL_Lazarus\ItemGrid_JsonItemEditFrame.pas' {FrameEditJsonItemGrid: TFrame},
  EasyServiceCommonMaterialDataMoudle_VCL in '..\..\OrangeProjectCommon\EasyServiceCommonMaterialDataMoudle_VCL.pas' {dmEasyServiceCommonMaterial: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmEasyServiceCommonMaterial, dmEasyServiceCommonMaterial);
  Application.Run;
end.
