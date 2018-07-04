unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Generics.Collections, SetSizeUnit, WidDialogUnit;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Update: TMenuItem;
    SetSize: TMenuItem;
    MainGrid: TGridPanel;
    function WinCheck: Boolean;
    procedure Swap(i1, j1, i2, j2: Integer);
    procedure UpdateClick(Sender: TObject);
    procedure DisableButtons;
    procedure ButtonClick(Sender: TObject);
    procedure GetRowColumn(const control: TControl; var column, row: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SetSizeClick(Sender: TObject);
  private
    total, width, height: Integer;
    grid: array of array of integer;
    buttonGrid: array of array of TButton;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}                                       

procedure Shuffle(var numbers: TList<Integer>);
var
  i: Integer;
begin
  for i := numbers.Count - 1 downto 1 do
    numbers.Exchange(i, Random(i + 1));
end;

function TForm1.WinCheck: Boolean;
var
  i, j, counter: Integer;
begin
  counter := 1;
  for i := 0 to height - 1 do
    for j := 0 to width - 1 do
      if grid[i][j] <> counter then begin
        WinCheck := false;
        exit;
      end else begin
        Inc(counter);
      end;
  WinCheck := true;
end;

procedure TForm1.SetSizeClick(Sender: TObject);
var
  sizeForm: TSizeForm;
begin
  sizeForm := TSizeForm.Create(self, width, height);
  if (sizeForm.ShowModal = mrYes) then begin
    width := sizeForm.Width;
    height := sizeForm.Height;
    total := width * height;
    UpdateClick(nil);
  end;
end;

procedure TForm1.Swap(i1, j1, i2, j2: Integer);
var
  buf: Integer;
  bufString: String;
begin
  buf := grid[i1][j1];
  grid[i1][j1] := grid[i2][j2];
  grid[i2][j2] := buf;
  bufString := buttonGrid[i1][j1].Caption;
  buttonGrid[i1][j1].Caption := buttonGrid[i2][j2].Caption;
  buttonGrid[i2][j2].Caption := bufString;
end;

procedure TForm1.DisableButtons;
var
  i, j, column, row: Integer;
begin
  column := - 1;
  row := - 1;
  for i := 0 to height - 1 do
    for j := 0 to width - 1 do
      if grid[i][j] = total then begin
        row := i;
        column := j;
      end;
  for i := 0 to height - 1 do
    for j := 0 to width - 1 do
      buttonGrid[i][j].Enabled := false;   
  if column > 0 then
    buttonGrid[row][column - 1].Enabled := true;
  if column < width - 1 then
    buttonGrid[row][column + 1].Enabled := true;
  if row > 0 then
    buttonGrid[Row - 1][column].Enabled := true;
  if row < height - 1 then
    buttonGrid[row + 1][column].Enabled := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  width := 4;
  height := 4;
  total := width * height;
  UpdateClick(nil);
end;

procedure TForm1.ButtonClick(Sender: TObject);
var
  row, column: Integer;
  winDialog: TWinDialog;
begin
  row := -1;
  column := -1;
  GetRowColumn(Sender as TControl, column, row);
  if (row > -1) then begin
    if (row > 0) and (grid[row - 1][column] = total) then
      Swap(row, column, row - 1, column);
    if (row < height - 1) and (grid[row + 1][column] = total) then
      Swap(row, column, row + 1, column);
    if (column > 0) and (grid[row][column - 1] = total) then
      Swap(row, column, row, column - 1);
    if (column < width - 1) and (grid[row][column + 1] = total) then
      Swap(row, column, row, column + 1);
  end;
  DisableButtons;
  if WinCheck then begin
    winDialog := TWinDialog.Create(self);
    if winDialog.ShowModal = mrOk then
      UpdateClick(nil)
    else
      Close;
  end;
end;

procedure TForm1.GetRowColumn(const control: TControl; var column, row: Integer);
var
  index: Integer;
begin
  if (control.Parent is TGridPanel) then begin
    index := MainGrid.ControlCollection.IndexOf(control);
    if index > -1 then begin
      column := MainGrid.ControlCollection[index].Column;
      row := MainGrid.ControlCollection[index].Row
    end;
  end;
end;

procedure TForm1.UpdateClick(Sender: TObject);
var
  sideSize: Integer;
  i, j, counter: Integer;
  columnItem: TColumnItem;
  button: TButton;
  numbers: TList<Integer>;
begin
  MainGrid.Destroy;
  MainGrid := TGridPanel.Create(Self);
  MainGrid.Parent := Self;
  MainGrid.Align := alClient;


  MainGrid.ColumnCollection.Clear;
  MainGrid.RowCollection.Clear;

  // Создаём колонки и строки сетки
  for i := 1 to width do
    MainGrid.ColumnCollection.Add;
  for i := 1 to height do
      MainGrid.RowCollection.Add;

  // Задаём ширину колонок
  MainGrid.ColumnCollection.BeginUpdate;
  for i := 0 to width - 1 do begin
    MainGrid.ColumnCollection[i].Value := 0;
    MainGrid.ColumnCollection[i].SizeStyle := ssPercent;
  end;
  MainGrid.ColumnCollection.EndUpdate;

  // Задаём высоту строк
  MainGrid.RowCollection.BeginUpdate;
  for i := 0 to height - 1 do begin
    MainGrid.RowCollection[i].Value := 0;
    MainGrid.RowCollection[i].SizeStyle := ssPercent;
  end;
  MainGrid.RowCollection.EndUpdate;

  // Генерация списка
  numbers := TList<Integer>.Create;
  for i := 1 to total do begin
    numbers.Add(i);
  end;
  Shuffle(numbers);

  // Заполнение массива
  SetLength(grid, height, width);
  counter := 0;
  for i := 0 to height - 1 do begin
    for j := 0 to width - 1 do begin
      grid[i][j] := numbers[counter];
      Inc(counter);
    end;
  end;

  // Заполнение сетки кнопками
  setLength(buttonGrid, height, width);
  for i := 0 to height - 1 do begin
    for j := 0 to width - 1 do begin
      button := TButton.Create(MainGrid);
      buttonGrid[i][j] := button;
      if (grid[i][j] <> total) then
        button.Caption := IntToStr(grid[i][j])
      else
        button.Enabled := false;
      button.Parent := MainGrid;
      button.Align := alClient;
      button.OnClick := ButtonClick;
      MainGrid.ControlCollection.AddControl(button);
    end;
  end;

  DisableButtons;
end;

end.
