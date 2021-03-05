unit MainFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type
  TForm6 = class(TForm)
    btnSpeedTest: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure btnSpeedTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TMyItem = class
  private
    FPropItem1: String;
    FPropItem2: String;
    procedure SetPropItem1(const Value: String);
    procedure SetPropItem2(const Value: String);
  public
    constructor Create(const Value1, Value2: String);
    property PropItem1: String read FPropItem1 write SetPropItem1;
    property PropItem2: String read FPropItem2 write SetPropItem2;
  end;

  TMyContainer = class
  private
    FProp1: String;
    FPropList1: TObjectList<TMyItem>;
    FArrayOfString: TArray<String>;
    procedure SetProp1(const Value: String);
    procedure SetPropList1(const Value: TObjectList<TMyItem>);
    procedure SetArrayOfString(const Value: TArray<String>);
  public
    constructor Create;
    destructor Destroy; override;
    property Prop1: String read FProp1 write SetProp1;
    property PropList1: TObjectList<TMyItem> read FPropList1 write SetPropList1;
    property ArrayOfString: TArray<String> read FArrayOfString write SetArrayOfString;
  end;


var
  Form6: TForm6;

implementation

uses
  MVCFramework.Serializer.JsonDataObjects, System.Diagnostics;

{$R *.dfm}

procedure Load(const Data: TObjectList<TMyItem>);
begin
  for var I := 1 to 1000000 do
  begin
    Data.Add(TMyItem.Create(I.ToString, I.ToString));
  end;
end;

procedure TForm6.btnSpeedTestClick(Sender: TObject);
begin
  var lSer := TMVCJsonDataObjectsSerializer.Create;
  try
    var lObj := TObjectList<TMyItem>.Create;
    try
      Load(lObj);
      var SW: TStopWatch := tstopwatch.startnew;
      var lJString := lSer.SerializeCollection(lObj);
      Memo1.Lines.Add('Serialize: ' + SW.ElapsedMilliseconds.ToString + 'ms');
//      SW:= tstopwatch.startnew;
//      lSer.DeserializeCollection(lJString, lObj, TMyItem);
//      Memo1.Lines.Add('DeSerialize: ' + SW.ElapsedMilliseconds.ToString);
    finally
      lObj.Free;
    end;
  finally
    lSer.Free;
  end;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  var lSer := TMVCJsonDataObjectsSerializer.Create;
  try
    var lObj := TMyContainer.Create;
    try
      var lJString := '{"Prop1":"Hello World", "PropList1":[{"PropItem1":"Value1"},{"PropItem1":"Value2"}], "ArrayOfString": ["Item1","Item2"]}';
      lSer.DeserializeObject(lJString, lObj);
      Assert( lObj.Prop1 = 'Hello World');
      Assert( lObj.PropList1.Count = 2);
      Assert( lObj.PropList1[0].PropItem1 = 'Value1');
      Assert( lObj.PropList1[1].PropItem1 = 'Value2');
    finally
      lObj.Free;
    end;
  finally
    lSer.Free;
  end;
end;

{ TMyContainer }

constructor TMyContainer.Create;
begin
  inherited;
  FPropList1 := TObjectList<TMyItem>.Create;
end;

destructor TMyContainer.Destroy;
begin
  FPropList1.Free;
  inherited;
end;

procedure TMyContainer.SetArrayOfString(const Value: TArray<String>);
begin
  FArrayOfString := Value;
end;

procedure TMyContainer.SetProp1(const Value: String);
begin
  FProp1 := Value;
end;

procedure TMyContainer.SetPropList1(const Value: TObjectList<TMyItem>);
begin
  FPropList1 := Value;
end;

{ TMyItem }

constructor TMyItem.Create(const Value1, Value2: String);
begin
  inherited Create;
  self.FPropItem1 := Value1;
  self.FPropItem2 := Value2;
end;

procedure TMyItem.SetPropItem1(const Value: String);
begin
  FPropItem1 := Value;
end;

procedure TMyItem.SetPropItem2(const Value: String);
begin
  FPropItem2 := Value;
end;

end.
