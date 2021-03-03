program ManagedRecordsGUI;

uses
  System.StartUpCopy,
  FMX.Forms,
  ManagedRecordsUnit1 in 'ManagedRecordsUnit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
