#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include utils.ahk ; usage of SendWMCopyToCurrentControl

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