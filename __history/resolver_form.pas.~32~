unit resolver_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  JvExStdCtrls, JvRichEdit, Vcl.OleCtrls, SHDocVw, cefvcl;

type
  TResolverForm = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Chromium1: TChromium;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure update_chat;

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

procedure TResolverForm.update_chat;
var chat_file: TextFile;
    id_problem: integer;
    chat_str: String;
    date, time, sender_name, text, img_link: String;
    Bitmap: TBitmap;
begin
  id_problem := pre_form.my_resolver.get_id_problem_by_title(ListBox1.Items[ListBox1.ItemIndex]);

  //WebBrowser1.Navigate(ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(id_problem) + '.html');
  Chromium1.Load(ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(id_problem) + '.html');




//  pre_form.my_resolver.download_chat(id_problem);
//  JvRichEdit1.Clear;
//  AssignFile(chat_file, ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(id_problem));
//  Reset(chat_file);
//  while not EOF(chat_file) do
//  begin
//    readln(chat_file, chat_str);
//    date := copy(chat_str, 1, pos('|', chat_str) - 1);
//    delete(chat_str, 1, pos('|', chat_str));
//    time := copy(chat_str, 1, pos('|', chat_str) - 1);
//    delete(chat_str, 1, pos('|', chat_str));
//    sender_name := pre_form.my_resolver.get_name_by_id(StrToInt(copy(chat_str, 1, pos('|', chat_str) - 1)));
//
//    delete(chat_str, 1, pos('|', chat_str));
//    text := copy(chat_str, 1, pos('|', chat_str) - 1);
//    delete(chat_str, 1, pos('|', chat_str));
//    img_link := chat_str;
//
//    if sender_name = pre_form.my_resolver.FIO then
//      JvRichEdit1.Paragraph.Alignment := paRightJustify
//    else
//      JvRichEdit1.Paragraph.Alignment := paLeftJustify;
//
//    if img_link <> '---' then begin
//      Bitmap := TBitmap.Create;
//      img_link := ExtractFileDir(Application.ExeName) + '\problem_chats\' + IntToStr(id_problem) + '.media\' + img_link;
//      Bitmap.LoadFromFile(img_link);
//      JvRichEdit1.InsertGraphic(Bitmap, false);
//      Bitmap.Free;
//    end;
//
//    JvRichEdit1.AddFormatText(#13 + 'hellllo');
//
//    JvRichEdit1.SelAttributes.Style:=[];
//    JvRichEdit1.SelText := date + ' ' + time + ' [' + sender_name + '] : ';
//    JvRichEdit1.SelLength := 0;
//    JvRichEdit1.SelAttributes.Style:=[fsBold];
//    JvRichEdit1.SelText := text + #13;
//    JvRichEdit1.SelLength := 0;
//  end;
//  CloseFile(chat_file);
end;

procedure TResolverForm.ListBox1DblClick(Sender: TObject);
begin
  update_chat;
end;

end.
