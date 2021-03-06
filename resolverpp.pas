unit resolverpp;

interface

uses problem, System.Generics.Collections, IdHTTP, global_variables, SysUtils;

type
  TResolverPP = class
    public
      class var problems: TList<TProblem>;
      FIO: String;
      class function ask_login(fio, pass: String): integer;
      class function get_list_problems: integer;
      class function ask_create_problem(title, describe: string; status: integer):integer;
      class function get_id_problem_by_title(title: String): integer;
      class function get_name_by_id(id: integer): String;
    private
  end;

implementation

{ TReoselverPP }

class function TResolverPP.ask_create_problem(title, describe: string;
  status: integer): integer;
var myIdHTTP: TIdHTTP;
begin
  myIdHTTP := TIdHTTP.Create();
  Result := StrToInt(myIdHTTP.Get(TGlobalVariables.server_host + '?oper=___cp&name=' + self.FIO +
    '&title=' + title + '&describe=' + describe + '&status=' + IntToStr(status)));
  myIdHTTP.Free;
end;

class function TResolverPP.ask_login(fio, pass: String): integer;
var resultHTTPGet: String;
    myIdHTTP: TIdHTTP;
begin
  myIdHTTP := TIdHTTP.Create();
  resultHTTPGet := myIdHTTP.Get(TGlobalVariables.server_host + '?oper=__log&name=' + fio + '&pass=' + pass);
  if resultHTTPGet = '0' then begin
    //self.IsLogin := true;
    self.FIO := fio;
  end;
  Result := StrToInt(resultHTTPGet);
  myIdHTTP.Free;
end;

class function TResolverPP.get_id_problem_by_title(title: String): integer;
var i:integer;
begin
  Result := 0;
  for i:= 0 to self.problems.Count - 1 do
    if self.problems[i].title = title then
      Result := self.problems[i].id;
end;

class function TResolverPP.get_list_problems: integer;
var resultHTTPGet, res_value, title: String;
    id :integer;
    tmp_problem: TProblem;
    myIdHTTP: TIdHTTP;
begin
  myIdHTTP := TIdHTTP.Create();
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
  myIdHTTP.Free;
end;

class function TResolverPP.get_name_by_id(id: integer): String;
var myIdHTTP: TIdHTTP;
begin
  myIdHTTP := TIdHTTP.Create();
  Result := myIdHTTP.Get(TGlobalVariables.server_host + '?oper=_nbid&user_id=' + IntToStr(id));
  myIdHTTP.Free;
end;

end.
