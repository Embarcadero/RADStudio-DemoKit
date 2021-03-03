unit ControlListDemoFrm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ControlList,
  Vcl.VirtualImage, Vcl.ExtCtrls, Vcl.BaseImageCollection, Vcl.ImageCollection,
  Generics.Collections, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    ControlList1: TControlList;
    ListBox1: TListBox;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ImageCollection1: TImageCollection;
    Label1: TLabel;
    VirtualImage1: TVirtualImage;
    ControlListButton1: TControlListButton;
    Label2: TLabel;
    btnFirst: TSpeedButton;
    btnLast: TSpeedButton;
    procedure ControlList1BeforeDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
      ARect: TRect; AState: TOwnerDrawState);
    procedure ControlListButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
    procedure ControlList1EnableItem(const AIndex: Integer;
      var AEnabled: Boolean);
    procedure btnFirstClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
    FClickCount: TDictionary<Integer, Integer>;
    FDrawCount: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnFirstClick(Sender: TObject);
begin
  ControlList1.ItemIndex := 0;
end;

procedure TForm1.btnLastClick(Sender: TObject);
begin
  ControlList1.ItemIndex := ControlList1.ItemCount;
end;

procedure TForm1.ControlList1AfterDrawItems(ACanvas: TCanvas; ARect: TRect);
begin
  Inc(FDrawCount);
  ListBox1.Items.Add(Format('--- %3d ---',[FDrawCount]));
  ListBox1.Items.EndUpdate;
  ListBox1.ItemIndex := pred(ListBox1.Count);
  ListBox1.ItemIndex := -1;
end;

procedure TForm1.ControlList1BeforeDrawItem(AIndex: Integer; ACanvas: TCanvas;
  ARect: TRect; AState: TOwnerDrawState);
begin
  ListBox1.Items.Add(Format('Drawing #%d',[AIndex]));
  Label1.Caption := Format('Index: %d',[AIndex]);
  VirtualImage1.ImageIndex := AIndex mod ImageCollection1.Count;
  if FClickCount.ContainsKey(AIndex) then
  begin
    Label2.Caption := Format('Click count: %d',[FClickCount.Items[AIndex]]);
    Label2.Visible := True;
  end
  else
  begin
    Label2.Visible := False;
  end;
end;

procedure TForm1.ControlList1BeforeDrawItems(ACanvas: TCanvas; ARect: TRect);
begin
  ListBox1.Items.BeginUpdate;
end;

procedure TForm1.ControlList1EnableItem(const AIndex: Integer;
  var AEnabled: Boolean);
begin
  AEnabled := AIndex mod 10 <> 0;
end;

procedure TForm1.ControlListButton1Click(Sender: TObject);
begin
  var idx := ControlList1.ItemIndex;
  var cnt := 1;
  if FClickCount.ContainsKey(idx) then
    cnt := FClickCount.Items[idx] + 1;
  FClickCount.AddOrSetValue(idx, cnt);
  ControlList1.Refresh; // must repaint everything
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FClickCount := TDictionary<Integer, Integer>.Create;
  FDrawCount := 0;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FClickCount.Free;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  ListBox1.Clear;
  FDrawCount := 0;
  FClickCount.Clear;
  ControlList1.Refresh;
  ListBox1.ItemIndex := -1;
  Panel1.SetFocus;
end;

end.
