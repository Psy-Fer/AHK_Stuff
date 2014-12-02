#persistent
#NoEnv
#SingleInstance Force


;caller

^t::
	Gui, Add, Edit, r1 w30 vXvar
	Gui, Add, Edit, r1 w30 vYvar
	Gui, Add, Button, gDoIt Default, Add
	Gui, Show,, Adder Function
Return

DoIt:
	
	GuiControlGet, p,, Xvar
	GuiControlGet, q,, Yvar
	Ans := Adder(p, q)
	MsgBox, %p% + %q% = %Ans%
	GuiControl,,Edit1,
	GuiControl,,Edit2,
Return
	
;function

Adder(x, y)
	{
		return x + y
	}
	

#!r::reload
