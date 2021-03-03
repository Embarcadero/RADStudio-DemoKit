program Per_Control_Styles_Colorful;

uses
  Vcl.Forms,
  Colorful_Main1 in 'Colorful_Main1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
