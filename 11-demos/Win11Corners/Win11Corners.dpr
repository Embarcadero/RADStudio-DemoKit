program Win11Corners;

uses
  Vcl.Forms,
  Win11CornersMain in 'Win11CornersMain.pas' {Win11CornersForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TWin11CornersForm, Win11CornersForm);
  Application.Run;
end.
