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