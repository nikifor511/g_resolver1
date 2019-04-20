unit pre_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,  global_variables;

type
  TPreForm = class(TForm)
    Button1: TButton;
    RichEdit1: TRichEdit;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreForm: TPreForm;

implementation

{$R *.dfm}

uses login_form;

procedure TPreForm.Button1Click(Sender: TObject);
begin
  LoginForm.ShowModal;
end;

procedure TPreForm.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TPreForm.ComboBox1Change(Sender: TObject);
begin
  TGlobalVariables.server_host := ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TPreForm.FormCreate(Sender: TObject);
var f: TextFile;
    s: String;
begin
  AssignFile(f, 'servercfg.config');
  Reset(f);
  while not EOF(f) do begin
    readln(f,s);
    ComboBox1.Items.Add(s);
  end;
  ComboBox1.ItemIndex := 0;
  TGlobalVariables.server_host := ComboBox1.Items[ComboBox1.ItemIndex];
end;

end.
