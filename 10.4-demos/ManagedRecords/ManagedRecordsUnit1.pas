unit ManagedRecordsUnit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types;

type
  // This is a custom managed record
  //   The Initialize and Finalize are both called automatically
  TMyRecord = record
    Value: Integer;
    class operator Initialize(out Dest: TMyRecord);
    class operator Finalize(var Dest: TMyRecord);
  end;

  TForm1 = class(TForm)
    GoButton: TButton;
    Memo1: TMemo;
    MaterialOxfordBlueSB: TStyleBook;
    procedure GoButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

// The Initialize is called when the record declaration is in scope
class operator TMyRecord.Initialize(out Dest: TMyRecord);
begin
  Dest.Value := 10;
  Form1.Memo1.Lines.Append('Record created @' + IntToHex(Integer(Pointer(@Dest))));
end;

// The Finalize is called when the record goes out of scope
class operator TMyRecord.Finalize(var Dest: TMyRecord);
begin
  Form1.Memo1.Lines.Append('Record destroyed @' + IntToHex(Integer(Pointer(@Dest))));
end;

procedure TForm1.GoButtonClick(Sender: TObject);
begin
  Memo1.Lines.Append('Before scope');
  begin
    var LMyRecord: TMyRecord;
    Memo1.Lines.Append('After declare');
    // Since it is a record there is no need to call create!
    Memo1.Lines.Append('Initial value: ' + LMyRecord.Value.ToString);
    LMyRecord.Value := 20;
    Memo1.Lines.Append('Changed value: ' + LMyRecord.Value.ToString);
    Memo1.Lines.Append('After use');
  end;
  // It was automatically Finalized when it went out of scope!
  Memo1.Lines.Append('After scope');
end;

end.
