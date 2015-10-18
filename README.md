# K-Meleon Window Manager
A window management tool for K-Meleon in Microsoft Windows.

## Description
K-Meleon Window Manager is a tiny open-source application (~4MB of RAM) which removes the title bar of K-Meleon, and adds hotkey controls as well as a window button toolbar to K-Meleon.

## Purpose
K-Meleon is a wonderful lightweight fully featured web browser, but one problem is its somewhat clunky outdated reliance on a separate title bar. KWM gives K-Meleon a more minimalistic modern interface similar to Firefox or Chrome by removing the system titlebar and integrating the window buttons into the web browser interface itself.

I originally created this because I was unsatisfied with the currently existing methods of removing the title bar. Using the built in fullscreen settings (or fullscreen2plus) is a workaround that removes the title bar by entering fullscreen mode while leaving the taskbar and toolbars. This is unsatisfactory unless you keep K-Meleon maximized 100% of the time. If you want to have multiple windows on your screen at once, that solution no longer functions, but K-Meleon Window Manager will work under any circumstances.

## Installation
Install the latest versions of K-Meleon and AutoHotkey from http://www.autohotkey.com/. Run install.bat. install.bat will automatically compile and install the application as soon as it is executed (no prompts), but it is still under construction, so shortcuts must be created manually as described starting in step 2 of the autostart section of Manual Installation. After installation is complete, you may remove AutoHotkey.

I will eventually create a binary installer and will upload it to my website (not github, I'll put a link here when it's done). The binary installer will allow you to install KWM without needing AutoHotkey.

You can also manually compile and install the application. See below for more details.

## Usage
Start K-Meleon as normal. The shortcut should have been replaced to a shortcut leading to a batch file which will start KWM automatically with K-Meleon. When KWM is running, it will automatically remove the title bar from any K-Meleon window as soon as it becomes active. KWM will automatically terminate when all K-Meleon windows are closed.

### Window Buttons
During installation, new window buttons ( _ [] X ) are added to K-Meleon as a toolbar. Ensure that the K-Meleon Window Manager toolbar is active, then click and drag it to anywhere you wish (such as the top right of the window). You can right click these buttons for more options. You can also switch them out for OS X style window buttons by modifying your toolbar.cfg file to use the osx bmp variants.

### Tray Icon
KWM creates a tray icon. Right click to see the available actions and settings.

### Hotkeys / Keybinds
* W-L (hold the windows key and then left click): Cycles titlebar state. On the first press, it will bring back the title bar on any activated K-Meleon window, on the next press it will return back to the initial state of the program, and so on.
* W-R (hold the windows key and then right click): Opens window management menu with options such as minimize, maximize/restore, close, and the entire tray menu. By default this hotkey now can be used for any application in Windows, but if you uncomment (delete the ; from) lines ?? and ?? of the ahk file before compiling, it will make it so this hotkey only works in K-Meleon.

## Manual Installation
In case there is a problem with the above installation method, you can install it manually: 

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

### Autostart
To make it start with K-Meleon (KWM quits when all K-Meleon windows are closed, so you will probably want to follow these steps):

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

### Window Buttons: _ [] X 
14. Manually copy all of the text in ```kwm-toolbar.cfg``` to the bottom of ```C:\Program Files (x86)\K-Meleon\browser\defaults\settings\toolbars.cfg```.
15. Make sure the K-Meleon Window Manager toolbar is enabled in K-Meleon and click and drag it to wherever you would like.
