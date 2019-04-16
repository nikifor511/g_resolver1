unit resolver;

interface

uses IdHTTP, SysUtils, Vcl.Forms, System.Generics.Collections, Classes,  Winapi.Windows, problem,
      global_variables;

type TResolver = class
  private
    myIdHTTP: TIdHTTP;
  public
    IsLogin: boolean;
    problems: TList<TProblem>;

    FIO: String;
    constructor Create;
    destructor Destroy;
    function ask_login(fio, pass: String): integer;
    function get_list_problems: integer;
    function ask_create_problem(title, describe: string; status: integer):integer;
    function download_chat(problem_id: integer): boolean;
    function get_id_problem_by_title(title: String): integer;
    function get_name_by_id(id: integer): String;

end;

implementation

constructor TResolver.Create;
begin
  myIdHTTP := TIdHTTP.Create;
  problems := TList<TProblem>.Create;
  self.IsLogin := false;
end;

destructor TResolver.Destroy;
begin
  myIdHTTP.Free;
end;

function TResolver.download_chat(problem_id: integer):boolean;
var Stream:TMemoryStream;
begin
  try
    Stream:=TMemoryStream.Create;
    myIdHTTP.Get(TGlobalVariables.server_host + 'problem_chat/' + IntToStr(problem_id),Stream);
    Stream.SaveToFile(ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(problem_id));
    Stream.Free;
  except
    on e:Exception do
    begin
      Stream.Free;
      Result := false;
    end;
  end;
  Result := true;
end;

function TResolver.ask_login(fio, pass: String): integer;
var resultHTTPGet: String;
begin
  resultHTTPGet := myIdHTTP.Get(TGlobalVariables.server_host + '?oper=__log&name=' + fio + '&pass=' + pass);
  if resultHTTPGet = '0' then begin
    self.IsLogin := true;
    self.FIO := fio;
  end;
  Result := StrToInt(resultHTTPGet);
end;

function TResolver.get_list_problems: integer;
var resultHTTPGet, res_value, title: String;
    id :integer;
    tmp_problem: TProblem;
begin
  resultHTTPGet := myIdHTTP.Get(TGlobalVariables.server_host + '?oper=___lo&name=' + self.FIO);
  if resultHTTPGet <> '0' then begin
    problems.Clear;
    while pos('/', resultHTTPGet) > 0 do begin
      res_value := copy(resultHTTPGet, 1, pos('/',resultHTTPGet) - 1);
      id := StrToInt(copy(res_value, 1, pos('*', res_value) - 1));
      title := copy(res_value, pos('*',res_value) + 1, Length(res_value) - pos('*', res_value));
      tmp_problem := TProblem.Create(id, title);
      problems.Add(tmp_problem);
      //tmp_problem.Free;
      delete(resultHTTPGet, 1, pos('/', resultHTTPGet));
    end;
    Result := 0;
  end
  else
    Result := 1;
end;

function TResolver.ask_create_problem(title, describe: string; status: integer): integer;
begin
  Result := StrToInt(myIdHTTP.Get(TGlobalVariables.server_host + '?oper=___cp&name=' + self.FIO +
    '&title=' + title + '&describe=' + describe + '&status=' + IntToStr(status)));
end;

function TResolver.get_id_problem_by_title(title: string): integer;
var i:integer;
begin
Result := 0;
  for i:= 0 to self.problems.Count - 1 do
    if self.problems[i].title = title then
      Result := self.problems[i].id;
end;

function TResolver.get_name_by_id(id: Integer): String;
begin
  Result := myIdHTTP.Get(TGlobalVariables.server_host + '?oper=_nbid&user_id=' + IntToStr(id));

end;

end.
