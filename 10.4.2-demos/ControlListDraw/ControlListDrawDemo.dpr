program ControlListDrawDemo;

uses
  Vcl.Forms,
  ControlListDemoFrm1 in 'ControlListDemoFrm1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
