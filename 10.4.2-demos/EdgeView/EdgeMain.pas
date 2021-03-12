unit EdgeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebView2, Winapi.ActiveX,
  Vcl.StdCtrls, Vcl.Edge, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TEdgeViewForm = class(TForm)
    EdgeBrowser1: TEdgeBrowser;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    Panel5: TPanel;
    memoHTML: TMemo;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EdgeBrowser1ExecuteScript(Sender: TCustomEdgeBrowser;
      AResult: HRESULT; const AResultObjectAsJson: string);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EdgeViewForm: TEdgeViewForm;

implementation

{$R *.dfm}

uses
  System.NetEncoding;

procedure TEdgeViewForm.EdgeBrowser1ExecuteScript(Sender: TCustomEdgeBrowser;
  AResult: HRESULT; const AResultObjectAsJson: string);
begin
  if AResultObjectAsJson <> 'null' then
    memoHTML.Text := TNetEncoding.URL.Decode(AResultObjectAsJson).DeQuotedString('"');
end;

procedure TEdgeViewForm.Button1Click(Sender: TObject);
begin
  EdgeBrowser1.Navigate(edit1.Text);
end;

procedure TEdgeViewForm.Button2Click(Sender: TObject);
begin
  EdgeBrowser1.ExecuteScript(Memo1.Text);
end;

procedure TEdgeViewForm.Button3Click(Sender: TObject);
begin
  EdgeBrowser1.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
end;

procedure TEdgeViewForm.Button4Click(Sender: TObject);
begin
  EdgeBrowser1.NavigateToString(memoHTML.Text);
end;

procedure TEdgeViewForm.FormCreate(Sender: TObject);
begin
  EdgeBrowser1.Navigate('http://example.com');
end;

end.
