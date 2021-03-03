program Per_Control_Styles_HealthSystem;

uses
  Vcl.Forms,
  HealthSystem_Unit1 in 'HealthSystem_Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Flat UI Light');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
