program ManagedRecordsConsole;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  // This is a custom managed record
  //   The Initialize and Finalize are both called automatically
  TMyRecord = record
    Value: Integer;
    class operator Initialize(out Dest: TMyRecord);
    class operator Finalize(var Dest: TMyRecord);
  end;

// The Initialize is called when the record declaration is in scope
class operator TMyRecord.Initialize(out Dest: TMyRecord);
begin
  Dest.Value := 10;
  WriteLn('Initialize called');
end;

// The Finalize is called when the record goes out of scope
class operator TMyRecord.Finalize(var Dest: TMyRecord);
begin
  WriteLn('Finalize called');
end;

begin
  WriteLn('-Before declaration-');
  try
    var LMyRecord: TMyRecord; // record Initialized.
    WriteLn('-Automatically Initialized-');
    WriteLn('Value: ' + LMyRecord.Value.ToString);
    WriteLn('-After use, still in scope-');
  except // record Finalized.
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
  WriteLn('-Out of scope-');
  Readln;
end.
