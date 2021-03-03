program LiveBindingCheckBoxes;

uses
  Vcl.Forms,
  LiveBindingsCheckBoxMain in 'LiveBindingsCheckBoxMain.pas' {Form1},
  LiveBindingsCheckBoxFrame in 'LiveBindingsCheckBoxFrame.pas' {Frame2: TFrame},
  LiveBindingsDataModule in 'LiveBindingsDataModule.pas' {DataModule3: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Blue');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
