program Messages_Demo;

uses
  Vcl.Forms,
  Messages_Demo_MainUnit in 'Messages_Demo_MainUnit.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TMessages_Demo_MainForm, Messages_Demo_MainForm);
  Application.Run;
end.
