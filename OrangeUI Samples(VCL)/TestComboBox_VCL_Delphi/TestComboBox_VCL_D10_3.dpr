program TestComboBox_VCL_D10_3;

uses
  Vcl.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  EasyServiceCommonMaterialDataMoudle_VCL in '..\..\OrangeProjectCommon\EasyServiceCommonMaterialDataMoudle_VCL.pas' {dmEasyServiceCommonMaterial: TDataModule},
  uVCLSVGSupport in '..\..\OrangeProjectCommon\uVCLSVGSupport.pas',
  ListItemStyle_IconLeft_CaptionRight_CloseBtnRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_IconLeft_CaptionRight_CloseBtnRight.pas' {FrameListItemStyle_IconLeft_CaptionRight_CloseBtnRight: TFrame},
  ListItemStyle_Caption_CheckBoxRight_Selected in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_Caption_CheckBoxRight_Selected.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TdmEasyServiceCommonMaterial, dmEasyServiceCommonMaterial);
  Application.Run;
end.
