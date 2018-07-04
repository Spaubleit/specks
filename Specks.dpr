program Specks;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  SetSizeUnit in 'SetSizeUnit.pas' {SizeForm},
  OKCANCL1 in 'c:\program files (x86)\embarcadero\studio\19.0\ObjRepos\EN\DelphiWin32\OKCANCL1.PAS' {OKBottomDlg},
  WidDialogUnit in 'WidDialogUnit.pas' {WinDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSizeForm, SizeForm);
  Application.CreateForm(TWinDialog, WinDialog);
  Application.Run;
end.
