unit LiveBindingsCheckBoxMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, LiveBindingsCheckBoxFrame,
  Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    Frame22: TFrame2;
    Frame23: TFrame2;
    Frame24: TFrame2;
    Frame25: TFrame2;
    Frame26: TFrame2;
    Frame27: TFrame2;
    Frame28: TFrame2;
    Timer1: TTimer;
    RelativePanel1: TRelativePanel;
    Label1: TLabel;
    Frame21: TFrame2;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  {Frame21.Visible := True;
  Frame22.Visible := True;
  Frame23.Visible := True;
  Frame24.Visible := True;
  Frame25.Visible := True;
  Frame26.Visible := True;
  Frame27.Visible := True;
  Frame28.Visible := True;  }

  //ActivityIndicator1.Animate := False;
  RelativePanel1.Visible := False;
end;

end.
