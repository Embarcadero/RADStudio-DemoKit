unit ImageIndex_ImageName_MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TImageIndex_ImageName_MainForm = class(TForm)
    Button1: TButton;
    ImageCollection1: TImageCollection;
    SmallVirtualImageList: TVirtualImageList;
    LargeVirtualImageList: TVirtualImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StatusBar1: TStatusBar;
    ListView1: TListView;
    SearchBox1: TSearchBox;
    Panel1: TPanel;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Label1: TLabel;
    ImageIndex_ImageName_MainForm: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
    procedure SearchBox1Change(Sender: TObject);
    procedure BitBtn1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BitBtn1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SearchBox1Exit(Sender: TObject);
  private
    procedure UpdateCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImageIndex_ImageName_MainForm: TImageIndex_ImageName_MainForm;

implementation

{$R *.dfm}

procedure TImageIndex_ImageName_MainForm.BitBtn1DragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  if Source = ListView1 then
  begin
    if Sender is TCustomButton then
      (Sender as TCustomButton).ImageName := ListView1.Selected.Caption
    else if sender is TToolButton then
      (sender as TToolButton).ImageName := ListView1.Selected.Caption
  end;
end;

procedure TImageIndex_ImageName_MainForm.BitBtn1DragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = ListView1;
end;

procedure TImageIndex_ImageName_MainForm.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  UpdateCaption;
end;

procedure TImageIndex_ImageName_MainForm.UpdateCaption;
begin
  Self.Caption := 'ImageIndex + ImageName property - Demo - DPI: ' + IntToStr(Round(Self.ScaleFactor * 100)) + '%';
end;

procedure TImageIndex_ImageName_MainForm.FormCreate(Sender: TObject);
begin
  UpdateCaption;
  for var i := 0 to LargeVirtualImageList.Count - 1 do
  begin
    var itm := ListView1.Items.Add;
    itm.Caption := LargeVirtualImageList.Images[i].Name;
    itm.ImageIndex := i;
  end;
end;

procedure TImageIndex_ImageName_MainForm.SearchBox1Change(Sender: TObject);
begin
  for var i := 0 to ListView1.Items.count-1 do
  begin
    if ListView1.Items[i].Caption.Contains(SearchBox1.Text) then
    begin
      ListView1.ItemIndex := i;
      ListView1.Items[i].MakeVisible(False);
      break;
    end;
  end;
end;

procedure TImageIndex_ImageName_MainForm.SearchBox1Exit(Sender: TObject);
begin
  SearchBox1.Clear;
end;

procedure TImageIndex_ImageName_MainForm.SpeedButton2Click(Sender: TObject);
var
  ImageName: String;
begin
  ListView1.ItemIndex := -1;

  if Sender is TCustomButton then
    ImageName := (Sender as TCustomButton).ImageName
  else if sender is TToolButton then
    ImageName := (Sender as TToolButton).ImageName
  else if sender is TCustomSpeedButton then
    ImageName := (Sender as TSpeedButton).ImageName
  else raise Exception.Create('Unsupport button type: ' + Sender.ClassName);


  ListView1.ItemIndex := LargeVirtualImageList.GetIndexByName(ImageName);
  ListView1.Selected.MakeVisible(False);
end;

end.
