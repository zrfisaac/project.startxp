unit main_form;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ComCtrls,
  ActnList,
  ExtCtrls,
  StdCtrls,
  Windows,
  Buttons,
  Menus,
  Types,
  LCLType;

type

  { TMainForm }

  TMainForm = class(TForm)
    acAction: TActionList;
    acDebug: TAction;
    miDebug: TMenuItem;
    pnBack01: TPanel;
    pmStart: TPopupMenu;
    SpeedButton1: TSpeedButton;
    ToolBar1: TToolBar;
    procedure acDebugExecute(Sender: TObject);
    procedure btMenu01Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  public
    procedure fnTaskbarHide;
    procedure fnTaskbarShow;
  end;

var
  MainForm: TMainForm;

var
  hwTaskbar: HWND;

implementation

uses
  main_data;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;

  // # : - data
  if not Assigned(MainData) then
    MainData := TMainData.Create(Application);

  // # : - hide
  Self.fnTaskbarHide;

  // # : - style
  Self.BorderStyle := bsNone;
  Self.Left := 0;
  Self.Height := 48;
  Self.Width := Screen.Width;
  Self.Top := Screen.Height - Self.Height;
  //Self.pnMenu01.BevelOuter := bvNone;
  //Self.btMenu01.Align := alClient;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
  P: TPoint;
begin
  // Get the button's screen coordinates
  P := SpeedButton1.ClientToScreen(Types.Point(0, SpeedButton1.Height));

  // Show the popup menu below the button
  pmStart.PopUp(P.X, P.Y - 44);
end;

procedure TMainForm.fnTaskbarHide;
begin
  hwTaskbar := FindWindow('Shell_TrayWnd', nil);
  if (hwTaskbar <> 0) then
    ShowWindow(hwTaskbar, SW_HIDE);
end;

procedure TMainForm.fnTaskbarShow;
begin
  if (hwTaskbar <> 0) then
    ShowWindow(hwTaskbar, SW_SHOW);
end;

procedure TMainForm.acDebugExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TMainForm.btMenu01Click(Sender: TObject);
//var
  //_vP01: TPoint;
begin
  // Get the button's screen coordinates
  //_vP01 := btMenu01.ClientToScreen(Point(0, btMenu01.Height));
  //pmStart.PopUp(_vP01.X, _vP01.Y);
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  // # : - show
  Self.fnTaskbarShow;
end;

end.

