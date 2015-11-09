; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/XP/
; Author:         AucT <AucT.uz.ua@gmail.com> + recode by yayuhhz
; Web-Site:		  AHT.isgreat.org
#NoEnv
setbatchlines -1
setkeydelay -1
CoordMode,Mouse,Screen
#IfWinActive Warcraft III
;Inventory
IniRead, ScrollIndicator, config.ini, Others, ScrollIndicator
if (ScrollIndicator="on")
SetScrollLockState, On

IniRead, enItems, config.ini, Inventory, enItems
if (enItems="on")
{
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
}


;Auto-Casts
IniRead, auto1, config.ini, Auto-Casts, auto1
IniRead, auto2, config.ini, Auto-Casts, auto2
IniRead, autoa, config.ini, Auto-Casts, autoALL
if %auto1%
Hotkey,%auto1%, AC1
if %auto2%
Hotkey,%auto2%, AC2
if %autoa%
Hotkey,%autoa%, ACa

;Chat Suspending
IniRead, enchat, config.ini, Others, enchat
if (enchat="on")
{
Hotkey,*Enter, SendEnt
Hotkey,*NumpadEnter, SendEnt
Hotkey, ~*Esc, KEYSON
Hotkey, ~LButton, KEYSON
}

;CustomKeys
IniRead, EnSkills, config.ini, CustomKeys, EnSkills
if (EnSkills="on")
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
;Fast TP
IniRead, fasttp1, config.ini, Others, FastTp1
IniRead, fasttp2, config.ini, Others, FastTp2
IniRead, fasttp3, config.ini, Others, FastTp3
IniRead, fasttp4, config.ini, Others, FastTp4
IniRead, fasttp5, config.ini, Others, FastTp5
IniRead, fasttp6, config.ini, Others, FastTp6
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
if %fasttp1%
Hotkey,%fasttp1%, FastTp01
if %fasttp2%
Hotkey,%fasttp2%, FastTp02
if %fasttp3%
Hotkey,%fasttp3%, FastTp03
if %fasttp4%
Hotkey,%fasttp4%, FastTp04
if %fasttp5%
Hotkey,%fasttp5%, FastTp05
if %fasttp6%
Hotkey,%fasttp6%, FastTp06

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

;RemapKeys
IniRead, RKhotkey1, config.ini, RemapKeys, hotkey1
IniRead, RKhotkey2, config.ini, RemapKeys, hotkey2
IniRead, RKhotkey3, config.ini, RemapKeys, hotkey3
IniRead, RKsendkey1, config.ini, RemapKeys, sendkey1
IniRead, RKsendkey2, config.ini, RemapKeys, sendkey2
IniRead, RKsendkey3, config.ini, RemapKeys, sendkey3
if %RKhotkey1%
Hotkey, %RKhotkey1%, RemapKey1
if %RKhotkey2%
Hotkey, %RKhotkey2%, RemapKey2
if %RKhotkey3%
Hotkey, %RKhotkey3%, RemapKey3
;Invoker
IniRead, EnableInvoker, config.ini, Invoker, EnableInvoker
if (EnableInvoker="on")
{
	IniRead, ColdSnap, config.ini, Invoker, ColdSnap
	IniRead, GhostWalk, config.ini, Invoker, GhostWalk
	IniRead, Tornado, config.ini, Invoker, Tornado
	IniRead, EMP, config.ini, Invoker, EMP
	IniRead, Alacrity, config.ini, Invoker, Alacrity
	IniRead, ChaosMeteor, config.ini, Invoker, ChaosMeteor
	IniRead, SunStrike, config.ini, Invoker, SunStrike
	IniRead, ForgeSpirit, config.ini, Invoker, ForgeSpirit
	IniRead, IceWall, config.ini, Invoker, IceWall
	IniRead, DeafeningBlast, config.ini, Invoker, DeafeningBlast
	IniRead, QQQ, config.ini, Invoker, QQQ
	IniRead, WWW, config.ini, Invoker, WWW
	IniRead, EEE, config.ini, Invoker, EEE
	IniRead, il, config.ini, Invoker, il

	if %ColdSnap%
	Hotkey,%ColdSnap%, Snap
	if %GhostWalk%
	Hotkey,%GhostWalk%, Walk
	if %Tornado%
	Hotkey,%Tornado%, Tornado
	if %EMP%
	Hotkey,%EMP%, EMP
	if %Alacrity%
	Hotkey,%Alacrity%, Alacrity
	if %ChaosMeteor%
	Hotkey,%ChaosMeteor%, Meteor
	if %SunStrike%
	Hotkey,%SunStrike%, Strike
	if %ForgeSpirit%
	Hotkey,%ForgeSpirit%, Spirit
	if %IceWall%
	Hotkey,%IceWall%, Wall
	if %DeafeningBlast%
	Hotkey,%DeafeningBlast%, Blast
	if %QQQ%
	Hotkey,%QQQ%, QQQ
	if %WWW%
	Hotkey,%WWW%, WWW
	if %EEE%
	Hotkey,%EEE%, EEE
	if %il%
	Hotkey,%il%, ilist
}

;ScoreBoard
IniRead, sb, config.ini,Others, ScoreBoard
if %sb%
Hotkey,%sb%, SB

;Quick Messages
IniRead, enqm, config.ini,Allied-Quick-Message, EnQM
	if (enqm="on") 
	{
		IniRead, qmh1, config.ini,Allied-Quick-Message, QMH1
		IniRead, qmh2, config.ini,Allied-Quick-Message, QMH2
		IniRead, qmh3, config.ini,Allied-Quick-Message, QMH3
		IniRead, qmh4, config.ini,Allied-Quick-Message, QMH4
		IniRead, qmv1, config.ini,Allied-Quick-Message, QMV1
		IniRead, qmv2, config.ini,Allied-Quick-Message, QMV2
		IniRead, qmv3, config.ini,Allied-Quick-Message, QMV3
		IniRead, qmv4, config.ini,Allied-Quick-Message, QMV4
		
		if %qmh1%
			Hotkey,%qmh1%, QM1
		if %qmh2%
			Hotkey,%qmh2%, QM2
		if %qmh3%
			Hotkey,%qmh3%, QM3
		if %qmh4%
			Hotkey,%qmh4%, QM4
	}
;AQuick Messages
IniRead, enaqm, config.ini,All-Quick-Message, EnAQM
	if (enaqm="on") 
	{   
		IniRead, aqmh1, config.ini,All-Quick-Message, AQMH1
		IniRead, aqmh2, config.ini,All-Quick-Message, AQMH2
		IniRead, aqmh3, config.ini,All-Quick-Message, AQMH3
		IniRead, aqmh4, config.ini,All-Quick-Message, AQMH4
		IniRead, aqmv1, config.ini,All-Quick-Message, AQMV1
		IniRead, aqmv2, config.ini,All-Quick-Message, AQMV2
		IniRead, aqmv3, config.ini,All-Quick-Message, AQMV3
		IniRead, aqmv4, config.ini,All-Quick-Message, AQMV4
		if %aqmh1%
			Hotkey,%aqmh1%, AQM1
		if %aqmh2%
			Hotkey,%aqmh2%, AQM2
		if %aqmh3%
			Hotkey,%aqmh3%, AQM3
		if %aqmh4%
			Hotkey,%aqmh4%, AQM4
	}

;Window MOUSE CAPTURER
IniRead, wmc, config.ini,Window-Mouse-Capturer, WMC
if %wmc%
Hotkey,%wmc%,WMC

;ShortKeys
::-u::-unlock
::-r::-roll
::-rr::-rickroll
::m::Miss!

return

AC1:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x2%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

ACa:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x3%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

AC2:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x3%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

TimeNow:
FormatTime, TimeString,, Time
sendplay {enter}The current time is %TimeString%.{enter}
return

Switch:
Suspend
if !A_IsSuspended{
   Hotkey,*Enter, SendEnt,on
   Hotkey,*NumpadEnter, SendEnt,on
   Hotkey, ~*Esc, KEYSON,on
   Hotkey, ~LButton, KEYSON,on
   if (ScrollIndicator="on")
   SetScrollLockState, On
}
Else{
   Hotkey,*Enter, SendEnt,off
   Hotkey,*NumpadEnter, SendEnt,off
   Hotkey, ~*Esc, KEYSON,off
   Hotkey, ~LButton, KEYSON,off
   if (ScrollIndicator="on")
   SetScrollLockState, Off
}
return


PauseGame:
sendplay {vk79}{vk4D}{vk52}
return

SB:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.985
   y:=top+cHeight*0.058
   }
   else
   {
   x:=A_ScreenWidth*0.98
   y:=A_ScreenHeight*0.058
   }
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
return

i1:
	sendplay {vk67}
return
i2:
	sendplay {vk68}
return
i3:
	sendplay {vk64}
return
i4:
	sendplay {vk65}
return
i5:
	sendplay {vk61}
return
i6:
	sendplay {vk62}
return

Share:
BlockInput, On
MouseGetPos, x0, y0
if _locked
{
x:=left+cWidth*0.6
y1:=top+cHeight*0.2
y2:=top+cHeight*0.25
y3:=top+cHeight*0.3
y4:=top+cHeight*0.345
y5:=top+cHeight*0.39
y6:=top+cHeight*0.435
y7:=top+cHeight*0.482
y8:=top+cHeight*0.527
y9:=top+cHeight*0.574
}
else
{
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
}
sendplay {vk7A}

sleep, %wait%
SendPlay, {Click %x%,  %y1%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y2%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y3%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y4%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y5%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y6%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y7%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y8%, 0}
sleep, %wait%
Click
SendPlay, {Click %x%,  %y9%, 0}
sleep, %wait%
Click
sendplay {Enter}
SendPlay, {Click %x0%,  %y0%, 0}
BlockInput, Off
return
  
Hero:
sendplay {vk70}{vk70}
return

RemapKey1:
sendplay %RKsendkey1%
return
RemapKey2:
sendplay %RKsendkey2%
return
RemapKey3:
sendplay %RKsendkey3%
return

Ignore:
sendplay {Enter}-hhn{Enter}{Enter}/squelch
SetScrollLockState, Off
Suspend, on
return

Dis1:
return

FastTpF(x,y,key)
{
   BlockInput, On
   MouseGetPos, x0, y0

   send key
   SendPlay, {Click %x%,  %y%, Left}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
}
FastTp01:
if _locked
FastTpF(left+cWidth*0.6637, top+cHeight*0.8428, vk67)
else
FastTpF(A_ScreenWidth*0.6637, A_ScreenHeight*0.8428, vk67)
return

FastTp02:
if _locked
FastTpF(left+cWidth*0.715, top+cHeight*0.8428, vk68)
else
FastTpF(A_ScreenWidth*0.715, A_ScreenHeight*0.8428, vk68)
return

FastTp03:
if _locked
FastTpF(left+cWidth*0.6637, top+cHeight*0.9047, vk64)
else
FastTpF(A_ScreenWidth*0.6637, A_ScreenHeight*0.9047, vk64)
return

FastTp04:
if _locked
FastTpF(left+cWidth*0.715, top+cHeight*0.9047, vk65)
else
FastTpF(A_ScreenWidth*0.715, A_ScreenHeight*0.9047, vk65)
return

FastTp05:
if _locked
FastTpF(left+cWidth*0.6637, top+cHeight*0.967, vk61)
else
FastTpF(A_ScreenWidth*0.6637, A_ScreenHeight*0.967, vk61)
return

FastTp06:
if _locked
FastTpF(left+cWidth*0.715, top+cHeight*0.967, vk62)
else
FastTpF(A_ScreenWidth*0.715, A_ScreenHeight*0.967, vk62)
return

  
 ;Misses
top:
	sendplay {enter}MISS TOP!{enter}
return
bot:
	sendplay {enter}MISS BOTTOM!{enter}
return
mid:
	sendplay {enter}MISS MID!{enter}
return


LC1:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.79
   y:=top+cHeight*0.95
   }
   else
   {
   x:=A_ScreenWidth*0.79
   y:=A_ScreenHeight*0.95
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC2:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.84
   y:=top+cHeight*0.95
   }
   else
   {
   x:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.95
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC3:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.9
   y:=top+cHeight*0.95
   }
   else
   {
   x:=A_ScreenWidth*0.9
   y:=A_ScreenHeight*0.95
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC4:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.95
   y:=top+cHeight*0.95
   }
   else
   {
   x:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC5:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.79
   y:=top+cHeight*0.88
   }
   else
   {
   x:=A_ScreenWidth*0.79
   y:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC6:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.84
   y:=top+cHeight*0.88
   }
   else
   {
   x:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC7:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.9
   y:=top+cHeight*0.88
   }
   else
   {
   x:=A_ScreenWidth*0.9
   y:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC8:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.95
   y:=top+cHeight*0.88
   }
   else
   {
   x:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.88
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC9:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.79
   y:=top+cHeight*0.81
   }
   else
   {
   x:=A_ScreenWidth*0.79
   y:=A_ScreenHeight*0.81
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC10:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.84
   y:=top+cHeight*0.81
   }
   else
   {
   x:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.81
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC11:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.9
   y:=top+cHeight*0.81
   }
   else
   {
   x:=A_ScreenWidth*0.9
   y:=A_ScreenHeight*0.81
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

LC12:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.95
   y:=top+cHeight*0.81
   }
   else
   {
   x:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.81
   }
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
return

QM1:
sendplay {Enter}{RAW}%qmv1%
sendplay {Enter}
return
QM2:
sendplay {Enter}{RAW}%qmv2%
sendplay {Enter}
return
QM3:
sendplay {Enter}{RAW}%qmv3%
sendplay {Enter}
return
QM4:
sendplay {Enter}{RAW}%qmv4%
sendplay {Enter}
return


AQM1:
sendplay +{Enter}{RAW}%aqmv1%
sendplay {Enter}
return
AQM2:
sendplay +{Enter}{RAW}%aqmv2%
sendplay {Enter}
return
AQM3:
sendplay +{Enter}{RAW}%aqmv3%
sendplay {Enter}
return
AQM4:
sendplay +{+Enter}{RAW}%aqmv4%
sendplay {Enter}
return

_locked := 0

WMC:
  if _locked
  {
    DllCall("ClipCursor")
    _locked := 0
  }
  else
  {
    ActiveHwnd := WinExist("Warcraft III")
    VarSetCapacity(rect,16)
    if GetWindowClientRect(ActiveHwnd,rect) && DllCall("ClipCursor","UInt",&rect)
      _locked := 1
  }
  Return

GetWindowClientRect(hwnd,ByRef rect)
{
  if !hwnd || VarSetCapacity(rect) < 16
    Return,0

  VarSetCapacity(cRect,16)
  if !DllCall("GetClientRect","UInt",hwnd,"UInt",&cRect)
    Return,0

  global cWidth := NumGet(cRect,8,Int) - NumGet(cRect,0,Int)
  global cHeight := NumGet(cRect,12,Int) - NumGet(cRect,4,Int)
  
  if !DllCall("GetWindowRect","UInt",hwnd,"UInt",&rect)
    Return,0
  
  wWidth := NumGet(rect,8,Int) - NumGet(rect,0,Int)
  margin := (wWidth - cWidth)//2

  NumPut(NumGet(rect,8,Int) - margin,rect,8,Int)
  NumPut(NumGet(rect,12,Int) - margin,rect,12,Int)
  NumPut(NumGet(rect,8,Int) - cWidth,rect,0,Int)
  NumPut(NumGet(rect,12,Int) - cHeight,rect,4,Int)
  
  global left := NumGet(rect,0,Int)
  global top := NumGet(rect,4,Int)
  
  Return,1
}

KEYSON:
Suspend, Permit
Suspend, Off
if (ScrollIndicator="on")
SetScrollLockState, On
return

SendEnt:
	Suspend, Permit
	Send, {Blind}{Enter}
	Suspend
	if (ScrollIndicator="on")
	{
	if !A_IsSuspended
		SetScrollLockState, On

	Else
		SetScrollLockState, Off
	}
	return
	
Snap:
sendplay {vk51}{vk51}{vk51}{vk52}
return
Wall:
sendplay {vk51}{vk51}{vk45}{vk52}
return
Blast:
sendplay {vk51}{vk57}{vk45}{vk52}
return
Tornado:
sendplay {vk51}{vk57}{vk57}{vk52}
return
Alacrity:
sendplay {vk57}{vk57}{vk45}{vk52}
return
Meteor:
sendplay {vk57}{vk45}{vk45}{vk52}
return
Strike:
sendplay {vk45}{vk45}{vk45}{vk52}
return
Walk:
sendplay {vk51}{vk51}{vk57}{vk52}
return
Spirit:
sendplay {vk51}{vk45}{vk45}{vk52}
return
EMP:
sendplay {vk57}{vk57}{vk57}{vk52}
return
QQQ:
sendplay {vk51}{vk51}{vk51}
return
WWW:
sendplay {vk57}{vk57}{vk57}
return
EEE:
sendplay {vk45}{vk45}{vk45}
return
ilist:
sendplay {Enter}-il{Enter}
return