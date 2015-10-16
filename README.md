# K-Meleon Window Manager
A window management tool for K-Meleon in Microsoft Windows.

## Description
K-Meleon Window Manager is a tiny open-source application (~4MB of RAM) which removes the title bar of K-Meleon, and adds hotkey controls as well as a window button toolbar to K-Meleon.

## Purpose
I created this because I was unsatisfied with the currently existing methods of removing the title bar. Using the built in fullscreen settings (or fullscreen2plus) is a workaround that removes the title bar by entering fullscreen mode while leaving the taskbar and toolbars. This is unsatisfactory unless you keep K-Meleon maximized 100% of the time. If you want to have multiple windows on your screen at once, that solution no longer functions, but K-Meleon Window Manager will work under any circumstances.

## Installation
Install AutoHotkey. Run install.bat (this file is currently under construction, do not use). install.bat will automatically compile and install the application.

You can also manually compile and install the application. See manual-install.md for more details

## Usage
Start K-Meleon as normal. The shortcut should have been replaced to a shortcut leading to a batch file which will start KWM automatically with K-Meleon. When KWM is running, it will automatically remove the title bar from any K-Meleon window as soon as it becomes active.

### Window Buttons
During installation, new window buttons ( _ [] X ) are added to K-Meleon as a toolbar. Ensure that the K-Meleon Window Manager toolbar is active, then click and drag it to anywhere you wish (such as the top right of the window). You can right click these buttons for more options. You can also switch them out for OS X style window buttons by modifying your toolbar.cfg file to use the osx bmp variants.

### Tray Icon
KWM creates a tray icon. Right click to see the available actions and settings.

### Hotkeys / Keybinds
* W-L (hold the windows key and then left click): Cycles titlebar state. On the first press, it will bring back the title bar on any activated K-Meleon window, on the next press it will return back to the initial state of the program, and so on.
* W-R (hold the windows key and then right click): Opens window management menu with options such as minimize, maximize/restore, close, and the entire tray menu. By default this hotkey now can be used for any application in Windows, but if you uncomment (delete the ; from) lines ?? and ?? of the ahk file before compiling, it will make it so this hotkey only works in K-Meleon.