program DBGrid_DBNavigator_Demo;

uses
  Vcl.Forms,
  DBGrid_DBNavigator_MainUnit in 'DBGrid_DBNavigator_MainUnit.pas' {DBGrid_DBNavigator_Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBGrid_DBNavigator_Form1, DBGrid_DBNavigator_Form1);
  Application.Run;
end.
