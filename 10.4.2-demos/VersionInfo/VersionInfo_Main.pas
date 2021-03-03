unit VersionInfo_Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    lbVer: TListBoxItem;
    lbPlatform: TListBoxItem;
    lblPlatform: TLabel;
    ListBoxItem1: TListBoxItem;
    lblArchitecture: TLabel;
    ListBoxItem2: TListBoxItem;
    lblMajor: TLabel;
    ListBoxItem3: TListBoxItem;
    lblMinor: TLabel;
    ListBoxItem4: TListBoxItem;
    lblBuild: TLabel;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    lblCompiler: TLabel;
    ListBoxItem7: TListBoxItem;
    lblRTL: TLabel;
    ListBoxItem8: TListBoxItem;
    lblFMX: TLabel;
    Z: TListBoxItem;
    lblPointer: TLabel;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  TypInfo, System.Rtti;

procedure TForm2.FormCreate(Sender: TObject);
begin
  lbVer.Text := TOSVersion.ToString;
  lblPlatform.Text := TRttiEnumerationType.GetName( TOSVersion.Platform ).Remove(0,2);
  lblArchitecture.Text := TRttiEnumerationType.GetName( TOSVersion.Architecture ).Remove(0,2);
  lblMajor.Text := TOSVersion.Major.ToString;
  lblMinor.Text := TOSVersion.Minor.ToString;
  lblBuild.Text := TOSVersion.Build.ToString;

  lblCompiler.Text := CompilerVersion.ToString;
  lblRTL.Text := Format('%f',[RTLVersion]);
  lblFMX.Text := FireMonkeyVersion.ToString;
  lblPointer.Text := (8*SizeOf(Pointer)).ToString + '-bits';

end;

end.
