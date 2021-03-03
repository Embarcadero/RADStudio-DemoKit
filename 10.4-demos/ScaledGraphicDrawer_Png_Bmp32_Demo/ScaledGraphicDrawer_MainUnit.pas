unit ScaledGraphicDrawer_MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Direct2D, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TScaledGraphicDrawer_MainForm = class(TForm)
    PaintBox1: TPaintBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    TopPnl: TPanel;
    LeftPnl: TPanel;
    Panel3: TPanel;
    RightPnl: TPanel;
    Panel5: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BMP: TImage;
    Label3: TLabel;
    RadioGroup2: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
    Buffer: TBitmap;
  public
    { Public declarations }
  end;

var
  ScaledGraphicDrawer_MainForm: TScaledGraphicDrawer_MainForm;

implementation

{$R *.dfm}

procedure TScaledGraphicDrawer_MainForm.FormCreate(Sender: TObject);
begin
  Buffer := TBitmap.Create;
  Buffer.Assign(Image1.Picture.Graphic);

  Buffer.DisableScaledDrawer;
  Image1.Picture.Graphic.DisableScaledDrawer;
end;

procedure TScaledGraphicDrawer_MainForm.FormDestroy(Sender: TObject);
begin
  Buffer.Free;
end;

procedure TScaledGraphicDrawer_MainForm.FormResize(Sender: TObject);
begin
  LeftPnl.Width := Width div 2;
  RightPnl.Width := Width div 2;
end;

procedure TScaledGraphicDrawer_MainForm.PaintBox1Paint(Sender: TObject);
begin
  PaintBox1.Canvas.StretchDraw(Rect(0, 0, PaintBox1.Width, PaintBox1.Height), Buffer);
end;

procedure TScaledGraphicDrawer_MainForm.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:
      begin
        Buffer.EnableScaledDrawer(TD2DScaledGraphicDrawer);
        Image1.Picture.Graphic.EnableScaledDrawer(TD2DScaledGraphicDrawer);
      end;
    1:
      begin
        Buffer.EnableScaledDrawer(TWICScaledGraphicDrawer);
        Image1.Picture.Graphic.EnableScaledDrawer(TWICScaledGraphicDrawer);
      end;
    2:
      begin
        Buffer.DisableScaledDrawer;
        Image1.Picture.Graphic.DisableScaledDrawer;
      end;
  end;
  Image1.Repaint;
  PaintBox1.Repaint;
end;

procedure TScaledGraphicDrawer_MainForm.RadioGroup2Click(Sender: TObject);
begin
  case RadioGroup2.ItemIndex of
    0: BMP.Picture.Graphic.EnableScaledDrawer(TWICScaledGraphicDrawer);
    1: BMP.Picture.Graphic.EnableScaledDrawer(TD2DScaledGraphicDrawer);
    2: BMP.Picture.Graphic.DisableScaledDrawer;
  end;
  BMP.Repaint;

end;

end.
