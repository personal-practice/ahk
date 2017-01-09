#!p::

fileCount := 10

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
	body .= "			<media src=""" playlist[A_Index] """/>`n"

foot := "
(
        </seq>
    </body>
</smil>
)"

FileAppend, % head "`n" body foot, % A_TickCount ".wpl"