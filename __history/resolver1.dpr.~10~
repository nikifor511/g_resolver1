program resolver1;

uses
  Vcl.Forms,
  pre_form in 'pre_form.pas' {PreForm},
  login_form in 'login_form.pas' {LoginForm},
  resolver in 'resolver.pas',
  resolver_form in 'resolver_form.pas' {ResolverForm},
  problem in 'problem.pas',
  create_problem_form in 'create_problem_form.pas' {CreateProblemForm},
  global_variables in 'global_variables.pas',
  html_chat_maker in 'html_chat_maker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPreForm, PreForm);
  Application.CreateForm(TLoginForm, LoginForm);
  Application.CreateForm(TResolverForm, ResolverForm);
  Application.CreateForm(TCreateProblemForm, CreateProblemForm);
  Application.Run;
end.
