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
  // В качестве уникального имени мьютекса используем полный путь
  // к исполняемому файлу приложения
  L := GetModuleFileName(MainInstance,MutexName,SizeOf(MutexName));
  // В имени мьютекса нельзя использовать обратные слэши, поэтому
  // заменяем их на прямые
  for I := 0 to L - 1 do
    if MutexName[I] = '\' then
    begin
      MutexName[I] := '/';
    end;
  Mutex := CreateMutex(nil,false,MutexName);

  Result := (Mutex = 0) or // Если мьютекс не удалось создать
  (GetLastError = ERROR_ALREADY_EXISTS); // Если мьютекс уже существует
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
    // Так как никаких инициализаций еще не производилось, то
    // спокойно используем для завершения программы Halt -
    // finalization все равно выполнится
    halt;
  end;
finalization
  if Mutex <> 0 then
    CloseHandle(Mutex);
end.
 