unit LiveBindingsDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule3 = class(TDataModule)
    FDMemTable1: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
