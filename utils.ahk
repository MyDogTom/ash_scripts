#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

;GetCurrent
GetCurrentKeyboardLayoutID(){
    SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    CurentLocalID := DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
	return CurentLocalID
}

SetKeyboardLayoutID(KeyboardLayoutID){
    SendMessage, 0x50,, KeyboardLayoutID,,A
	Return
}

SendWMCopyToCurrentControl(){
	Controlgetfocus, ctrl, A
    SendMessage, % WM_COPY := 0x301,,,%ctrl%, A
	Return
}

