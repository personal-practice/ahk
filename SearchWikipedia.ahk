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

