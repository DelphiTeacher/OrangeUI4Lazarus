program TestLineChart_VCL_D10_3;

uses
  Vcl.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  DashBoard_LineChart_WeekSummaryFrame in '..\MainSample_VCL_Lazarus\DashBoard_LineChart_WeekSummaryFrame.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
