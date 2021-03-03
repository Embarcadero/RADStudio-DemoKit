program ImageIndex_ImageName;

uses
  Vcl.Forms,
  ImageIndex_ImageName_MainUnit in 'ImageIndex_ImageName_MainUnit.pas' {ImageIndex_ImageName_MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TImageIndex_ImageName_MainForm, ImageIndex_ImageName_MainForm);
  Application.Run;
end.
