program TestItemGrid_MultiColorProgressBarColumnFrame;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, TestItemGrid_MultiColorProgressBarColumnFrameForm,
  DashBoard_Analyse_ItemGrid_MutliColorProgressBarColumnFrame,
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus, ListItemStyle_ProgressBar
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

