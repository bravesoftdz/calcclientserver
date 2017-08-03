unit MyClass;

interface

uses Classes;

type
  {$METHODINFO ON}
    TMyClass = class(TComponent)
      function Sum(const a,b:double):double;
    end;

  {$METHODINFO OFF}

implementation

{ TMyClass }

function TMyClass.Sum(const a, b: double): double;
begin
  Result := a + b;
end;

end.
