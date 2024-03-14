program TestGridSwitchPageFrame_VCL_D10_3;

uses
  Vcl.Forms,
  Unit8 in 'Unit8.pas' {Form8},
  GridSwitchPageFrame in '..\..\OrangeProjectCommon\VCLFrames_Lazarus\GridSwitchPageFrame.pas' {FrameGridSwitchPage: TFrame},
  uVCLSVGSupport in '..\..\OrangeProjectCommon\uVCLSVGSupport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
