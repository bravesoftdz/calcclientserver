program MyServerProj;

uses
  Vcl.Forms,
  MyServer in 'MyServer.pas' {Form1},
  MyClass in 'MyClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
