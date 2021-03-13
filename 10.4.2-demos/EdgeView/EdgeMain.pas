unit EdgeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebView2, Winapi.ActiveX,
  Vcl.StdCtrls, Vcl.Edge, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TEdgeViewForm = class(TForm)
    EdgeBrowser1: TEdgeBrowser;
    btnGo: TButton;
    Edit1: TEdit;
    btnExecuteScript: TButton;
    btnViewSource: TButton;
    Panel1: TPanel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    memoJavaScript: TMemo;
    Panel5: TPanel;
    memoHTML: TMemo;
    btnSetSource: TButton;
    procedure btnGoClick(Sender: TObject);
    procedure btnExecuteScriptClick(Sender: TObject);
    procedure btnViewSourceClick(Sender: TObject);
    procedure EdgeBrowser1ExecuteScript(Sender: TCustomEdgeBrowser;
      AResult: HRESULT; const AResultObjectAsJson: string);
    procedure FormCreate(Sender: TObject);
    procedure btnSetSourceClick(Sender: TObject);
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

procedure TEdgeViewForm.btnGoClick(Sender: TObject);
begin
  EdgeBrowser1.Navigate(memoJavaScript.Text);
end;

procedure TEdgeViewForm.btnExecuteScriptClick(Sender: TObject);
begin
  EdgeBrowser1.ExecuteScript(memoJavaScript.Text);
end;

procedure TEdgeViewForm.btnViewSourceClick(Sender: TObject);
begin
  EdgeBrowser1.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
end;

procedure TEdgeViewForm.btnSetSourceClick(Sender: TObject);
begin
  EdgeBrowser1.NavigateToString(memoHTML.Text);
end;

procedure TEdgeViewForm.FormCreate(Sender: TObject);
begin
  EdgeBrowser1.Navigate('https://embarcadero.com');
end;

end.
