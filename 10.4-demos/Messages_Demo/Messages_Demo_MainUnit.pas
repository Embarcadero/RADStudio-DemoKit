unit Messages_Demo_MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Themes;

type
  TMessages_Demo_MainForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
  private
    procedure UpdateCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Messages_Demo_MainForm: TMessages_Demo_MainForm;

implementation

{$R *.dfm}

procedure TMessages_Demo_MainForm.Button1Click(Sender: TObject);
begin
  MessageDlg('What do you think of the custom buttom captions?',
    mtConfirmation, [mbYes, mbNo], -1, mbYes,
    ['Wow! Amazing', 'I can''t wait to use 10.4 Sydney!']);
end;

procedure TMessages_Demo_MainForm.Button2Click(Sender: TObject);
begin
  MessageDlg('The 12 buttons are in this order: '+sLineBreak+
    'mbYes, mbNo, mbOK, mbCancel, mbAbort, mbRetry, mbIgnore, mbAll, mbNoToAll, mbYesToAll, mbHelp, mbClose', mtInformation,
    [mbYes,mbNo,mbOK,mbCancel,mbAbort,mbRetry,mbIgnore,mbAll,mbNoToAll,mbYesToAll,mbHelp,mbClose], -1, mbClose,
    ['Yes,','you','can','use','and','change','the','captions','of','all','twelve','buttons!']);
end;

procedure TMessages_Demo_MainForm.Button3Click(Sender: TObject);
begin
  MessageDlg('Do you want to say "good-bye"?', mtConfirmation,
    [mbYes, mbNo], -1, mbYes,
    ['Parting is such sweet sorrow!', 'Until we meet again!', 'Extra captions are ignored!']);
end;

procedure TMessages_Demo_MainForm.Button4Click(Sender: TObject);
begin
  MessageDlg('Warning message test?', mtWarning, [mbYes, mbOK], -1, mbOK,
    ['Only this first button is changed!']);
end;

procedure TMessages_Demo_MainForm.ComboBox1Change(Sender: TObject);
begin
  TStyleManager.SetStyle(ComboBox1.Items[ComboBox1.ItemIndex]);
end;

procedure TMessages_Demo_MainForm.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  UpdateCaption;
end;

procedure TMessages_Demo_MainForm.UpdateCaption;
begin
  Self.Caption := 'Messages - Demo - DPI: ' + IntToStr(Round(Self.ScaleFactor * 100)) + '%';
end;

procedure TMessages_Demo_MainForm.FormCreate(Sender: TObject);
begin
  UpdateCaption;
  for var I := Low(TStyleManager.StyleNames) to High(TStyleManager.StyleNames) do
    ComboBox1.Items.Add(TStyleManager.StyleNames[I]);
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

end.
