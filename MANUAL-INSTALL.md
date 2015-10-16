
1. Download and install AutoHotkey from http://www.autohotkey.com/. You can uninstall AutoHotkey when you are finished compiling.
2. You have the choice of using AutoHotkey's default icon, or using mine I made for this script:
  a If you wish to have the letter H as the program's icon, navigate to and right click your .ahk file and click "compile," and in the same directory as your .ahk file there will be a new file called kmtbd.exe.
  b. If instead you wish to use my icon (whatever icon you choose will be visible in your tray), follow these steps: 
    1. Then open "Convert .ahk to .exe" which should now be in your start menu under AutoHotkey.
    2. For Source, select the .ahk
    3. For destination, choose a new name and save location (eg. kmtbd.exe)
    4. For Custom Icon, select the .ico file you just downloaded
    5. Click convert, and now you have compiled an .exe file with the name, location, and icon of your choosing.
3. Run the file (double click) and now it is active, all K-Meleon windows will behave in the new way I have described. Without any further work, you must manually start this application when you want it to work.

[i]MORE OPTIONAL STEPS[/i]
There are a few ways you can automate the initiation of my script. You can either have it automatically start whenever K-Meleon starts, or you can set it to start with Windows. I only mention the latter for because it is easier to set up.

To make it start with Windows:
6. Once your .exe file is in a permanent location, right click it and click create shortcut.
7. Move your shortcut to: %AppData%\Microsoft\Windows\Start Menu\Programs\Startup

To make it start with K-Meleon:
6. Move your .exe file to the K-Meleon directory (C:\Program Files (x86)\K-Meleon in 64-bit Windows)
7. Put the following into Notepad:[code]
START km-titlebar-delete.exe
START k-meleon.exe
[/code]8. Save this file in the same directory, call it: km+kmtbd.bat
9. Right click this new batch file and create shortcut.
10. Rename your new shortcut to K-Meleon (or K-Meleon.ink depending on whether you see ".ink" in your file manager)
11. Right click your shortcut and go to properties
12. Click "Change Icon"
13. Browse and navigate to C:\Program Files (x86)\K-Meleon and select k-meleon.exe
14. Select the first icon (or whatever you want) and hit OK, then OK again.
15. Copy this new shortcut to both of these locations, replacing the old shortcuts.
---->C:\ProgramData\Microsoft\Windows\Start Menu\Programs
---->%appdata%\Microsoft\Windows\Start Menu\Programs
16. If you have a desktop (or quick launch in XP) shortcut to K-Meleon, replace it with that one also.
17. If you have K-Meleon pinned to your taskbar (Windows 7, 8), navigate to %appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar
18. There should be a file called something like K-Meleon Web Browser. Copy your newly made shortcut into this directory.
19. If it has the same name as the original, let it overwrite. If they have different names, delete the original and rename yours (only the one in TaskBar) to the name that the original had.
20. Now all of your K-Meleon shortcuts open KM TitleBar Delete along with K-Meleon.
[hr]
[b][u]_ [] X Toolbar[/b][/u]

You must manually add the information from 
