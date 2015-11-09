; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/XP/
; Author:         AucT <AucT.uz.ua@gmail.com> + recode by yayuhhz
; Web-Site:		  AHT.isgreat.org
Process, priority, , High
#NoEnv
#SingleInstance
#UseHook
#HotkeyInterval, 1
setbatchlines -1
setkeydelay -1
CoordMode,Mouse,Screen
VK_LIST = VK41,VK42,VK43,VK44,VK45,VK46,VK47,VK48,VK49,VK4A,VK4B,VK4C,VK4D,VK4E,VK4F,VK50,VK51,VK52,VK53,VK54,VK55,VK56,VK57,VK58,VK59,VK5A,VKC0,VK30,VK31,VK32,VK33,VK34,VK35,VK36,VK37,VK38,VK39
HK_LIST = A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,``,0,1,2,3,4,5,6,7,8,9
;Menu, Tray, Icon, %A_ScriptDir%\%A_ScriptName%,1,1
;OnMessage(0x111,"WM_COMMAND")
IniRead, ShopIndependence, config.ini, Others, ShopIndependence, %A_Space%
IniRead, ScrollIndicator, config.ini, Others, ScrollIndicator, on
if (ScrollIndicator="on")
SetScrollLockState, On
Hotkey, IfWinActive, Warcraft III
IniRead, enItems, config.ini, Inventory, enItems, on
if (enItems="on")
{
IniRead, i1, config.ini, Inventory, item1, %A_Space%
IniRead, i2, config.ini, Inventory, item2, %A_Space%
IniRead, i3, config.ini, Inventory, item3, %A_Space%
IniRead, i4, config.ini, Inventory, item4, %A_Space%
IniRead, i5, config.ini, Inventory, item5, %A_Space%
IniRead, i6, config.ini, Inventory, item6, %A_Space%
  i1:=VK(i1)
  i2:=VK(i2)
  i3:=VK(i3)
  i4:=VK(i4)
  i5:=VK(i5)
  i6:=VK(i6)
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
IniRead, auto1, config.ini, Auto-Casts, auto1, %A_Space%
IniRead, auto2, config.ini, Auto-Casts, auto2, %A_Space%
IniRead, autoa, config.ini, Auto-Casts, autoALL, %A_Space%
if %auto1%
Hotkey,% VK(auto1), AC1
if %auto2%
Hotkey,% VK(auto2), AC2
if %autoa%
Hotkey,% VK(autoa), ACa

;Chat Suspending
IniRead, enchat, config.ini, Others, enchat, on
IniRead, AutoDetect, config.ini, Others, AutoDetect, on
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
IniRead, EnSkills, config.ini, CustomKeys, EnSkills, %A_Space%
if (EnSkills="on")
{
	IniRead, skill1, config.ini, CustomKeys, skill1, %A_Space%
	IniRead, skill2, config.ini, CustomKeys, skill2, %A_Space%
	IniRead, skill3, config.ini, CustomKeys, skill3, %A_Space%
	IniRead, skill4, config.ini, CustomKeys, skill4, %A_Space%
	IniRead, skill5, config.ini, CustomKeys, skill5, %A_Space%
	IniRead, skill6, config.ini, CustomKeys, skill6, %A_Space%
	IniRead, skill7, config.ini, CustomKeys, skill7, %A_Space%
	IniRead, skill8, config.ini, CustomKeys, skill8, %A_Space%
	IniRead, skill9, config.ini, CustomKeys, skill9, %A_Space%
	IniRead, skill10, config.ini, CustomKeys, skill10, %A_Space%
	IniRead, skill11, config.ini, CustomKeys, skill11, %A_Space%
	IniRead, skill12, config.ini, CustomKeys, skill12, %A_Space%

	if %skill1%
	Hotkey,% VK(skill1), LC1
	if %skill2%
	Hotkey,% VK(skill2), LC2
	if %skill3%
	Hotkey,% VK(skill3), LC3
	if %skill4%
	Hotkey,% VK(skill4), LC4
	if %skill5%
	Hotkey,% VK(skill5), LC5
	if %skill6%
	Hotkey,% VK(skill6), LC6
	if %skill7%
	Hotkey,% VK(skill7), LC7
	if %skill8%
	Hotkey,% VK(skill8), LC8
	if %skill9%
	Hotkey,% VK(skill9), LC9
	if %skill10%
	Hotkey,% VK(skill10), LC10
	if %skill11%
	Hotkey,% VK(skill11), LC11
	if %skill12%
	Hotkey,% VK(skill12), LC12
}
;OTHERS
IniRead, t, config.ini,Others, time, %A_Space%
IniRead, GAJ, config.ini,Others, GarenaAutoJoiner, %A_Space%
IniRead, p, config.ini,Others, pause, , %A_Space%
IniRead, toggle, config.ini,Others, toggle, %A_Space%
IniRead, share, config.ini,Others, share, %A_Space%
IniRead, hero, config.ini,Others, hero, %A_Space%
IniRead, ignore, config.ini,Others, ignore, %A_Space%
IniRead, dis1, config.ini,Disable, dis1, %A_Space%
IniRead, dis2, config.ini,Disable, dis2, %A_Space%
IniRead, dis3, config.ini,Disable, dis3, %A_Space%
IniRead, dis4, config.ini,Disable, dis4, %A_Space%
;Fast TP
IniRead, fasttp1, config.ini, Others, FastTp1, %A_Space%
IniRead, fasttp2, config.ini, Others, FastTp2, %A_Space%
IniRead, fasttp3, config.ini, Others, FastTp3, %A_Space%
IniRead, fasttp4, config.ini, Others, FastTp4, %A_Space%
IniRead, fasttp5, config.ini, Others, FastTp5, %A_Space%
IniRead, fasttp6, config.ini, Others, FastTp6, %A_Space%
if %t%
Hotkey,% VK(t), TimeNow
Hotkey, IfWinActive, Garena
if %GAJ%
Hotkey,% VK(GAJ), GarenaJoiner
Hotkey, IfWinActive, Warcraft III
if %toggle%
Hotkey,% VK(toggle), Switch
if %p%
Hotkey,% VK(p), PauseGame
if %share%
Hotkey,% VK(share), Share
if %hero%
Hotkey,% VK(hero), Hero
if %ignore%
Hotkey,% VK(ignore), Ignore
if %dis1%
Hotkey,% VK(dis1), Dis1
if %dis2%
Hotkey,% VK(dis2), Dis1
if %dis3%
Hotkey,% VK(dis3), Dis1
if %dis4%
Hotkey,% VK(dis4), Dis1
if %fasttp1%
Hotkey,% VK(fasttp1), FastTp1
if %fasttp2%
Hotkey,% VK(fasttp2), FastTp2
if %fasttp3%
Hotkey,% VK(fasttp3), FastTp3
if %fasttp4%
Hotkey,% VK(fasttp4), FastTp4
if %fasttp5%
Hotkey,% VK(fasttp5), FastTp5
if %fasttp6%
Hotkey,% VK(fasttp6), FastTp6

;MISSES
IniRead, top, config.ini,Misses, Top, %A_Space%
IniRead, bot, config.ini,Misses, Bot, %A_Space%
IniRead, mid, config.ini,Misses, Mid, %A_Space%
if %top%
Hotkey,% VK(top), top
if %bot%
Hotkey,% VK(bot), bot
if %mid%
Hotkey,% VK(mid), mid

;HPBar
IniRead, HPBars, config.ini,HPBars, HPBars, %A_Space%
IniRead, ShowAlliedHP, config.ini,HPBars, ShowAlliedHP, %A_Space%
IniRead, ShowEnemyHP, config.ini,HPBars, ShowEnemyHP, %A_Space%
if (HPBars="on")
{
Hotkey,%ShowAlliedHP%, ShowAHP
Hotkey,%ShowEnemyHP%, ShowEHP
}

;RemapKeys
IniRead, RKhotkey1, config.ini, RemapKeys, hotkey1, %A_Space%
IniRead, RKhotkey2, config.ini, RemapKeys, hotkey2, %A_Space%
IniRead, RKhotkey3, config.ini, RemapKeys, hotkey3, %A_Space%
IniRead, RKsendkey1, config.ini, RemapKeys, sendkey1, %A_Space%
IniRead, RKsendkey2, config.ini, RemapKeys, sendkey2, %A_Space%
IniRead, RKsendkey3, config.ini, RemapKeys, sendkey3, %A_Space%
if %RKhotkey1%
Hotkey, % VK(RKhotkey1), RemapKey1
if %RKhotkey2%
Hotkey, % VK(RKhotkey2), RemapKey2
if %RKhotkey3%
Hotkey, % VK(RKhotkey3), RemapKey3
;Invoker
IniRead, EnableInvoker, config.ini, Invoker, EnableInvoker, %A_Space%
if (EnableInvoker="on")
{
	IniRead, ColdSnap, config.ini, Invoker, ColdSnap, !Q
	IniRead, GhostWalk, config.ini, Invoker, GhostWalk, !V
	IniRead, Tornado, config.ini, Invoker, Tornado, !X
	IniRead, EMP, config.ini, Invoker, EMP, !C
	IniRead, Alacrity, config.ini, Invoker, Alacrity, !Z
	IniRead, ChaosMeteor, config.ini, Invoker, ChaosMeteor, !D
	IniRead, SunStrike, config.ini, Invoker, SunStrike, !T
	IniRead, ForgeSpirit, config.ini, Invoker, ForgeSpirit, !F
	IniRead, IceWall, config.ini, Invoker, IceWall, !G
	IniRead, DeafeningBlast, config.ini, Invoker, DeafeningBlast, !B
	IniRead, QQQ, config.ini, Invoker, QQQ, %A_Space%
	IniRead, WWW, config.ini, Invoker, WWW, %A_Space%
	IniRead, EEE, config.ini, Invoker, EEE, %A_Space%
	IniRead, il, config.ini, Invoker, il, %A_Space%

	if %ColdSnap%
	Hotkey,% VK(ColdSnap), Snap
	if %GhostWalk%
	Hotkey,% VK(GhostWalk), Walk
	if %Tornado%
	Hotkey,% VK(Tornado), Tornado
	if %EMP%
	Hotkey,% VK(EMP), EMP
	if %Alacrity%
	Hotkey,% VK(Alacrity), Alacrity
	if %ChaosMeteor%
	Hotkey,% VK(ChaosMeteor), Meteor
	if %SunStrike%
	Hotkey,% VK(SunStrike), Strike
	if %ForgeSpirit%
	Hotkey,% VK(ForgeSpirit), Spirit
	if %IceWall%
	Hotkey,% VK(IceWall), Wall
	if %DeafeningBlast%
	Hotkey,% VK(DeafeningBlast), Blast
	if %QQQ%
	Hotkey,% VK(QQQ), QQQ
	if %WWW%
	Hotkey,% VK(WWW), WWW
	if %EEE%
	Hotkey,% VK(EEE), EEE
	if %il%
	Hotkey,% VK(il), ilist
}

;ScoreBoard
IniRead, sb, config.ini,Others, ScoreBoard, %A_Space%
if %sb%
Hotkey,% VK(sb), SB

;Quick Messages
IniRead, enqm, config.ini,Allied-Quick-Message, EnQM, %A_Space%
	if (enqm="on") 
	{
		IniRead, qmh1, config.ini,Allied-Quick-Message, QMH1, %A_Space%
		IniRead, qmh2, config.ini,Allied-Quick-Message, QMH2, %A_Space%
		IniRead, qmh3, config.ini,Allied-Quick-Message, QMH3, %A_Space%
		IniRead, qmh4, config.ini,Allied-Quick-Message, QMH4, %A_Space%
		IniRead, qmh5, config.ini,Allied-Quick-Message, QMH5, %A_Space%
		IniRead, qmh6, config.ini,Allied-Quick-Message, QMH6, %A_Space%
		IniRead, qmh7, config.ini,Allied-Quick-Message, QMH7, %A_Space%
		IniRead, qmh8, config.ini,Allied-Quick-Message, QMH8, %A_Space%
		IniRead, qmh9, config.ini,Allied-Quick-Message, QMH9, %A_Space%
		IniRead, qmh10, config.ini,Allied-Quick-Message, QMH10, %A_Space%
		IniRead, qmv1, config.ini,Allied-Quick-Message, QMV1, %A_Space%
		IniRead, qmv2, config.ini,Allied-Quick-Message, QMV2, %A_Space%
		IniRead, qmv3, config.ini,Allied-Quick-Message, QMV3, %A_Space%
		IniRead, qmv4, config.ini,Allied-Quick-Message, QMV4, %A_Space%
		IniRead, qmv5, config.ini,Allied-Quick-Message, QMV5, %A_Space%
		IniRead, qmv6, config.ini,Allied-Quick-Message, QMV6, %A_Space%
		IniRead, qmv7, config.ini,Allied-Quick-Message, QMV7, %A_Space%
		IniRead, qmv8, config.ini,Allied-Quick-Message, QMV8, %A_Space%
		IniRead, qmv9, config.ini,Allied-Quick-Message, QMV9, %A_Space%
		IniRead, qmv10, config.ini,Allied-Quick-Message, QMV10, %A_Space%
		
		IniRead, lmh1, config.ini, Allied-Quick-Message, LMH1, %A_Space%
		IniRead, lmv1, config.ini, Allied-Quick-Message, LMV1, %A_Space%
		IniRead, lmh2, config.ini, Allied-Quick-Message, LMH2, %A_Space%
		IniRead, lmv2, config.ini, Allied-Quick-Message, LMV2, %A_Space%
		IniRead, lmh3, config.ini, Allied-Quick-Message, LMH3, %A_Space%
		IniRead, lmv3, config.ini, Allied-Quick-Message, LMV3, %A_Space%
		IniRead, lmh4, config.ini, Allied-Quick-Message, LMH4, %A_Space%
		IniRead, lmv4, config.ini, Allied-Quick-Message, LMV4, %A_Space%
		IniRead, lmh5, config.ini, Allied-Quick-Message, LMH5, %A_Space%
		IniRead, lmv5, config.ini, Allied-Quick-Message, LMV5, %A_Space%
		
		if %qmh1%
			Hotkey,% VK(qmh1), QM1
		if %qmh2%
			Hotkey,% VK(qmh2), QM2
		if %qmh3%
			Hotkey,% VK(qmh3), QM3
		if %qmh4%
			Hotkey,% VK(qmh4), QM4
		if %qmh5%
			Hotkey,% VK(qmh5), QM5
		if %qmh6%
			Hotkey,% VK(qmh6), QM6
		if %qmh7%
			Hotkey,% VK(qmh7), QM7
		if %qmh8%
			Hotkey,% VK(qmh8), QM8
		if %qmh9%
			Hotkey,% VK(qmh9), QM9
		if %qmh10%
			Hotkey,% VK(qmh10), QM10
			
		
		if %lmh1%
			Hotkey,% VK(lmh1), LM1
		if %lmh2%
			Hotkey,% VK(lmh2), LM2
		if %lmh3%
			Hotkey,% VK(lmh3), LM3
		if %lmh4%
			Hotkey,% VK(lmh4), LM4
		if %lmh5%
			Hotkey,% VK(lmh5), LM5
	}
;AQuick Messages
IniRead, enaqm, config.ini,All-Quick-Message, EnAQM, %A_Space%
	if (enaqm="on") 
	{   
		IniRead, aqmh1, config.ini,All-Quick-Message, AQMH1, %A_Space%
		IniRead, aqmh2, config.ini,All-Quick-Message, AQMH2, %A_Space%
		IniRead, aqmh3, config.ini,All-Quick-Message, AQMH3, %A_Space%
		IniRead, aqmh4, config.ini,All-Quick-Message, AQMH4, %A_Space%
		IniRead, aqmh5, config.ini,All-Quick-Message, AQMH5, %A_Space%
		IniRead, aqmh6, config.ini,All-Quick-Message, AQMH6, %A_Space%
		IniRead, aqmh7, config.ini,All-Quick-Message, AQMH7, %A_Space%
		IniRead, aqmh8, config.ini,All-Quick-Message, AQMH8, %A_Space%
		IniRead, aqmh9, config.ini,All-Quick-Message, AQMH9, %A_Space%
		IniRead, aqmh10, config.ini,All-Quick-Message, AQMH10, %A_Space%
		IniRead, aqmv1, config.ini,All-Quick-Message, AQMV1, %A_Space%
		IniRead, aqmv2, config.ini,All-Quick-Message, AQMV2, %A_Space%
		IniRead, aqmv3, config.ini,All-Quick-Message, AQMV3, %A_Space%
		IniRead, aqmv4, config.ini,All-Quick-Message, AQMV4, %A_Space%
		IniRead, aqmv5, config.ini,All-Quick-Message, AQMV5, %A_Space%
		IniRead, aqmv6, config.ini,All-Quick-Message, AQMV6, %A_Space%
		IniRead, aqmv7, config.ini,All-Quick-Message, AQMV7, %A_Space%
		IniRead, aqmv8, config.ini,All-Quick-Message, AQMV8, %A_Space%
		IniRead, aqmv9, config.ini,All-Quick-Message, AQMV9, %A_Space%
		IniRead, aqmv10, config.ini,All-Quick-Message, AQMV10, %A_Space%
		
		
		IniRead, almh1, config.ini, All-Quick-Message, ALMH1, %A_Space%
		IniRead, almv1, config.ini, All-Quick-Message, ALMV1, %A_Space%
		IniRead, almh2, config.ini, All-Quick-Message, ALMH2, %A_Space%
		IniRead, almv2, config.ini, All-Quick-Message, ALMV2, %A_Space%
		IniRead, almh3, config.ini, All-Quick-Message, ALMH3, %A_Space%
		IniRead, almv3, config.ini, All-Quick-Message, ALMV3, %A_Space%
		IniRead, almh4, config.ini, All-Quick-Message, ALMH4, %A_Space%
		IniRead, almv4, config.ini, All-Quick-Message, ALMV4, %A_Space%
		IniRead, almh5, config.ini, All-Quick-Message, ALMH5, %A_Space%
		IniRead, almv5, config.ini, All-Quick-Message, ALMV5, %A_Space%
		if %aqmh1%
			Hotkey,% VK(aqmh1), AQM1
		if %aqmh2%
			Hotkey,% VK(aqmh2), AQM2
		if %aqmh3%
			Hotkey,% VK(aqmh3), AQM3
		if %aqmh4%
			Hotkey,% VK(aqmh4), AQM4
		if %aqmh5%
			Hotkey,% VK(aqmh5), AQM5
		if %aqmh6%
			Hotkey,% VK(aqmh6), AQM6
		if %aqmh7%
			Hotkey,% VK(aqmh7), AQM7
		if %aqmh8%
			Hotkey,% VK(aqmh8), AQM8
		if %aqmh9%
			Hotkey,% VK(aqmh9), AQM9
		if %aqmh10%
			Hotkey,% VK(aqmh10), AQM10
			
		if %almh1%
			Hotkey,% VK(almh1), ALM1
		if %almh2%
			Hotkey,% VK(almh2), ALM2
		if %almh3%
			Hotkey,% VK(almh3), ALM3
		if %almh4%
			Hotkey,% VK(almh4), ALM4
		if %almh5%
			Hotkey,% VK(almh5), ALM5
	}

;Window MOUSE CAPTURER

IniRead, wmc, config.ini,Window-Mouse-Capturer, WMC, %A_Space%
if %wmc%
Hotkey,% VK(wmc),WMC
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
send {%i1%}
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
Send {%i2%}
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
Send {%i3%}
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
Send {%i4%}
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
Send {%i5%}
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
Send {%i6%}
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
QM5:
send {Enter}{RAW}%qmv5%
send {Enter}
return
QM6:
send {Enter}{RAW}%qmv6%
send {Enter}
return
QM7:
send {Enter}{RAW}%qmv7%
send {Enter}
return
QM8:
send {Enter}{RAW}%qmv8%
send {Enter}
return
QM9:
send {Enter}{RAW}%qmv9%
send {Enter}
return
QM10:
send {Enter}{RAW}%qmv10%
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
LM4:
Loop, parse, lmv4, `,
{
	send {enter}{Raw}%A_LoopField%
	send {enter}
}
return
LM5:
Loop, parse, lmv5, `,
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
AQM5:
send +{+Enter}{RAW}%aqmv5%
send {Enter}
return
AQM6:
send +{+Enter}{RAW}%aqmv6%
send {Enter}
return
AQM7:
send +{+Enter}{RAW}%aqmv7%
send {Enter}
return
AQM8:
send +{+Enter}{RAW}%aqmv8%
send {Enter}
return
AQM9:
send +{+Enter}{RAW}%aqmv9%
send {Enter}
return
AQM10:
send +{+Enter}{RAW}%aqmv10%
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
ALM4:
Loop, parse, almv4, `,
{
	send +{enter}{Raw}%A_LoopField%
	send {enter}
}
return
ALM5:
Loop, parse, almv5, `,
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
	

ShowAHP:	
  If AHealthBarOn
    {
      Send, {[ Up}
      AHealthBarOn := 0
    }
  Else
    {
      Send, {[ Down}
      AHealthBarOn := 1
    }
Return
	
ShowEHP:
  If EHealthBarOn
    {
      Send, {] Up}
      EHealthBarOn := 0
    }
  Else
    {
      Send, {] Down}
      EHealthBarOn := 1
    }
Return

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

VK(Param) ; заменяет нужные хоткеи на виртуальные коды
{
   global
   Hotkey:=RegExReplace(Param, "[\^\!\+\#]+(.*)", "$1")
   If StrLen(Hotkey) > 1
      return Param
   Loop, parse, HK_LIST, CSV
      If (Hotkey = A_LoopField)
      {
         Index := A_Index
         Loop, parse, VK_LIST, CSV
            If (A_Index = Index)
               return % RegExReplace(Param, "(.*)" Hotkey, "$1" A_LoopField)
			else 
				return Param
      }
	  else 
				return Param

}

WM_Command(wP) {

 static Suspend:=65305, Pause:=65306
 If (wP = Suspend)
  If !A_IsSuspended
   Menu, Tray, Icon, Shell32.dll, 110, 1
  Else
   Menu, Tray, Icon, %A_ScriptDir%\%A_ScriptName%, 1
}