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



#S::

	InputBox, WaitTime, Countdown, Please enter the time of shutdown in hours, , 200, 150

	if ErrorLevel
		return
	else
	{
		Sleep, (%WaitTime%*3600000)

		Send {LWin}
		Sleep, 100
		Send {Right}
		Sleep, 100
		Send {Enter}
	}
	return