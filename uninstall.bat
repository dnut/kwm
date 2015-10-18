@echo off


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