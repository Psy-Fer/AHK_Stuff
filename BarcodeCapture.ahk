#NoEnv
#Persistent
#Singleinstance Force

;for a 9 digit barcode.
Loop 10
Hotkey, % "$~" A_Index-1, BarCodeDetect, on
BarCodeDetect:
BNum .= SubStr(A_ThisHotkey, 0)
If Strlen(BNum) > 8 && A_TimeSincePriorHotkey < 60
   SetTimer, BarCodeSend, -60
If (A_TimeSincePriorHotkey > 100)
   BNum := SubStr(A_ThisHotkey, 0)
return
BarCodeSend:
If BNum
   msgbox You scanned barcode %BNum%
return

