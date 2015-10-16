1. Download and install AutoHotkey from http://www.autohotkey.com/. You can uninstall AutoHotkey when you are finished compiling.
2. You have the choice of using AutoHotkey's default icon, or using the defaut K-Meleon icon:
  1. If you wish to have the letter H as the program's icon, navigate to and right click your .ahk file and click "compile," and in the same directory as your .ahk file there will be a new file called kmtbd.exe.
  2. If instead you wish to use my icon (whatever icon you choose will be visible in your tray), follow these steps: 
    1. Then open "Convert .ahk to .exe" which should now be in your start menu under AutoHotkey.
    2. For Source, select the ```kwm.ahk```
    3. For destination, choose a new name and save location (```kwm.exe```)
    4. For Custom Icon, select ```k-meleon.ico```
    5. Click convert, and now you have compiled an .exe file with the name, location, and icon of your choosing.
3. Run the file (double click) and now it is active, all K-Meleon windows will behave in the new way I have described. Without any further work, you must manually start this application when you want it to work.
4. To make it start with K-Meleon (KWM quits when all K-Meleon windows are closed, so you will probably want to follow these steps):
  1. Move kwm.exe and ```kwm.bat``` to the K-Meleon directory (```C:\Program Files (x86)\K-Meleon``` in 64-bit Windows)
  2. Right click the batch file and create a shortcut.
  3. Rename your new shortcut to ```K-Meleon.ink```
  4. Right click the shortcut and go to properties
  5. Click "Change Icon"
  6. Browse and navigate to ```C:\Program Files (x86)\K-Meleon``` and select ```k-meleon.exe```
  7. Select the first icon (or whatever you want) and hit OK, then OK again.
  8. Copy this new shortcut to both of these locations, replacing the old shortcuts.
    * ---->```C:\ProgramData\Microsoft\Windows\Start Menu\Programs```
    * ---->```%appdata%\Microsoft\Windows\Start Menu\Programs```
  9. If you have a desktop (or quick launch in XP) shortcut to K-Meleon, replace it with that one also.
  10. If you have K-Meleon pinned to your taskbar (Windows 7, 8, 10), navigate to ```%appdata%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar```
  11. There should be a file called something like K-Meleon Web Browser. Copy your newly made shortcut into this directory.
  12. If it has the same name as the original, let it overwrite. If they have different names, delete the original and rename yours (only the one in TaskBar) to the name that the original had.
  13. Now all of your K-Meleon shortcuts open KM TitleBar Delete along with K-Meleon.

## Window Buttons: _ [] X 
You must manually copy all of the text in ```kwm-toolbar.cfg``` to the bottom of ```C:\Program Files (x86)\K-Meleon\browser\defaults\settings\toolbars.cfg```. Enable to toolbar in K-Meleon and click and drag it to wherever you would like.
