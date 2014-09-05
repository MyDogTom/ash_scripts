#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include utils.ahk ; usage of SendCtrlInsToCurrentControl
#include ChangeLayoutAndCopy.ahk
#include runFavoriteApps.ahk ; run or activate favorite applications
#include CreatePatchFromFileList.ahk
#include EnhancedNavigation2.ahk

;#IfWinActive ahk_class TfrmMain ; BT2
;^c::  ;ctrl+c
;#IfWinActive ahk_class TPropertyInspector ; Delphi 7 property inspector window
;^c::  ;ctrl+c
;#IfWinActive ahk_class TEditWindow ;Delphi 7 Code Editor Window
;^c::  ;ctrl+c
;#IfWinActive ahk_class TPLSQLDevForm ;PL/SQL Developer
#IfWinActive
^c::  ;ctrl+c
{
    ;0x419 RU
	changeLayoutAndCopy(0x419)
	;Send, ^{Ins}
Return
}
#IfWinActive ; let other scripts to work with all apps

;copy -> run or activate notepad++ -> open new file -> paste
#c:: ;win+c	
  SendCtrlInsToCurrentControl()
  ;Send, ^c
  ;ClipWait
  Run, notepad++.exe
  WinWaitActive, ahk_class Notepad++
  send, ^n
  send, ^v
return


