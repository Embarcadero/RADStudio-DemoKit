unit Scaled_Jelly_Drawer_MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Direct2D;

type
  TScaled_Jelly_Drawer_MainForm = class(TForm)
    BMP: TImage;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Scaled_Jelly_Drawer_MainForm: TScaled_Jelly_Drawer_MainForm;

implementation

{$R *.dfm}

procedure TScaled_Jelly_Drawer_MainForm.FormCreate(Sender: TObject);
begin
  BMP.Picture.Graphic.DisableScaledDrawer;
end;

procedure TScaled_Jelly_Drawer_MainForm.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0: BMP.Picture.Graphic.EnableScaledDrawer(TWICScaledGraphicDrawer);
    1: BMP.Picture.Graphic.EnableScaledDrawer(TD2DScaledGraphicDrawer);
    2: BMP.Picture.Graphic.DisableScaledDrawer;
  end;
  BMP.Repaint;
end;

end.
