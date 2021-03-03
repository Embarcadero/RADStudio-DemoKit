program VersionInfo;

uses
  System.StartUpCopy,
  FMX.Forms,
  VersionInfo_Main in 'VersionInfo_Main.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
