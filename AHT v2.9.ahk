; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT/XP/Vista/7
; Author:         AucT <AucT.eu@gmail.com>
; Code helper:    yayuhhz (thanks to him there is awesome chat-suspending system and window mode)
; Main Tester:    DenSiL7
; Web-Site:		  http://aht.auct.eu
;********************************************FORCE TO RUN AS ADMIN*************************
RegRead, UAC, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System, EnableLUA
if !A_IsAdmin 
{
	Log("Not running as admin. Restarting as admin")
	if A_IsCompiled
		DllCall("shell32\ShellExecuteA","uint",0,"str","RunAs","str",A_ScriptFullPath,"uint",0,"str",A_WorkingDir,"int",1)
    else
       DllCall("shell32\ShellExecuteA","uint",0,"str","RunAs","str",A_AhkPath,"str","""" . A_ScriptFullPath . """","str",A_WorkingDir,"int",1)
    ExitApp
}
DebugPrivilegesEnable()
FileInstall, all.gif, %A_temp%\all.gif
FileInstall, blue.gif, %A_temp%\blue.gif
FileInstall, pink.gif, %A_temp%\pink.gif
FileInstall, AutoCast.jpg, %A_temp%\AutoCast.jpg
FileInstall, Inventory.jpg, %A_temp%\Inventory.jpg
FileInstall, Skills.jpg, %A_temp%\Skills.jpg
GroupAdd, WC3DOTA , Warcraft III
GroupAdd, WC3DOTA , DOTA 2
GroupAdd, WC3DOTA , Dota 2
;********************************************INITIAL SCRIPT SETTINGS*************************
  #UseHook on                    ;forces to use it at start and not in game
  #SingleInstance force          ;makes sure second execution of the tool will stop teh first
  #HotkeyInterval 0
  #NoEnv
  #MaxThreads
  Process, priority, , High
  SetWorkingDir %A_ScriptDir%
  SetBatchLines, -1
  SetKeyDelay , -1, -1
  SetDefaultMouseSpeed, 0
  #ifWinActive, ahk_group WC3DOTA
  VK_LIST = VK41,VK42,VK43,VK44,VK45,VK46,VK47,VK48,VK49,VK4A,VK4B,VK4C,VK4D,VK4E,VK4F,VK50,VK51,VK52,VK53,VK54,VK55,VK56,VK57,VK58,VK59,VK5A,VK30,VK31,VK32,VK33,VK34,VK35,VK36,VK37,VK38,VK39,VKC0,VKDB,VKDD,VKBE,VKBF,VKBA,VKDE,VKDC
  HK_LIST = A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9,``,[,],.,/,;,',\

Version=AucT Hotkeys Tool v2.9			;current verison for update
;************************************************PROFILE MANAGEMENT********************************//////////////
  IniRead, profile, %A_WorkingDir%\settings.ini, Others, profile, General
	if profile=General
	profileini=settings.ini
	else
	profileini=%profile%.ini
;************************************************STYLE COLOR**********************************************
IniRead, stylecolor, %A_WorkingDir%\%profileini%, Others, stylecolor, %A_Space%
if stylecolor {
IniRead, darkstyle, %A_WorkingDir%\%profileini%, Others, darkstyle, 0
Gui, Color, %stylecolor%
Gui, 2:Color, %stylecolor%
Gui, 3:Color, %stylecolor%
Gui, 4:Color, %stylecolor%
Gui, 5:Color, %stylecolor%
if darkstyle {
gui, font, cwhite
gui,2:font, cwhite
gui,3:font, cwhite
gui,4:font, cwhite
gui,5:font, cwhite
}
}
;************************************************TRAY MENU********************************************************
  ;Menu
  Menu, tray, NoStandard
  Menu, Tray, Click, 1
  Menu, tray, add, Configuration, configuration
  Menu, tray, Default, Configuration
  Menu, tray, add
  Menu, tray, add, Run WarCraft 3, RunWC3
  Menu, tray, add
  Menu, tray, add, About, About
  Menu, tray, add, Check update, UpdateCheck
  Menu, tray, add
  Menu, tray, add, Reload, ButtonReload
  Menu, tray, add
  Menu, tray, add, Mouse Capture, SetWMC
  Menu, tray, add, Exit
  Menu, Tray, Icon, %A_ScriptDir%\%A_ScriptName%,1,1

  CoordMode,Mouse,Screen
  
  IniRead, ScrollIndicator, %A_WorkingDir%\%profileini%, Others, ScrollIndicator, 0
  if ScrollIndicator
  SetScrollLockState, On
  else 
  SetScrollLockState, Off
  IniRead, ReloadScr, %A_WorkingDir%\%profileini%,Others, ReloadScr, %A_Space%
	if ReloadScr
	Hotkey,% VK(ReloadScr), ReloadScript
  Hotkey, IfWinActive, ahk_group WC3DOTA
  IniRead, WMC, %A_WorkingDir%\%profileini%,Others, WMC, 0
  IniRead, WMChotkey, %A_WorkingDir%\%profileini%,Others, WMChotkey, %A_Space%
  if WMC
  SetTimer,CheckActiveWar3
  if WMChotkey
  Hotkey,% VK(WMChotkey), SetWMC
;************************************************INVENTORY*************************************
  
  IniRead, EnInventory, %A_WorkingDir%\%profileini%, Inventory, EnInventory, 1
  IniRead, h1, %A_WorkingDir%\%profileini%, Inventory, item1, %A_Space%
  IniRead, h2, %A_WorkingDir%\%profileini%, Inventory, item2, %A_Space%
  IniRead, h3, %A_WorkingDir%\%profileini%, Inventory, item3, %A_Space%
  IniRead, h4, %A_WorkingDir%\%profileini%, Inventory, item4, %A_Space%
  IniRead, h5, %A_WorkingDir%\%profileini%, Inventory, item5, %A_Space%
  IniRead, h6, %A_WorkingDir%\%profileini%, Inventory, item6, %A_Space%
  if %EnInventory%
  {
  i1:=VK(h1)
  i2:=VK(h2)
  i3:=VK(h3)
  i4:=VK(h4)
  i5:=VK(h5)
  i6:=VK(h6)
  

	if i1 {
	Hotkey,%i1%, i1
	Hotkey,+%i1%, i1S,
	}
	if i2 {
	Hotkey,%i2%, i2
	Hotkey,+%i2%, i2S
	}
	if i3 {
	Hotkey,%i3%, i3
	Hotkey,+%i3%, i3S
	}
	if i4 {
	Hotkey,%i4%, i4
	Hotkey,+%i4%, i4S
	}
	if i5 {
	Hotkey,%i5%, i5
	Hotkey,+%i5%, i5S
	}
	if i6 {
	Hotkey,%i6%, i6
	Hotkey,+%i6%, i6S
	}
} 
;************************************************CUSTOMKEYS**********************************************

	IniRead, EnSkills, %A_WorkingDir%\%profileini%, CustomKeys, EnSkills, 0
	IniRead, SmartSkills, %A_WorkingDir%\%profileini%, CustomKeys, SmartSkills, 0
	IniRead, SelfCast, %A_WorkingDir%\%profileini%, CustomKeys, SelfCast, 0
	IniRead, skill1, %A_WorkingDir%\%profileini%, CustomKeys, skill1, Q
	IniRead, skill2, %A_WorkingDir%\%profileini%, CustomKeys, skill2, W
	IniRead, skill3, %A_WorkingDir%\%profileini%, CustomKeys, skill3, E
	IniRead, skill4, %A_WorkingDir%\%profileini%, CustomKeys, skill4, R
	IniRead, skill5, %A_WorkingDir%\%profileini%, CustomKeys, skill5, %A_Space%
	IniRead, skill6, %A_WorkingDir%\%profileini%, CustomKeys, skill6, D
	IniRead, skill7, %A_WorkingDir%\%profileini%, CustomKeys, skill7, F
	IniRead, skill8, %A_WorkingDir%\%profileini%, CustomKeys, skill8, %A_Space%
	IniRead, skill9, %A_WorkingDir%\%profileini%, CustomKeys, skill9, %A_Space%
	IniRead, skill10, %A_WorkingDir%\%profileini%, CustomKeys, skill10, %A_Space%
	IniRead, skill11, %A_WorkingDir%\%profileini%, CustomKeys, skill11, %A_Space%
	IniRead, skill12, %A_WorkingDir%\%profileini%, CustomKeys, skill12, %A_Space%
  if %EnSkills%
  {
	if (!Selfcast and !SmartSkills) {
		if %skill1%
		Hotkey,% VK(skill1), LC1L
		if %skill2%
		Hotkey,% VK(skill2), LC2L
		if %skill3%
		Hotkey,% VK(skill3), LC3L
		if %skill4%
		Hotkey,% VK(skill4), LC4L
		
		if %skill5%
		Hotkey,% VK(skill5), LC5L
		if %skill6%
		Hotkey,% VK(skill6), LC6L
		if %skill7%
		Hotkey,% VK(skill7), LC7L
		if %skill8%
		Hotkey,% VK(skill8), LC8L
	}
	else {
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
	
	}
	
	if %skill9%
	Hotkey,% VK(skill9), LC9
	if %skill10%
	Hotkey,% VK(skill10), LC10
	if %skill11%
	Hotkey,% VK(skill11), LC11
	if %skill12%
	Hotkey,% VK(skill12), LC12
}
  
  
;************************************************AUTO-CASTS*****************************************

  IniRead, EnAutoCast, %A_WorkingDir%\%profileini%, Auto-Casts, EnAutoCast, 0
  IniRead, DoubleAutoCast, %A_WorkingDir%\%profileini%, Auto-Casts, DoubleAutoCast, 0
  IniRead, auto1, %A_WorkingDir%\%profileini%, Auto-Casts, auto1, !E
  IniRead, auto2, %A_WorkingDir%\%profileini%, Auto-Casts, auto2, !R
  IniRead, autoall, %A_WorkingDir%\%profileini%, Auto-Casts, autoALL, !F
  if %EnAutoCast%
  {
  if DoubleAutoCast
  {
  a1:=VK(auto1)
  a2:=VK(auto2)
  aa:=VK(autoall)
  if %auto1%
	Hotkey,~%a1%, DAC1
  if %auto2%
	Hotkey,~%a2%, DAC2
  if %autoall%
	Hotkey,~%aa%, DACa
  }
  else
  {
  if %auto1%
    if UAC
    Hotkey,% VK(auto1), AC1UAC
	else
	Hotkey,% VK(auto1), AC1
  if %auto2%
	if UAC
    Hotkey,% VK(auto2), AC2UAC
	else
	Hotkey,% VK(auto2), AC2
  if %autoall%
	if UAC
    Hotkey,% VK(autoall), ACaUAC
	else
	Hotkey,% VK(autoall), ACa
  }
  }
  ;***************************
  	;Chat Suspending
	IniRead, chat, %A_WorkingDir%\%profileini%, Others, chat, 1
	;IniRead, AutoDetect, %A_WorkingDir%\%profileini%, Others, AutoDetect, 1
	if chat
	{
	SetTimer, CheckWarcraft, 1000
	
	}
;************************************************MESSAGES***********************************************
  loop, 36 {
	IniRead, mh%A_Index%, %A_WorkingDir%\%profileini%,Messages, hotkey%A_Index%, %A_Space%
	IniRead, mv%A_Index%, %A_WorkingDir%\%profileini%,Messages, message%A_Index%, %A_Space%
	if mh%A_Index% {

	vmh%A_Index%:=VK(mh%A_Index%)
	Hotkey, % vmh%A_Index%, mv%A_Index%
	}
	}
;************************************************INVOKER*********************************	
    IniRead, EnInvokerA, %A_WorkingDir%\%profileini%, Invoker, EnInvokerA, 0
	IniRead, EnInvokerU, %A_WorkingDir%\%profileini%, Invoker, EnInvokerU, 0
	IniRead, EnInvokerD, %A_WorkingDir%\%profileini%, Invoker, EnInvokerD, 0

	IniRead, ColdSnapA, %A_WorkingDir%\%profileini%, Invoker, ColdSnapA, !Q
	IniRead, GhostWalkA, %A_WorkingDir%\%profileini%, Invoker, GhostWalkA, !V
	IniRead, TornadoA, %A_WorkingDir%\%profileini%, Invoker, TornadoA, !X
	IniRead, EMPA, %A_WorkingDir%\%profileini%, Invoker, EMPA, !C
	IniRead, AlacrityA, %A_WorkingDir%\%profileini%, Invoker, AlacrityA, !Z
	IniRead, ChaosMeteorA, %A_WorkingDir%\%profileini%, Invoker, ChaosMeteorA, !D
	IniRead, SunStrikeA, %A_WorkingDir%\%profileini%, Invoker, SunStrikeA, !T
	IniRead, ForgeSpiritA, %A_WorkingDir%\%profileini%, Invoker, ForgeSpiritA, !F
	IniRead, IceWallA, %A_WorkingDir%\%profileini%, Invoker, IceWallA, !G
	IniRead, BlastA, %A_WorkingDir%\%profileini%, Invoker, BlastA, !B
	
	IniRead, AlacrityAS, %A_WorkingDir%\%profileini%, Invoker, AlacrityAS, %A_Space%
	IniRead, AlacrityUS, %A_WorkingDir%\%profileini%, Invoker, AlacrityUS, %A_Space%
	
	IniRead, ColdSnapU, %A_WorkingDir%\%profileini%, Invoker, ColdSnapU, ^Q
	IniRead, GhostWalkU, %A_WorkingDir%\%profileini%, Invoker, GhostWalkU, ^V
	IniRead, TornadoU, %A_WorkingDir%\%profileini%, Invoker, TornadoU, ^X
	IniRead, EMPU, %A_WorkingDir%\%profileini%, Invoker, EMPU, ^C
	IniRead, AlacrityU, %A_WorkingDir%\%profileini%, Invoker, AlacrityU, ^Z
	IniRead, ChaosMeteorU, %A_WorkingDir%\%profileini%, Invoker, ChaosMeteorU, ^D
	IniRead, SunStrikeU, %A_WorkingDir%\%profileini%, Invoker, SunStrikeU, ^T
	IniRead, ForgeSpiritU, %A_WorkingDir%\%profileini%, Invoker, ForgeSpiritU, ^F
	IniRead, IceWallU, %A_WorkingDir%\%profileini%, Invoker, IceWallU, ^G
	IniRead, BlastU, %A_WorkingDir%\%profileini%, Invoker, BlastU, ^B
	
	
	IniRead, QQQ, %A_WorkingDir%\%profileini%, Invoker, QQQ, %A_Space%
	IniRead, WWW, %A_WorkingDir%\%profileini%, Invoker, WWW, %A_Space%
	IniRead, EEE, %A_WorkingDir%\%profileini%, Invoker, EEE, %A_Space%
	IniRead, il, %A_WorkingDir%\%profileini%, Invoker, il, l
	
	IniRead, Q, %A_WorkingDir%\%profileini%, Invoker, Q, Q
	IniRead, W, %A_WorkingDir%\%profileini%, Invoker, W, W
	IniRead, E, %A_WorkingDir%\%profileini%, Invoker, E, E
	IniRead, R, %A_WorkingDir%\%profileini%, Invoker, R, R
	
	vQ:=VK(Q)
	vW:=VK(W)
	vE:=VK(E)
	vR:=VK(R)
	
	
	if EnInvokerA
	{
	if EnInvokerD
	{
	if %ColdSnapA%
	ColdSnapA:=VK(ColdSnapA)
	GhostWalkA:=VK(GhostWalkA)
	TornadoA:=VK(TornadoA)
	AlacrityA:=VK(AlacrityA)
	ChaosMeteorA:=VK(ChaosMeteorA)
	SunStrikeA:=VK(SunStrikeA)
	ForgeSpiritA:=VK(ForgeSpiritA)
	IceWallA:=VK(IceWallA)
	BlastA:=VK(BlastA)
	EMPA:=VK(EMPA)
	Hotkey,~%ColdSnapA%, DSnap
	if %GhostWalkA%
	Hotkey,~%GhostWalkA%, DWalk
	if %TornadoA%
	Hotkey,~%TornadoA%, DTornado
	if %EMPA%
	Hotkey,~%EMPA%, DEMP
	if %AlacrityA%
	Hotkey,~%AlacrityA%, DAlacrity
	if %ChaosMeteorA%
	Hotkey,~%ChaosMeteorA%, DMeteor
	if %SunStrikeA%
	Hotkey,~%SunStrikeA%, DStrike
	if %ForgeSpiritA%
	Hotkey,~%ForgeSpiritA%, DSpirit
	if %IceWallA%
	Hotkey,~%IceWallA%, DWall
	if %BlastA%
	Hotkey,~%BlastA%, DBlast
	}
	else
	{
	if %ColdSnapA%
	Hotkey,% VK(ColdSnapA), Snap
	if %GhostWalkA%
	Hotkey,% VK(GhostWalkA), Walk
	if %TornadoA%
	Hotkey,% VK(TornadoA), Tornado
	if %EMPA%
	Hotkey,% VK(EMPA), EMP
	if %AlacrityA%
	Hotkey,% VK(AlacrityA), Alacrity
	if %ChaosMeteorA%
	Hotkey,% VK(ChaosMeteorA), Meteor
	if %SunStrikeA%
	Hotkey,% VK(SunStrikeA), Strike
	if %ForgeSpiritA%
	Hotkey,% VK(ForgeSpiritA), Spirit
	if %IceWallA%
	Hotkey,% VK(IceWallA), Wall
	if %BlastA%
	Hotkey,% VK(BlastA), Blast
	}
	}
	if EnInvokerU
	{
	if EnInvokerD
	{
	ColdSnapU:=VK(ColdSnapU)
	TornadoU:=VK(TornadoU)
	EMPU:=VK(EMPU)
	AlacrityU:=VK(AlacrityU)
	SunStrikeU:=VK(SunStrikeU)
	ChaosMeteorU:=VK(ChaosMeteorU)
	ForgeSpiritU:=VK(ForgeSpiritU)
	IceWallU:=VK(IceWallU)
	BlastU:=VK(BlastU)
	if %ColdSnapU%
	Hotkey,~%ColdSnapU%, DSnap2
	if %GhostWalkA%
	Hotkey,~%GhostWalkU%, DWalk2
	if %TornadoU%
	Hotkey,~%TornadoU%, DTornado2
	if %EMPU%
	Hotkey,~%EMPU%, DEMP2
	if %AlacrityA%
	Hotkey,~%AlacrityU%, DAlacrity2
	if %ChaosMeteorU%
	Hotkey,~%ChaosMeteorU%, DMeteor2
	if %SunStrikeU%
	Hotkey,~%SunStrikeU%, DStrike2
	if %ForgeSpiritU%
	Hotkey,~%ForgeSpiritU%, DSpirit2
	if %IceWallU%
	Hotkey,~%IceWallU%, DWall2
	if %BlastU%
	Hotkey,~%BlastU%, DBlast2
	}
	else
	{
	if %ColdSnapU%
	Hotkey,% VK(ColdSnapU), Snap2
	if %GhostWalkA%
	Hotkey,% VK(GhostWalkU), Walk2
	if %TornadoU%
	Hotkey,% VK(TornadoU), Tornado2
	if %EMPU%
	Hotkey,% VK(EMPU), EMP2
	if %AlacrityA%
	Hotkey,% VK(AlacrityU), Alacrity2
	if %ChaosMeteorU%
	Hotkey,% VK(ChaosMeteorU), Meteor2
	if %SunStrikeU%
	Hotkey,% VK(SunStrikeU), Strike2
	if %ForgeSpiritU%
	Hotkey,% VK(ForgeSpiritU), Spirit2
	if %IceWallU%
	Hotkey,% VK(IceWallU), Wall2
	if %BlastU%
	Hotkey,% VK(BlastU), Blast2
	}
	}
	if EnInvokerA or EnInvokerU
	{
	if %QQQ%
	Hotkey,% VK(QQQ), gQQQ
	if %WWW%
	Hotkey,% VK(WWW), gWWW
	if %EEE%
	Hotkey,% VK(EEE), gEEE
	if %il%
	Hotkey,% VK(il), gilist
	if EnInvokerD
	{
	AlacrityAS:=VK(AlacrityAS)
	AlacrityUS:=VK(AlacrityUS)
	if %AlacrityAS%
	Hotkey,~%AlacrityAS%, DAlacrity3
	if %AlacrityUS%
	Hotkey,~%AlacrityUS%, DAlacrity4
	}
	else
	{
	if %AlacrityAS%
	Hotkey,% VK(AlacrityAS), Alacrity3
	if %AlacrityUS%
	Hotkey,% VK(AlacrityUS), Alacrity4
	}
	}
	
	
;************************************************OTHER*********************************	
	IniRead, sound, %A_WorkingDir%\%profileini%, Others, sound, 0
	IniRead, Shield, %A_WorkingDir%\%profileini%, Others, Shield, 0
	IniRead, ShieldR, %A_WorkingDir%\%profileini%, Others, ShieldR, 0
	if Shield
	Hotkey, LWin, disable
	if ShieldR
	Hotkey, RWin, disable
	
	IniRead, UpdateAtStart, %A_WorkingDir%\%profileini%, Others, UpdateAtStart, 0
	
	IniRead, RunAtStart, %A_WorkingDir%\%profileini%, Others, RunAtStart, 0
	if RunAtStart
	FileCreateShortcut , %A_ScriptDir%\%A_ScriptName%, %A_Startup%\AHT.lnk
	else{
	IfExist %A_Startup%\AHT.lnk 
	FileDelete, %A_Startup%\AHT.lnk
	}
	
	IniRead, Scoreboard, %A_WorkingDir%\%profileini%,Others, Scoreboard, ``
	if Scoreboard
	if UAC
	Hotkey,% VK(Scoreboard), SBUAC
	else
	Hotkey,% VK(Scoreboard), SB
	
	IniRead, share, %A_WorkingDir%\%profileini%,Others, share, F6
	if %share%
	Hotkey,% VK(share), ShareControl
	
	IniRead, ignore, %A_WorkingDir%\%profileini%,Others, ignore, ^S
	if %ignore%
	Hotkey,% VK(ignore), gIgnore
	
	IniRead, Garena, %A_WorkingDir%\%profileini%,Others, Garena, !J
	Hotkey, IfWinActive, Garena
	if %Garena%
	Hotkey,% VK(Garena), GarenaJoiner
	Hotkey, IfWinActive, ahk_group WC3DOTA
	
	IniRead, Time, %A_WorkingDir%\%profileini%,Others, time, %A_Space%
	if %Time%
	Hotkey,% VK(Time), TimeNow
	
	IniRead, toggle, %A_WorkingDir%\%profileini%,Others, toggle, Home
	if %toggle%
	Hotkey,% VK(toggle), Switch
	
	IniRead, pause, %A_WorkingDir%\%profileini%,Others, pause, !P
	if %pause%
	Hotkey,% VK(pause), PauseGame
	
	IniRead, Roshan, %A_WorkingDir%\%profileini%,Others, Roshan, %A_Space%
	if %Roshan%
	Hotkey,% VK(Roshan), Rosh
	
	IniRead, hero, %A_WorkingDir%\%profileini%,Others, hero, %A_Space%
	if %hero%
	Hotkey,% VK(hero), GetHero
	
	;HPBar
	IniRead,AHP, %A_WorkingDir%\%profileini%,Others, AHP, ![
	IniRead,EHP, %A_WorkingDir%\%profileini%,Others, EHP, !]
	;IniRead,AHPS, %A_WorkingDir%\%profileini%,Others, AHPS, 0
	;IniRead,EHPS, %A_WorkingDir%\%profileini%,Others, EHPS, 0
	if %AHP%
	Hotkey,% VK(AHP), ShowAHP
	if %EHP%
	Hotkey,% VK(EHP), ShowEHP
	;if AHPS
	;SetTimer, AHPST, 1000
	;if EHPS
	;SetTimer, EHPST, 1000
	
	IniRead, prog1, %A_WorkingDir%\%profileini%, Others, prog1, %A_Space%
	IniRead, runprog1s, %A_WorkingDir%\%profileini%, Others, runprog1s, 0
	IniRead, prog2, %A_WorkingDir%\%profileini%, Others, prog2, %A_Space%
	IniRead, runprog2s, %A_WorkingDir%\%profileini%, Others, runprog2s, 0
	IniRead, prog3, %A_WorkingDir%\%profileini%, Others, prog3, %A_Space%
	IniRead, runprog3s, %A_WorkingDir%\%profileini%, Others, runprog3s, 0

	loop, 35 {
	IniRead, krh%A_Index%, %A_WorkingDir%\%profileini%,RemapKey, KRhotkey%A_Index%, %A_Space%
	IniRead, krv%A_Index%, %A_WorkingDir%\%profileini%,RemapKey, KRvalue%A_Index%, %A_Space%
	if krh%A_Index%
	Hotkey,% VK(krh%A_Index%), krv%A_Index%
	}
	
	IniRead, DontShowConfigTemp, %A_WorkingDir%\settings.ini,Others, DontShowConfigTemp, 0
	IniRead, DontShowConfig, %A_WorkingDir%\settings.ini,Others, DontShowConfig, 0
;==================================================================================  
;=====================================GUI==========================================
;==================================================================================  
if runprog1s
		gosub, runprog1
	if runprog2s
		gosub, runprog2
	if runprog3s
		gosub, runprog3

if DontShowConfig or DontShowConfigTemp
{
EmptyMem()
IniWrite, 0, %A_WorkingDir%\settings.ini, Others, DontShowConfigTemp
return
}

configuration:
if ConfigCreated
{
gui, show, autosize center, %Version% - %profile% profile
}
else {
ConfigCreated:=1
Menu, ProfileMenu, Add, &New Profile, ProfileNew
Menu, ProfileMenu, Add
Menu, ProfileMenu, Add, &General, ChooseGeneral
Menu, ProfileMenu, Add
Loop, %A_WorkingDir%\*.ini
{
if A_LoopFileName!=settings.ini
cprofile:= SubStr(A_LoopFileName,1,-4)
Menu, ProfileMenu, Add, %cprofile%, ProfileChoose
}
Menu, Warcraft, Add, Registry Fixer, WarRegFix
Menu, Warcraft, Add, Resolution Changer, ResChange

RegRead, healthbars, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Gameplay, healthbars
RegRead, mcustomkeys, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Gameplay, customkeys
Menu, Warcraft, Add, Show HealthBars, showhealthbars
if healthbars
menu, warcraft, check, Show HealthBars
else
menu, warcraft, uncheck, Show HealthBars

menu, warcraft, add, Use Customkeys, usecustomkeys
if mcustomkeys
menu, warcraft, check, Use Customkeys
else
menu, warcraft, uncheck, Use Customkeys

RegRead, opengl, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, Gfx OpenGL
RegRead, fps, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Video, lockfb
Menu, Warcraft, Add, OpenGL on, OpenGL
Menu, Warcraft, Add, Improve FPS, ImprFPS
if opengl
menu, warcraft, check, OpenGL on
else
menu, warcraft, uncheck, OpenGL on

if !fps
menu, warcraft, check, Improve FPS
else
menu, warcraft, uncheck, Improve FPS

Menu, Options, Add, Scroll Indicator, SetScrollIndicator
Menu, Options, Add, Sound Indicator, SetSoundIndicator
Menu, Options, Add
Menu, Options, Add, Shield LeftWin, SetShieldLWin
Menu, Options, Add, Shield RightWin, SetShieldRWin
Menu, Options, Add
Menu, Options, Add, Run at start, SetRunatStart
Menu, Options, Add, Update at start, SetUpdateAtStart
Menu, Options, Add
Menu, Options, Add, Mouse Capture, SetWMC

Menu, Chat-Suspend, Add, Chat-free in game, Setchat
;Menu, Chat-Suspend, Add, Chat-free in lobby, Setautodetect

Menu, Submenu1, Add, default, styledefault
Menu, Submenu1, Add
Menu, Submenu1, Add, light purple, stylelpurple
Menu, Submenu1, Add, light blue, stylelblue
Menu, Submenu1, Add, light green, stylelgreen
Menu, Submenu1, Add
Menu, Submenu1, Add, purple, stylepurple
Menu, Submenu1, Add, blue, styleblue
Menu, Submenu1, Add, green, stylegreen
Menu, Submenu1, Add, grey, stylegrey

Menu, Options, Add, Color Style, :Submenu1

if chat
menu, Chat-Suspend, check, Chat-free in game
if ScrollIndicator
menu, Options, check, Scroll Indicator
if sound
menu, Options, check, Sound Indicator
if Shield
menu, Options, check, Shield LeftWin
if ShieldR
menu, Options, check, Shield RightWin
if RunAtStart
menu, Options, check, Run at start
if UpdateAtStart
menu, Options, check, Update at start
if WMC {
menu, Options, check, Mouse Capture
menu, tray, check, Mouse Capture
}
	

Menu, HelpMenu, Add, &Check updates, UpdateCheck
Menu, HelpMenu, Add, &Commands, Commands
Menu, HelpMenu, Add, &About, About

Menu, LinksMenu, Add, How to use, Help
Menu, LinksMenu, Add, Generate CustomKeys.txt, Customkeystxt
Menu, LinksMenu, Add, AucT Blog, auctblog
Menu, LinksMenu, Add, Dota Resources, dotaresources


; Create the menu bar by attaching the sub-menus to it:
Menu, MyMenuBar, Add, Profile, :ProfileMenu
Menu, MyMenuBar, Add, WarCraft, :WarCraft
Menu, MyMenuBar, Add, Options, :Options
Menu, MyMenuBar, Add, Chat-Suspend, :Chat-Suspend
Menu, MyMenuBar, Add, Links, :LinksMenu
Menu, MyMenuBar, Add, Help, :HelpMenu


Gui, Menu, MyMenuBar

Gui, Add, Tab2, x0 y0 w470 h500 , Inventory|Skills|Autocast|Messages|Invoker|Remap|Other
Gui, Tab, Inventory
if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Inventory
if darkstyle
gui, font, cwhite
else
gui, font
Gui, Add, Picture, x115 y92 w200 h300 , %A_temp%\Inventory.jpg
Gui, Add, Checkbox, Checked%EnInventory% vEnInventory gSwitchInv x115 y62 , Enable Keys
Gui, Add, button, vb1 gSetItem x120 y150 w85 h30,%h1%
Gui, Add, button, vb2 gSetItem x225 y150 w85 h30,%h2%
Gui, Add, button, vb3 gSetItem x120 y240 w85 h30,%h3%
Gui, Add, button, vb4 gSetItem x225 y240 w85 h30,%h4%
Gui, Add, button, vb5 gSetItem x120 y350 w85 h30,%h5%
Gui, Add, button, vb6 gSetItem x225 y350 w85 h30,%h6%
if EnInventory=0
Gosub, SwitchInv


Gui, Tab, Skills
if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Customkeys
if darkstyle
gui, font, cwhite
else
gui, font
Gui, Add, CheckBox,Checked%EnSkills% vEnSkills gEnSkills x36 y55 w200 h30 , Enable Custom Keys
Gui, Add, CheckBox,Checked%SmartSkills% vSmartSkills gSmartSkills x236 y55 w200 h30 , Smart Learning Skills*
Gui, Add, CheckBox,Checked%SelfCast% vSelfCast gSelfCast x36 y80 w200 h30 , Selfcast on double-click
gui, add, text, x30 y390 w410,*Smart Learning will click the right (upper) skill when learning skill.
gui, add, text, cBlue gCustomkeystxt x30 y410 w410,AucT CustomKeys.txt Generator
Gui, Add, Picture, x36 y110 w402 h272 , %A_temp%\Skills.jpg
Gui, Add, Hotkey, vskill9 gskill9 x94 y142 w30 h30 , %skill9%
Gui, Add, Hotkey, vskill10 gskill10 x194 y142 w30 h30 , %skill10%
Gui, Add, Hotkey, vskill11 gskill11 x294 y142 w30 h30 , %skill11%
Gui, Add, Hotkey, vskill12 gskill12 x394 y142 w30 h30 , %skill12%
Gui, Add, Hotkey, vskill8 gskill8 x394 y232 w30 h30 , %skill8%
Gui, Add, Hotkey, vskill7 gskill7 x294 y232 w30 h30 , %skill7%
Gui, Add, Hotkey, vskill6 gskill6 x194 y232 w30 h30 , %skill6%
Gui, Add, Hotkey, vskill5 gskill5 x94 y232 w30 h30 , %skill5%
Gui, Add, Hotkey, vskill1 gskill1 x94 y322 w30 h30 , %skill1%
Gui, Add, Hotkey, vskill2 gskill2 x194 y322 w30 h30 , %skill2%
Gui, Add, Hotkey, vskill3 gskill3 x294 y322 w30 h30 , %skill3%
Gui, Add, Hotkey, vskill4 gskill4 x394 y322 w30 h30 , %skill4%

Gui, Tab, Autocast
Gui, Add, Picture, x36 y92 w402 h272 , %A_temp%\AutoCast.jpg
if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Autocast
if darkstyle
gui, font, cwhite
else
gui, font
Gui, Add, CheckBox,Checked%EnAutoCast% vEnAutoCast gEnAutoCast x36 y62 w200 h30 , Enable AutoCast Keys
Gui, Add, CheckBox,Checked%DoubleAutoCast% vDoubleAutoCast gDoubleAutoCast x236 y62 w200 h30 ,Autocast on double click*
gui, add, text, x30 y370 w410,*If double click is checked the autocast key isn't blocked
Gui, Add, Picture, x36 y392 w30 h30 , %A_temp%\blue.gif
Gui, Add, Picture, x170 y392 w30 h30 , %A_temp%\pink.gif
Gui, Add, Picture, x314 y392 w30 h30 , %A_temp%\all.gif
Gui, Add, Hotkey, vauto1 gauto1 x76 y392 w80 h30 , %auto1%
Gui, Add, Hotkey, vauto2 gauto2 x215 y392 w80 h30 , %auto2%
Gui, Add, Hotkey, vautoall gautoall x354 y392 w80 h30 , %autoall%

Gui, Tab, Messages
if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400,Messages


mesinfo =
(
To make random message add "|" after each. For example:
GJ|GREAT|nice1|I love u
)
if darkstyle
gui, font, cwhite
else
gui, font
gui, add, text, x30 y390 w410,%mesinfo%
gui, add, checkbox, x380 y55 w70 h30 vtoAll, To All?
gui, font


gui, add, hotkey,vHotkeyChoose_Mes x30 y55 w100 h30,
gui, add, button, gAddMes x140 y55 w110 h30, ADD
gui, add, button, gDeleteMes x260 y55 w110 h30, DELETE

Gui, Add, ListBox, x30 y90 w100 h295 vMes_Key gMes_MesUpdate
gui, add, edit, x140 y90 w300 h290 vMesEdit,

gosub, Mes_KeyUpdate


Gui, Tab, Invoker
if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Invoker
if darkstyle
gui, font, cwhite
else
gui, font
gui, add, text, x30 y48, *Put customkeys in bottom right fields. only Add Spell will work with customkeys.
gui, add, Checkbox, Checked%EnInvokerA% vEnInvokerA gEnInvokerA x120 y68, Add Spell
gui, add, checkbox, Checked%EnInvokerU% vEnInvokerU gEnInvokerU x220 y68, Use Spell
gui, add, checkbox, Checked%EnInvokerD% vEnInvokerD gEnInvokerD x320 y68, Double Click
gui, add, text, x30 y90, Cold Snap
gui, add, text, x30 y125, Ghost Walk
gui, add, text, x30 y160, Tornado
gui, add, text, x30 y195, EMP
gui, add, text, x30 y230, Alacrity
gui, add, text, x30 y265, Chaos Meteor
gui, add, text, x30 y300, Sun Strike
gui, add, text, x30 y335, Forge Spirit
gui, add, text, x30 y370, Ice Wall
gui, add, text, x30 y405, Blast

gui, add, text, x320 y90, QQQ
gui, add, text, x320 y125, WWW
gui, add, text, x320 y160, EEE
gui, add, text, x320 y195, -il
gui, add, text, x320 y230, Self-Cast Z:
gui, add, text, x320 y275, Invoke + Self-Cast Z:

gui, add, hotkey,vQQQ gQQQ x360 y90 w80, %QQQ%
gui, add, hotkey,vWWW gWWW x360 y125 w80, %WWW%
gui, add, hotkey,vEEE gEEE x360 y160 w80, %EEE%
gui, add, hotkey,vil gil x360 y195 w80, %il%
gui, add, hotkey,vAlacrityAS gAlacrityAS x320 y250 w120, %AlacrityAS%
gui, add, hotkey,vAlacrityUS gAlacrityUS x320 y290 w120, %AlacrityUS%

gui, add, text, x320 y320, Your Customkeys*:
gui, add, text, x320 y340, Quas
gui, add, hotkey,vQ gQ x355 y340 w80, %Q%
gui, add, text, x320 y360, Wex
gui, add, hotkey,vW gW x355 y360 w80, %W%
gui, add, text, x320 y380, Exort
gui, add, hotkey,vE gE x355 y380 w80, %E%
gui, add, text, x320 y400, Invoke
gui, add, hotkey,vR gR x355 y400 w80, %R%

gui, add, hotkey,vColdSnapA gColdSnapA x120 y90 w80, %ColdSnapA%
gui, add, hotkey,vColdSnapU gColdSnapU x220 y90 w80, %ColdSnapU%
gui, add, hotkey,vGhostWalkA gGhostWalkA x120 y125 w80, %GhostWalkA%
gui, add, hotkey,vGhostWalkU gGhostWalkU x220 y125 w80, %GhostWalkU%
gui, add, hotkey,vTornadoA gTornadoA x120 y160 w80, %TornadoA%
gui, add, hotkey,vTornadoU gTornadoU x220 y160 w80, %TornadoU%
gui, add, hotkey,vEMPA gEMPA x120 y195 w80, %EMPA%
gui, add, hotkey,vEMPU gEMPU x220 y195 w80, %EMPU%
gui, add, hotkey,vAlacrityA gAlacrityA x120 y230 w80, %AlacrityA%
gui, add, hotkey,vAlacrityU gAlacrityU x220 y230 w80, %AlacrityU%
gui, add, hotkey,vChaosMeteorA gChaosMeteorA x120 y265 w80, %ChaosMeteorA%
gui, add, hotkey,vChaosMeteorU gChaosMeteorU x220 y265 w80, %ChaosMeteorU%
gui, add, hotkey,vSunStrikeA gSunStrikeA x120 y300 w80, %SunStrikeA%
gui, add, hotkey,vSunStrikeU gSunStrikeU x220 y300 w80, %SunStrikeU%
gui, add, hotkey,vForgeSpiritA gForgeSpiritA x120 y335 w80, %ForgeSpiritA%
gui, add, hotkey,vForgeSpiritU gForgeSpiritU x220 y335 w80, %ForgeSpiritU%
gui, add, hotkey,vIceWallA gIceWallA x120 y370 w80, %IceWallA%
gui, add, hotkey,vIceWallU gIceWallU x220 y370 w80, %IceWallU%
gui, add, hotkey,vBlastA gBlastA x120 y405 w80, %BlastA%
gui, add, hotkey,vBlastU gBlastU x220 y405 w80, %BlastU%

Gui, Tab, Remap
gui, font
gui, font, s14
Gui, Add, ListBox, x30 y90 w400 h342 vRemap_Key gRemap_Update
gui, font
if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400,Key Remap
if darkstyle
gui, font, cwhite
else
gui, font

gui, add, hotkey,vHK_Remap x30 y55 w80 h30,
gui, add, hotkey,vValue_Remap x120 y55 w80 h30,
gui, add, button, gAddRemap x210 y55 w110 h30, ADD
gui, add, button, gDeleteRemap x330 y55 w110 h30, DELETE

gosub, Remap_KeyUpdate
Gui, Tab, Other

if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h270 , Other
if darkstyle
gui, font, cwhite
else
gui, font

Gui, Add, Hotkey, vScoreboard gScoreboard x26 y60 w80, %Scoreboard%
Gui, Add, Text, x116 y60, Show ScoreBoard
Gui, Add, Hotkey, vShare gShare x26 y95 w80, %Share%
Gui, Add, Text, x116 y95, Share Control
Gui, Add, Hotkey, vIgnore gIgnore x26 y130 w80, %Ignore%
Gui, Add, Text, x116 y130, Ignore (/squelch)
Gui, Add, Hotkey, vAHP gAHP x26 y165 w80, %AHP%
Gui, Add, Text, x116 y165, Show ally HP
Gui, Add, Hotkey, vGarena gGarena x26 y200 w80, %Garena%
Gui, Add, Text, x116 y200, Garena AutoJoin
Gui, Add, Hotkey, vReloadScr gReloadScr x26 y235 w80, %ReloadScr%
Gui, Add, Text, x116 y235, Reload Script
Gui, Add, Hotkey, vWMChotkey gWMChotkey x26 y270 w80, %WMChotkey%
Gui, Add, Text, x116 y270, Window Mouse Capture

Gui, Add, Hotkey, vTime gTime x250 y60 w80, %Time%
Gui, Add, Text, x340 y60, Get Time
Gui, Add, Hotkey, vtoggle gtoggle x250 y95 w80, %toggle%
Gui, Add, Text, x340 y95, Pause Script
Gui, Add, Hotkey, vpause gpause x250 y130 w80, %pause%
Gui, Add, Text, x340 y130, Pause Game
Gui, Add, Hotkey, vEHP gEHP x250 y165 w80, %EHP%
Gui, Add, Text, x340 y165, Show enemy HP
Gui, Add, Hotkey, vRoshan gRoshan x250 y200 w80, %Roshan%
Gui, Add, Text, x340 y200, Rosh Notification 
Gui, Add, Hotkey, vHero gHero x250 y235 w80, %Hero%
Gui, Add, Text, x340 y235, Get Hero

if darkstyle
gui, font, cwhite
else
gui, font, cblue
Gui, Add, GroupBox, x6 y305 w450 h125,Run Program

gui, font
gui, add, edit,r1 vprog1 x26 y330 w200, %prog1%
gui, add, button, x+5 gBrowseProg1 w40,...
gui, add, button, x+5 gRunProg1 w60,Run
if darkstyle
gui, font, cwhite
gui, add, checkbox,checked%runprog1s% vrunprog1s grunprog1s x+5 yp+4, Run At Start
gui, font

gui, add, edit,r1 vprog2 x26 y360 w200, %prog2%
gui, add, button, x+5 gBrowseProg2 w40,...
gui, add, button, x+5 gRunProg2 w60,Run
if darkstyle
gui, font, cwhite
gui, add, checkbox,checked%runprog2s% vrunprog2s grunprog2s x+5 yp+4, Run At Start
gui, font

gui, add, edit,r1 vprog3 x26 y390 w200, %prog3%
gui, add, button, x+5 gBrowseProg3 w40,...
gui, add, button, x+5 gRunProg3 w60,Run
if darkstyle
gui, font, cwhite
gui, add, checkbox,checked%runprog3s% vrunprog3s grunprog3s x+5 yp+4, Run At Start
gui, font

Gui, Tab
if darkstyle
gui, font, cwhite
gui, add, checkbox,Checked%DontShowConfig% vDontShowConfig gDontShowConfig x16 y457, Don't show it later
gui, font, bold
Gui, Add, Button, x155 y450 w90 h30,Hide
Gui, Add, Button, gButtonReload x250 y450 w110 h30,Save
Gui, Add, Button, x365 y450 w90 h30,Exit
if darkstyle
gui, font, cwhite
else
gui, font
Gui, Show, x209 y100 h500 w470, %Version% - %profile% profile
}
EmptyMem()
return

:*b0:/l ::
suspend, permit
Input  arguments, V I , {enter}

if arguments!=general
{
IfNotExist %arguments%.ini
{
;MsgBox 16, Error ,Profile doesn't exist!,3
soundplay *-1
sleep 1000
send {enter}Profile doesn't exist{enter}
return
}
}

IniWrite, 1, %A_WorkingDir%\settings.ini, Others, DontShowConfigTemp

IniWrite, %arguments%, %A_WorkingDir%\settings.ini, Others, profile
;MsgBox 64, Info ,Loaded successfully!,2
soundplay *64
sleep 1000
send {enter}%arguments% profile loaded successfully{enter}
reload
return

::/reload::
::reload::
suspend, permit
send {esc}
IniWrite, 1, %A_WorkingDir%\settings.ini, Others, DontShowConfigTemp
sleep 150
send {enter}Script reloaded successfully{enter}
reload
return

::/exit::
::exit::
suspend, permit
ExitApp
return

::/suspend::
::suspend::
suspend, permit
send {enter}
sleep, 150
gosub, switch
return

::-u::
suspend, permit
send -unlock{enter}
return

::-ro::
suspend, permit
send -roll{enter}
return

::-wa::
suspend, permit
send -water{space}
return

::-we::
suspend, permit
send -weather{space}
return

::-ra::
suspend, permit
send -random{enter}
return

::-c::
suspend, permit
send -clear{enter}
return

::-re::
suspend, permit
send -repick{enter}
return

::-1x1::
suspend, permit
send -apshomnp{enter}
return

BrowseProg1:
FileSelectFile, prog1, , , Select your prog, Anything (*.*)
if prog1
GuiControl Text, prog1, %prog1%
IniWrite, %prog1%, %profileini%, Others, prog1
return
BrowseProg2:
FileSelectFile, prog2, , , Select your prog, Anything (*.*)
GuiControl Text, prog2, %prog2%
IniWrite, %prog2%, %profileini%, Others, prog2
return
BrowseProg3:
FileSelectFile, prog3, , , Select your prog, Anything (*.*)
GuiControl Text, prog3, %prog3%
IniWrite, %prog3%, %profileini%, Others, prog3
return

RunProg1:
Run, %Prog1%
return
RunProg2:
Run, %Prog2%,, UseErrorLevel
return
RunProg3:
Run, %Prog3%,, UseErrorLevel
return


FileNew:
FileOpen:
FileSaveAs:
FileExit:

return

ProfileNew:
Gui 3:Default
Gui, +owner1
gui, add, text,, Name of new profile:
gui, add, edit,vNewProf w200
gui, add, checkbox,Checked1 vblankprofile x+5 yp h25, Blank?*
gui, add, text, x10, *If not blank - will copy current keys to new profile
gui, add, button,x10 gOkNewProfile w145, OK
gui, add, button, yp x+10 w145, Cancel
gui, show,,Create new profile
return

OkNewProfile:
gui, submit, nohide
if NewProf
{
IniWrite, %NewProf%, %A_WorkingDir%\settings.ini, Others, profile

if blankprofile
IniWrite,%A_Space%, %A_WorkingDir%\%NewProf%.ini, Inventory, item1
else
FileCopy, %A_WorkingDir%\%profileini%, %NewProf%.ini
gui, 3:destroy
reload
}
else
MsgBox 262160, Error ,Choose name for profile
return

ChooseGeneral:
IniWrite, general, %A_WorkingDir%\settings.ini, Others, profile
reload
return

ProfileChoose:
IniWrite, %A_ThisMenuItem%, %A_WorkingDir%\settings.ini, Others, profile
reload
return



Commands:
Commandlist =
(
Default Commands:
/l ProfileName - will load profile (if it exists).
/reload (or reload) - will reload script
/suspend (or suspend) - will pause (unpause) script
/exit (or exit) - will exit script

Default Hotstrings:
-u - -unlock
-wa - -water
-we - -weather
-re - -repick
-ra - -random
-ro - -roll
-1x1 - -apshomnp
)

MsgBox 64, Command List ,%Commandlist%
return

Help:
run, http://aht.auct.eu/guide.html
return


auctblog:
run, http://auct.eu
return
dotaresources:
run, https://yadi.sk/d/arn3UVKVHxdSk
return
Customkeystxt:
run, http://dotacustomkeys.appspot.com/
return

UpdateCheck:
UrlDownloadToFile, https://auct.eu/latestaht.html, %A_Temp%\latest.html
FileReadLine, NetVer, %A_Temp%\latest.html, 1
If (Version <> NetVer)
{
   ;MsgBox, 4,Check for update, %NetVer% is available! `nWould you like to download new version?
   MsgBox 68, Update is available ,%NetVer% is available! `nWould you like to download new version?,5
IfMsgBox Yes
	run, http://aht.auct.eu/download.html
}
else
   MsgBox 64, Info ,Your AHT is up to date!,2
return

UpdateCheckS:
UrlDownloadToFile, https://auct.eu/latestaht.html, %A_Temp%\latest.html
FileReadLine, NetVer, %A_Temp%\latest.html, 1
If (Version <> NetVer){
   MsgBox, 4,Check for Update, %NetVer% is available! `nWould you like to download new version?
IfMsgBox Yes
	run, http://aht.auct.eu/download.html
}
return

RunWC3:
regread, path, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, ProgramX
if path
{
if WMC
run %path% -windowed
else
run %path%
}
else
gosub, WarRegFix
return

About:
if aboutcreated
gui, 2:show, autosize center, About
else {
Gui +Disabled  ; Disable main window.
Gui 2:Default
Gui, +owner1  ; Make the main window (Gui #1) the owner of the "about box" (Gui #2).

if darkstyle
gui, font,s10 cwhite
else
gui, font,s10 cblue
Gui, Add, GroupBox, x10 y0 w330 R1 , Author
if darkstyle
gui, font, cwhite
else
gui, font
gui, font, s10 underline
Gui, add, text,x140 y25 gmailauct,AucT

if darkstyle
gui, font,s10 cwhite
else
gui, font,s10 cblue
Gui, Add, GroupBox, x10 w330 R1 , Main Tester
if darkstyle
gui, font, cwhite
else
gui, font
gui, font, s10
Gui, add, text,x130 y85,DenSiL7

if darkstyle
gui, font,s10 cwhite
else
gui, font,s10 cblue
Gui, Add, GroupBox, x10 w330 R1 ,Window mode
if darkstyle
gui, font, cwhite
else
gui, font
gui, font, s10
Gui, add, text,x130 y145,yayuhhz

if darkstyle
gui, font,s10 cwhite
else
gui, font,s10 cblue
Gui, Add, GroupBox, x10 w330 R1 , Website
if darkstyle
gui, font, cwhite
else
gui, font
gui, font, s10 underline
Gui, add, text,x100 y205 gAHTISGREAT, http://aht.auct.eu
if darkstyle
gui, font, cwhite
else
gui, font
gui, font, s10
gui, add, button, x10 y+20 w330, OK
if darkstyle
gui, font, cwhite
else
gui, font
gui, show, autosize center, About
aboutcreated:=1
}
return

2ButtonOK:
2GuiClose:
2GuiEscape:
Gui, 1:-Disabled  ; Re-enable the main window (must be done prior to the next step).
Gui, hide  ; Destroy the about box.
return

AHTISGREAT:
run, http://aht.auct.eu
return
mailauct:
run, mailto:AucT.eu@gmail.com?Subject=AHT
return


;*******************************Warcraft III Registry Fixer***********************************
WarRegFix:
Gui 5:Default
RegRead, CPath, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III,InstallPathX
Gui, -MinimizeBox -MaximizeBox
Gui, Add, Text,, Warcraft III Directory:
Gui, Add, Edit,w300 vWarcraftPath , %CPath%
Gui, Add, Button, x+5 yp w100 gBrowseRegFix , Browse
Gui, Add, Button, x10 w200 gRegFix , Fix Registry
Gui, Add, Button, x+5 w200, Cancel
Gui, Show, , Warcraft III Registry Fixer
Return

BrowseRegFix:
FileSelectFolder, SPath, , , Select you Warcraft III folder.
IfExist, %SPath%\war3.exe
    ControlSetText, Edit1, %SPath%, A
else
    MsgBox, 16, Warcraft III Registry Fixer, You did not choose the correct folder.
return

RegFix:
Gui 5:Default
Gui, Submit, NoHide
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, InstallPath, %SPath%
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, InstallPathX, %SPath%
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, Program, %SPath%\Warcraft III.exe
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, ProgramX, %SPath%\Frozen Throne.exe
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, War3CD, %SPath%
RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, War3XCD, %SPath%
MsgBox, 32, Warcraft III Registry Fixer, The registry has been fixed.
return

5GuiEscape:
5GuiClose:
5ButtonCancel:
Gui, destroy
return

ResChange:
Gui 6:Default
SysGet, SysWidth, 0
SysGet, SysHeight, 1
gui, add, edit,vwarw w100,%SysWidth%
gui, add, edit,vwarh yp x+5 w100,%SysHeight%
gui, add, button,x10 w100, Change
gui, add, button,x+5 w100, Cancel
Gui, Show, , Warcraft III Res Changer
return

6ButtonChange:
gui, submit, nohide
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Video, reswidth, %warw%
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Video, resheight, %warh%
MsgBox, 32, Warcraft III Resolution have been setted.
Gui, destroy
return
6GuiEscape:
6GuiClose:
6ButtonCancel:
Gui, destroy
return


showhealthbars:
healthbars:=!healthbars
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Gameplay, healthbars, %healthbars%
menu, warcraft, togglecheck, Show HealthBars
return

usecustomkeys:
mcustomkeys:=!mcustomkeys
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Gameplay, customkeys, %mcustomkeys%
menu, warcraft, togglecheck, Use Customkeys
return

OpenGL:
opengl:=!opengl
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III, Gfx OpenGL, %opengl%
menu, warcraft, togglecheck, OpenGL on
return

ImprFPS:
fps:=!fps
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Blizzard Entertainment\Warcraft III\Video, lockfb, %fps%
menu, warcraft, togglecheck, Improve FPS
return




SetScrollIndicator:
ScrollIndicator:=!ScrollIndicator
IniWrite, %ScrollIndicator%, %A_WorkingDir%\%profileini%, Others, ScrollIndicator
menu, options, togglecheck, Scroll Indicator
return

SetSoundIndicator:
sound:=!sound
IniWrite, %sound%, %A_WorkingDir%\%profileini%, Others, sound
menu, options, togglecheck, Sound Indicator
return

SetShieldLWin:
Shield:=!Shield
IniWrite, %Shield%, %A_WorkingDir%\%profileini%, Others, Shield
menu, options, togglecheck, Shield LeftWin
return

SetShieldRWin:
ShieldR:=!ShieldR
IniWrite, %ShieldR%, %A_WorkingDir%\%profileini%, Others, ShieldR
menu, options, togglecheck, Shield RightWin
return

SetChat:
chat:=!chat
IniWrite, %chat%, %A_WorkingDir%\%profileini%, Others, chat
menu, Chat-Suspend, togglecheck, Chat-free in game
return

SetAutodetect:
autodetect:=!autodetect
IniWrite, %autodetect%, %A_WorkingDir%\%profileini%, Others, autodetect
menu, Chat-Suspend, togglecheck, Chat-free in lobby
return

SetRunatStart:
RunatStart:=!RunatStart
IniWrite, %RunatStart%, %A_WorkingDir%\%profileini%, Others, RunatStart
menu, options, togglecheck, Run at Start
return

SetUpdateatStart:
UpdateatStart:=!UpdateatStart
IniWrite, %UpdateatStart%, %A_WorkingDir%\%profileini%, Others, UpdateatStart
menu, options, togglecheck, Update at Start
return

SetWMC:
WMC:=!WMC
IniWrite, %WMC%, %A_WorkingDir%\%profileini%, Others, WMC
if ConfigCreated
menu, options, togglecheck, Mouse Capture
menu, tray, togglecheck, Mouse Capture
if WMC
SetTimer,CheckActiveWar3
else
{
SetTimer,CheckActiveWar3,off
SetTimer,CheckInactiveWar3,Off
DllCall("ClipCursor", UInt, 0)
_locked:=0
}
return
styledefault:
IniWrite, %A_Space%, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,0, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
stylelpurple:
IniWrite, 9185be, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,0, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
stylelblue:
IniWrite, 83d0f5, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,0, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
stylelgreen:
IniWrite,86c06a, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,0, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
stylepurple:
IniWrite,1d0e46, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,1, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
styleblue:
IniWrite,009fe3, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,1, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
stylegreen:
IniWrite,006b2d, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,1, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return
stylegrey:
IniWrite,c1c1c1, %A_WorkingDir%\%profileini%, Others, stylecolor
IniWrite,0, %A_WorkingDir%\%profileini%, Others, darkstyle
reload
return

SetItem:
ChoosenB=%A_GuiControl%
;Gui , 2:+Disabled
;Gui , 2:-Minimizebox +owner2
Gui 4:Default
gui, destroy
Gui, Color, %stylecolor%
if darkstyle
gui, font, cwhite
Gui, Add, GroupBox, w220 h50, Modifier
gui, add, checkbox, vAltModifier xp+15 yp+20 gHotkey_UpdateHotkey, &Alt
gui, add, checkbox, vCtrlModifier x+0 gHotkey_UpdateHotkey, &Ctrl
gui, add, checkbox, vShiftModifier x+0 gHotkey_UpdateHotkey, &Shift
gui, add, checkbox, vWinModifier x+0 gHotkey_UpdateHotkey, &Win

gui, add, groupbox,x10 w220 h180, Keys

gui, add, radio, xp+5 yp+30 vRadioKey gHotkey_UpdateKeyList Checked, Standart
gui, add, radio, y+10 gHotkey_UpdateKeyList, Function
gui, add, radio, y+10 gHotkey_UpdateKeyList, Numpad
gui, add, radio, y+10 gHotkey_UpdateKeyList, Mouse
gui, add, radio, y+10 gHotkey_UpdateKeyList, Multimedia
gui, add, radio, y+10 gHotkey_UpdateKeyList, None
gui, font
gui, add, listbox, x110 y85 w120 h150 vHG_Key gHotkey_UpdateHotkey
gosub, Hotkey_UpdateKeyList
if darkstyle
gui, font, cwhite
gui, add, text, x10 y250 w40 h20, Key:
gui, add, edit, vhotkeyshow x+5 w190 h20 +readonly

gui, add, text, x10 y+5 w40 h20, Desc:
gui, add, text, vdescshow x+5 w190 h20 +readonly, None

gui, add, button, x25 y300 w100 h30 gHotkey_AcceptButton, Accept
gui, add, button, x+5 w100 h30 gHotkeyClose, Cancel

gui, show, autosize center, Choose hotkey...

return

;==================================Hotkey Mechanism============================================
HotkeyClose:
gui, 4:destroy
return

Hotkey_AcceptButton:
Gui, Submit
i := SubStr(ChoosenB,2)
loop, 18
{
if HG_Hotkey and HG_Hotkey=h%A_Index%
{
gui, 4:destroy
HG_Hotkey=
MsgBox 262160, Error ,Dublicate Hotkeys not allowed
return
}
}

h%i%=%HG_Hotkey%
i2:=i-6
if i<7
IniWrite, %HG_Hotkey%, %A_WorkingDir%\%profileini%, Inventory, item%i%
else
IniWrite, %HG_Hotkey%, %A_WorkingDir%\%profileini%, RemapKey, KRhotkey%i2%
gui, 4:destroy
hDialog:=0
Gui 1:Default
GuiControl Text, %ChoosenB%, %HG_Hotkey%
HG_Hotkey=
return

Hotkey_UpdateKeyList:
Gui 4:Default
Gui, Submit, Nohide
GUIControl -Redraw,HG_Key
if (RadioKey = 1)
GuiControl,, HG_Key, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|``|-|=|\|[|]|;|'|,|.|/|Space|Tab|Enter|Escape|Delete|ScrollLock|CapsLock|NumLock|PrintScreen|BackSpace|CtrlBreak|Pause|Break|Up|Down|Left|Right|Home|End|Insert|Page Up|Page Down
if (RadioKey = 2)
GuiControl,, HG_Key, |F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LWin|RWin|LControl|RControl|LShift|RShift|LAlt|RAlt
if (RadioKey = 3)
GuiControl,, HG_Key, |Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|Numpadmult|NumpadAdd|NumpadSub|NumpadDiv|NumpadDot|NumpadEnter
if (RadioKey = 4)
GuiControl,, HG_Key, |LButton|RButton|MButton|WheelUp|WheelDown|XButton1|XButton2
if (RadioKey = 5)
GuiControl,, HG_Key, |Browser_back|Browser_forward|Browser_refresh|Browser_stop|Browser_search|Browser_favorites|Browser_home|volume_mute|volume_down|volume_up|Media_next|Media_prev|Media_stop|Media_play_h8|launch_media|launch_mail|launch_app1|launch_app2|Help|Sleep
if (RadioKey = 6)
GuiControl,, HG_Key, |%A_Blank%
GUIControl +Redraw,HG_Key
return


Hotkey_UpdateHotkey:
gui, submit, nohide
HG_Hotkey=
HG_HKDesc=
    if CtrlModifier
        {
        HG_Hotkey:=HG_Hotkey . "^"
        HG_HKDesc:=HG_HKDesc . "Ctrl + "
        }
    
    if ShiftModifier
        {
        HG_Hotkey:=HG_Hotkey . "+"
        HG_HKDesc:=HG_HKDesc . "Shift + "
        }
    
    if WinModifier
        {
        HG_Hotkey:=HG_Hotkey . "#"
        HG_HKDesc:=HG_HKDesc . "Win + "
        }
    
    if AltModifier
        {
        HG_Hotkey:=HG_Hotkey . "!"
        HG_HKDesc:=HG_HKDesc . "Alt + "
        }
		
	HG_Hotkey:=HG_Hotkey . HG_Key
    HG_HKDesc:=HG_HKDesc . HG_Key

    GUIControl ,,hotkeyshow,%HG_Hotkey%
    GUIControl ,,descshow,%HG_HKDesc%
	if a_guievent = DoubleClick
	gosub, Hotkey_AcceptButton
return



3GuiEscape:
3GuiClose:
3ButtonCancel:
Gui, destroy
return

4GuiEscape:
4GuiClose:
gui, 4:destroy
return

GuiEscape:
GuiClose:
ButtonHide:
Gui, Hide
return

ButtonExit:
Exit:
ExitApp
return

ButtonReload:
reload
return



SwitchInv:
;Gui,submit,nohide
GuiControlGet, EnInventory
IniWrite, %EnInventory%, %A_WorkingDir%\%profileini%, Inventory, EnInventory
if (EnInventory=1){
GuiControl, Enable, b1
GuiControl, Enable, b2
GuiControl, Enable, b3
GuiControl, Enable, b4
GuiControl, Enable, b5
GuiControl, Enable, b6
}
else{
GuiControl, Disable, b1
GuiControl, Disable, b2
GuiControl, Disable, b3
GuiControl, Disable, b4
GuiControl, Disable, b5
GuiControl, Disable, b6
}
return


;=======================================END of GUI===============================

;=======================================SAVE INI=================================
EnSkills:
SmartSkills:
SelfCast:
skill1:
skill2:
skill3:
skill4:
skill5:
skill6:
skill7:
skill8:
skill9:
skill10:
skill11:
skill12:
gui, submit, nohide
IniWrite, % %A_ThisLabel%, %A_WorkingDir%\%profileini%, CustomKeys, %A_ThisLabel%
return

EnInvokerA:
EnInvokerU:
EnInvokerD:
ColdSnapA:
ColdSnapU:
GhostWalkA:
GhostWalkU:
TornadoA:
TornadoU:
EMPA:
EMPU:
AlacrityA:
AlacrityU:
AlacrityAS:
AlacrityUS:
ChaosMeteorA:
ChaosMeteorU:
SunStrikeA:
SunStrikeU:
ForgeSpiritA:
ForgeSpiritU:
IceWallA:
IceWallU:
BlastA:
BlastU:
QQQ:
WWW:
EEE:
il:
Q:
W:
E:
R:
gui, submit, nohide
IniWrite, % %A_ThisLabel%, %A_WorkingDir%\%profileini%, Invoker, %A_ThisLabel%
return

chat:
autodetect:
ScrollIndicator:
sound:
Shield:
RunAtStart:
UpdateAtStart:
Scoreboard:
Share:
Ignore:
AHP:
Garena:
ReloadScr:
WMChotkey:
Time:
toggle:
pause:
EHP:
Roshan:
Hero:
AHPS:
EHPS:
DontShowConfig:
runprog1s:
runprog2s:
runprog3s:
gui, submit, nohide
IniWrite, % %A_ThisLabel%, %A_WorkingDir%\%profileini%, Others, %A_ThisLabel%
return


auto1:
auto2:
autoall:
EnAutoCast:
DoubleAutoCast:
gui, submit, nohide
IniWrite, % %A_ThisLabel%, %A_WorkingDir%\%profileini%, Auto-Casts, %A_ThisLabel%
return

;=====================================CORE CODE=================================

;====================================INVENTORY==================================
i1:
send {vk67}
return
i1S:
sendplay +{vk67}
return

i2:
send {vk68}
return
i2S:
sendplay +{vk68}
return
 
i3:
send {vk64}
return
i3S:
sendplay +{vk64}
return

i4:
send {vk65}
return
i4S:
sendplay +{vk65}
return

i5:
send {vk61}
return
i5S:
sendplay +{vk61}
return

i6:
send {vk62}
return
i6S:
sendplay +{vk62}
return
;===================================================CUSTOM KEYS=======================
LC(xx,yy)
{	
   global _locked
   global left
   global top
   global cWidth
   global cHeight
   global UAC
   if _locked
   {
   x:=left+cWidth*xx
   y:=top+cHeight*yy
   }
   else
   {
   x:=A_ScreenWidth*xx
   y:=A_ScreenHeight*yy
   }
   
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   if UAC
   {
   MouseMove,x,y
   sleep,1
   Click
   }
   else 
   {
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   }
   Send {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
}

IsLearning()
{
   global SmartSkills
   if !SmartSkills
	 return 0
   global _locked
   global left
   global top
   global cWidth
   global cHeight
   if _locked
   {
   x:=left+cWidth*0.9595
   y:=top+cHeight*0.878
   x2:=left+cWidth*0.79
   y2:=top+cHeight*0.95
   }
   else
   {
   x:=A_ScreenWidth*0.9595
   y:=A_ScreenHeight*0.878
   x2:=A_ScreenWidth*0.79
   y2:=A_ScreenHeight*0.95
   }
  
PixelGetColor, color1, %x%, %y%
PixelGetColor, color2, %x2%, %y2%
;msgbox %color1% %color2%
if (color1=0x000000 and color2=0x000000)
	return 1
return 0
}
LC1L:
LC(.79,.95)
return
LC1:
	if SelfCast {
	if lc1
	LC(0.02381, 0.0806)
	lc1:=!lc1
	SetTimer, lc1off, -1000
	}
	if IsLearning()
		LC(.79,.81)
	else 
		LC(.79,.95)
return
LC1off:
lc1:=0
return

LC2L:
LC(.84,.95)
return
LC2: 
	if SelfCast {
	if lc2
	LC(0.02381, 0.0806)
	lc2:=!lc2
	SetTimer, lc2off, -1000
	}
	if IsLearning()
		LC(.84,.81)
	else
		LC(.84,.95)
return
LC2off:
lc2:=0
return

LC3L:
LC(.9,.95)
return
LC3:
	if SelfCast {
	if lc3
	LC(0.02381, 0.0806)
	lc3:=!lc3
	SetTimer, lc3off, -1000
	}
	if IsLearning()
		LC(.9,.81)
	else
		LC(.9,.95)
return
LC3off:
lc3:=0
return

LC4L:
LC(.95,.95)
return
LC4:
	if SelfCast {
	if lc4
	LC(0.02381, 0.0806)
	lc4:=!lc4
	SetTimer, lc4off, -1000
	}
	if IsLearning()
		LC(.95,.81)
	else
		LC(.95,.95)
return
LC4off:
lc4:=0
return

LC5L:
LC(.79,.88)
return
LC5:
	if SelfCast {
	if lc5
	LC(0.02381, 0.0806)
	lc5:=!lc5
	SetTimer, lc5off, -1000
	}
   LC(.79,.88)
return
LC5off:
lc5:=0
return
LC6L:
LC(.84,.88)
return
LC6:
	if SelfCast {
	if lc6
	LC(0.02381, 0.0806)
	lc6:=!lc6
	SetTimer, lc6off, -1000
	}
   LC(.84,.88)
return
LC6off:
lc6:=0
return

LC7L:
LC(.9,.88)
return
LC7:
	if SelfCast {
	if lc7
	LC(0.02381, 0.0806)
	lc7:=!lc7
	SetTimer, lc7off, -1000
	}
   LC(.9,.88)
return
LC7off:
lc7:=0
return

LC8L:
LC(.95,.88)
return
LC8:
	if SelfCast {
	if lc8
	LC(0.02381, 0.0806)
	lc8:=!lc8
	SetTimer, lc8off, -1000
	}
   LC(.95,.88)
return
LC8off:
lc8:=0
return
LC9:
   LC(.79,.81)
return

LC10:
   LC(.84,.81)
return

LC11:
   LC(.9,.81)
return

LC12:
   LC(.95,.81)
return
;==================================================AUTO CAST===================================
AC1:
   if _locked
   {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x2%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput,MouseMoveOff
return

DAC1:
if dac1
{
if UAC
gosub, AC1UAC
else
gosub, AC1
}
dac1:=!dac1
SetTimer, dac1off, -1000
return

dac1off:
dac1:=0
return

DAC2:
if dac2
{
if UAC
gosub, AC2UAC
else
gosub, AC2
}
dac2:=!dac2
SetTimer, dac2off, -1000
return

dac2off:
dac2:=0
return

DACa:
if daca
{
if UAC
gosub, ACaUAC
else
gosub, ACa
}
daca:=!daca
SetTimer, dacaoff, -1000
return

dacaoff:
daca:=0
return

AC1UAC:
   if _locked
   {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseClick,Right,x1,y,,0
   MouseClick,Right,x2,y,,0
   MouseClick,Right,x2,y2,,0
   MouseMove,x0,y0
   BlockInput,MouseMoveOff
return


ACaUAC:
   if _locked {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseClick,Right,x1,y,,0
   MouseClick,Right,x2,y,,0
   MouseClick,Right,x3,y,,0
   MouseClick,Right,x4,y,,0
   MouseClick,Right,x3,y2,,0
   MouseMove,x0,y0
   BlockInput,MouseMoveOff
return

ACa:
   if _locked {
   x1:=left+cWidth*0.79
   x2:=left+cWidth*0.84
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else {
   x1:=A_ScreenWidth*0.79
   x2:=A_ScreenWidth*0.84
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   SendPlay, {Click %x1%,  %y%, Right}{Click %x2%,  %y%, Right}{Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x3%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput,MouseMoveOff
return

AC2:
   if _locked
   {
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   SendPlay, {Click %x3%,  %y%, Right}{Click %x4%,  %y%, Right}{Click %x3%,  %y2%, Right}{Click %x0%, %y0%, 0}
   BlockInput,MouseMoveOff
return

AC2UAC:
   if _locked
   {
   x3:=left+cWidth*0.9
   x4:=left+cWidth*0.95
   y:=top+cHeight*0.95
   y2:=top+cHeight*0.88
   }
   else
   {
   x3:=A_ScreenWidth*0.9
   x4:=A_ScreenWidth*0.95
   y:=A_ScreenHeight*0.95
   y2:=A_ScreenHeight*0.88
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseClick,Right,x3,y,,0
   MouseClick,Right,x4,y,,0
   MouseClick,Right,x3,y2,,0
   MouseMove,x0,y0
   BlockInput,MouseMoveOff
return
;===========================================================MESSAGES===================================
RandomMessage(M)
{
Loop, parse, M, `|
Random, rand, 1, %A_Index%
Loop, parse, M, `|
{
if rand=%A_Index%
return %A_LoopField%
}

return
}
mv1:
mv2:
mv3:
mv4:
mv5:
mv6:
mv7:
mv8:
mv9:
mv10:
mv11:
mv12:
mv13:
mv14:
mv15:
mv16:
mv17:
mv18:
mv19:
mv20:
mv21:
mv22:
mv23:
mv24:
mv25:
mv26:
mv27:
mv28:
mv29:
mv30:
mv31:
mv32:
mv33:
mv34:
mv35:
mv36:
m:=% %A_ThisLabel%
if SubStr(m,1,4)="All:"
{
m:=SubStr(m,5)
typemes=+{vk0D}
}
else
typemes={vk0D}

if instr(m,"|")
{
r:=RandomMessage(m)
send %typemes%{Raw}%r%
send {vk0D}
sleep, 1
}
else {
StringReplace, m, m,\n,`n, All
loop, parse, m, `n
{
	send %typemes%{Raw}%A_LoopField%
	send {vk0D}
	sleep, 1
}
}
return


Mes_KeyUpdate:
  Mes_KeyList=
  loop, 35 {
  IniRead, mh, %A_WorkingDir%\%profileini%,Messages, hotkey%A_Index%, %A_Space%
  if mh
  Mes_KeyList=%Mes_KeyList%|%mh%
  }
  GuiControl,, Mes_Key,%Mes_KeyList%
return


Mes_MesUpdate:
gui, submit, nohide
Mes_Keyi=% getKeyIndex(Mes_Key)
IniRead, H, %A_WorkingDir%\%profileini%,Messages, hotkey%Mes_Keyi%, %A_Space%
IniRead, M, %A_WorkingDir%\%profileini%,Messages, message%Mes_Keyi%, %A_Space%
StringReplace, M, M,\n,`n, All
if SubStr(M,1,4)="All:"
{
M:=SubStr(M,5)
GUIControl ,,toAll,1
}
else
GUIControl ,,toAll,0
GUIControl ,,MesEdit,%M%
GUIControl ,,HotkeyChoose_Mes,%H%
return

AddMes:
gui, submit, nohide

if HotkeyChoose_Mes=
{
MsgBox 262160, Error ,Choose hotkey first!
return
}


StringReplace, MesEdit, MesEdit,`n,\n, All
loop {
IniRead, h, %A_WorkingDir%\%profileini%, Messages, hotkey%A_Index%, %A_Space%
  if !h
  {
  i=%A_Index%
  break
  }
}

if toAll
MesEdit:="ALL:" . MesEdit
IniWrite, %HotkeyChoose_Mes%, %A_WorkingDir%\%profileini%, Messages, hotkey%i%
IniWrite, %MesEdit%, %A_WorkingDir%\%profileini%, Messages, message%i%

GUIControl ,,toAll,0
gosub, Mes_KeyUpdate
GUIControl ,,HotkeyChoose_Mes,
GUIControl ,,MesEdit,
HotkeyChoose_Mes=
MesEdit=
return

DeleteMes:
gui, submit, nohide
Mes_Keyi=% getKeyIndex(Mes_Key)
IniWrite, %A_Space%, %A_WorkingDir%\%profileini%,Messages, hotkey%Mes_Keyi%
IniWrite, %A_Space%, %A_WorkingDir%\%profileini%,Messages, message%Mes_Keyi%
GUIControl ,,toAll,0
gosub, Mes_KeyUpdate
GUIControl ,,HotkeyChoose_Mes,
GUIControl ,,MesEdit,
HotkeyChoose_Mes=
MesEdit=
return



Remap_Update:
gui, submit, nohide
Remap_Keyi=% getKRIndex(Remap_Key)
IniRead, H, %A_WorkingDir%\%profileini%,RemapKey, KRhotkey%Remap_Keyi%, %A_Space%
IniRead, M, %A_WorkingDir%\%profileini%,RemapKey, KRvalue%Remap_Keyi%, %A_Space%
GUIControl ,,HK_Remap,%H%
GUIControl ,,Value_Remap,%M%
return

Remap_KeyUpdate:
  Remap_KeyList=
  loop, 36 {
  IniRead, rh, %A_WorkingDir%\%profileini%,RemapKey, KRhotkey%A_Index%, %A_Space%
  IniRead, rv, %A_WorkingDir%\%profileini%,RemapKey, KRvalue%A_Index%, %A_Space%
  if rh
  Remap_KeyList=%Remap_KeyList%|%rh% => %rv%
  }
  GuiControl,, Remap_Key,%Remap_KeyList%
return

AddRemap:
gui, submit, nohide
if HK_Remap=
{
MsgBox 262160, Error ,Choose hotkey first!
return
}
loop {
IniRead, h, %A_WorkingDir%\%profileini%, RemapKey, KRhotkey%A_Index%, %A_Space%
  if !h
  {
  i=%A_Index%
  break
  }
}
IniWrite, %HK_Remap%, %A_WorkingDir%\%profileini%, RemapKey, KRhotkey%i%
IniWrite, %Value_Remap%, %A_WorkingDir%\%profileini%, RemapKey, KRvalue%i%

gosub, Remap_KeyUpdate
GUIControl ,,HK_Remap,
GUIControl ,,Value_Remap,
HK_Remap=
Value_Remap=
return


DeleteRemap:
gui, submit, nohide
Remap_Keyi=% getKRIndex(Remap_Key)
IniWrite, %A_Space%, %A_WorkingDir%\%profileini%,RemapKey, KRhotkey%Remap_Keyi%
IniWrite, %A_Space%, %A_WorkingDir%\%profileini%,RemapKey, KRvalue%Remap_Keyi%
gosub, Remap_KeyUpdate
GUIControl ,,HK_Remap,
GUIControl ,,Value_Remap,
HK_Remap=
Value_Remap=
return

getKeyIndex(a) {
global
loop, 36 {
IniRead, h, %A_WorkingDir%\%profileini%,Messages, hotkey%A_Index%, %A_Space%
  if (h = a)
  {
  i=%A_Index%
  return i
  }
}
return
}
getKRIndex(a) {
global
loop, 36 {
IniRead, h, %A_WorkingDir%\%profileini%, RemapKey, KRhotkey%A_Index%, %A_Space%
  if h and (h = SubStr(a,1,StrLen(h)))
  {
  i=%A_Index%
  return i
  }
}
}
;==========================================INVOKER===========================================
DSnap:
if dsnap
{
gosub, Snap
}
dsnap:=!dsnap
SetTimer, dsnapoff, -1000
return

dsnapoff:
dsnap:=0
return

DWall:
if dwall
{
gosub, Wall
}
dwall:=!dwall
SetTimer, dwalloff, -1000
return

dwalloff:
dwall:=0
return

DWalk:
if dwalk
{
gosub, Walk
}
dwalk:=!dwalk
SetTimer, dwalkoff, -1000
return

dwalkoff:
dwalk:=0
return

DBlast:
if dblast
{
gosub, Blast
}
dblast:=!dblast
SetTimer, dblastoff, -1000
return

dblastoff:
dblast:=0
return

DTornado:
if dtornado
{
gosub, Tornado
}
dtornado:=!dtornado
SetTimer, dtornadooff, -1000
return

dtornadooff:
dtornado:=0
return


DSnap2:
if dsnap2
{
gosub, Snap2
}
dsnap2:=!dsnap2
SetTimer, dsnap2off, -1000
return

dsnap2off:
dsnap2:=0
return

DWall2:
if dwall2
{
gosub, Wall2
}
dwall2:=!dwall2
SetTimer, dwall2off, -1000
return

dwall2off:
dwall2:=0
return

DWalk2:
if dwalk2
{
gosub, Walk2
}
dwalk2:=!dwalk2
SetTimer, dwalk2off, -1000
return

dwalk2off:
dwalk2:=0
return

DEMP:
if demp
{
gosub, EMP
}
demp:=!demp
SetTimer, dempoff, -1000
return

dempoff:
demp:=0
return

DEMP2:
if demp2
{
gosub, EMP2
}
demp2:=!demp2
SetTimer, demp2off, -1000
return

demp2off:
demp2:=0
return

DMeteor:
if DMeteor
{
gosub, Meteor
}
DMeteor:=!DMeteor
SetTimer, DMeteoroff, -1000
return

DMeteoroff:
DMeteor:=0
return

DMeteor2:
if DMeteor2
{
gosub, Meteor2
}
DMeteor2:=!DMeteor2
SetTimer, DMeteor2off, -1000
return

DMeteor2off:
DMeteor2:=0
return

DStrike:
if DStrike
{
gosub, Strike
}
DStrike:=!DStrike
SetTimer, DStrikeoff, -1000
return

DStrikeoff:
DStrike:=0
return

DStrike2:
if DStrike2
{
gosub, Strike2
}
DStrike2:=!DStrike2
SetTimer, DStrike2off, -1000
return

DStrike2off:
DStrike2:=0
return

DSpirit:
if DSpirit
{
gosub, Spirit
}
DSpirit:=!DSpirit
SetTimer, DSpiritoff, -1000
return

DSpiritoff:
DSpirit:=0
return

DSpirit2:
if DSpirit2
{
gosub, Spirit2
}
DSpirit2:=!DSpirit2
SetTimer, DSpirit2off, -1000
return

DSpirit2off:
DSpirit:=0
return

DBlast2:
if dblast2
{
gosub, Blast2
}
dblast2:=!dblast2
SetTimer, dblast2off, -1000
return

dblast2off:
dblast2:=0
return

DTornado2:
if dtornado2
{
gosub, Tornado2
}
dtornado2:=!dtornado2
SetTimer, dtornado2off, -1000
return

dtornado2off:
dtornado2:=0
return


DAlacrity:
if dalacrity
{
gosub, Alacrity
}
dalacrity:=!dalacrity
SetTimer, dalacrityoff, -1000
return

dalacrityoff:
dalacrity:=0
return

DAlacrity2:
if dalacrity2
{
gosub, Alacrity2
}
dalacrity2:=!dalacrity2
SetTimer, dalacrity2off, -1000
return

dalacrity2off:
dalacrity2:=0
return

DAlacrity3:
if dalacrity3
{
gosub, Alacrity3
}
dalacrity3:=!dalacrity3
SetTimer, dalacrity3off, -1000
return

dalacrity3off:
dalacrity3:=0
return

DAlacrity4:
if dalacrity4
{
gosub, Alacrity4
}
dalacrity4:=!dalacrity4
SetTimer, dalacrity4off, -1000
return

dalacrity4off:
dalacrity4:=0
return

Snap:
send {%vQ%}{%vQ%}{%vQ%}{%vR%}
return
Snap2:
send {%vQ%}{%vQ%}{%vQ%}{%vR%}
sleep 250
send {vk59}
return
Wall:
send {%vQ%}{%vQ%}{%vE%}{%vR%}
return
Wall2:
send {%vQ%}{%vQ%}{%vE%}{%vR%}
sleep 250
send {vk47}
return
Blast:
send {%vQ%}{%vW%}{%vE%}{%vR%}
return
Blast2:
send {%vQ%}{%vW%}{%vE%}{%vR%}
sleep 250
send {vk42}
return
Tornado:
send {%vQ%}{%vW%}{%vW%}{%vR%}
return
Tornado2:
send {%vQ%}{%vW%}{%vW%}{%vR%}
sleep 250
send {vk58}
return
Alacrity:
send {%vW%}{%vW%}{%vE%}{%vR%}
return
Alacrity2:
send {%vW%}{%vW%}{%vE%}{%vR%}
sleep 250
send {vk5A}
return

Alacrity3:
sleep 150
send {vk5A}


if _locked
{
x:=left+cWidth*0.02381
y:=top+cHeight*0.95
}
else
{
x:=A_ScreenWidth*0.02381
y:=A_ScreenHeight*0.0806
}
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseMove,x,y
   sleep,1
   Click
   Send {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
return

Alacrity4:
send {%vW%}{%vW%}{%vE%}{%vR%}
sleep 250
send {vk5A}
 
if _locked
{
x:=left+cWidth*0.02381
y:=top+cHeight*0.95
}
else
{
x:=A_ScreenWidth*0.02381
y:=A_ScreenHeight*0.0806
}
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseMove,x,y
   sleep,1
   Click
   Send {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
return
Meteor:
send {%vW%}{%vE%}{%vE%}{%vR%}
return
Meteor2:
send {%vW%}{%vE%}{%vE%}{%vR%}
sleep 250
send {vk44}
return
Strike:
send {%vE%}{%vE%}{%vE%}{%vR%}
return
Strike2:
send {%vE%}{%vE%}{%vE%}{%vR%}
sleep 250
send {vk54}
return
Walk:
send {%vQ%}{%vQ%}{%vW%}{%vR%}{%vW%}{%vW%}
return
Walk2:
send {%vQ%}{%vQ%}{%vW%}{%vR%}{%vW%}{%vW%}
sleep 250
send {vk56}
return
Spirit:
send {%vQ%}{%vE%}{%vE%}{%vR%}
return
Spirit2:
send {%vQ%}{%vE%}{%vE%}{%vR%}
sleep 250
send {vk46}
return
EMP:
send {%vW%}{%vW%}{%vW%}{%vR%}
return
EMP2:
send {%vW%}{%vW%}{%vW%}{%vR%}
sleep 250
send {vk43}
return
gQQQ:
send {%vQ%}{%vQ%}{%vQ%}
return
gWWW:
send {%vW%}{%vW%}{%vW%}
return
gEEE:
send {%vE%}{%vE%}{%vE%}
return
gilist:
send {Enter}-il{Enter}
return
;===============================OTHER======================================================

disable:
return

SBUAC:
   if _locked {
   x:=left+cWidth*189/192
   y:=top+cHeight*7/120
   }
   else {
   x:=A_ScreenWidth*189/192
   y:=A_ScreenHeight*7/120
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   MouseMove,x,y
   sleep,1
   Click
   Send {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
return
SB:
   if _locked {
   x:=left+cWidth*1651/1680
   y:=top+cHeight*0.06
   }
   else {
   x:=A_ScreenWidth*1651/1680
   y:=A_ScreenHeight*0.06
   }
   BlockInput,MouseMove
   MouseGetPos, x0, y0
   SendPlay, {Click %x%,  %y%, 0}
   Click
   SendPlay, {Click %x0%,  %y0%, 0}
   BlockInput,MouseMoveOff
return

ShareControl:
BlockInput, On
MouseGetPos, x0, y0
if _locked
{
xShare:=left+cWidth*0.6
y1Share:=top+cHeight*0.2
y2Share:=top+cHeight*0.25
y3Share:=top+cHeight*0.3
y4Share:=top+cHeight*0.345
y5Share:=top+cHeight*0.39
y6Share:=top+cHeight*0.435
y7Share:=top+cHeight*0.482
y8Share:=top+cHeight*0.527
y9Share:=top+cHeight*0.574
}
else
{
xShare:=A_ScreenWidth*0.6
y1Share:=A_ScreenHeight*0.2
y2Share:=A_ScreenHeight*0.25
y3Share:=A_ScreenHeight*0.3
y4Share:=A_ScreenHeight*0.345
y5Share:=A_ScreenHeight*0.39
y6Share:=A_ScreenHeight*0.435
y7Share:=A_ScreenHeight*0.482
y8Share:=A_ScreenHeight*0.527
y9Share:=A_ScreenHeight*0.574
}
send {vk7A}
Sleep, 100
if UAC {
MouseMove,xShare,y1Share
Sleep 100
Click
MouseMove,xShare,y2Share
Sleep 100
Click
MouseMove,xShare,y3Share
Sleep 100
Click
MouseMove,xShare,y4Share
Sleep 100
Click
MouseMove,xShare,y5Share
Sleep 100
Click
MouseMove,xShare,y6Share
Sleep 100
Click
MouseMove,xShare,y7Share
Sleep 100
Click
MouseMove,xShare,y8Share
Sleep 100
Click
MouseMove,xShare,y9Share
Sleep 100
Click
}
else {
Send {Click %xShare%,  %y1Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y2Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y3Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y4Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y5Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y6Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y7Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y8Share%, 0}
Sleep 100
Click
Send {Click %xShare%,  %y9Share%, 0}
Sleep 100
Click
}

Send {Enter}
Send {Click %x0%,  %y0%, 0}
BlockInput, Off
return


;********************************************OTHER*********************************
gIgnore:
squelch:="/squelch "
send {Enter}-hhn{Enter}
send {Enter}%squelch%
if !A_IsSuspended
{
if ScrollIndicator
   SetScrollLockState, Off
}
return

GetHero:
send {vk70}{vk70}
return

Rosh:
if RoshDead
{
if A_Min<10
t:=10-A_Min-60+RoshTime
else
t:=10-A_Min+RoshTime
send {enter}Rosh will spawn in %t% mins {enter}
}
else
{
RoshTime:=A_Min
RoshDead:=1
SetTimer, RoshAnounce, 600000
send {enter}Press %Roshan% to view Roshan Info {enter}
}
return

RoshAnounce:
SetTimer, RoshAnounce, off
RoshDead:=0
ifWinActive, ahk_class Warcraft III
send {enter}Rosh has been spawned {enter}
return

TimeNow:
FormatTime, TimeString,, Time
send {enter}The current time is %TimeString%.{enter}
return

Switch:
suspend
ManualSuspend:=!ManualSuspend
if !A_IsSuspended
{
   SetTimer, CheckWarcraft, on
   if ScrollIndicator
   SetScrollLockState, On
   if Sound
   soundplay, *48
}
Else
{
   SetTimer, CheckWarcraft, off
   if ScrollIndicator
   SetScrollLockState, Off
   if Sound
   soundplay, *64
}
return


PauseGame:
send {vk79}{vk4D}{vk52}
return


CheckActiveWar3:
	hWnd := WinActive("ahk_classWarcraft III")
	if hWnd
	{
		SetTimer,CheckActiveWar3,Off
		if GetWindowClientRect(hWnd,rect) && DllCall("ClipCursor","UInt",&rect)
		{
			_locked := 1
			SetTimer,CheckInactiveWar3
		}
		else
			SetTimer,CheckActiveWar3
	}
	Return

CheckInactiveWar3:
	IfWinNotActive,ahk_id%hWnd%
	{
		SetTimer,CheckInactiveWar3,Off
		if DllCall("ClipCursor")
		{
			_locked := 0
			SetTimer,CheckActiveWar3
		}
		else
			SetTimer,CheckInactiveWar3
	}
	Return

GetWindowClientRect(hWnd,ByRef rect)
{
	if !hWnd
		Return,0

	VarSetCapacity(cRect,16)
	if !DllCall("GetClientRect","UInt",hWnd,"UInt",&cRect)
		Return,0

	global cWidth := NumGet(cRect,8,"Int") - NumGet(cRect,0,"Int")
	global cHeight := NumGet(cRect,12,"Int") - NumGet(cRect,4,"Int")

	VarSetCapacity(rect,16)
	if !DllCall("GetWindowRect","UInt",hWnd,"UInt",&rect)
		Return,0

	wWidth := NumGet(rect,8,"Int") - NumGet(rect,0,"Int")
	margin := (wWidth - cWidth)//2

	NumPut(NumGet(rect,8,"Int") - margin,rect,8,"Int")
	NumPut(NumGet(rect,12,"Int") - margin,rect,12,"Int")
	NumPut(NumGet(rect,8,"Int") - cWidth,rect,0,"Int")
	NumPut(NumGet(rect,12,"Int") - cHeight,rect,4,"Int")

	global left := NumGet(rect,0,"Int")
	global top := NumGet(rect,4,"Int")

	Return,1
}

GarenaJoiner:
ifWinActive, Warcraft III ahk_class Warcraft III
return
gojoin:=!gojoin
if gojoin
{
gosub, autojoin
sleep 100
SetTimer, autojoin, 5010
}
else
{
ToolTip
SetTimer, autojoin, off
}
return

autojoin:
ToolTip, GarenaJoiner is active
send, {click 2}
sleep, 2000
send {space}
return

	
AHPST:
ifWinActive, ahk_class Warcraft III
{
if !A_IsSuspended {
Send, {[ Down}
AHealthBarOn := 1
}
}
return

EHPST:
ifWinActive, ahk_class Warcraft III
{
if !A_IsSuspended {
Send, {] Down}
EHealthBarOn := 1
}
}
return

ShowAHP:
  If AHealthBarOn
      Send {VKDB Up}
  Else
      Send {VKDB Down}
  AHealthBarOn:=!AHealthBarOn	
Return
	
ShowEHP:
  If EHealthBarOn
      Send, {VKDD Up}
  Else
      Send, {VKDD Down}
  EHealthBarOn:=!EHealthBarOn
Return

ReloadScript:
reload
return

krv1:
krv2:
krv3:
krv4:
krv5:
krv6:
krv7:
krv8:
krv9:
krv10:
krv11:
krv12:
krv13:
krv14:
krv15:
krv16:
krv17:
krv18:
krv19:
krv20:
krv21:
krv22:
krv23:
krv24:
krv25:
krv26:
krv27:
krv28:
krv29:
krv30:
krv31:
krv32:
krv33:
krv34:
krv35:

v:=% %A_ThisLabel%
v:=VK(v)

if v {
send {%v%}
}
return


VK(Param)
{
	global
	if InStr(Param,"[")
	return % RegExReplace(Param, "\[$", "VKDB")
	if InStr(Param,"]")
	return % RegExReplace(Param, "\]$", "VKDD")
	if InStr(Param,"\")
	return % RegExReplace(Param, "\\$", "VKDC")
	if InStr(Param,",")
	return % RegExReplace(Param, "\,$", "VKBC")
	if InStr(Param,".")
	return % RegExReplace(Param, "\.$", "VKBE")
	if InStr(Param,"/")
	return % RegExReplace(Param, "\/$", "VKBF")
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
		}
}

EmptyMem(PID="AHT v2.9"){
    pid:=(pid="AHT v2.9") ? DllCall("GetCurrentProcessId") : pid
    h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
    DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
    DllCall("CloseHandle", "Int", h)
}




CheckWarcraft:
	Log("Checking Warcraft III")
	IfWinNotExist, ahk_class Warcraft III
		Return
	SetTimer, CheckWarcraft, Off
	Log("Warcraft III found. Waiting 5 seconds...")
	Sleep, 5000
	IfWinExist, ahk_class Warcraft III
	{
		WinGet, pid, PID
		Log("Warcraft III still found")
		if hWar3Proc > 0
			DllCall("CloseHandle", "UInt", hWar3Proc)
		hWar3Proc := DllCall("OpenProcess", "UInt", 0x0010 | 0x0400, "Int", 0, "UInt", pid)
		if (hWar3Proc = 0 || ErrorLevel)
		{
			Log("Failed to open war3 process with code: " . A_LastError)
			SetTimer, CheckWarcraft, On
			Return
		}
		chatAddr := GetChatAddr(pid)
		if (chatAddr < 0)
		{
			Log("Failed to get chat address")
			if (chatAddr = -1)
				SetTimer, CheckWarcraft, On
			Return
		}
		Log("Got chat address: " . chatAddr)
		SetTimer, CheckChatting, 100
	}
	else
	{
		Log("Warcraft III no longer found")
		SetTimer, CheckWarcraft, On
	}
	Return

GetChatAddr(pid)
{
	hSnapshot := DllCall("CreateToolhelp32Snapshot", "UInt", 0x08, "UInt", pid)
	if (hSnapshot < 0 || ErrorLevel)
	{
		Log("Failed to take module snapshot with code: " . A_LastError)
		Return -2
	}
	
	VarSetCapacity(me32, 548)
	NumPut(548, me32)
	
	if DllCall("Module32First", "UInt", hSnapshot, "UInt", &me32)
	{
		VarSetCapacity(szModule, 256)
		
		Loop
		{
			DllCall("RtlMoveMemory", "Str", szModule, "UInt", &me32 + 32, "UInt", 256)
			Log("Found module: " . szModule)
			if (szModule = "Game.dll")
			{
				DllCall("CloseHandle", "UInt", hSnapshot)
				
				VarSetCapacity(szExePath, 260)
				DllCall("RtlMoveMemory", "Str", szExePath, "UInt", &me32 + 288, "UInt", 260)
				Log("Path of game.dll: " . szExePath)
				
				FileGetVersion,version,%szExePath%
				if (InStr(version, "1.24."))
					offset := 0xAE8450
				else if (version = "1.26.0.6401")
					offset := 0xAD15F0
				;else if (version = "1.27.0.52240")// dont wanna do exac match if new patch will be and offset will be the same
				else if (InStr(version, "1.27."))
					offset := 0xBDAA14
				else
				{
					Log("Warcraft III version: " . version . " is not supported")
					Return -2
				}
				Return NumGet(me32, 20, "UInt") + offset
			}
			
			if !DllCall("Module32Next", "UInt", hSnapshot, "UInt", &me32)
				Break
		}
	}
	
	DllCall("CloseHandle", "UInt", hSnapshot)
	Log("game.dll was not found")
	Return -1
}

CheckChatting:
	if ManualSuspend
		return
	if ReadChatState(hWar3Proc, chatAddr, chatState)
	{
		if chatState
			Suspend, On
		else
			Suspend, Off
	}
	else
	{
		SetTimer, CheckChatting, Off
		DllCall("CloseHandle", "UInt", hWar3Proc)
		hWar3Proc := 0
		SetTimer, CheckWarcraft, On
		Suspend, Off
	}
	Return

ReadChatState(handle, chatAddr, ByRef chatState)
{
	if (DllCall("ReadProcessMemory", "UInt", handle, "UInt", chatAddr, "UInt*", chatState, "UInt", 4, "UInt", 0) = 0 || ErrorLevel)
	{
		Log("Can not read memory location: " . chatAddr . ". Last chat state: " . chatState)
		Return 0
	}
	Return 1
}

DebugPrivilegesEnable()
{
	Log("In DebugPrivilegesEnable")
	Process, Exist  ; sets ErrorLevel to the PID of this running script
	; Get the handle of this script with PROCESS_QUERY_INFORMATION (0x0400)
	h := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", ErrorLevel)
	if (!h || ErrorLevel)
		Log("OpenProcess failed with code: " . A_LastError)
	; Open an adjustable access token with this process (TOKEN_ADJUST_PRIVILEGES = 32)
	success := DllCall("Advapi32.dll\OpenProcessToken", "UInt", h, "UInt", 32, "UIntP", t)
	if (!success || ErrorLevel)
		Log("OpenProcessToken failed with code: " . A_LastError)
	VarSetCapacity(ti, 16, 0)  ; structure of privileges
	NumPut(1, ti, 0)  ; one entry in the privileges array...
	; Retrieves the locally unique identifier of the debug privilege:
	sucecss := DllCall("Advapi32.dll\LookupPrivilegeValueA", "UInt", 0, "Str", "SeDebugPrivilege", "Int64P", luid)
	if (!success || ErrorLevel)
		Log("LookupPrivilegeValue failed with code: " . A_LastError)
	NumPut(luid, ti, 4, "int64")
	NumPut(2, ti, 12)  ; enable this privilege: SE_PRIVILEGE_ENABLED = 2
	; Update the privileges of this process with the new access token:
	success := DllCall("Advapi32.dll\AdjustTokenPrivileges", "UInt", t, "Int", false, "UInt", &ti, "UInt", 0, "UInt", 0, "UInt", 0)
	if (!success || ErrorLevel)
		Log("AdjustTokenPrivileges failed with code: " . A_LastError)
	else
		Log("AdjustTokenPrivileges succeeded with code: " . A_LastError)
	DllCall("CloseHandle", "UInt", h)  ; close this process handle to save memory
}