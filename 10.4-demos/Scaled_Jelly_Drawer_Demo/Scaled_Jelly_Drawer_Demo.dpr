program Scaled_Jelly_Drawer_Demo;

uses
  Vcl.Forms,
  Scaled_Jelly_Drawer_MainUnit in 'Scaled_Jelly_Drawer_MainUnit.pas' {Scaled_Jelly_Drawer_MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutDown := True;
  Application.CreateForm(TScaled_Jelly_Drawer_MainForm, Scaled_Jelly_Drawer_MainForm);
  Application.Run;
end.
