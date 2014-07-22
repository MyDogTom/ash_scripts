#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


changeLayoutAndCopy(layoutid){
;layoutid 0x419 for RU
    SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
    ;SendMessage, 0x50,, 0x419,,A
	SendMessage, 0x50,, layoutid,,A
	Controlgetfocus, ctrl, A
    SendMessage, % WM_COPY := 0x301,,,%ctrl%, A
	SendMessage, 0x50,, %InputLocaleID%,,A
Return
}