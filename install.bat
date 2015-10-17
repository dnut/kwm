:: ================   K-Meleon Window Manager 0.1.0    ================ ::
:: ==================   Copyright 2015 Drew Nutter   ================== ::
::                                                                      ::
:: This program is free software: you can redistribute it and/or modify ::
:: it under the terms of the GNU General Public License as published by ::
:: the Free Software Foundation, either version 3 of the License, or    ::
:: (at your option) any later version.                                  ::
::                                                                      ::
:: This program is distributed in the hope that it will be useful,      ::
:: but WITHOUT ANY WARRANTY:: without even the implied warranty of      ::
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        ::
:: GNU General Public License for more details.                         ::
::                                                                      ::
:: You should have received a copy of the GNU General Public License    ::
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.::
:: ==================================================================== ::

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

:: ### Installation Process ###

:: Initialize Variables
setlocal EnableDelayedExpansion
set kmpath=false
set ahpath=false
set install=true

:: Check for dependencies
echo Locating K-meleon . . .
if exist C:\Progra~1\K-Meleon\k-meleon.exe (
	set kmpath=C:\Progra~1\K-Meleon\
)
if exist C:\Progra~2\K-Meleon\k-meleon.exe (
	set kmpath=C:\Progra~2\K-Meleon\
)
if %kmpath% == false (
	echo.
	echo K-Meleon not found! If you have installed K-Meleon in a nonstandard location,
	echo this installation batch file will not work without being modified.
	set install=false
) else (
	echo K-Meleon located at %kmpath%k-meleon.exe.
)

echo.
echo Locating AutoHotkey compiler . . .
if exist C:\Progra~1\AutoHotkey\Compiler\Ahk2Exe.exe (
	set ahpath=C:\Progra~1\AutoHotkey\Compiler\Ahk2Exe.exe
)
if exist C:\Progra~2\AutoHotkey\Compiler\Ahk2Exe.exe (
	set ahpath=C:\Progra~2\AutoHotkey\Compiler\Ahk2Exe.exe
)
if %ahpath% == false (
	echo.
	echo AutoHotkey compiler not found! If you have installed it in a nonstandard location,
	echo this installation batch file will not work without being modified.
	set install=false
) else (
	echo AutoHotkey compiler located at %ahpath%.
)


:: Compile and Install KWM
if %install% == true (

	echo.
	echo Compiling ahk, merging with icon . . .
	%ahpath% /in kwm.ahk /out kwm.exe /icon k-meleon.ico

	echo.
	echo Copying exe and bat to K-Meleon folder, ini to Appdata . . .
	copy kwm.exe %kmpath%\kwm.exe
	copy kwm.bat %kmpath%\kwm.bat
	copy kwm.ini %appdata%\K-meleon\kwm.ini

	echo.
	echo Copying window buttons to all skin folders . . .
    for /r "%kmpath%\skins" %%i in (.) DO (
    	@copy "kwm*.bmp" "%%i"
    )

	echo.
	echo Adding kwm-toolbar.cfg to toolbars.cfg . . .
	if exist %kmpath%browser\defaults\settings\toolbars.cfg.orig (
    	rem file exists, meaning kwm has already been installed,
	    rem and the pre-kwm file has already been backed up.
	) else (
	    copy %kmpath%browser\defaults\settings\toolbars.cfg %kmpath%browser\defaults\settings\toolbars.cfg.orig
	)
	copy %kmpath%browser\defaults\settings\toolbars.cfg %kmpath%browser\defaults\settings\toolbars.cfg.bak
	type %kmpath%browser\defaults\settings\toolbars.cfg.bak | findstr /v #kwm > %kmpath%browser\defaults\settings\toolbars.cfg
	type kwm-toolbar.cfg >> %kmpath%browser\defaults\settings\toolbars.cfg

	echo.
	echo Creating shortcuts . . .
	shortcuts.bat
	:: For some reason this code wouldn't work embedded into this batch script.
	:: I couldn't figure out why, but it works when called as a separate file.

	echo.
	echo Installation complete. Check above for errors just in case. Press any key to exit . . .
	pause>nul

) else (
	echo.
	echo Installation aborted. Press any key to exit . . .
	pause>nul
)