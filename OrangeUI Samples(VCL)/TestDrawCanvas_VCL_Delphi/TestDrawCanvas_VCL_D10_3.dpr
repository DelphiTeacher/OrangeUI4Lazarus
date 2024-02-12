program TestDrawCanvas_VCL_D10_3;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  TestDrawCanvasFrame in 'TestDrawCanvasFrame.pas' {FrameTestDrawCanvas: TFrame},
  uNativeDrawCanvas in '..\..\OrangeUIControlNew\Source\VCL\NativeCanvas\uNativeDrawCanvas.pas',
  uSkinProgressBarType in '..\..\OrangeUIControlNew\Source\Controls\uSkinProgressBarType.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
