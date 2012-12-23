unit uLex;

interface

uses
  OneHinst,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, IniFiles, ExtCtrls, StringListUnicodeSupport,
  Encoding, ShellApi, Menus;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    tmrRead: TTimer;
    tmrCheckSettings: TTimer;
    MainMenu1: TMainMenu;
    PopupMenu1: TPopupMenu;
    File1: TMenuItem;
    Settings1: TMenuItem;
    Help1: TMenuItem;
    Exit1: TMenuItem;
    Scroll1: TMenuItem;
    About1: TMenuItem;
    Copyselected1: TMenuItem;
    Selectall1: TMenuItem;
    Reload1: TMenuItem;
    Edit1: TMenuItem;
    N1: TMenuItem;
    Openlogs1: TMenuItem;
    OpenL2log1: TMenuItem;
    Clear1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    lblProcess: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tmrReadTimer(Sender: TObject);
    procedure tmrCheckSettingsTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Reload1Click(Sender: TObject);
    procedure Scroll1Click(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
    procedure Copyselected1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Openlogs1Click(Sender: TObject);
    procedure OpenL2log1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Settings:       TIniFile;
  MyDir:          String;
  LogDir:         String;
  LogName:        String;
  LogLast:        TDateTime;
  LogIds:         array of integer;
  LogCommands:    array of string;
  LastChangeTime: String;
  MaxLinesCount:  integer;
  FilterParam:    array of integer;
  FilterValue:    array of string;
  doLog:          boolean;
  AutoScroll:     boolean;
  ShowCommand:    boolean;
implementation

{$R *.dfm}

procedure AddMsg(Str: string; Color: integer);
var
  lt: TSYSTEMTIME;
  LStr: string;
  CarPos: TPoint;

begin
  if (NOT AutoScroll) then
    CarPos := Form1.RichEdit1.CaretPos;

  GetLocalTime(lt);
  LStr := '[' + IntToStr(lt.wDay) + '.';
  if (lt.wMonth < 10) then
    LStr := LStr + '0';
  LStr := LStr + IntToStr(lt.wMonth)+'.' +  IntToStr(lt.wYear)+'-';

  LStr := LStr + IntToStr(lt.wHour)+ ':';
  if (lt.wMinute < 10) then
    LStr := LStr + '0';
  LStr := LStr + IntToStr(lt.wMinute)+ ':';
  if (lt.wSecond < 10) then
    LStr := LStr + '0';
  LStr := LStr + IntToStr(lt.wSecond)+'] ' + Str;
  case Color of
  1 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clBlack;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
  2 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clRed;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
  3 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clGreen;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
  4 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clBlue;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
  end;
  if (AutoScroll) then
  begin
    //Form1.RichEdit1.Perform(EM_SCROLL, SB_PAGEDOWN, 0)
  end
  //else
    //Form1.RichEdit1.CaretPos := CarPos;
end;


procedure AddLog(Str: string; Color: integer);
var
  lt: TSYSTEMTIME;
  log: textfile;
  LStr: string;
  CarPos: TPoint;

begin
  if (NOT AutoScroll) then
    CarPos := Form1.RichEdit1.CaretPos;

  if (doLog) then
  begin
    GetLocalTime(lt);
    if (NOT FileExists(MyDir + 'log')) then
      CreateDirectory(PAnsiChar(MyDir + 'log'), nil);

    LStr := IntToStr(lt.wYear) + '-';
    if (lt.wMonth < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wMonth) + '-';
    if (lt.wDay < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wDay);

    AssignFile(log,MyDir + 'log\' + LStr + '.txt');
    if (FileExists(MyDir + 'log\' + LStr + '.txt')) then
       Append(log)
    else
       Rewrite(log);
    LStr := '[' + IntToStr(lt.wDay) + '.';
    if (lt.wMonth < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wMonth)+'.' +  IntToStr(lt.wYear)+'-';

    LStr := LStr + IntToStr(lt.wHour)+ ':';
    if (lt.wMinute < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wMinute)+ ':';
    if (lt.wSecond < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wSecond)+'] ' + Str;

    case Color of
    1 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clBlack;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
    2 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clRed;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
    3 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clGreen;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
    4 : begin
         with Form1.RichEdit1.SelAttributes do
            begin
              Color := clBlue;
              Style := [fsBold];
            end;
          Form1.RichEdit1.Lines.Add(LStr);
      end;
    end;
    WriteLn(log,Lstr);
    CloseFile(log);
  end
  else
    AddMsg(Str, Color);

  if (AutoScroll) then
  begin
    //Form1.RichEdit1.Perform(EM_SCROLL, SB_PAGEDOWN, 0)
  end
  //else
    //Form1.RichEdit1.CaretPos := CarPos;
end;

procedure AddOnlyLog(Str: string; Color: integer);
var
  lt: TSYSTEMTIME;
  log: textfile;
  LStr: string;
  CarPos: TPoint;

begin
  if (NOT AutoScroll) then
    CarPos := Form1.RichEdit1.CaretPos;

  if (doLog) then
  begin
    GetLocalTime(lt);
    if (NOT FileExists(MyDir + 'log')) then
      CreateDirectory(PAnsiChar(MyDir + 'log'), nil);

    LStr := IntToStr(lt.wYear) + '-';
    if (lt.wMonth < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wMonth) + '-';
    if (lt.wDay < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wDay);

    AssignFile(log,MyDir + 'log\' + LStr + '.txt');
    if (FileExists(MyDir + 'log\' + LStr + '.txt')) then
       Append(log)
    else
       Rewrite(log);
    LStr := '[' + IntToStr(lt.wDay) + '.';
    if (lt.wMonth < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wMonth)+'.' +  IntToStr(lt.wYear)+'-';

    LStr := LStr + IntToStr(lt.wHour)+ ':';
    if (lt.wMinute < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wMinute)+ ':';
    if (lt.wSecond < 10) then
      LStr := LStr + '0';
    LStr := LStr + IntToStr(lt.wSecond)+'] ' + Str;

    WriteLn(log,Lstr);
    CloseFile(log);
  end
  else
    AddMsg(Str, Color);

end;

procedure Explode(var a: array of string; Border, S: string);
var
  S2: string;
  i: Integer;
begin
  i := 0;
  S2 := S + Border;
  repeat
    //setlength(a, i+1);
    try
      a[i] := Copy(S2, 0, Pos(Border, S2) - 1);
    except
    end;
    Delete(S2, 1, Length(a[i] + Border));
    Inc(i);
  until S2 = '';
end;

function InArray(value: integer; arr: array of integer; var index: integer): boolean;
var
  i: integer;
begin
  Result := false;
  Index := -1;
  for i:=0 to Length(arr)-1 do
    if (arr[i] = value) then
    begin
      Index := i;
      Result := true;
      break;
    end
end;

function GetFileDate(FileName: string): string;
var
  FHandle: Integer;
begin
  FHandle := FileOpen(FileName, 0);
  try
    Result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  finally
    FileClose(FHandle);
  end;
end;




procedure TForm1.FormCreate(Sender: TObject);
var
  i, m: integer;
  onStartCommand: string;
begin
  doLog := true;
  LogLast := Now();
  MyDir := ExtractFilePath(Application.ExeName);
  if (FileExists(MyDir+'settings.ini')) then
  begin
    Settings := TIniFile.Create(MyDir+'settings.ini');
    if (Settings.ReadInteger('main', 'doLog', 1) = 0) then
      doLog := false;
    AddLog('Application start', 1);
    AddLog('Load settings succificully', 1);
    LogDir := IncludeTrailingBackslash(Settings.ReadString('path', 'log', '.'));
    for i:=0 to 100 do
    begin
      m := Settings.ReadInteger('commands', 'LogId'+IntToStr(i), 0);
      if (m > 0) then
      begin
        SetLength(LogIds, Length(LogIds)+1);
        SetLength(LogCommands, Length(LogCommands)+1);
        SetLength(FilterParam, Length(FilterParam)+1);
        SetLength(FilterValue, Length(FilterValue)+1);
        LogIds[i] := m;
        LogCommands[i] := Settings.ReadString('commands', 'Command'+IntToStr(i), '');
        FilterParam[i] := Settings.ReadInteger('commands', 'FilterParam'+IntToStr(i), 0);
        FilterValue[i] := Settings.ReadString('commands', 'FilterValue'+IntToStr(i), '');
      end
    end;
    MaxLinesCount := Settings.ReadInteger('main', 'MaxLinesCount', 30);
    LastChangeTime := GetFileDate(MyDir+'settings.ini');
    tmrCheckSettings.Enabled := true;
    onStartCommand := Settings.ReadString('commands', 'OnStart', '');

    if (Settings.ReadInteger('main', 'AutoScroll', 1) = 1) then
    begin
      AutoScroll := true;
      Scroll1.Checked := true;
    end
    else
    begin
      AutoScroll :=  false;
      Scroll1.Checked := false;
    end;

    if (Settings.ReadInteger('main', 'ShowExecCommand', 1) = 1) then
    begin
      ShowCommand := true;
    end
    else
    begin
      ShowCommand :=  false;
    end;

    if (onStartCommand <> '') then
    begin
      AddLog('Execute start-command ' + onStartCommand, 1);
      ShellExecute(Self.Handle, 'open', PChar(onStartCommand), nil, nil, Settings.ReadInteger('commands', 'ShowStartCmd', 0));
    end;
    tmrRead.Enabled := true;
    AddLog('Start monitoring log-file', 1);
  end
  else
  begin
    doLog := false;
    tmrRead.Enabled := false;
    tmrCheckSettings.Enabled := false;
    AddLog('Application start', 1);
    AddLog('ERROR: Not found '+MyDir+'settings.ini', 2);
  end;
end;

procedure TForm1.tmrReadTimer(Sender: TObject);
var
  SR: TSearchRec;
  i, k: Integer;
  LogContent: TStringList;
  Params: array[0..26] of string;
  DateParams: array[0..5] of string;
  sDate: string;
  fs: TFileStream;
  LogChanged: boolean;

begin
  if not DirectoryExists(LogDir) then
    Exit;
  I := FindFirst(LogDir + '*server-in*.log', faAnyFile, SR);
  LogChanged := false;
  try
    while I = 0 do
    begin
      if (SR.Name <> '') and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if SR.Attr <> faDirectory then
        begin
          if (SR.Name <> LogName) AND (FileAge(LogDir + LogName) < FileAge(LogDir + SR.Name)) then
          begin
            LogName := SR.Name;
            LogChanged := true;
          end
        end
      end;
      I := FindNext(SR);
    end;
  finally
    SysUtils.FindClose(SR);
  end;
  if (RichEdit1.Lines.Count + 1 > MaxLinesCount) then
  begin
    RichEdit1.Lines.Delete(0);
  end;
  if (LogChanged) then
    AddLog('Monitoring file ' + LogName, 1);
  LogChanged := false;
  LogContent := TStringList.Create();
  if (FileExists(LogDir + LogName)) then
  begin
    fs := TFileStream.Create(LogDir + LogName, fmOpenRead or fmShareDenyNone);
    LogContent.LoadFromStream(fs);
    OpenL2Log1.Enabled := true;
  end
  else
  begin
    AddLog('File ' + LogDir + LogName + ' not found', 2);
    OpenL2Log1.Enabled := false;
  end;
  fs.Free;


  DateSeparator := '/';
  TimeSeparator := ':';
  LongDateFormat := 'dd/mm/yyyy';

  for i:=0 to LogContent.Count-1 do
  begin
    Explode(Params, ',', LogContent.Strings[i]);
    Explode(DateParams, '/', Params[0]);
    sDate := DateParams[1]+'/'+DateParams[0]+'/'+Copy(Params[0], pos(' ', Params[0])-2, Length(Params[0]));
    if (StrToDateTime(sDate) > LogLast) AND (InArray(StrToInt(trim(Params[1])), LogIds, k)) then
    begin
      if (RichEdit1.Lines.Count + 1 > MaxLinesCount) then
      begin
        RichEdit1.Lines.Delete(0);
      end;
      if (FilterParam[k] = 0) OR (Pos('['+Params[FilterParam[k]]+']', FilterValue[k]) > 0) then
      begin
        AddLog(Params[0] + ' ' + Params[1] + ' ' + Params[2] + ' (' + Params[22] + ') ' + Params[16] + ' [' + Params[6] + ';' + Params[7] + ';' + Params[8] + '] ' + trim(Params[9]), 1);
        if (LogCommands[k] <> '') then
        begin
          if (ShowCommand) then
            AddLog('Execute command ' + LogCommands[k] + ' "' + LogContent.Strings[i] + '" ' + Params[1] + ' ' + Params[2] + ' ' + Params[22] + ' ' +
                Params[6] + ' ' + Params[16] + ' ' + Params[7] + ' ' + Params[8] + ' ' + Params[12] + ' ' +
                Params[13] + ' ' + Params[14] + ' ' + Params[15] + ' ' + Params[16] + ' ' + Params[17] + ' ' +
                Params[18] + ' ' + Params[19] + ' ' + Params[20] + ' ' + Params[21] + ' ' + Params[22] + ' ' +
                Params[23] + ' ' + Params[24] + ' ' + Params[25] + ' ' + Params[26] + ' ' + trim(Params[9]) + '', 1)
          else
            AddOnlyLog('Execute command ' + LogCommands[k] + ' "' + LogContent.Strings[i] + '" ' + Params[1] + ' ' + Params[2] + ' ' + Params[22] + ' ' +
                Params[6] + ' ' + Params[16] + ' ' + Params[7] + ' ' + Params[8] + ' ' + Params[12] + ' ' +
                Params[13] + ' ' + Params[14] + ' ' + Params[15] + ' ' + Params[16] + ' ' + Params[17] + ' ' +
                Params[18] + ' ' + Params[19] + ' ' + Params[20] + ' ' + Params[21] + ' ' + Params[22] + ' ' +
                Params[23] + ' ' + Params[24] + ' ' + Params[25] + ' ' + Params[26] + ' ' + trim(Params[9]) + '', 1);
          ShellExecute(Self.Handle, 'open', PChar(LogCommands[k]), PAnsiChar(' "' + LogContent.Strings[i] + '" ' + Params[1] + ' ' + Params[2] + ' ' + Params[22] + ' ' +
                Params[6] + ' ' + Params[16] + ' ' + Params[7] + ' ' + Params[8] + ' ' + Params[12] + ' ' +
                Params[13] + ' ' + Params[14] + ' ' + Params[15] + ' ' + Params[16] + ' ' + Params[17] + ' ' +
                Params[18] + ' ' + Params[19] + ' ' + Params[20] + ' ' + Params[21] + ' ' + Params[22] + ' ' +
                Params[23] + ' ' + Params[24] + ' ' + Params[25] + ' ' + Params[26] + ' ' + trim(Params[9]) + ''), nil, Settings.ReadInteger('commands', 'ShowCmd'+IntToStr(k), 0));
        end;
        LogLast := StrToDateTime(sDate);
      end;
    end;
  end;
  LogContent.Free;

  if Length(lblProcess.Caption) > 50 then
    lblProcess.Caption := '';
  lblProcess.Caption := lblProcess.Caption + '.';
end;

procedure TForm1.tmrCheckSettingsTimer(Sender: TObject);
var
  i, m: integer;
begin
  if (FileExists(MyDir+'settings.ini') AND (GetFileDate(MyDir+'settings.ini') <> LastChangeTime)) then
  begin
    Settings := TIniFile.Create(MyDir+'settings.ini');
    AddLog('settings.ini changed. Reload settings succificully', 1);
    LogDir := IncludeTrailingBackslash(Settings.ReadString('path', 'log', '.'));
    for i:=0 to 100 do
    begin
      m := Settings.ReadInteger('commands', 'LogId'+IntToStr(i), 0);
      if (m > 0) then
      begin
        SetLength(LogIds, Length(LogIds)+1);
        SetLength(LogCommands, Length(LogCommands)+1);
        SetLength(FilterParam, Length(FilterParam)+1);
        SetLength(FilterValue, Length(FilterValue)+1);
        LogIds[i] := m;
        LogCommands[i] := Settings.ReadString('commands', 'Command'+IntToStr(i), '');
        FilterParam[i] := Settings.ReadInteger('commands', 'FilterParam'+IntToStr(i), 0);
        FilterValue[i] := Settings.ReadString('commands', 'FilterValue'+IntToStr(i), '');
      end
    end;

    if (Settings.ReadInteger('main', 'AutoScroll', 1) = 1) then
    begin
       AutoScroll := true;
       Scroll1.Checked := true;
    end
    else
    begin
      AutoScroll :=  false;
      Scroll1.Checked := false;
    end;

    if (Settings.ReadInteger('main', 'ShowExecCommand', 1) = 1) then
    begin
      ShowCommand := true;
    end
    else
    begin
      ShowCommand :=  false;
    end;
    
    LastChangeTime := GetFileDate(MyDir+'settings.ini');
  end
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  onCloseCommand: string;
begin
  if (FileExists(MyDir+'settings.ini')) then
  begin
    onCloseCommand := Settings.ReadString('commands', 'OnClose', '');
    if (onCloseCommand <> '') then
    begin
      AddLog('Execute close-command ' + onCloseCommand, 1);
      ShellExecute(Self.Handle, 'open', PChar(onCloseCommand), nil, nil, Settings.ReadInteger('commands', 'ShowCloseCmd', 0));
    end
  end
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('Are you sure to close application?',mtConfirmation,[mbYes,mbNo],0) = mrYes;
  if (CanClose) then
    AddLog('Application closed by user', 1);
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  ShellExecute(Self.Handle, 'open', PChar(MyDir + 'settings.ini'), nil, nil, 1);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Reload1Click(Sender: TObject);
var
  i, m: integer;
begin
  if (FileExists(MyDir+'settings.ini')) then
  begin
    Settings := TIniFile.Create(MyDir+'settings.ini');
    AddLog('settings.ini reloaded manually', 1);
    LogDir := IncludeTrailingBackslash(Settings.ReadString('path', 'log', '.'));
    for i:=0 to 100 do
    begin
      m := Settings.ReadInteger('commands', 'LogId'+IntToStr(i), 0);
      if (m > 0) then
      begin
        SetLength(LogIds, Length(LogIds)+1);
        SetLength(LogCommands, Length(LogCommands)+1);
        SetLength(FilterParam, Length(FilterParam)+1);
        SetLength(FilterValue, Length(FilterValue)+1);
        LogIds[i] := m;
        LogCommands[i] := Settings.ReadString('commands', 'Command'+IntToStr(i), '');
        FilterParam[i] := Settings.ReadInteger('commands', 'FilterParam'+IntToStr(i), 0);
        FilterValue[i] := Settings.ReadString('commands', 'FilterValue'+IntToStr(i), '');
      end
    end;

    if (Settings.ReadInteger('main', 'AutoScroll', 1) = 1) then
    begin
       AutoScroll := true;
       Scroll1.Checked := true;
    end
    else
    begin
      AutoScroll :=  false;
      Scroll1.Checked := false;
    end;

    if (Settings.ReadInteger('main', 'ShowExecCommand', 1) = 1) then
    begin
      ShowCommand := true;
    end
    else
    begin
      ShowCommand :=  false;
    end;
    
    LastChangeTime := GetFileDate(MyDir+'settings.ini');
  end
end;

procedure TForm1.Scroll1Click(Sender: TObject);
begin
  if (Scroll1.Checked) then
  begin
    AutoScroll := false;
    Scroll1.Checked := false;
    Settings.WriteInteger('main', 'AutoScroll', 1);
    LastChangeTime := GetFileDate(MyDir+'settings.ini');
  end
  else
  begin
    AutoScroll :=  true;
    Scroll1.Checked := true;
    Settings.WriteInteger('main', 'AutoScroll', 1);
    LastChangeTime := GetFileDate(MyDir+'settings.ini');
  end;
end;

procedure TForm1.Selectall1Click(Sender: TObject);
begin
  RichEdit1.SelectAll;
end;

procedure TForm1.Copyselected1Click(Sender: TObject);
begin
  RichEdit1.CopyToClipboard;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShowMessage(Form1.Caption + #13#10 + 'Author: vanchester' + #13#10 + '2011 (c)');
end;

procedure TForm1.Openlogs1Click(Sender: TObject);
begin
  ShellExecute(Self.Handle, 'open', PChar(MyDir + 'log'), nil, nil, 1)
end;

procedure TForm1.OpenL2log1Click(Sender: TObject);
begin
  if (FileExists(LogDir + LogName)) then
    ShellExecute(Self.Handle, 'open', PChar(LogDir + LogName), nil, nil, 1)
end;

procedure TForm1.Clear1Click(Sender: TObject);
begin
  RichEdit1.Clear;
end;

end.
