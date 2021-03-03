unit DBGrid_DBNavigator_MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Themes, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Tabs, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.ActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnMenus, Data.DB, Datasnap.DBClient, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCGrids, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList;

type
  TDBGrid_DBNavigator_Form1 = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
      NewDPI: Integer);
  private
    procedure UpdateCaption;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBGrid_DBNavigator_Form1: TDBGrid_DBNavigator_Form1;

implementation

{$R *.dfm}

procedure TDBGrid_DBNavigator_Form1.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  UpdateCaption;
end;

procedure TDBGrid_DBNavigator_Form1.UpdateCaption;
begin
  Self.Caption := 'TDBGrid - TDBNavigator - DPI: ' + IntToStr(Round(Self.ScaleFactor * 100)) + '%';
end;

procedure TDBGrid_DBNavigator_Form1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  UpdateCaption;
  ClientDataSet1.Open;
  for I := 1 to 10 do
    ClientDataSet1.InsertRecord(['Item' + IntToStr(I), 'Value' + IntToStr(I)]);
  ClientDataSet1.First;
end;

end.
