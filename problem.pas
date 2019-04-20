unit problem;

interface

type TProblem = class
  public
    id: integer;
    title: String;

    constructor Create(id: integer; title: String);
  end;

implementation

constructor TProblem.Create(id: integer; title: string);
begin
  self.id := id;
  self.title := title;
end;

end.
