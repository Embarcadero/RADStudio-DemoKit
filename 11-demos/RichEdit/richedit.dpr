program richeditdemo;

uses
  Forms,
  reabout in 'reabout.pas' {AboutBox},
  remain in 'remain.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R richedit.RES}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.Title := 'Rich Edit Control Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
