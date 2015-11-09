;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/XP/
; Author:         AucT <AucT@mail.ua>
; Web-Site:		  AHT.isgreat.org
#IfWinActive Warcraft III
;Inventory
IniRead, i1, config.ini, Inventory, item1
IniRead, i2, config.ini, Inventory, item2
IniRead, i3, config.ini, Inventory, item3
IniRead, i4, config.ini, Inventory, item4
IniRead, i5, config.ini, Inventory, item5
IniRead, i6, config.ini, Inventory, item6

if %i1%
Hotkey,%i1%, i1
Hotkey,+%i1%, i1
if %i2%
Hotkey,%i2%, i2
Hotkey,+%i2%, i2
if %i3%
Hotkey,%i3%, i3
Hotkey,+%i3%, i3
if %i4%
Hotkey,%i4%, i4
Hotkey,+%i4%, i4
if %i5%
Hotkey,%i5%, i5
Hotkey,+%i5%, i5
if %i6%
Hotkey,%i6%, i6
Hotkey,+%i6%, i6

;Auto-Casts
IniRead, auto1, config.ini, Auto-Casts, auto1
IniRead, auto2, config.ini, Auto-Casts, auto2
if %auto1%
Hotkey,%auto1%, AC1
if %auto2%
Hotkey,%auto2%, AC2

;Chat Suspending
IniRead, ChatSuspending, config.ini, Others, ChatSuspending
if (ChatSuspending="on")
{
Hotkey,*Enter, SendEnt
Hotkey,*NumpadEnter, SendEnt
Hotkey, ~*Esc, KEYSON
Hotkey, ~LButton, KEYSON
}

;CustomKeys
IniRead, EnableCK, config.ini, CustomKeys, Enable
if (EnableCK="on")
{
	IniRead, skill1, config.ini, CustomKeys, skill1
	IniRead, skill2, config.ini, CustomKeys, skill2
	IniRead, skill3, config.ini, CustomKeys, skill3
	IniRead, skill4, config.ini, CustomKeys, skill4
	IniRead, skill5, config.ini, CustomKeys, skill5
	IniRead, skill6, config.ini, CustomKeys, skill6
	IniRead, skill7, config.ini, CustomKeys, skill7
	IniRead, skill8, config.ini, CustomKeys, skill8
	IniRead, skill9, config.ini, CustomKeys, skill9
	IniRead, skill10, config.ini, CustomKeys, skill10
	IniRead, skill11, config.ini, CustomKeys, skill11
	IniRead, skill12, config.ini, CustomKeys, skill12

	if %skill1%
	Hotkey,%skill1%, LC1
	if %skill2%
	Hotkey,%skill2%, LC2
	if %skill3%
	Hotkey,%skill3%, LC3
	if %skill4%
	Hotkey,%skill4%, LC4
	if %skill5%
	Hotkey,%skill5%, LC5
	if %skill6%
	Hotkey,%skill6%, LC6
	if %skill7%
	Hotkey,%skill7%, LC7
	if %skill8%
	Hotkey,%skill8%, LC8
	if %skill9%
	Hotkey,%skill9%, LC9
	if %skill10%
	Hotkey,%skill10%, LC10
	if %skill11%
	Hotkey,%skill11%, LC11
	if %skill12%
	Hotkey,%skill12%, LC12
}
;OTHERS
IniRead, t, config.ini,Others, time
IniRead, p, config.ini,Others, pause
IniRead, toggle, config.ini,Others, toggle
IniRead, share, config.ini,Others, share
IniRead, wait, config.ini,Others, wait
IniRead, hero, config.ini,Others, hero
IniRead, ignore, config.ini,Others, ignore
IniRead, dis1, config.ini,Disable, dis1
IniRead, dis2, config.ini,Disable, dis2
IniRead, dis3, config.ini,Disable, dis3
IniRead, dis4, config.ini,Disable, dis4
;IniRead, dis5, config.ini,Disable, dis5
if %t%
Hotkey,%t%, TimeNow
if %toggle%
Hotkey,%toggle%, Switch
if %p%
Hotkey,%p%, PauseGame
if %share%
Hotkey,%share%, Share
if %hero%
Hotkey,%hero%, Hero
if %ignore%
Hotkey,%ignore%, Ignore
if %dis1%
Hotkey,%dis1%, Dis1
if %dis2%
Hotkey,%dis2%, Dis1
if %dis3%
Hotkey,%dis3%, Dis1
if %dis4%
Hotkey,%dis4%, Dis1
;if %dis5%
;Hotkey,%dis5%, Dis1

;MISSES
IniRead, top, config.ini,Misses, Top
IniRead, bot, config.ini,Misses, Bot
IniRead, mid, config.ini,Misses, Mid
if %top%
Hotkey,%top%, top
if %bot%
Hotkey,%bot%, bot
if %mid%
Hotkey,%mid%, mid

;ScoreBoard
IniRead, sb, config.ini,Others, ScoreBoard
IniRead, sba, config.ini,Others, ScoreBoardActive
if %sb%
	{
	 if %sba% 
		Hotkey,~%sb%, SB
	 else
		Hotkey,%sb%, SB
	}

;ShortKeys
::-u::-unlock
::-r::-roll
::-rr::-rickroll
::m::Miss!

return

AC1:
   BlockInput, On
   MouseGetPos, x0, y0
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x2%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

AC2:
   BlockInput, On
   MouseGetPos, x0, y0
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x3%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

TimeNow:
FormatTime, TimeString,, Time
send {enter}The current time is %TimeString%.{enter}
return

Switch:
Suspend
return

PauseGame:
Send {F10}{M}{R}
return

SB:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.985
   y:=A_ScreenHeight*0.0575
   ;MouseMove, %x%, %y%
   SendPlay, {Click %x%,  %y%, 0}
   Click

   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
   
return

i1:
	send {Numpad7}
return
i2:
	send {Numpad8}
return
i3:
	send {Numpad4}
return
i4:
	send {Numpad5}
return
i5:
	send {Numpad1}
return
i6:
	send {Numpad2}
return

Share:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.6
y1:=A_ScreenHeight*0.2
y2:=A_ScreenHeight*0.25
y3:=A_ScreenHeight*0.3
y4:=A_ScreenHeight*0.345
y5:=A_ScreenHeight*0.39
y6:=A_ScreenHeight*0.435
y7:=A_ScreenHeight*0.482
y8:=A_ScreenHeight*0.527
y9:=A_ScreenHeight*0.574
Send {F11}
MouseMove, %x%,  %y1%
sleep, %wait%
Click, Left

MouseMove, %x%,  %y2%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y3%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y4%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y5%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y6%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y7%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y8%
sleep, %wait%
Click, Left
MouseMove, %x%,  %y9%
sleep, %wait%
Click, Left
Send {Enter}
   BlockInput, Off
  return
  
Hero:
Send {F1}{F1}
return


Ignore:
Send {Enter}-hhn{Enter}{Enter}/squelch 
return

Dis1:
return
  
 ;Misses
top:
	send {enter}MISS TOP!{enter}
return
bot:
	send {enter}MISS BOTTOM!{enter}
return
mid:
	send {enter}MISS MID!{enter}
return



LC1:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.79
   y:=A_ScreenHeight*0.95
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC2:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.95
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC3:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.9
   y:=A_ScreenHeight*0.95
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC4:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC5:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.79
   y:=A_ScreenHeight*0.88
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC6:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.88
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC7:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.9
   y:=A_ScreenHeight*0.88
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC8:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.88
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC9:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.79
   y:=A_ScreenHeight*0.81
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC10:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.81
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC11:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.9
   y:=A_ScreenHeight*0.81
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC12:
   BlockInput, On
   MouseGetPos, x0, y0
   x:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.81
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

KEYSON:
Suspend, Permit
Suspend, Off
return

SendEnt:
	Suspend, Permit
	Send, {Blind}{Enter}
	Suspend
	return