unit login_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, resolverpp;

type
  TLoginForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
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
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses resolver_form;

procedure TLoginForm.Button1Click(Sender: TObject);
var res: integer;
begin
  res := TResolverPP.ask_login(Edit1.Text, Edit2.Text);
  if res = 0 then begin
    LoginForm.Close;
    ResolverForm.Show;
  end;
  if res = 1  then
    ShowMessage('Check password');
  if res = 2 then
    ShowMessage('No such user');

end;

procedure TLoginForm.Button2Click(Sender: TObject);
begin
  LoginForm.Close;
end;

end.
