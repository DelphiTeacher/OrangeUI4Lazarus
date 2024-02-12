program TestItemGrid_TwoCellText_VCL_Lazarus;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, TestItemGrid_TwoCellTextFrameForm,
  DashBoard_Analyse_ItemGrid_TwoCellTextFrame,
  EasyServiceCommonMaterialDataMoudle_VCL_Lazarus
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TdmEasyServiceCommonMaterial, dmEasyServiceCommonMaterial);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

