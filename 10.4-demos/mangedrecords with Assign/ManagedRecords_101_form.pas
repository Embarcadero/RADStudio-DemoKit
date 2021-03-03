unit ManagedRecords_101_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Rtti;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form5: TForm5;

  procedure Log (const strMessage: string);

implementation

{$R *.dfm}

var
  recNo: Integer = 0;

type
  TMyRecord = record
  private
    FNumber: Integer;
  public
    Value: Integer;
    class operator Initialize (out Dest: TMyRecord);
    class operator Finalize(var Dest: TMyRecord);
    class operator Assign (var Dest: TMyRecord;
 		  const [ref] Src: TMyRecord);
  end;

{ TMyRecord record}

class operator TMyRecord.Initialize (out Dest: TMyRecord);
begin
  Inc (recNo);
  Dest.FNumber := recNo;
  Dest.Value := 10;
  Log('created ' + Dest.FNumber.ToString + ' ' + IntToHex (Integer(Pointer(@Dest))));
end;

class operator TMyRecord.Assign (var Dest: TMyRecord; const [ref] Src: TMyRecord);
begin
  Dest.Value := Src.Value;
  // do not copy recNo!
  Log (Src.FNumber.ToString + ' copied to ' + Dest.FNumber.ToString);
end;

class operator TMyRecord.Finalize(var Dest: TMyRecord);
begin
  Log('destroyed ' + Dest.FNumber.ToString + ' ' + IntToHex (Integer(Pointer(@Dest))));
end;



procedure LocalVarTest;
var
  t: TMyRecord;
begin
  Log(t.Value.ToString);
end;

procedure InlineVarTest;
begin
  var t: TMyRecord;
  Log(t.Value.ToString);
end;

procedure InlineVarTest2;
var
  my1: TMyRecord;
begin
  var t := my1;
  Log(t.Value.ToString);

  var s: TMyRecord;
  Log(s.Value.ToString);
end;

procedure SimpleAssign;
var
  my1, my2: TMyRecord;
begin
  my1.Value := 22;
  my2 := my1;
end;

procedure ParByValue (rec: TMyRecord);
begin
  Log ('ParByValue');
 //  rec.Value := 100;
end;

procedure ParByConstValue (const rec: TMyRecord);
begin
  Log ('ParByConstValue');
  // rec.Value := 100; // cannot assign to const
end;

procedure ParByRef (var rec: TMyRecord);
begin
  Log ('ParByRef');
  rec.Value := 100;
end;

procedure ParByConstRef (const rec: TMyRecord);
begin
  Log ('ParByConstRef');
  // rec.Value := 100; // cannot assign to const
end;

function ParReturned: TMyRecord;
begin
  Log ('ParReturned');
  Result.Value := 42;
end;


procedure TForm5.Button1Click(Sender: TObject);
begin
  Log ('LocalVarTest');
  LocalVarTest;
  Log ('');

  Log ('InlineVarTest');
  InlineVarTest;
  Log ('');

  Log ('SimpleAssign');
  SimpleAssign;
  Log ('');

  Log ('InlineVarTest2');
  InlineVarTest2;
  Log ('');
end;


procedure Log(const strMessage: string);
begin
  Form5.Memo1.Lines.Add (strMessage);
end;

procedure TForm5.Button2Click(Sender: TObject);
var
  my1: TMyRecord;
begin
  Log(my1.Value.ToString);
  ParByValue (my1);
  Log(my1.Value.ToString);
  ParByConstValue (my1);
  Log(my1.Value.ToString);
  ParByRef (my1);
  Log(my1.Value.ToString);
  ParByConstRef (my1);
  Log(my1.Value.ToString);
  my1 := ParReturned;
  Log(my1.Value.ToString);
end;

var
  fRaise: Boolean = False;

type
  TMRException = record
    x: Integer;
    class operator Initialize(out Dest: TMRException);
    class operator Finalize(var Dest: TMRException);
  end;

  class operator TMRException.Initialize(out Dest: TMRException);
  begin
    Log('created ' + IntToHex (Integer(Pointer(@Dest))));
    if fRaise then
      raise Exception.Create('Error Message');
  end;

  class operator TMRException.Finalize(var Dest: TMRException);
  begin
    Log('destroyed ' + IntToHex (Integer(Pointer(@Dest))));
  end;

procedure ExceptionTest;
begin
  fRaise := False;
  var a: TMRException;
  var b: TMRException;

  raise Exception.Create('Error Message');
end;

procedure ExceptionInConstructor;
begin
  Log ('ExceptionInConstructor');
  fRaise := True;
  var d: TMRException;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  try
    ExceptionTest;
  except
    ;
  end;

  try
    ExceptionInConstructor;
  except
    ;
  end;

end;

procedure ArrOfRec;
var
  a1: array [1..5] of TMyRecord;
begin
  Log ('ArrOfRec');
  // use array
  for var I := Low(a1) to High (a1) do
    Log (a1[I].Value.ToString);
end;

procedure ArrOfDyn;
var
  a2: array of TMyRecord;
begin
  Log ('ArrOfDyn');
  SetLength(a2, 5);
  for var I := Low(a2) to High (a2) do
    Log (a2[I].Value.ToString);

end;

procedure TForm5.Button5Click(Sender: TObject);
begin
  ArrOfRec;
  ArrOfDyn;
end;

type
  TMyRec4 = record
    x: Integer;
    constructor Create (const recc: TMyRec4);
  end;

  constructor TMyRec4.Create (const recc: TMyRec4);
  begin
    Log ('copy 4 onstructor');
  end;

type
  TMyRec5 = record
    x: Integer;
    class operator Initialize(out Dest: TMyRec5);
    constructor Create (const recc: TMyRec5);
  end;

  class operator TMyRec5.Initialize(out Dest: TMyRec5);
  begin
    Log ('regular 5 constructor');
  end;

  constructor TMyRec5.Create (const recc: TMyRec5);
  begin
    Log ('MR 5 copy constructor');
  end;



procedure TForm5.Button6Click(Sender: TObject);
var
  rc: TRttiContext;
  mr2: TMyRec4;
  mrc2: TMyRec5;
begin
  // copy constructor called twice
  var mr1 := TMyRec4.Create (mr2);

  if rc.GetType(TypeInfo(TMyRec4)).TypeKind = tkMRecord then
    Log ('managed record')
  else if rc.GetType(TypeInfo(TMyRec4)).TypeKind = tkRecord then
    Log ('regular record');

  var mrc55 :=  TMyRec5.Create (mrc2);
  if rc.GetType(TypeInfo(TMyRec5)).TypeKind = tkMRecord then
    Log ('managed record')
  else if rc.GetType(TypeInfo(TMyRec5)).TypeKind = tkRecord then
    Log ('regular record');

  var mrc56 := mrc2;
end;

end.
