program StringSetDemo;

uses
  Vcl.Forms,
  MainFormU in 'MainFormU.pas' {MainForm},
  SetOfStrU in 'SetOfStrU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
