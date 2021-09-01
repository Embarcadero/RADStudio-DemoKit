program RADZipper_Delphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  ZipMain in 'ZipMain.pas' {Form20};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
