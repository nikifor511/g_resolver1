unit html_chat_maker;

interface

uses idFTP, IdFTPCommon, Classes,
SysUtils, Vcl.Forms;

type THTMLChatMaker= class
  public

    class function make_chat(problem_id:integer): boolean;
end;

implementation

class function THTMLChatMaker.make_chat(problem_id:integer): boolean;
var FileList : TStringList;
    i:integer;
    str, str_from, str_to: String;
    chat_file, html_file: TextFile;
    chat_str: String;
    date, time, sender_name, text, img_link: String;
    style_str, font_str: String;
    font_size: integer;
    myIdFTP: TIdFTP;
begin
  try
    myIdFTP := TIdFTP.Create();
    myIdFTP := TIdFTP.Create;
    myIdFTP.Host := 'files.000webhost.com';
    myIdFTP.Port := 21;
    myIdFTP.Username := 'indolent-keyword';
    myIdFTP.Password := 'student511';
    myIdFTP.Passive := true;
    myIdFTP.TransferType := ftBinary;

    myIdFtp.Connect;

    str_from := '/public_html/problem_chat/';
    str_to := ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(problem_id);

    myIdFTP.ChangeDir(str_from);
    myIdFTP.Get(IntToStr(problem_id), ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(problem_id), true);

    myIdFTP.ChangeDir(str_from + IntToStr(problem_id) + '.media/');
    FileList := TStringList.Create;
    myIdFTP.List(FileList,'*.png', False);

    if not DirectoryExists(str_to + '.media\') then
      CreateDir(str_to + '.media\') ;

    if FileList.Count > 0 then
      for i := 0 to FileList.Count - 1 do
        myIdFTP.Get(FileList.Strings[i], str_to + '.media\' +FileList.Strings[i], true);

    myIdFTP.Disconnect;
    myIdFTP.Free;

    AssignFile(chat_file, ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(problem_id));
    AssignFile(html_file, ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(problem_id) + '.html');
    Reset(chat_file);
    Rewrite(html_file);

    Writeln(html_file, '<style>');
    Writeln(html_file, '  img.big {cursor: pointer; max-width: 150px;}');
    Writeln(html_file, '  img.big:hover {max-width: none;}');
    Writeln(html_file, '</style>');
    font_size := 2;
    font_str := '<font face = "Comic sans MS" size ="' + IntToStr(font_size) + '">';

    while not EOF(chat_file) do begin
      readln(chat_file, chat_str);
      date := copy(chat_str, 1, pos('|', chat_str) - 1);
      delete(chat_str, 1, pos('|', chat_str));
      time := copy(chat_str, 1, pos('|', chat_str) - 1);
      delete(chat_str, 1, pos('|', chat_str));
//      sender_name := get_name_by_id(StrToInt(copy(chat_str, 1, pos('|', chat_str) - 1)));
//      if sender_name = self.FIO then
//      style_str := '<p style="text-align: right;">'
//    else
//      style_str := '<p style="text-align: left;">';
    sender_name := '[' + sender_name + ']:';
    delete(chat_str, 1, pos('|', chat_str));
    text := copy(chat_str, 1, pos('|', chat_str) - 1);
    text := '<strong>' + text + '</strong>';
    delete(chat_str, 1, pos('|', chat_str));
    img_link := chat_str;

    if img_link <> '---' then begin
      img_link := IntToStr(problem_id) + '.media\' + img_link;
      Writeln(html_file, style_str + '<img class="big" src="' + img_link + '"/></p>');
    end;
    Writeln(html_file, style_str + font_str + date + ' ' + time + ' ' + sender_name + text + '</font></p>');
  end;
  CloseFile(chat_file);
  CloseFile(html_file);


  except
    on e:Exception do
    begin
      Result := false;
    end;
  end;
  Result := true;
end;

end.
