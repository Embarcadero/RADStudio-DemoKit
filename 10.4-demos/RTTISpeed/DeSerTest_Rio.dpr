program DeSerTest_Rio;

uses
  Vcl.Forms,
  MainFormU in 'MainFormU.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
