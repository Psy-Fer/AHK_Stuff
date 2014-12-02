#NoEnv
#SingleInstance Force

Gui, Font, s12
Gui, Add, Text, , Input
Gui, Add, Edit, r2 w300 vInput, 
Gui, Add, Text, x+50, Key (1-26)
Gui, Add, Edit, w30 vKey,
Gui, Font, s13
Gui, Add, Button,X20 gEncrypt, Encrypt
Gui, Add, Button,X+15 gDecrypt, Decrypt
Gui, Add, Button,X+15 gBruteWin, Brute Force
Gui, Font, s12
Gui, Add, Text,y+10, Output
Gui, Add, Edit, r2 w300 vOutput,


Gui, 2:Add, Text,, Brute Force Attack!
Gui, 2:Add, Edit, vBruteDisp ReadOnly r27 w300,
Gui, 2:Add, Button, gBruteForce, Attack
Gui, 2:Add, Button, X+15 gBruteClose, Close

Cipher(message, shift)
{
	Secret =
	StringLower, message, message       ;changes to lower case
	Loop Parse, message
	{
		If A_LoopField is Alpha
		{
			x := Asc(A_LoopField)+shift
			If x > 122
			{                           ;for lower case letters
				x := x-26
			}
			Else If x < 97
			{
				x := x+26
			}
			secret .= Chr(x)
		}
		Else 
			secret .= A_LoopField       ;numbers, spaces, puntuation go through unchanged
	}
	Return secret
}

F7::                              ;F7 opens the main window
	Gui, Show,, Caesar Cipher
Return

Encrypt:
	GuiControlGet, Input,, Input
	GuiControlGet, Key,, Key
	Data := Cipher(Input,Key)
	GuiControl,,Output,	%Data%
Return

Decrypt:
	GuiControlGet, Input,, Input
	GuiControlGet, Key,, Key
	key := -key
	Data := Cipher(Input,Key)
	GuiControl,,Output,	%Data%
Return

BruteWin:
	Gui, 2:Show, X1337, Brute Forcer
Return

BruteForce:
	brute = 
	Loop, 26
	{
		keyNeg := -A_Index
		bruteTemp := A_Index . " - " . Cipher(Input,keyNeg) . "`n"
		brute .= bruteTemp
		GuiControl,, BruteDisp, %brute%
	}
Return

BruteClose:
	Gui, 2:Cancel
Return

#!r::Reload

F3::
	MsgBox, Created by PsyFer
Return
