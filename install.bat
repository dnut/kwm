@echo off
rem This installer does not contain automatic verifications. 
rem This will be added in a future update.

echo Have you installed the latest version of AutoHotkey? If
echo you lie, the installation will still be attempted, but
echo no KWM binary will be created and the application will
echo not function properly. 
set /p yn="[y,N]?"
if "%yn%"=="Y" (
	set yn=y
)

if "%yn%"=="y" (
	echo Compiling ahk, merging with icon . . .


	echo Copying exe and bat to K-Meleon folder . . .


	echo Copying window buttons to all skin folders . . .



	echo Adding kwm-toolbar.cfg to toolbars.cfg
	if browser\defaults\settings\exist toolbars.cfg.orig (
    	rem file exists, meaning kwm has already been installed,
	    rem and the pre-kwm file has already been backed up.
	) else (
	    copy browser\defaults\settings\toolbars.cfg browser\defaults\settings\toolbars.cfg.orig
	)
	copy browser\defaults\settings\toolbars.cfg browser\defaults\settings\toolbars.cfg.bak
	type toolbars.cfg.bak | findstr /v #kwm > toolbars.cfg
	type kwm-toolbar.cfg >> browser\defaults\settings\toolbars.cfg


	echo Overwriting shortcuts . . .

	echo.
	echo Installation complete! Press any key to exit . . .
	pause>nul

) else (
	echo Installation aborted. Press any key to exit . . .
	pause>nul
)