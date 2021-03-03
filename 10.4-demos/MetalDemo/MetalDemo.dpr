program MetalDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  MetalDemoUnit1 in 'MetalDemoUnit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
