FileEncoding UTF-8

Width := 150
Gui, +LastFound
Gui, Color, 808080
Gui, Margin, 0, 0
Gui, Font, s11 cD0D0D0 Bold
Gui, Add, Progress, % "x-1 y-1 w" (Width+2) " h31 Background404040 Disabled hwndHPROG"
Gui, Add, Text, % "x0 y0 w" Width " h30 BackgroundTrans Center 0x200 gGuiMove vCaption", Playlist Creator

Gui, Font, s9 c404040
Gui, Add, Text, % "x10 y45 w70 +0x4000", Track Count

Gui, Font, c404040
Gui, Add, Edit, % "x83 y41 w30 +0x4000 vfileCount"

Gui, Add, Picture, x115 y37 +0x4000 gCreate, note.png

Gui, Add, Text, % "x7 w" (Width-14) "h5 vP"
GuiControlGet, P, Pos
H := PY + PH
Gui, -Caption
WinSet, Region, 0-0 w%Width% h%H% r6-6
Gui, Show, % "w" Width " NA"
WinSet AlwaysOnTop

return

thisFuncTho(fileCount)
{
	files := [], count := 0
	Loop, *.mp3,,1
			files[++count] := A_ScriptDir "\" A_LoopFileFullPath

	rnds := "", playlist := []
	Loop, % fileCount
	{
		Loop
		{
			Random, rnd, 1, files.maxIndex()
			if (!RegExMatch(rnds, "(" rnd ")"))
			{
				rnds .= "(" rnd ")"
				break
			}
		}
		playlist[A_Index] := files[rnd]
	}

	head := "
	(
	<?wpl version=""1.0""?>
	<smil>
		<head>
			<meta name=""Generator"" content=""playlistCreator""/>
			<meta name=""ItemCount"" content=""" fileCount """/>
			<title>playlist</title>
		</head>
		<body>
			<seq>
	)"

	body := ""
	Loop, % playlist.maxIndex()
	{
		string := playlist[A_Index]
		Transform, string, HTML, % string, 1
		body .= "			<media src=""" string """/>`n"
	}

	foot := "
	(
			</seq>
		</body>
	</smil>
	)"

	fname := A_TickCount ".wpl"
	FileAppend, % head "`n" body foot, % fname

	return fname
}

GuiMove:
   PostMessage, 0xA1, 2
return

GuiClose:
	Gui 1: Destroy
	ExitApp
return

Create:
	Gui 1: Submit, NoHide
	try Run, % thisFuncTho(fileCount)
	ExitApp
return