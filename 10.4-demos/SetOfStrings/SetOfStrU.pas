//---------------------------------------------------------------
// Demo written by Daniele Teti <d.teti@bittime.it>
//---------------------------------------------------------------
unit SetOfStrU;

interface

uses
  System.SysUtils, System.Classes;

type
  SetOfStr = record
  private
    fElements: TStringList;
    class procedure RemoveSetElement(const [ref] StringSet: SetOfStr; const Value: String); static;
  public
    /// Managed Record Requirements
    class operator Initialize(out Dest: SetOfStr);
    class operator Finalize(var Dest: SetOfStr);
    class operator Assign(var Dest: SetOfStr; const [ref] Src: SetOfStr);

    /// Operators
    class operator Implicit(Value: TArray<String>): SetOfStr;
    class operator In(a: string; b: SetOfStr): Boolean;
    class operator Add(a: SetOfStr; b: SetOfStr): SetOfStr; overload;
    class operator Add(a: SetOfStr; b: String): SetOfStr; overload;
    class operator Subtract(a: SetOfStr; b: SetOfStr): SetOfStr; overload;
    class operator Subtract(a: SetOfStr; b: String): SetOfStr; overload;
    class operator Multiply(a: SetOfStr; b: SetOfStr): SetOfStr;

    /// Methods
    function ToString: string;
    function ToArray: TArray<String>;
  end;

implementation

{ SetOfStr }

function SetOfStr.ToArray: TArray<String>;
begin
  Result := fElements.ToStringArray;
end;

class operator SetOfStr.In(a: string; b: SetOfStr): Boolean;
begin
  Result := b.fElements.IndexOf(a) > -1;
end;

class operator SetOfStr.Initialize(out Dest: SetOfStr);
begin
  Dest.fElements := TStringList.Create(dupIgnore, True, False);
end;

class operator SetOfStr.Finalize(var Dest: SetOfStr);
begin
  Dest.fElements.Free;
end;

class operator SetOfStr.Assign(var Dest: SetOfStr; const [ref] Src: SetOfStr);
begin
  Dest.fElements.AddStrings(Src.fElements);
end;

class operator SetOfStr.Implicit(Value: TArray<String>): SetOfStr;
begin
  Result.fElements.AddStrings(Value);
end;

function SetOfStr.ToString: string;
begin
  Result := fElements.Text;
end;

class operator SetOfStr.Add(a: SetOfStr; b: SetOfStr): SetOfStr;
begin
  Result.fElements.AddStrings(a.fElements);
  Result.fElements.AddStrings(b.fElements);
end;

class operator SetOfStr.Add(a: SetOfStr; b: String): SetOfStr;
begin
  Result.fElements.AddStrings(a.fElements);
  Result.fElements.Add(b);
end;

class operator SetOfStr.Subtract(a: SetOfStr; b: SetOfStr): SetOfStr;
begin
  Result := a;
  for var s in b.fElements do
  begin
    RemoveSetElement(Result,s);
  end;
end;

class operator SetOfStr.Subtract(a: SetOfStr; b: String): SetOfStr;
begin
  Result := a;
  RemoveSetElement(a,b);
end;

class operator SetOfStr.Multiply(a: SetOfStr; b: SetOfStr): SetOfStr;
begin
  for var s in a.fElements do
  begin
    if s in b then
    begin
      Result.fElements.Add(s);
    end;
  end;
end;


class procedure SetOfStr.RemoveSetElement(const [ref] StringSet: SetOfStr; const Value: String);
begin
  var lIdx := StringSet.fElements.IndexOf(Value);
  if lIdx > -1 then
  begin
    StringSet.fElements.Delete(lIdx);
  end;
end;

end.
