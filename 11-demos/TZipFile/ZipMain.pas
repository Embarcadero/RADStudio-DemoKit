unit ZipMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, FMX.ListBox;

type
  TForm20 = class(TForm)
    lstFiles1: TListBox;
    edtPath: TEdit;
    Label1: TLabel;
    Button1: TButton;
    lblCompressed: TLabel;
    lblSize: TLabel;
    lblTempFile: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    var ZipFileName: String;
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.fmx}

uses IOUtils, System.Zip;

procedure TForm20.Button1Click(Sender: TObject);
begin
  lstFiles1.Clear;
  var files := TDirectory.GetFiles(edtPath.Text, '*.*', TSearchOption.soAllDirectories);
  var size: Integer := 0;
  if TFile.Exists(ZipFileName) then
    TFile.Delete(ZipFileName);
  lstFiles1.BeginUpdate;
  try
    for var i := 0 to pred(length(files)) do
    begin
      size := size + TFile.GetSize(files[i]);
      lstFiles1.Items.Add(TPath.GetFileName(files[i]));
    end;
  finally
    lstFiles1.EndUpdate;
  end;
  lblSize.Text := Format('%d bytes uncompressed', [size]);
  // Zips sub directories too
  TZipFile.ZipDirectoryContents( ZipFileName, edtPath.Text );

  lblTempFile.Text := ZipFileName;

  var ZipSize := TFile.GetSize(ZipFileName);
  var ZipValid: String;
  // New in 11.0 TZipFile.IsValid
  if TZipFile.IsValid(ZipFileName) then
    ZipValid := 'Valid'
  else
    ZipValid := 'Invalid';
  lblCompressed.Text := Format('%d bytes (%s) %f%%', [ZipSize, ZipValid, ZipSize/Size*100]);
end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TFile.Exists(ZipFileName) then
    TFile.Delete(ZipFileName);
end;

procedure TForm20.FormCreate(Sender: TObject);
begin
  ZipFileName := TPath.Combine(TPath.GetTempPath, 'TestZip.zip');
end;

end.
