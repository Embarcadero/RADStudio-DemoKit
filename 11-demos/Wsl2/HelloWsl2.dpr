program HelloWsl2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    Randomize;
    var i := Random(1000);
    Writeln(Format('The random number is %d',[i]));
    Writeln(Format('And the magic number is %d',[i]));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
