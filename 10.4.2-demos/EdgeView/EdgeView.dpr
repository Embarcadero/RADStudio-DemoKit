program EdgeView;

uses
  Vcl.Forms,
  EdgeMain in 'EdgeMain.pas' {EdgeViewForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TEdgeViewForm, EdgeViewForm);
  Application.Run;
end.
