program TreeCheck;

uses
  Vcl.Forms,
  TreeMain in 'TreeMain.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
