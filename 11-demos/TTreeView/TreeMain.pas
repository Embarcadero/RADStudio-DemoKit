unit TreeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Vcl.VirtualImageList, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    TreeView1: TTreeView;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button2: TButton;
    lstLog: TListBox;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    FDMemTable1: TFDMemTable;
    FDMemTable1word: TStringField;
    Label1: TLabel;
    Button13: TButton;
    Button14: TButton;
    SpeedButton1: TSpeedButton;
    Button15: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure TreeViewCheckStateChanging(Sender: TCustomTreeView; Node: TTreeNode;
      NewCheckState, OldCheckState: TNodeCheckState; var AllowChange: Boolean);
    procedure TreeViewCheckStateChanged(Sender: TCustomTreeView; Node: TTreeNode;
      CheckState: TNodeCheckState);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Log(const Msg: string); overload;
    procedure Log(const Msg: string; const Args: array of const); overload;
    procedure AllowAllStyles;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Log(const Msg: string);
begin
  lstLog.ItemIndex := lstLog.Items.Add(Msg)
end;

procedure TForm2.Log(const Msg: string; const Args: array of const);
begin
  Log(Format(Msg, Args))
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  lstLog.Clear;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  TreeView1.Items.Clear;
  lstLog.Clear;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  FDmemTable1.Open;

  while fdMemTable1.RecordCount > 0 do
  begin
    FDMemTable1.RecNo := random(fdMemTable1.RecordCount);
    var randomWord := FDMemTable1.Fields[0].AsString;
    var randomNode: TTreeNode := nil;
    if TreeView1.Items.Count > 0 then
      randomNode := TreeView1.Items.Item[random(TreeView1.Items.Count)];
    case random(4) of
      0 : TreeView1.Items.AddChild(nil, randomWord);
      1..2 : TreeView1.Items.AddChild(randomNode, randomWord);
      3 : TreeView1.Items.Add(randomNode, randomWord);
    end;
    FDMemTable1.Delete;
  end;

end;

function CheckStateToStr(CheckState: TNodeCheckState): string;
begin
  case CheckState of
    ncsNone:      Result := 'N/A';
    ncsUnchecked: Result := 'unchecked';
    ncsChecked  : Result := 'checked';
    ncsPartial  : Result := 'partial';
    ncsDimmed   : Result := 'dimmed';
    ncsExclusion: Result := 'exclusion';
  end;
end;

procedure TForm2.TreeViewCheckStateChanged(Sender: TCustomTreeView; Node: TTreeNode; CheckState: TNodeCheckState);
begin
  Log('Node ''%s'' state changed to %s', [Node.Text, CheckStateToStr(CheckState)]);
end;

procedure TForm2.TreeViewCheckStateChanging(Sender: TCustomTreeView; Node: TTreeNode; NewCheckState,
  OldCheckState: TNodeCheckState; var AllowChange: Boolean);
begin
  Log('Node ''%s'' state changing: %s -> %s',
    [Node.Text, CheckStateToStr(OldCheckState), CheckStateToStr(NewCheckState)]);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  TreeView1.CheckBoxes := not TreeView1.CheckBoxes;
  if TreeView1.CheckBoxes then
    Log('CheckBoxes = True')
  else
    Log('CheckBoxes = False')
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  TreeView1.CheckStyles := [];
  Log('CheckStyles = []')
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  TreeView1.CheckStyles := [csPartial];
  Log('CheckStyles = [csPartial]')
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  TreeView1.CheckStyles := [csPartial, csDimmed];
  Log('CheckStyles = [csPartial, csDimmed]')
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  TreeView1.CheckStyles := [csPartial, csExclusion];
  Log('CheckStyles = [csPartial, csExclusion]')
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  TreeView1.CheckStyles := [csDimmed, csExclusion];
  Log('CheckStyles = [csDimmed, csExclusion]')
end;

procedure TForm2.AllowAllStyles;
begin
  TreeView1.CheckStyles := [csPartial, csDimmed, csExclusion];
  Log('CheckStyles = [csPartial, csDimmed, csExclusion]');
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  AllowAllStyles;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  TreeView1.Items[0].CheckState := ncsUnchecked
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  TreeView1.Items[0].CheckState := ncsChecked
end;

procedure TForm2.Button10Click(Sender: TObject);
begin
  TreeView1.Items[0].CheckState := ncsPartial
end;

procedure TForm2.Button11Click(Sender: TObject);
begin
  TreeView1.Items[0].CheckState := ncsDimmed
end;

procedure TForm2.Button12Click(Sender: TObject);
begin
  TreeView1.Items[0].CheckState := ncsExclusion
end;

procedure TForm2.Button13Click(Sender: TObject);
begin
  TreeView1.LockDrawing;
  try
    TreeView1.FullExpand;
    TreeView1.Items.GetFirstNode.MakeVisible;
  finally
    TreeView1.UnlockDrawing;
  end;
end;

procedure TForm2.Button14Click(Sender: TObject);
begin
  TreeView1.LockDrawing;
  try
    TreeView1.FullCollapse;
    TreeView1.Items.GetFirstNode.MakeVisible;
  finally
    TreeView1.UnlockDrawing;
  end;
end;

procedure TForm2.Button15Click(Sender: TObject);
begin
  AllowAllStyles;
  TreeView1.LockDrawing;
  lstLog.LockDrawing;
  try
    for var i := 0 to pred(TreeView1.Items.Count) do
    begin
      var state := Succ(TNodeCheckState(random(5)));
      TreeView1.Items[i].CheckState := state;
    end;
  finally
    TreeView1.UnlockDrawing;
    lstLog.UnlockDrawing;
  end;
end;

end.
