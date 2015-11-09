; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/XP/
; Author:         AucT <AucT.uz.ua@gmail.com> + recode by yayuhhz
; Web-Site:		  AHT.isgreat.org
#NoEnv
#SingleInstance
#UseHook
setbatchlines -1
setkeydelay -1
CoordMode,Mouse,Screen
IniRead, ShopIndependence, config.ini, Others, ShopIndependence
IniRead, ScrollIndicator, config.ini, Others, ScrollIndicator
if (ScrollIndicator="on")
SetScrollLockState, On
Hotkey, IfWinActive, Warcraft III
IniRead, enItems, config.ini, Inventory, enItems
if (enItems="on")
{
IniRead, i1, config.ini, Inventory, item1
IniRead, i2, config.ini, Inventory, item2
IniRead, i3, config.ini, Inventory, item3
IniRead, i4, config.ini, Inventory, item4
IniRead, i5, config.ini, Inventory, item5
IniRead, i6, config.ini, Inventory, item6
if (ShopIndependence="on")
{
if %i1%
Hotkey,%i1%, i1Shop
Hotkey,+%i1%, i1S
if %i2%
Hotkey,%i2%, i2Shop
Hotkey,+%i2%, i2S
if %i3%
Hotkey,%i3%, i3Shop
Hotkey,+%i3%, i3S
if %i4%
Hotkey,%i4%, i4Shop
Hotkey,+%i4%, i4S
if %i5%
Hotkey,%i5%, i5Shop
Hotkey,+%i5%, i5S
if %i6%
Hotkey,%i6%, i6Shop
Hotkey,+%i6%, i6S
}
else {
if %i1%
Hotkey,%i1%, i1
;Hotkey,+%i1%, i1S
if %i2%
Hotkey,%i2%, i2
Hotkey,+%i2%, i2S
if %i3%
Hotkey,%i3%, i3
Hotkey,+%i3%, i3S
if %i4%
Hotkey,%i4%, i4
Hotkey,+%i4%, i4S
if %i5%
Hotkey,%i5%, i5
Hotkey,+%i5%, i5S
if %i6%
Hotkey,%i6%, i6
Hotkey,+%i6%, i6S
}
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
IniRead, AutoDetect, config.ini, Others, AutoDetect
if (enchat="on")
{
Hotkey,*Enter, SendEnt
Hotkey,*NumpadEnter, SendEnt
Hotkey, ~*Esc, KEYSON
Hotkey, ~LButton, KEYSON
if (AutoDetect="on")
SetTimer, checklobby, 1000
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
IniRead, GAJ, config.ini,Others, GarenaAutoJoiner
IniRead, p, config.ini,Others, pause
IniRead, toggle, config.ini,Others, toggle
IniRead, share, config.ini,Others, share
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
Hotkey, IfWinActive, Garena
if %GAJ%
Hotkey,%GAJ%, GarenaJoiner
Hotkey, IfWinActive, Warcraft III
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
Hotkey,%fasttp1%, FastTp1
if %fasttp2%
Hotkey,%fasttp2%, FastTp2
if %fasttp3%
Hotkey,%fasttp3%, FastTp3
if %fasttp4%
Hotkey,%fasttp4%, FastTp4
if %fasttp5%
Hotkey,%fasttp5%, FastTp5
if %fasttp6%
Hotkey,%fasttp6%, FastTp6

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
		
		IniRead, lmh1, config.ini, Allied-Quick-Message, LMH1
		IniRead, lmv1, config.ini, Allied-Quick-Message, LMV1
		IniRead, lmh2, config.ini, Allied-Quick-Message, LMH2
		IniRead, lmv2, config.ini, Allied-Quick-Message, LMV2
		IniRead, lmh3, config.ini, Allied-Quick-Message, LMH3
		IniRead, lmv3, config.ini, Allied-Quick-Message, LMV3
		
		if %qmh1%
			Hotkey,%qmh1%, QM1
		if %qmh2%
			Hotkey,%qmh2%, QM2
		if %qmh3%
			Hotkey,%qmh3%, QM3
		if %qmh4%
			Hotkey,%qmh4%, QM4
		
		if %lmh1%
			Hotkey,%lmh1%, LM1
		if %lmh2%
			Hotkey,%lmh2%, LM2
		if %lmh3%
			Hotkey,%lmh3%, LM3
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
		
		IniRead, almh1, config.ini, All-Quick-Message, ALMH1
		IniRead, almv1, config.ini, All-Quick-Message, ALMV1
		IniRead, almh2, config.ini, All-Quick-Message, ALMH2
		IniRead, almv2, config.ini, All-Quick-Message, ALMV2
		IniRead, almh3, config.ini, All-Quick-Message, ALMH3
		IniRead, almv3, config.ini, All-Quick-Message, ALMV3
		if %aqmh1%
			Hotkey,%aqmh1%, AQM1
		if %aqmh2%
			Hotkey,%aqmh2%, AQM2
		if %aqmh3%
			Hotkey,%aqmh3%, AQM3
		if %aqmh4%
			Hotkey,%aqmh4%, AQM4
		if %almh1%
			Hotkey,%almh1%, ALM1
		if %almh2%
			Hotkey,%almh2%, ALM2
		if %almh3%
			Hotkey,%almh3%, ALM3
	}

;Window MOUSE CAPTURER

IniRead, wmc, config.ini,Window-Mouse-Capturer, WMC
if %wmc%
Hotkey,%wmc%,WMC
return

GarenaJoiner:
gojoin:=!gojoin
if gojoin
{
SetTimer, autojoin, 5010
gosub, autojoin
}
else
SetTimer, autojoin, off
return

autojoin:
send, {click} {click}
sleep, 1700
IfWinExist, ahk_class SkinDialog, Sorry
send, {space}
else {
SetTimer, autojoin, off
soundplay,*48
}
return

checklobby:
IfWinActive, Warcraft III
{
x:=A_ScreenWidth*0.738
y:=A_ScreenHeight*0.019
PixelGetColor, color1, %x%, %y%
if color1=0x000000
{
   if A_IsSuspended {
   Hotkey,*Enter, SendEnt,on
   Hotkey,*NumpadEnter, SendEnt,on
   Hotkey, ~*Esc, KEYSON,on
   Hotkey, ~LButton, KEYSON,on
   if (ScrollIndicator="on")
   SetScrollLockState, On
   Suspend, Off
   }
}
else{
   if !A_IsSuspended{
   Hotkey,*Enter, SendEnt,off
   Hotkey,*NumpadEnter, SendEnt,off
   Hotkey, ~*Esc, KEYSON,off
   Hotkey, ~LButton, KEYSON,off
   if (ScrollIndicator="on")
   SetScrollLockState, Off
   Suspend, On
   }
   }
  }
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
send {enter}The current time is %TimeString%.{enter}
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
send {vk79}{vk4D}{vk52}
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

InShop()
{
x:=A_ScreenWidth*0.53
y:=A_ScreenHeight*0.914
PixelGetColor, color, %x%, %y%
if color=0x000000
return 1
else
return 0
}

i1:
send {vk67}
return
i1S:
sendplay +{vk67}
return
i1Shop:
if InShop()
Send %i1%
else
send {vk67}
return 
i2:
send {vk68}
return
i2S:
sendplay +{vk68}
return
i2Shop:
if InShop()
Send %i2%
else
send {vk68}
return 
i3:
send {vk64}
return
i3S:
sendplay +{vk64}
return
i3Shop:
if InShop()
Send %i3%
else
send {vk64}
return 
i4:
send {vk65}
return
i4S:
sendplay +{vk65}
return
i4Shop:
if InShop()
Send %i4%
else
send {vk65}
return 
i5:
send {vk61}
return
i5S:
sendplay +{vk61}
return
i5Shop:
if InShop()
Send %i5%
else
send {vk61}
return 
i6:
send {vk62}
return
i6S:
sendplay +{vk62}
return
i6Shop:
if InShop()
Send %i6%
else
send {vk62}
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
send {vk7A}
Send {Click %x%,  %y1%, 0}
Click
Send {Click %x%,  %y2%, 0}
Click
Send {Click %x%,  %y3%, 0}
Click
Send {Click %x%,  %y4%, 0}
Click
Send {Click %x%,  %y5%, 0}
Click
Send {Click %x%,  %y6%, 0}
Click
Send {Click %x%,  %y7%, 0}
Click
Send {Click %x%,  %y8%, 0}
Click
Send {Click %x%,  %y9%, 0}
Click
Send {Enter}
Send {Click %x0%,  %y0%, 0}
BlockInput, Off
return
  
Hero:
send {vk70}{vk70}
return

RemapKey1:
send %RKsendkey1%
return
RemapKey2:
send %RKsendkey2%
return
RemapKey3:
send %RKsendkey3%
return

Ignore:
send {Enter}-hhn{Enter}{Enter}/squelch
SetScrollLockState, Off
Suspend, on
return

Dis1:
return

FastTp1:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.6637
   y:=top+cHeight*0.8428
   }
   else
   {
   x:=A_ScreenWidth*0.6637
   y:=A_ScreenHeight*0.8428
   }
   ;
   SendPlay, {Click %x%,  %y%, 0}
   send {vk67}
   ;Click
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
return

FastTp2:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.715
   y:=top+cHeight*0.8428
   }
   else
   {
   x:=A_ScreenWidth*0.715
   y:=A_ScreenHeight*0.8428
   }
   send {vk68}
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
return

FastTp3:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.6637
   y:=top+cHeight*0.9047
   }
   else
   {
   x:=A_ScreenWidth*0.6637
   y:=A_ScreenHeight*0.9047
   }
   send {vk64}
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
return

FastTp4:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.715
   y:=top+cHeight*0.9047
   }
   else
   {
   x:=A_ScreenWidth*0.715
   y:=A_ScreenHeight*0.9047
   }
   send {vk65}
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
return
FastTp5:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.6637
   y:=top+cHeight*0.967
   }
   else
   {
   x:=A_ScreenWidth*0.6637
   y:=A_ScreenHeight*0.967
   }
   send {vk61}
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput, Off
return

FastTp6:
   BlockInput, On
   MouseGetPos, x0, y0
   if _locked
   {
   x:=left+cWidth*0.715
   y:=top+cHeight*0.967
   }
   else
   {
   x:=A_ScreenWidth*0.715
   y:=A_ScreenHeight*0.967
   }
   send {vk62}
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
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
send {Enter}{RAW}%qmv1%
send {Enter}
return
QM2:
send {Enter}{RAW}%qmv2%
send {Enter}
return
QM3:
send {Enter}{RAW}%qmv3%
send {Enter}
return
QM4:
send {Enter}{RAW}%qmv4%
send {Enter}
return
LM1:
Loop, parse, lmv1, `,
{
	send {enter}{Raw}%A_LoopField%
	send {enter}
}
return
LM2:
Loop, parse, lmv2, `,
{
	send {enter}{Raw}%A_LoopField%
	send {enter}
}
return
LM3:
Loop, parse, lmv3, `,
{
	send {enter}{Raw}%A_LoopField%
	send {enter}
}
return

AQM1:
send +{Enter}{RAW}%aqmv1%
send {Enter}
return
AQM2:
send +{Enter}{RAW}%aqmv2%
send {Enter}
return
AQM3:
send +{Enter}{RAW}%aqmv3%
send {Enter}
return
AQM4:
send +{+Enter}{RAW}%aqmv4%
send {Enter}
return
ALM1:
Loop, parse, almv1, `,
{
	send +{enter}{Raw}%A_LoopField%
	send {enter}
}
return
ALM2:
Loop, parse, almv2, `,
{
	send +{enter}{Raw}%A_LoopField%
	send {enter}
}
return
ALM3:
Loop, parse, almv3, `,
{
	send +{enter}{Raw}%A_LoopField%
	send {enter}
}
return

_locked := 0

WMC:
  Suspend, Permit
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
	if !A_IsSuspended
		{
		if (ScrollIndicator="on")
		SetScrollLockState, On
		if (AutoDetect="on")
		SetTimer, checklobby, on
		}
	Else {
		if (ScrollIndicator="on")
		SetScrollLockState, Off
		if (AutoDetect="on")
		SetTimer, checklobby, off
		}
	return
Snap:
send {vk51}{vk51}{vk51}{vk52}
return
Wall:
send {vk51}{vk51}{vk45}{vk52}
return
Blast:
send {vk51}{vk57}{vk45}{vk52}
return
Tornado:
send {vk51}{vk57}{vk57}{vk52}
return
Alacrity:
send {vk57}{vk57}{vk45}{vk52}
return
Meteor:
send {vk57}{vk45}{vk45}{vk52}
return
Strike:
send {vk45}{vk45}{vk45}{vk52}
return
Walk:
send {vk51}{vk51}{vk57}{vk52}
return
Spirit:
send {vk51}{vk45}{vk45}{vk52}
return
EMP:
send {vk57}{vk57}{vk57}{vk52}
return
QQQ:
send {vk51}{vk51}{vk51}
return
WWW:
send {vk57}{vk57}{vk57}
return
EEE:
send {vk45}{vk45}{vk45}
return
ilist:
send {Enter}-il{Enter}
return