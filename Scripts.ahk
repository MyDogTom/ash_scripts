#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include utils.ahk


!+b::
	if not WinExist( "ahk_class TMailerForm" )
		run, "d:\Program Files\The Bat!\thebat.exe"
	WinActivate
	Return

; Alt-Shift-W (Run or activate Total Commander)
!+w::
	if not WinExist( "ahk_class TTOTAL_CMD" )
		;Run "%COMMANDER_PATH%\Totalcmd.exe"
		run, "D:\Program Files\Total Commander\TOTALCMD.EXE"
	WinActivate
Return
	
#c::
  ;Send, ^c
  ;Sleep, 100
  Controlgetfocus, ctrl, A
    PostMessage, % WM_COPY := 0x301,,,%ctrl%, A
  Sleep, 100
  Run, notepad++.exe
  WinWaitActive, ahk_class Notepad++
  send, ^n
  send, ^v
return

#IfWinActive ahk_class TfrmMain ; BT2
^c::  ;ctrl+c
#IfWinActive ahk_class TPropertyInspector ; Delphi 7 property inspector window
^c::  ;ctrl+c
#IfWinActive ahk_class TEditWindow ;Delphi Code Editor Window
^c::  ;ctrl+c
{
    ;SetFormat, Integer, H
    ;WinGet, WinID,, A
    ;ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    ;InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
    ;SendMessage, 0x50,, 0x419,,A
	;Controlgetfocus, ctrl, A
    ;SendMessage, % WM_COPY := 0x301,,,%ctrl%, A
	;SendMessage, 0x50,, %InputLocaleID%,,A
	changeLayoutAndCopy(0x419)
Return
}
#IfWinActive ahk_class TTOTAL_CMD
{
^i::
  ;Send {NumpadMult}
  ;Send {F12}
  ;Send {NumpadMult}
  PostMessage, 0x433, 3312,,, ahk_class TTOTAL_CMD ; выслать команду cm_SelectFiles окну ТС 
  WinWaitActive, ahk_class TCOMBOINPUT
  send, *.sql{Enter}
  Sleep, 100
; (0x433 - WM_USER+51, 2127 - wParam,,, ahk_class - класс окна) 
  ;Send {F12}
  ;cm_CopyFullNamesToClip 2018
  SendMessage, 0x433, 2018,,, ahk_class TTOTAL_CMD
  ;FileAppend, spool ata_test_all.log `r`n%Clipboard%, ata_test_all.sql
  FileAppend, spool ata_test_all.log `r`n%Clipboard%, ata_test_all.sql
  Run, notepad++.exe "ata_test_all.sql"
  WinWaitActive, ahk_class Notepad++
  send, ^!1
  return
}
#IfWinActive

#IfWinActive ahk_class TTOTAL_CMD
{
^k::
  ;Send {NumpadMult}
  PostMessage, 0x433, 3312,,, ahk_class TTOTAL_CMD ; выслать команду cm_SelectFiles окну ТС 
  WinWaitActive, ahk_class TCOMBOINPUT
  send, *.sql
  send, {Enter}
  Sleep, 100
; (0x433 - WM_USER+51, 2127 - wParam,,, ahk_class - класс окна) 
  ;Send {F12}
  ;cm_CopyFullNamesToClip 2018
  SendMessage, 0x433, 2018,,, ahk_class TTOTAL_CMD
  ;FileAppend, spool ata_test_all.log `r`n%Clipboard%, ata_test_all.sql
  Run, notepad++.exe
  WinWaitActive, ahk_class Notepad++
  send, ^n
  send, spool ata_test_all.log`r`n
  send, ^v
  send, ^!1
  return
}
#IfWinActive


