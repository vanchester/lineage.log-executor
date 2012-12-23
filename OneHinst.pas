unit OneHinst;
interface

implementation
uses
  Windows;
var
  Mutex : THandle;
  MutexName : array[0..255] of Char;

function StopLoading : boolean;
var
  L,I : integer;
begin
  // � �������� ����������� ����� �������� ���������� ������ ����
  // � ������������ ����� ����������
  L := GetModuleFileName(MainInstance,MutexName,SizeOf(MutexName));
  // � ����� �������� ������ ������������ �������� �����, �������
  // �������� �� �� ������
  for I := 0 to L - 1 do
    if MutexName[I] = '\' then
    begin
      MutexName[I] := '/';
    end;
  Mutex := CreateMutex(nil,false,MutexName);

  Result := (Mutex = 0) or // ���� ������� �� ������� �������
  (GetLastError = ERROR_ALREADY_EXISTS); // ���� ������� ��� ����������
end;

procedure ShowErrMsg;
const
  PROGRAM_ALREADY_RUN = 'Programm already running';
begin
  MessageBox(0,PROGRAM_ALREADY_RUN,MutexName, MB_ICONSTOP or MB_OK);
end;

initialization
  if StopLoading then
  begin
    ShowErrMsg;
    // ��� ��� ������� ������������� ��� �� �������������, ��
    // �������� ���������� ��� ���������� ��������� Halt -
    // finalization ��� ����� ����������
    halt;
  end;
finalization
  if Mutex <> 0 then
    CloseHandle(Mutex);
end.
 