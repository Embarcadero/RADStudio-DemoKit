unit Win11CornersMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.TitleBarCtrls,
  Vcl.ExtCtrls;

type
  TWin11CornersForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    TitleBarPanel1: TTitleBarPanel;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Win11CornersForm: TWin11CornersForm;

implementation

{$R *.dfm}

uses
  Winapi.Dwmapi;

const
  // More information:
  //   https://docs.microsoft.com/en-us/windows/apps/desktop/modernize/apply-rounded-corners
  //   https://docs.microsoft.com/en-us/windows/win32/api/dwmapi/ne-dwmapi-dwmwindowattribute
  //   https://docs.microsoft.com/en-us/windows/win32/api/dwmapi/nf-dwmapi-dwmsetwindowattribute
  // Let the system decide whether or not to round window corners
  DWMWCP_DEFAULT      = 0;
  // Never round window corners
  DWMWCP_DONOTROUND   = 1;
  // Round the corners if appropriate
  DWMWCP_ROUND        = 2;
  // Round the corners if appropriate, with a small radius
  DWMWCP_ROUNDSMALL   = 3;
  // [set] WINDOW_CORNER_PREFERENCE, Controls the policy that rounds top-level window corners
  DWMWA_WINDOW_CORNER_PREFERENCE = 33;


procedure TWin11CornersForm.Button1Click(Sender: TObject);
begin
  var DWM_WINDOW_CORNER_PREFERENCE: Cardinal;
  case TComponent(Sender).Tag of
    0: DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_DONOTROUND;
    1: DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_ROUND;
    2: DWM_WINDOW_CORNER_PREFERENCE := DWMWCP_ROUNDSMALL;
  end;
  Winapi.Dwmapi.DwmSetWindowAttribute(self.Handle, DWMWA_WINDOW_CORNER_PREFERENCE, @DWM_WINDOW_CORNER_PREFERENCE, sizeof(DWM_WINDOW_CORNER_PREFERENCE));
end;

procedure TWin11CornersForm.CheckBox1Click(Sender: TObject);
begin
  Self.CustomTitleBar.Enabled := CheckBox1.Checked;
end;

end.
