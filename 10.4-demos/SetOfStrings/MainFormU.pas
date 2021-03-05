//---------------------------------------------------------------
// Demo written by Daniele Teti <d.teti@bittime.it>
//---------------------------------------------------------------
unit MainFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    btnSimple: TButton;
    Memo1: TMemo;
    btnAddSets: TButton;
    btnIn: TButton;
    btnIntersect: TButton;
    btnSubtract: TButton;
    procedure btnSimpleClick(Sender: TObject);
    procedure btnAddSetsClick(Sender: TObject);
    procedure btnIntersectClick(Sender: TObject);
    procedure btnInClick(Sender: TObject);
    procedure btnSubtractClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses SetOfStrU;

procedure TMainForm.btnInClick(Sender: TObject);
begin
  var Set1: SetOfStr := ['one','two','three'];
  Memo1.Clear;
  Memo1.Lines.Add(BoolToStr('one' in Set1, True));
  Memo1.Lines.Add(BoolToStr('two' in Set1, True));
  Memo1.Lines.Add(BoolToStr('four' in Set1, True));
end;

procedure TMainForm.btnIntersectClick(Sender: TObject);
begin
  var Set1: SetOfStr := ['one','two','three'];
  var Set2: SetOfStr := ['two','three','four'];
  Memo1.Lines.Text := (Set1 * Set2).ToString;
end;

procedure TMainForm.btnSimpleClick(Sender: TObject);
begin
  var Set1: SetOfStr := ['Hello','World','World'];
  var Set2 := Set1;
  Set1 := Set1 + 'NewValue';
  Memo1.Lines.Add('Set1 => ');
  Memo1.Lines.Add(Set1.ToString);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Set2 => ');
  Memo1.Lines.Add(Set2.ToString);
end;

procedure TMainForm.btnSubtractClick(Sender: TObject);
begin
  var Set1: SetOfStr := ['one','two','three','four'];
  var Set2: SetOfStr := ['two','four'];
  Memo1.Lines.Text := (Set1 - Set2).ToString;
end;

procedure TMainForm.btnAddSetsClick(Sender: TObject);
begin
  var Set2: SetOfStr := ['one','two','three'];
  var Set3: SetOfStr := ['two','three','four'];
  var Set4: SetOfStr := Set2 + Set3;
  Memo1.Lines.Text := Set4.ToString;
end;

end.
