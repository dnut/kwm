; ================   K-Meleon Window Manager 0.1.0    ================ ;
; ==================   Copyright 2015 Drew Nutter   ================== ;
;                                                                      ;
; This program is free software: you can redistribute it and/or modify ;
; it under the terms of the GNU General Public License as published by ;
; the Free Software Foundation, either version 3 of the License, or    ;
; (at your option) any later version.                                  ;
;                                                                      ;
; This program is distributed in the hope that it will be useful,      ;
; but WITHOUT ANY WARRANTY; without even the implied warranty of       ;
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        ;
; GNU General Public License for more details.                         ;
;                                                                      ;
; You should have received a copy of the GNU General Public License    ;
; along with this program.  If not, see <http://www.gnu.org/licenses/>.;
; ==================================================================== ;

#SingleInstance ignore             ; Prevent additional instances of the same script.
#Persistent                        ; Keep it going.
#NoEnv                             ; Ensure smooth operation.

; Have this program close (on start) and open (on exit) Window Controller to maintain consistency without interference.

; Initialize configuration settings
IniRead, confirm, %A_AppData%\K-Meleon\kwm.ini,config,confirm ; When set, dialog confirms K-Meleon exit (not default).
IniRead, global, %A_AppData%\K-Meleon\kwm.ini,config,global   ; When set, max/restore hotkey affects all windows (not default).

; Initialize variables.
flag := 0                          ; No flag means go ahead and remove title bar.
startupcounter := 0                ; This is used to prevent kmtbd from closing before the K-Meleon window loads.                      
leave :=0                          ; Used to permit K-Meleon exit.
stylevar := 0

; Tray Menu
Menu, tray, tip, K-Meleon Window Manager
Menu, tray, nostandard
menu, tray, add, New Window, openfn
menu, tray, add
menu, tray, add, Enable Title Bar, enabar
menu, tray, add, Remove Title Bar, remobar
menu, tray, add, Suspend Hotkeys, SuspendFn
menu, tray, add
menu, tray, add, Settings, SettingsFn
menu, tray, add, Help, HelpFn
menu, tray, add
menu, tray, add, Exit K-Meleon Window Manager, ExitFn
menu, tray, add, Exit K-Meleon, ExitAllFn

; Window Menu
menu, window, add, Restore, WinRestoreFn
;menu, window, add, Move,
;menu, window, add, Size,
menu, window, add, Minimize, WinMinimizeFn
menu, window, add, Maximize, WinMaximizeFn
menu, window, add
menu, window, add, Close, WinCloseFn
menu, window, add
menu, window, add, K-Meleon Window Manager, :tray

; Main Code
SetTimer, fix_k-meleon, 5          ; Loop the function.

; These are the hotkeys which control K-Meleon window behavior.
LWIN & LButton::
  if ( global = 0 OR WinActive("ahk_class KMeleon Browser Window") )
  {
    flag := !flag                    ; Cycle flag state (to remove or replace k_meleon title bar).
  }
  WinGet, stylevar, Style, A
  if ( stylevar := +0xC00000 )
  {
	WinSet, Style, -0xC00000, A
  }
  else {
  WinSet, Style, !stylevar, A                   ; ( stylevar := +0xC00000 AND global = 1 )
  }
  return

LWIN & RButton::
  if ( WinActive("ahk_class KMeleon Browser Window") OR global = 1)
  {                                ; Only use in K-Meleon.
    menu, window, show
  }
  return
  
LWIN & MButton::                   ; Cycle maximized/restore using windows key plus right click.
  if ( WinActive("ahk_class KMeleon Browser Window") OR global = 1)
  {                                ; Only use min/max hotkey in K-Meleon.
    WinGet, maximized, MinMax, A   ; Check if it's maximized.
    if (maximized)                 ; If maximized,
      WinRestore, A                ; restore the window.
    else                           ; If restored,
      WinMaximize, A               ; maximize the window.
  }
  return

return
  
; Define Functions
WinRestoreFn:
  WinRestore, A
  return
WinMinimizeFn:
  WinMinimize, A
  return
WinMaximizeFn:
  WinMaximize, A
  return
WinCloseFn:
  WinClose, A
  return
openfn:
  run, k-meleon.exe
  return
enabar:
  flag := 1
  return
remobar:
  flag := 0
  return

SettingsFn:
  MsgBox,0x1024, K-Meleon Window Manager Settings, Would you like KWM to display a confirmation dialog before closing K-Meleon?
  ifMsgBox Yes
  {
    confirm := 1
	IniWrite, 1, %A_AppData%\K-Meleon\kwm.ini,config,confirm
  }
  ifMsgBox No
  {
    confirm := 0
	IniWrite, 0, %A_AppData%\K-Meleon\kwm.ini,config,confirm
  }
  MsgBox,0x1024, Settings (This session only), Would you like the Maximize/Restore hotkey to work for all windows?
  ifMsgBox Yes
  {
    global := 1
	IniWrite, 1, %A_AppData%\K-Meleon\kwm.ini,config,global
  }
  ifMsgBox No
  {
    global := 0
	IniWrite, 0, %A_AppData%\K-Meleon\kwm.ini,config,global
  }
  return

HelpFn:
  MsgBox,0x1040, K-Meleon Window Manager Help,
    (
Remove or replace the title bar:
  + Hold the left windows key and then left click anywhere.
                      ------- OR -------
  + Right click the tray icon and select Enable or Remove.

Maximize or restore the window:
  Hold the left windows key and then right click anywhere
  in the window. If K-Meleon is maximized, it will restore
  (shrink); if it is restored, it will maximize. You can make
  this setting global (so that it works not only in K-Meleon,
  but everywhere) via the settings.
 
Settings persist from session to session as long as the K-Meleon\kmdb
directory remains intact.
	)
  MsgBox,0x1044, K-Meleon Window Manager Help, Would you like to view the online documentation?
  ifMsgBox Yes
    run, https://www.google.com/search?q=%22km%20window%20controller%22&cad=h
  return

SuspendFn:
  Suspend
  return
ExitFn:
  exitapp
  return
ExitAllFn:
  if ( confirm = 1 )
  {
    MsgBox,0x1031, WARNING, This will close ALL K-Meleon windows.
	ifMsgBox OK
    {
      leave = 1
    }
  }
  if ( leave = 1 OR confirm = 0 )
  {
    SetTimer, ExitOneKM, 1
  }
  return
ExitOneKM:
  if ( WinExist("ahk_class KMeleon Browser Window") )
  {
    WinClose, ahk_class KMeleon Browser Window
  }
  else
  {
    ExitApp
  }
  return

fix_k-meleon:                      ; Primary function
DetectHiddenWindows, on            ; Not really necessary, but might help.
if ( WinActive("ahk_class KMeleon Browser Window") )
{                                  ; Only alter title bar in K-Meleon.
  if (flag = 0)                    ; Flag state 0?
  {
    WinSet, Style, -0xC00000, A    ; Remove title bar from window.
    return
  }
  elseif (flag = 1)                ; Flag state 1?
  {
    WinSet, Style, +0xC00000, A    ; Add title bar to window.
    return
  }
}

; The rest of this function is used to auto-exit kmtbd, it exits if no K-Meleon windows are open.
if ( startupcounter < 500 )         ; Wait a while after starting before thinking about exiting.
{
  startupcounter := startupcounter + 1
}
else
{
  IfWinNotExist, ahk_class KMeleon Browser Window      ; K-Meleon isn't running?
  {
    Sleep, 100                                         ; Give it a moment to be absolutely sure.
    IfWinNotExist, ahk_class KMeleon Browser Window    ; K-Meleon still isn't running?
    {
      ExitApp
    }
  }
}
return