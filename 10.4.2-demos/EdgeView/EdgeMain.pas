unit EdgeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebView2, Winapi.ActiveX,
  Vcl.StdCtrls, Vcl.Edge, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    EdgeBrowser1: TEdgeBrowser;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EdgeBrowser1ExecuteScript(Sender: TCustomEdgeBrowser;
      AResult: HRESULT; const AResultObjectAsJson: string);
    procedure FormCreate(Sender: TObject);
    procedure EdgeBrowser1CreateWebViewCompleted(
      Sender: TCustomEdgeBrowser; AResult: HRESULT);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses
  System.NetEncoding,
  System.JSON;

procedure TForm4.Button1Click(Sender: TObject);
begin
  EdgeBrowser1.Navigate(edit1.Text);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  EdgeBrowser1.ExecuteScript(Memo1.Text);
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
  EdgeBrowser1.ExecuteScript('document.documentElement.outerHTML');
end;

procedure TForm4.EdgeBrowser1CreateWebViewCompleted(
  Sender: TCustomEdgeBrowser; AResult: HRESULT);
begin
  ShowMessage('Done');
end;

procedure TForm4.EdgeBrowser1ExecuteScript(Sender: TCustomEdgeBrowser;
  AResult: HRESULT; const AResultObjectAsJson: string);
begin
  if AResultObjectAsJson <> 'null' then
    Memo1.Text :=
        TJSONObject.ParseJSONValue(
          TEncoding.UTF8.GetBytes(AResultObjectAsJson),0).ToString.DeQuotedString;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  EdgeBrowser1.Navigate('http://example.com');
end;

end.
