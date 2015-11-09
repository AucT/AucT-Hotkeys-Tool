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
if %i2%
Hotkey,%i2%, i2
if %i3%
Hotkey,%i3%, i3
if %i4%
Hotkey,%i4%, i4
if %i5%
Hotkey,%i5%, i5
if %i6%
Hotkey,%i6%, i6

;Auto-Casts
IniRead, auto1, config.ini, Auto-Casts, auto1
IniRead, auto2, config.ini, Auto-Casts, auto2
if %auto1%
Hotkey,%auto1%, AC1
if %auto2%
Hotkey,%auto2%, AC2

;OTHERS
IniRead, t, config.ini,Others, time
IniRead, p, config.ini,Others, pause
IniRead, toggle, config.ini,Others, toggle
IniRead, share, config.ini,Others, share
IniRead, wait, config.ini,Others, wait
if %t%
Hotkey,%t%, TimeNow
if %toggle%
Hotkey,%toggle%, Switch
if %p%
Hotkey,%p%, PauseGame
if %share%
Hotkey,%share%, Share

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
   MouseMove, %x%, %y%
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