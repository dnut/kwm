if exist C:\Progra~1\K-Meleon\k-meleon.exe (
	set kmpath=C:\Progra~1\K-Meleon\
)
if exist C:\Progra~2\K-Meleon\k-meleon.exe (
	set kmpath=C:\Progra~2\K-Meleon\
)

	echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
	echo sLinkFile = "k-meleon.lnk" >> CreateShortcut.vbs
	echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
	echo oLink.TargetPath = "%kmpath%kwm.bat" >> CreateShortcut.vbs
	echo oLink.IconLocation = "%kmpath%k-meleon.exe, 0" >> CreateShortcut.vbs
	echo oLink.WorkingDirectory = "%kmpath%" >> CreateShortcut.vbs
	echo oLink.Save >> CreateShortcut.vbs
	cscript CreateShortcut.vbs
	del CreateShortcut.vbs
	
	copy k-meleon.lnk %userprofile%\Desktop\K-Meleon.lnk
	if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\K-Meleon.lnk" (
		copy k-meleon.lnk "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\K-Meleon.lnk"
	)
	if exist "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\K-Meleon.lnk" (
		copy k-meleon.lnk "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\K-Meleon.lnk"
	)