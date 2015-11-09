; <COMPILER: v1.0.48.5>







Process, priority, , High
#SingleInstance force


#InstallKeybdHook
#UseHook On
#MaxThreads 20





SetWorkingDir %A_ScriptDir%
SetTimer, CheckWarcraft
  Version=AucT Hotkeys Tool v2.0rc5

  if !A_IsAdmin
{
    if A_IsCompiled
       DllCall("shell32\ShellExecuteA","uint",0,"str","RunAs","str",A_ScriptFullPath,"uint",0,"str",A_WorkingDir,"int",1)
    else
       DllCall("shell32\ShellExecuteA","uint",0,"str","RunAs","str",A_AhkPath,"str","""" . A_ScriptFullPath . """","str",A_WorkingDir,"int",1)
    ExitApp
}
DebugPrivilegesEnable()

  IniRead, profile, %A_WorkingDir%\settings.ini, Others, profile, General
	if profile=General
	profileini=settings.ini
	else
	profileini=%profile%.ini


  Menu, tray, NoStandard
  Menu, Tray, Click, 1
  Menu, tray, add, Configuration, configuration
  Menu, tray, Default, Configuration
  Menu, tray, add
  Menu, tray, add, About, About
  Menu, tray, add, Check update, UpdateCheck
  Menu, tray, add
  Menu, tray, add, Mouse Capture, SetWMC
  Menu, tray, add, Exit
  Menu, Tray, Icon, %A_ScriptDir%\%A_ScriptName%,1,1

  CoordMode,Mouse,Screen

  IniRead, ScrollIndicator, %A_WorkingDir%\%profileini%, Others, ScrollIndicator, 1
  if ScrollIndicator
  SetScrollLockState, On
  IniRead, ReloadScr, %A_WorkingDir%\%profileini%,Others, ReloadScr, %A_Space%
	if ReloadScr
	Hotkey,% VK(ReloadScr), ReloadScript
  Hotkey, IfWinActive, Warcraft III
  IniRead, WMC, %A_WorkingDir%\%profileini%,Others, WMC, 0
  if WMC
  SetTimer,CheckActiveWar3

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
	if StrLen(i1)=1
	Hotkey,~%i1%, i1
	else
	Hotkey,%i1%, i1
	Hotkey,+%i1%, i1S
	}
	if i2 {
	if StrLen(i2)=1
	Hotkey,~%i2%, i2
	else
	Hotkey,%i2%, i2
	Hotkey,+%i2%, i2S
	}
	if i3 {
	if StrLen(i3)=1
	Hotkey,~%i3%, i3
	else
	Hotkey,%i3%, i3
	Hotkey,+%i3%, i3S
	}
	if i4 {
	if StrLen(i4)=1
	Hotkey,~%i4%, i4
	else
	Hotkey,%i4%, i4
	Hotkey,+%i4%, i4S
	}
	if i5 {
	if StrLen(i5)=1
	Hotkey,~%i5%, i5
	else
	Hotkey,%i5%, i5
	Hotkey,+%i5%, i5S
	}
	if i6 {
	if StrLen(i6)=1
	Hotkey,~%i6%, i6
	else
	Hotkey,%i6%, i6
	Hotkey,+%i6%, i6S
	}

}




  IniRead, EnSkills, %A_WorkingDir%\%profileini%, CustomKeys, EnSkills, 0

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



  IniRead, EnAutoCast, %A_WorkingDir%\%profileini%, Auto-Casts, EnAutoCast, 0

  IniRead, auto1, %A_WorkingDir%\%profileini%, Auto-Casts, auto1, !E
  IniRead, auto2, %A_WorkingDir%\%profileini%, Auto-Casts, auto2, !R
  IniRead, autoall, %A_WorkingDir%\%profileini%, Auto-Casts, autoALL, !F
  if %EnAutoCast%
  {
  if %auto1%
    Hotkey,% VK(auto1), AC1
  if %auto2%
	Hotkey,% VK(auto2), AC2
  if %autoall%
	Hotkey,% VK(autoall), ACa
  }

  IniRead, mh1, %A_WorkingDir%\%profileini%,Messages, hotkey1, %A_Space%
  IniRead, mv1, %A_WorkingDir%\%profileini%,Messages, message1, %A_Space%
  IniRead, mh2, %A_WorkingDir%\%profileini%,Messages, hotkey2, %A_Space%
  IniRead, mv2, %A_WorkingDir%\%profileini%,Messages, message2, %A_Space%
  IniRead, mh3, %A_WorkingDir%\%profileini%,Messages, hotkey3, %A_Space%
  IniRead, mv3, %A_WorkingDir%\%profileini%,Messages, message3, %A_Space%
  IniRead, mh4, %A_WorkingDir%\%profileini%,Messages, hotkey4, %A_Space%
  IniRead, mv4, %A_WorkingDir%\%profileini%,Messages, message4, %A_Space%
  IniRead, mh5, %A_WorkingDir%\%profileini%,Messages, hotkey5, %A_Space%
  IniRead, mv5, %A_WorkingDir%\%profileini%,Messages, message5, %A_Space%
  if %mh1%
	Hotkey,% VK(mh1), mv1
  if %mh2%
	Hotkey,% VK(mh2), mv2
  if %mh3%
	Hotkey,% VK(mh3), mv3
  if %mh4%
	Hotkey,% VK(mh4), mv4
  if %mh5%
	Hotkey,% VK(mh5), mv5

  IniRead, amh1, %A_WorkingDir%\%profileini%,Messages, ahotkey1, %A_Space%
  IniRead, amv1, %A_WorkingDir%\%profileini%,Messages, amessage1, %A_Space%
  IniRead, amh2, %A_WorkingDir%\%profileini%,Messages, ahotkey2, %A_Space%
  IniRead, amv2, %A_WorkingDir%\%profileini%,Messages, amessage2, %A_Space%
  IniRead, amh3, %A_WorkingDir%\%profileini%,Messages, ahotkey3, %A_Space%
  IniRead, amv3, %A_WorkingDir%\%profileini%,Messages, amessage3, %A_Space%
  IniRead, amh4, %A_WorkingDir%\%profileini%,Messages, ahotkey4, %A_Space%
  IniRead, amv4, %A_WorkingDir%\%profileini%,Messages, amessage4, %A_Space%
  IniRead, amh5, %A_WorkingDir%\%profileini%,Messages, ahotkey5, %A_Space%
  IniRead, amv5, %A_WorkingDir%\%profileini%,Messages, amessage5, %A_Space%
  if %amh1%
	Hotkey,% VK(amh1), amv1
  if %amh2%
	Hotkey,% VK(amh2), amv2
  if %amh3%
	Hotkey,% VK(amh3), amv3
  if %amh4%
	Hotkey,% VK(amh4), amv4
  if %amh5%
	Hotkey,% VK(amh5), amv5



    IniRead, EnInvokerA, %A_WorkingDir%\%profileini%, Invoker, EnInvokerA, 0
	IniRead, EnInvokerU, %A_WorkingDir%\%profileini%, Invoker, EnInvokerU, 0

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
	IniRead, il, %A_WorkingDir%\%profileini%, Invoker, il, %A_Space%


	if EnInvokerA
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
	if EnInvokerU
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
	if %AlacrityAS%
	Hotkey,% VK(AlacrityAS), Alacrity3
	if %AlacrityUS%
	Hotkey,% VK(AlacrityUS), Alacrity4
	}















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
	Hotkey,%Scoreboard%, SB

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
	Hotkey, IfWinActive, Warcraft III



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

	IniRead, hero, %A_WorkingDir%\%profileini%,Others, hero, F1
	if %hero%
	Hotkey,% VK(hero), GetHero


	IniRead,AHP, %A_WorkingDir%\%profileini%,Others, AHP, ![
	IniRead,EHP, %A_WorkingDir%\%profileini%,Others, EHP, !]


	if %AHP%
	Hotkey,%AHP%, ShowAHP
	if %EHP%
	Hotkey,%EHP%, ShowEHP





	IniRead, prog1, %A_WorkingDir%\%profileini%, Others, prog1, %A_Space%
	IniRead, runprog1s, %A_WorkingDir%\%profileini%, Others, runprog1s, 0
	IniRead, prog2, %A_WorkingDir%\%profileini%, Others, prog2, %A_Space%
	IniRead, runprog2s, %A_WorkingDir%\%profileini%, Others, runprog2s, 0
	IniRead, prog3, %A_WorkingDir%\%profileini%, Others, prog3, %A_Space%
	IniRead, runprog3s, %A_WorkingDir%\%profileini%, Others, runprog3s, 0

	loop, 12
	{
	ttt:=A_Index+6
	IniRead, h%ttt%, %A_WorkingDir%\%profileini%,RemapKey, KRhotkey%A_Index%, %A_Space%
	IniRead, KRvalue%A_Index%, %A_WorkingDir%\%profileini%,RemapKey, KRvalue%A_Index%, %A_Space%
	if h%ttt%
	Hotkey,% VK(h%ttt%), KR%A_Index%
	VKR%A_Index%:=% VK(KRvalue%A_Index%)

	}

	IniRead, DontShowConfig, %A_WorkingDir%\%profileini%,Others, DontShowConfig, 0



if DontShowConfig
{
EmptyMem()
	if runprog1s
		gosub, runprog1
	if runprog2s
		gosub, runprog2
	if runprog3s
		gosub, runprog3
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
Menu, HelpMenu, Add, Getdota, getdota
Menu, HelpMenu, Add, &F.A.Q., FAQ
Menu, HelpMenu, Add, &About, About


Menu, MyMenuBar, Add, &Profile, :ProfileMenu
Menu, MyMenuBar, Add, &WarCraft, :WarCraft
Menu, MyMenuBar, Add, &Options, :Options
Menu, MyMenuBar, Add, &Help, :HelpMenu


Gui, Menu, MyMenuBar

Gui, Add, Tab2, x0 y0 w470 h500 , Inventory|Skills|Autocast|Messages|Invoker|Remap|Other
Gui, Tab, Inventory
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Inventory
gui, font
Gui, Add, Picture, x115 y92 w200 h300 , images\Inventory.jpg
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
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Customkeys
gui, font
Gui, Add, CheckBox,Checked%EnSkills% vEnSkills gEnSkills x36 y62 w300 h30 , Enable Custom Keys
Gui, Add, Picture, x36 y92 w402 h272 , images\Skills.jpg
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
Gui, Add, Picture, x36 y92 w402 h272 , images\AutoCast.jpg
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Autocast
gui, font
Gui, Add, CheckBox,Checked%EnAutoCast% vEnAutoCast gEnAutoCast x36 y62 w300 h30 , Enable AutoCast Keys
Gui, Add, Picture, x36 y392 w30 h30 , images\blue.gif
Gui, Add, Picture, x170 y392 w30 h30 , images\pink.gif
Gui, Add, Picture, x314 y392 w30 h30 , images\all.gif
Gui, Add, Hotkey, vauto1 gauto1 x76 y392 w80 h30 , %auto1%
Gui, Add, Hotkey, vauto2 gauto2 x215 y392 w80 h30 , %auto2%
Gui, Add, Hotkey, vautoall gautoall x354 y392 w80 h30 , %autoall%

Gui, Tab, Messages
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h200,Allies
gui, font
gui, add, hotkey,vmh1 gSM1 x30 y55 w80 h30, %mh1%
gui, add, edit,vmv1 gSM1 x120 y55 w300 h30, %mv1%
gui, add, hotkey,vmh2 gSM2 x30 y90 w80 h30, %mh2%
gui, add, edit,vmv2 gSM2 x120 y90 w300 h30, %mv2%
gui, add, hotkey,vmh3 gSM3 x30 y125 w80 h30, %mh3%
gui, add, edit,vmv3 gSM3 x120 y125 w300 h30, %mv3%
gui, add, hotkey,vmh4 gSM4 x30 y160 w80 h30, %mh4%
gui, add, edit,vmv4 gSM4 x120 y160 w300 h30, %mv4%
gui, add, hotkey,vmh5 gSM5 x30 y195 w80 h30, %mh5%
gui, add, edit,vmv5 gSM5 x120 y195 w300 h30, %mv5%

gui, font, cblue
Gui, Add, GroupBox, x6 y247 w450 h200 , All
gui, font
gui, add, hotkey,vamh1 gSAM1 x30 y270 w80 h30, %amh1%
gui, add, edit,vamv1 gSAM1 x120 y270 w300 h30, %amv1%
gui, add, hotkey,vamh2 gSAM2 x30 y305 w80 h30, %amh2%
gui, add, edit,vamv2 gSAM2 x120 y305 w300 h30, %amv2%
gui, add, hotkey,vamh3 gSAM3 x30 y340 w80 h30, %amh3%
gui, add, edit,vamv3 gSAM3 x120 y340 w300 h30, %amv3%
gui, add, hotkey,vamh4 gSAM4 x30 y375 w80 h30, %amh4%
gui, add, edit,vamv4 gSAM4 x120 y375 w300 h30, %amv4%
gui, add, hotkey,vamh5 gSAM5 x30 y410 w80 h30, %amh5%
gui, add, edit,vamv5 gSAM5 x120 y410 w300 h30, %amv5%


Gui, Tab, Invoker
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h400 , Invoker
gui, font
gui, add, Checkbox, Checked%EnInvokerA% vEnInvokerA gEnInvokerA x120 y55, Add Spell
gui, add, checkbox, Checked%EnInvokerU% vEnInvokerU gEnInvokerU x220 y55, Use Spell
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
gui, add, text, x320 y240, Self-Cast Z:
gui, add, text, x320 y310, Invoke + Self-Cast Z:

gui, add, hotkey,vQQQ gQQQ x360 y90 w80, %QQQ%
gui, add, hotkey,vWWW gWWW x360 y125 w80, %WWW%
gui, add, hotkey,vEEE gEEE x360 y160 w80, %EEE%
gui, add, hotkey,vil gil x360 y195 w80, %il%
gui, add, hotkey,vAlacrityAS gAlacrityAS x320 y265 w120, %AlacrityAS%
gui, add, hotkey,vAlacrityUS gAlacrityUS x320 y335 w120, %AlacrityUS%

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
gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h270,Key Remap
gui, font

loop, 6 {
irk:=A_Index+6
yy:=20+A_Index*40
gui, add, button,vb%irk% gSetItem x26 y%yy% w80,% h%irk%
gui, add, text, x110 y%yy%,=>
gui, add, hotkey,vKRvalue%A_Index% gKRvalue%A_Index% x130 y%yy% w80,% KRvalue%A_Index%
}
loop, 6 {
irk:=A_Index+12
yy:=20+A_Index*40
krvali:=A_Index+6
gui, add, button,vb%irk% gSetItem x250 y%yy% w80,% h%irk%
gui, add, text, x335 y%yy%,=>
gui, add, hotkey,vKRvalue%krvali% gKRvalue%krvali% x355 y%yy% w80,% KRvalue%krvali%
}




Gui, Tab, Other



gui, font, cblue
Gui, Add, GroupBox, x6 y32 w450 h270 , Other
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

gui, font, cblue
Gui, Add, GroupBox, x6 y305 w450 h125,Run Program
gui, font
gui, add, edit,r1 vprog1 x26 y330 w200, %prog1%
gui, add, button, x+5 gBrowseProg1 w40,...
gui, add, button, x+5 gRunProg1 w60,Run
gui, add, checkbox,checked%runprog1s% vrunprog1s grunprog1s x+5 yp+4, Run At Start

gui, add, edit,r1 vprog2 x26 y360 w200, %prog2%
gui, add, button, x+5 gBrowseProg2 w40,...
gui, add, button, x+5 gRunProg2 w60,Run
gui, add, checkbox,checked%runprog2s% vrunprog2s grunprog2s x+5 yp+4, Run At Start

gui, add, edit,r1 vprog3 x26 y390 w200, %prog3%
gui, add, button, x+5 gBrowseProg3 w40,...
gui, add, button, x+5 gRunProg3 w60,Run
gui, add, checkbox,checked%runprog3s% vrunprog3s grunprog3s x+5 yp+4, Run At Start

Gui, Tab

gui, add, checkbox,Checked%DontShowConfig% vDontShowConfig gDontShowConfig x16 y457, Don't show it later
gui, font, bold
Gui, Add, Button, x155 y450 w90 h30,&Hide
Gui, Add, Button, gButtonReload x250 y450 w110 h30,&Reload
Gui, Add, Button, x365 y450 w90 h30,E&xit
gui, font
Gui, Show, x209 y100 h500 w470, %Version% - %profile% profile
}
EmptyMem()
	if runprog1s
		gosub, runprog1
	if runprog2s
		gosub, runprog2
	if runprog3s
		gosub, runprog3

    if UpdateAtStart
	gosub, UpdateCheckS
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
Run %Prog1%
return
RunProg2:
Run %Prog2%
return
RunProg3:
Run %Prog3%
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

FAQ:
run http://aht.isgreat.org/faq.html
return

getdota:
run http://getdota.com
return

UpdateCheck:
UrlDownloadToFile, http://www.dota.zzl.org/latest.html, %A_Temp%\latest.html
FileReadLine, NetVer, %A_Temp%\latest.html, 1
If (Version <> NetVer){
   MsgBox, 4,Check for update, %NetVer% is available! `nWould you like to download new version?
IfMsgBox Yes
	run http://aht.isgreat.org/download.html
}
else
   msgbox, Your AHT is up to date!
return

UpdateCheckS:
UrlDownloadToFile, http://www.dota.zzl.org/latest.html, %A_Temp%\latest.html
FileReadLine, NetVer, %A_Temp%\latest.html, 1
If (Version <> NetVer){
   MsgBox, 4,Check for Update, %NetVer% is available! `nWould you like to download new version?
IfMsgBox Yes
	run http://aht.isgreat.org/download.html
}
return

About:
if aboutcreated
gui, 2:show, autosize center, About
else {
Gui +Disabled
Gui 2:Default
Gui, +owner1

gui, font, s10 cblue
Gui, Add, GroupBox, x10 y0 w330 R1 , Author
gui, font
gui, font, s10
Gui, add, text,x140 y25,AucT

gui, font, s10 cblue
Gui, Add, GroupBox, x10 w330 R1 , Main Tester
gui, font
gui, font, s10
Gui, add, text,x130 y85,DenSiL7

gui, font, s10 cblue
Gui, Add, GroupBox, x10 w330 R1 ,Window mode, chat-suspend
gui, font
gui, font, s10
Gui, add, text,x130 y145,yayuhhz

gui, font, s10 cblue
Gui, Add, GroupBox, x10 w330 R1 , Website
gui, font
gui, font, s10 underline
Gui, add, text,x100 y205 gAHTISGREAT, AHT.ISGREAT.ORG
gui, font
gui, font, s10
gui, add, button, x10 y+20 w330, OK
gui, font
gui, show, autosize center, About
aboutcreated:=1
}
return

2ButtonOK:
2GuiClose:
2GuiEscape:
Gui, 1:-Disabled
Gui, hide
return

AHTISGREAT:
run http://aht.isgreat.org/
return




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
menu, options, togglecheck, Mouse Capture
menu, tray, togglecheck, Mouse Capture
if WMC
SetTimer,CheckActiveWar3
else
SetTimer,CheckActiveWar3,off
return


SetItem:
ChoosenB=%A_GuiControl%


Gui 4:Default

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

gui, add, listbox, x110 y85 w120 h150 vHG_Key gHotkey_UpdateHotkey
gosub, Hotkey_UpdateKeyList

gui, add, text, x10 y250 w40 h20, Key:
gui, add, edit, vhotkeyshow x+5 w190 h20 +readonly

gui, add, text, x10 y+5 w40 h20, Desc:
gui, add, text, vdescshow x+5 w190 h20 +readonly, None

gui, add, button, x25 y300 w100 h30 gHotkey_AcceptButton, Accept
gui, add, button, x+5 w100 h30 gHotkeyClose, Cancel

gui, show, autosize center, Choose hotkey...

return


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
GuiControl,, HG_Key, |A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|1|2|3|4|5|6|7|8|9|0|``|-|=|\|[|]|;|''|,|.|/|Space|Tab|Enter|Escape|Delete|ScrollLock|CapsLock|NumLock|PrintScreen|BackSpace|CtrlBreak|Pause|Break|Up|Down|Left|Right|Home|End|Insert|Page Up|Page Down
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





EnSkills:
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


KRvalue1:
KRvalue2:
KRvalue3:
KRvalue4:
KRvalue5:
KRvalue6:
KRvalue7:
KRvalue8:
KRvalue9:
KRvalue10:
KRvalue11:
KRvalue12:
gui, submit, nohide
IniWrite, % %A_ThisLabel%, %A_WorkingDir%\%profileini%, RemapKey, %A_ThisLabel%
return

auto1:
auto2:
autoall:
EnAutoCast:
gui, submit, nohide
IniWrite, % %A_ThisLabel%, %A_WorkingDir%\%profileini%, Auto-Casts, %A_ThisLabel%
return

SaveMessage:
gui, submit, nohide
loop, 5
{
IniWrite,% mh%A_index%, %A_WorkingDir%\%profileini%, Messages, hotkey%A_index%
IniWrite,% mv%A_index%, %A_WorkingDir%\%profileini%, Messages, message%A_index%
IniWrite,% amh%A_index%, %A_WorkingDir%\%profileini%, Messages, ahotkey%A_index%
IniWrite,% amv%A_index%, %A_WorkingDir%\%profileini%, Messages, amessage%A_index%
}
return

SM1:
SM2:
SM3:
SM4:
SM5:
i := SubStr(A_ThisLabel,3)
gui, submit, nohide
IniWrite,% mh%i%, %A_WorkingDir%\%profileini%, Messages, hotkey%i%
IniWrite,% mv%i%, %A_WorkingDir%\%profileini%, Messages, message%i%
return

SAM1:
SAM2:
SAM3:
SAM4:
SAM5:
i := SubStr(A_ThisLabel,4)
gui, submit, nohide
IniWrite,% amh%i%, %A_WorkingDir%\%profileini%, Messages, ahotkey%i%
IniWrite,% amv%i%, %A_WorkingDir%\%profileini%, Messages, amessage%i%
return




i1:
send {vk67}
return
i1S:
sendplay +{vk67}
return
i1Shop:

i2:
send {vk68}
return
i2S:
sendplay +{vk68}
return
i2Shop:

i3:
send {vk64}
return
i3S:
sendplay +{vk64}
return
i3Shop:

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
i5Shop:

i6:
send {vk62}
return
i6S:
sendplay +{vk62}
return

LC(xx,yy)
{
   BlockInput, On
   MouseGetPos, x0, y0
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
   SendPlay, {Click %x%,  %y%, Left}{Click %x0%, %y0%, 0}
   BlockInput, Off
}
LC1:
   LC(.79,.95)
return

LC2:
	LC(.84,.95)
return

LC3:
   LC(.9,.95)
return

LC4:
   LC(.95,.95)
return

LC5:
   LC(.79,.88)
return

LC6:
   LC(.84,.88)
return

LC7:
   LC(.9,.88)
return

LC8:
   LC(.95,.88)
return

LC9:
   LC(.81,.79)
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
m:=% %A_ThisLabel%
if instr(m,"|")
{
r:=RandomMessage(m)
send {enter}{Raw}%r%
send {enter}
}
else {
Loop, parse, %A_ThisLabel%, `,
{
	send {enter}{Raw}%A_LoopField%
	send {enter}
	sleep, 150
}
}
return

amv1:
amv2:
amv3:
amv4:
amv5:
m:=% %A_ThisLabel%
if instr(m,"|")
{
r:=RandomMessage(m)
send +{enter}{Raw}%r%
send {enter}
}
else {
Loop, parse, %A_ThisLabel%, `,
{
	send +{enter}{Raw}%A_LoopField%
	send {enter}
}
}
return

Snap:
sendplay {vk51}{vk51}{vk51}{vk52}
return
Snap2:
sendplay {vk51}{vk51}{vk51}{vk52}
sleep 250
sendplay {vk59}
return
Wall:
sendplay {vk51}{vk51}{vk45}{vk52}
return
Wall2:
sendplay {vk51}{vk51}{vk45}{vk52}
sleep 250
send {vk47}
return
Blast:
sendplay {vk51}{vk57}{vk45}{vk52}
return
Blast2:
sendplay {vk51}{vk57}{vk45}{vk52}
sleep 250
sendplay {vk42}
return
Tornado:
sendplay {vk51}{vk57}{vk57}{vk52}
return
Tornado2:
sendplay {vk51}{vk57}{vk57}{vk52}
sleep 250
sendplay {vk58}
return
Alacrity:
sendplay {vk57}{vk57}{vk45}{vk52}
return
Alacrity2:
sendplay {vk57}{vk57}{vk45}{vk52}
sleep 250
sendplay {vk5A}
return

Alacrity3:
sleep 150
sendplay {vk5A}

BlockInput, On
MouseGetPos, x0, y0
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
SendPlay, {Click %x%, %y%, Left}{Click %x0%, %y0%, 0}
BlockInput, Off
return

Alacrity4:
sendplay {vk57}{vk57}{vk45}{vk52}
sleep 250
sendplay {vk5A}

BlockInput, On
MouseGetPos, x0, y0
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
SendPlay, {Click %x%, %y%, Left}{Click %x0%, %y0%, 0}
BlockInput, Off
return
Meteor:
sendplay {vk57}{vk45}{vk45}
sleep 250
sendplay {vk52}
return
Meteor2:
sendplay {vk57}{vk45}{vk45}{vk52}
sleep 250
sendplay {vk44}
return
Strike:
sendplay {vk45}{vk45}{vk45}
sleep 250
sendplay {vk52}
return
Strike2:
sendplay {vk45}{vk45}{vk45}{vk52}
sleep 250
sendplay {vk54}
return
Walk:
sendplay {vk51}{vk51}{vk57}{vk52}{vk57}{vk57}
return
Walk2:
sendplay {vk51}{vk51}{vk57}{vk52}{vk57}{vk57}
sleep 250
sendplay {vk56}
return
Spirit:
sendplay {vk51}{vk45}{vk45}{vk52}
return
Spirit2:
sendplay {vk51}{vk45}{vk45}{vk52}
sleep 250
sendplay {vk46}
return
EMP:
sendplay {vk57}{vk57}{vk57}{vk52}
return
EMP2:
sendplay {vk57}{vk57}{vk57}{vk52}
sleep 250
sendplay {vk43}
return
gQQQ:
send {vk51}{vk51}{vk51}
return
gWWW:
send {vk57}{vk57}{vk57}
return
gEEE:
send {vk45}{vk45}{vk45}
return
gilist:
send {Enter}-il{Enter}
return


disable:
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
Sleep 100
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
Send {Enter}
Send {Click %x0%,  %y0%, 0}
BlockInput, Off
return

gIgnore:
squelch:="/squelch "
send {Enter}-hhn{Enter}
send {Enter}%squelch%

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

RemapKey1:
send %RKsendkey1%
return
RemapKey2:
send %RKsendkey2%
return
RemapKey3:
send %RKsendkey3%
return



TimeNow:
FormatTime, TimeString,, Time
send {enter}The current time is %TimeString%.{enter}
return

Switch:
Suspend
if !A_IsSuspended{
   if ScrollIndicator
   SetScrollLockState, On
   if Sound
   soundplay, *48
   SetTimer, CheckWarcraft, On
}
Else{
   if ScrollIndicator
   SetScrollLockState, Off
   if Sound
   soundplay, *64
   SetTimer, CheckChatting, Off
   SetTimer, CheckWarcraft, Off
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
      Sendplay {[ Up}
  Else
      Sendplay {[ Down}
  AHealthBarOn:=!AHealthBarOn

Return

ShowEHP:
  If EHealthBarOn
    {
      Sendplay, {] Up}
      EHealthBarOn:=0
    }
  Else
    {
      Sendplay, {] Down}
      EHealthBarOn := 1
    }
  EHealthBarOn:=!EHealthBarOn
Return

ReloadScript:
reload
return

KR1:
if KRvalue1
send {%VKR1%}
return
KR2:
if KRvalue2
send {%VKR2%}
return
KR3:
if KRvalue3
send {%VKR3%}
return
KR4:
if KRvalue4
send {%VKR4%}
return
KR5:
if KRvalue5
send {%VKR5%}
return
KR6:
if KRvalue6
send {%VKR6%}
return
KR7:
if KRvalue7
send {%VKR7%}
return
KR8:
if KRvalue8
send {%VKR8%}
return


VK(K) {
  if !K
  return K
  If RegExMatch(K,"([~*!#+]*)(.*)",M) && (StrLen(M2)>1)
    Return K
  F := A_FormatInteger
  SetFormat, Integer, H
  V := DllCall("VkKeyScan",Char,Asc(M2)) & 0xFF
  SetFormat, Integer, %F%
  StringReplace,V,V,0x,VK
  Return M1 V
}


EmptyMem(PID="AHT v2.0rc5"){
    pid:=(pid="AHT v2.0rc5") ? DllCall("GetCurrentProcessId") : pid
    h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
    DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
    DllCall("CloseHandle", "Int", h)
}

CheckChatting:
	if ReadChatState(hWar3Proc, baseAddr, chatState)
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

ReadChatState(handle, baseAddr, ByRef chatState)
{
	if (DllCall("ReadProcessMemory", "UInt", handle, "UInt", baseAddr, "UInt*", chatState, "UInt", 4, "UInt", 0) = 0 || ErrorLevel)
	{

		Return 0
	}
	Return 1
}

CheckWarcraft:
	IfWinNotActive, ahk_class Warcraft III
		Return
	SetTimer, CheckWarcraft, Off
	Sleep, 5000
	IfWinActive, ahk_class Warcraft III
	{
		WinGet, pid, PID
		if hWar3Proc > 0
			DllCall("CloseHandle", "UInt", hWar3Proc)



		hWar3Proc := DllCall("OpenProcess", "UInt", 0x0010 | 0x0400, "Int", 0, "UInt", pid)
		if (hWar3Proc = 0 || ErrorLevel)
		{
			MsgBox,Error: Unable to open process (%A_LastError%).
			SetTimer, CheckWarcraft, On
			Return
		}
		baseAddr := GetBaseAddr(pid)
		if (baseAddr = 0)
		{
			SetTimer, CheckWarcraft, On
			Return
		}
		SetTimer, CheckChatting, 100
	}
	else
		SetTimer, CheckWarcraft, On
	Return

GetBaseAddr(pid)
{
	hSnapshot := DllCall("CreateToolhelp32Snapshot", "UInt", 0x08, "UInt", pid)
	if (hSnapshot < 0 || ErrorLevel)
	{
		MsgBox,Error: Unable to take module snapshot (%A_LastError%).
		Return 0
	}

	VarSetCapacity(me32, 548)
	NumPut(548, me32)

	if DllCall("Module32First", "UInt", hSnapshot, "UInt", &me32)
	{
		VarSetCapacity(szModule, 256)

		Loop
		{
			DllCall("RtlMoveMemory", "Str", szModule, "UInt", &me32 + 32, "UInt", 256)

			if (szModule = "game.dll")
			{
				DllCall("CloseHandle", "UInt", hSnapshot)
				Return NumGet(me32, 20, "UInt") + 0xAD15F0
			}

			if !DllCall("Module32Next", "UInt", hSnapshot, "UInt", &me32)
				Break
		}
	}

	DllCall("CloseHandle", "UInt", hSnapshot)

	Return 0
}


DebugPrivilegesEnable()
{
	Process, Exist

	h := DllCall("OpenProcess", "UInt", 0x0400, "Int", false, "UInt", ErrorLevel)

	DllCall("Advapi32.dll\OpenProcessToken", "UInt", h, "UInt", 32, "UIntP", t)
	VarSetCapacity(ti, 16, 0)
	NumPut(1, ti, 0)

	DllCall("Advapi32.dll\LookupPrivilegeValueA", "UInt", 0, "Str", "SeDebugPrivilege", "Int64P", luid)
	NumPut(luid, ti, 4, "int64")
	NumPut(2, ti, 12)

	DllCall("Advapi32.dll\AdjustTokenPrivileges", "UInt", t, "Int", false, "UInt", &ti, "UInt", 0, "UInt", 0, "UInt", 0)
	DllCall("CloseHandle", "UInt", h)
}
