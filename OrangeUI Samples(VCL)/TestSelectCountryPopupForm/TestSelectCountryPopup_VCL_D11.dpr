program TestSelectCountryPopup_VCL_D11;

uses
  Vcl.Forms,
  uCountryData in '..\..\OrangeProjectCommon\uCountryData.pas',
  SelectPopupForm in '..\..\OrangeProjectCommon\PopupForm_VCL\SelectPopupForm.pas' {frmSelectPopup},
  SelectCountryPopupForm in '..\..\OrangeProjectCommon\PopupForm_VCL\SelectCountryPopupForm.pas' {frmSelectCountryPopup},
  ListItemStyle_CheckBoxIconLeft_CaptionRight in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_CheckBoxIconLeft_CaptionRight.pas',
  EasyServiceCommonMaterialDataMoudle_VCL in '..\..\OrangeProjectCommon\EasyServiceCommonMaterialDataMoudle_VCL.pas' {dmEasyServiceCommonMaterial: TDataModule},
  ListItemStyle_VertSelectedGray_CaptionLeft in '..\..\OrangeProjectCommon\OrangeUIStyles_VCL\ListItemStyle_VertSelectedGray_CaptionLeft.pas',
  Unit5 in 'Unit5.pas' {Form5},
  uSelectCountryComboBoxFrame in '..\..\OrangeProjectCommon\VCLFrames\uSelectCountryComboBoxFrame.pas',
  XSuperJSON in '..\..\OrangeProjectCommon\XSuperObjectNew\XSuperJSON.pas',
  XSuperObject in '..\..\OrangeProjectCommon\XSuperObjectNew\XSuperObject.pas',
  uSkinItemJsonHelper in '..\..\OrangeProjectCommon\uSkinItemJsonHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmEasyServiceCommonMaterial, dmEasyServiceCommonMaterial);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
