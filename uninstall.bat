@echo off

:: ### Ask for UAC ###

:: Windows XP doesn't have UAC so skip
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName ^| Find "ProductName"') do set WINVER=%%i %%j 
echo %WINVER% | find "XP" > nul && goto commands

:: prompt for elevation
if "%1" == "UAC" goto elevation
(
  echo Set objShell = CreateObject^("Shell.Application"^)
  echo Set objFSO = CreateObject^("Scripting.FileSystemObject"^)
  echo strPath = objFSO.GetParentFolderName^(WScript.ScriptFullName^)
  echo If objFSO.FileExists^("%~0"^) Then
  echo   objShell.ShellExecute "cmd.exe", "/c """"%~0"" UAC ""%~dp0""""", "", "runas", 1
  echo Else
  echo   MsgBox "Script file not found"
  echo End If
) > "%TEMP%\UAC.vbs"
cscript //nologo "%TEMP%\UAC.vbs"
goto :eof
:elevation
del /q "%TEMP%\UAC.vbs"

:commands
:: navigate back to kwm directory
%~d2
cd "%~p2"

:: ### Uninstallation Process ###

if exist C:\Progra~1\K-Meleon\k-meleon.exe (
	set kmpath=C:\Progra~1\K-Meleon\
)
if exist C:\Progra~2\K-Meleon\k-meleon.exe (
	set kmpath=C:\Progra~2\K-Meleon\
)

echo Are you sure you would like to uninstall KWM?
set /p yn="[y,N]: "

if "%yn%" == "Y" (
	set yn=y
)

if %yn% == y (
	del %kmpath%kwm.exe
	del %kmpath%kwm.bat
	shortcuts-unin.bat
	echo.
	echo Uninstall complete. Press any key to exit . . .
	pause>nul
) else (
	echo.
	echo Uninstall aborted. Press any key to exit . . .
	pause>nul
)