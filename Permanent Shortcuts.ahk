;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_class ConsoleWindowClass
^V::
SendInput {Raw}%clipboard%
return
#IfWinActive

; Daily Sites
#space::
Run www.facebook.com
Sleep, 100
Run https://dub120.mail.live.com/default.aspx
Sleep, 100
Run https://webmail.noc.uoa.gr/src/login.php
return
; News Sites
#n::
Run http://lambda-the-ultimate.org/
Sleep, 100
Run https://egtheory.wordpress.com/
Sleep, 100
Run https://rjlipton.wordpress.com/
Sleep, 100
Run http://cacm.acm.org/blogs/blog-cacm
Sleep, 100
Run http://www.scottaaronson.com/blog/
return
; Project Sites
#p::
Run https://app.asana.com/0/18203721899548/18203721899548
Sleep, 100
Run https://www.assembla.com/code/social-network-analysis-project/subversion/nodes
Sleep, 100
Run https://bitbucket.org/orestisMelkonian/
return
; Command Prompt
#r::
Run cmd.exe
SendRaw, cd "..\..\\Documents\Sxolh Orestis\EclipseWorkspace"
Send {ENTER}
return
; Search wikipedia
#w::
clipboard =  ;
Send ^c
ClipWait  ;
Run http://en.wikipedia.org/wiki/Main_Page
Loop
	{
		PixelGetColor, Loaded, 664, 250
		if Loaded = 0xF9F9F9
			break
	}
Send {TAB}
Send %clipboard%
Send {Enter}
return
; Search IMDB
#i::
clipboard =  ;
Send ^c
ClipWait  ;
Run http://www.imdb.com/
Loop
	{
		PixelGetColor, Loaded, 1072, 223
		if Loaded = 0xF1F2F2
			break
	}
Send {TAB}, {TAB}, {TAB}, {TAB}
Send %clipboard%
Send {Enter}
return
; Google Query
!g::
InputBox, UserInput, Google Query, Please enter a google query or URL., , 200, 150
if ErrorLevel
    return
else
{
    Run chrome.exe
	Send {^l}
	Send %UserInput%
	Send {Enter}
}
return
; Skype login
#M::
Send sisterity1@live.com
Sleep, 100ms
Send {TAB}
Sleep, 100ms
Send "CHANGE_ME"
Sleep, 100ms
Send {Enter}
return
; Desktop Shortcut
!d::
CoordMode, ToolTip, Screen
MouseClick, left, 1282, 995
MouseClick
return
; Shutdown scheduling
#S::
	InputBox, WaitTime, Countdown, Please enter the time of shutdown in minutes, , 200, 150
	if ErrorLevel
		return
	else
	{
		Sleep, (%WaitTime%*60000)

		Send {LWin}
		Sleep, 100
		Send {Right}
		Sleep, 100
		Send {Enter}
	}
	return
