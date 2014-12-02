#persistent
#NoEnv
#SingleInstance Force

^t::
	Gui, Add, Text, , Your Night / 10
	Gui, Add, Edit, r1 w30 vNight_out_of_10
	Gui, Add, Text, , Number of beers
	Gui, Add, Edit, r1 w30 vNum_of_beers
	Gui, Add, Button, gDoIt Default, Add
	Gui, Show,, Successful Function
Return

DoIt:
	GuiControlGet, p,, Night_out_of_10
	GuiControlGet, q,, Num_of_beers
	Ans := Verdict(p, q)
	If Ans >= 30
	MsgBox, Your night has been successful!
	Else
	{
	MsgBox, Your night was shit do better!
	}
	GuiControl,,Edit1,
	GuiControl,,Edit2,
Return
	
Verdict(x, y)
{
   Return x * y
}
