program ManagedRecords_101;

uses
  Vcl.Forms,
  ManagedRecordsAssign_form in 'ManagedRecordsAssign_form.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
