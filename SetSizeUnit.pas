unit SetSizeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TSizeForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    WidthUpDown: TUpDown;
    WidthTextBox: TEdit;
    HeightTextBox: TEdit;
    HeightUpDown: TUpDown;
    SaveButton: TButton;
    CancelButton: TButton;
    procedure WidthUpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure HeightUpDownClick(Sender: TObject; Button: TUDBtnType);
    constructor Create(AOwner: TComponent; Width, Height: Integer);
  private
    { Private declarations }
  public
    Width, Height: Integer;
  end;

var
  SizeForm: TSizeForm;

implementation

{$R *.dfm}

constructor TSizeForm.Create(AOwner: TComponent; Width: Integer; Height: Integer);
begin
  inherited Create(AOwner);
  WidthUpDown.Position := Width;
  Self.Width := Width;
  HeightUpDown.Position := Height;
  Self.Height := Height;
end;

procedure TSizeForm.HeightUpDownClick(Sender: TObject; Button: TUDBtnType);
begin
  Height := HeightUpDown.Position;
end;

procedure TSizeForm.WidthUpDownClick(Sender: TObject; Button: TUDBtnType);
begin
  Width := WidthUpDown.Position;
end;

end.
