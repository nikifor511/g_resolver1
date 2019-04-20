unit create_problem_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, resolverpp;

type
  TCreateProblemForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateProblemForm: TCreateProblemForm;

implementation

{$R *.dfm}

uses resolver_form;

procedure TCreateProblemForm.Button1Click(Sender: TObject);
var res, status: integer;
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('field Title is empty');
    exit;
  end;
  if CheckBox1.Checked then
    status := 11
  else
    status := 1;
  res := TResolverPP.ask_create_problem(Edit1.Text, Memo1.Lines.CommaText, status);
  if res = 0 then
  begin
    ShowMessage('Problem successfully created!');
    ResolverForm.upadate_problem_list;
  end
  else
    ShowMessage('Error creating problem(');
  CreateProblemForm.Close;
end;

procedure TCreateProblemForm.Button2Click(Sender: TObject);
begin
  CreateProblemForm.Close;
end;

end.
