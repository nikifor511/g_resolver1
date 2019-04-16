unit resolver_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  JvExStdCtrls, JvRichEdit;

type
  TResolverForm = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    JvRichEdit1: TJvRichEdit;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);

  private

  public
    procedure upadate_problem_list;
  end;

var
  ResolverForm: TResolverForm;

implementation

{$R *.dfm}

uses pre_form, create_problem_form;

procedure TResolverForm.Button1Click(Sender: TObject);
begin
  create_problem_form.CreateProblemForm.ShowModal;
end;

procedure TResolverForm.upadate_problem_list;
  var i:integer;
begin
  ListBox1.Clear;
  Label1.Caption := IntToStr(pre_form.my_resolver.get_list_problems);
  for i := 0 to pre_form.my_resolver.problems.Count - 1 do
    ListBox1.Items.Add(pre_form.my_resolver.problems[i].title);

end;

procedure TResolverForm.FormActivate(Sender: TObject);
begin
  self.upadate_problem_list;
end;

procedure TResolverForm.FormShow(Sender: TObject);
begin
  self.upadate_problem_list;
end;

procedure TResolverForm.ListBox1DblClick(Sender: TObject);
var chat_file: TextFile;
    id_problem: integer;
    chat_str: String;
    date, time, sender_name, text, img_link: String;
begin
  id_problem := pre_form.my_resolver.get_id_problem_by_title(ListBox1.Items[ListBox1.ItemIndex]);
  pre_form.my_resolver.download_chat(id_problem);
  JvRichEdit1.Clear;
  AssignFile(chat_file, ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(id_problem));
  Reset(chat_file);
  while not EOF(chat_file) do
  begin
    readln(chat_file, chat_str);
    date := copy(chat_str, 1, pos('|', chat_str) - 1);
    delete(chat_str, 1, pos('|', chat_str));
    time := copy(chat_str, 1, pos('|', chat_str) - 1);
    delete(chat_str, 1, pos('|', chat_str));
<<<<<<< HEAD
    sender_name := pre_form.my_resolver.get_name_by_id(StrToInt(copy(chat_str, 1, pos('|', chat_str) - 1)));
=======
    sender_name := pre_form.my_resolver.get_name_by_id( StrToInt(copy(chat_str, 1, pos('|', chat_str) - 1)));
>>>>>>> 44685acca1ce4f23f6f461c86942ea65b2954eba
    delete(chat_str, 1, pos('|', chat_str));
    text := copy(chat_str, 1, pos('|', chat_str) - 1);
    delete(chat_str, 1, pos('|', chat_str));
    img_link := chat_str;
<<<<<<< HEAD
    if sender_name = pre_form.my_resolver.FIO then
      JvRichEdit1.Paragraph.Alignment := paRightJustify
    else
      JvRichEdit1.Paragraph.Alignment := paLeftJustify;
    JvRichEdit1.AddFormatText(date + ' ' + time + ' ' + sender_name + ' : ' + text + #13);
=======

    JvRichEdit1.AddFormatText(chat_str + #13);
>>>>>>> 44685acca1ce4f23f6f461c86942ea65b2954eba
  end;


end;

end.
