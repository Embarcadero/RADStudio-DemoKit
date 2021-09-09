program Wsl2Gui;

uses
  System.StartUpCopy,
  FMX.Forms,
  Wsl2GuiMain in 'Wsl2GuiMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
