
#include utils.ahk

;Changes keyboard layout to "KeyboardLayoutID"
;Copies
;Return keyboard layout to initial one
; ex. KeyboardLayoutID = 0x419 for RU
changeLayoutAndCopy(KeyboardLayoutID){
;layoutid 0x419 for RU
    CurrentInputLocalID := GetCurrentKeyboardLayoutID()
    SetKeyboardLayoutID(KeyboardLayoutID)
	SendWMCopyToCurrentControl()
	SetKeyboardLayoutID(CurrentInputLocalID)
Return
}