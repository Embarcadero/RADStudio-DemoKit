program ScaledGraphicDrawer_Demo;

uses
  Vcl.Forms,
  ScaledGraphicDrawer_MainUnit in 'ScaledGraphicDrawer_MainUnit.pas' {ScaledGraphicDrawer_MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutDOwn := True;
  Application.CreateForm(TScaledGraphicDrawer_MainForm, ScaledGraphicDrawer_MainForm);
  Application.Run;
end.
