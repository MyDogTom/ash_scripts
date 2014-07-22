#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Alt-Shift-B (Run or activate TheBat!)
!+b::
{
	if not WinExist( "ahk_class TMailerForm" )
		run, "d:\Program Files\The Bat!\thebat.exe"
	WinActivate
	Return
}
; Alt-Shift-W (Run or activate Total Commander)
!+w::
{
	if not WinExist( "ahk_class TTOTAL_CMD" )
		;Run "%COMMANDER_PATH%\Totalcmd.exe"
		run, "D:\Program Files\Total Commander\TOTALCMD.EXE"
	WinActivate
Return
}