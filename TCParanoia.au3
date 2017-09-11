#cs
TCParanoia 1.3 written in AutoIt 3
Author: Tibor Repček
Web: https://github.com/tiborepcek/TCP
#ce

#NoTrayIcon
Break(0)

#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>

$sn = "TCParanoia" ;software name
$sv = "1.3" ;software version
$settings_file = @ScriptDir & "\" & $sn & ".ini" ;this software settings file
$tc_ini = @ScriptDir & "\totalcmd.ini" ;ini file with Total Commander settings

GUICreate($sn & " " & $sv, 343, 277, -1, -1)
GUICtrlCreateLabel($sn & " " & $sv, 15, 16, 308, 25, $ES_CENTER)
GUICtrlSetFont(-1, 14, 800, 0, "Verdana")
$editprocess = GUICtrlCreateEdit("", 15, 64, 308, 193, BitOR($ES_AUTOVSCROLL,$ES_WANTRETURN,$WS_VSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, "Courier New")
GUISetState(@SW_SHOW)
$secnames = IniReadSection($settings_file, "delSecs")
If Not FileExists($settings_file) Or Not FileExists($tc_ini) Then
	GUICtrlSetData($editprocess, "")
	GUICtrlSetData($editprocess, "! Error: " & "--> missing settings file(s).")
ElseIf @error Then
	GUICtrlSetData($editprocess, "")
	GUICtrlSetData($editprocess, "! Error: " & $settings_file & " --> probably no INI file.")
Else
	For $i = 1 To $secnames[0][0]
		$tcsecnames = IniReadSection($tc_ini, $secnames[$i][1])
		If @error Then
			GUICtrlSetData($editprocess, $secnames[$i][1] & " --> empty" & @CRLF, 1)
		Else
			For $ii = 1 To $tcsecnames[0][0]
				$delsec = IniDelete($tc_ini, $secnames[$i][1], $tcsecnames[$ii][0])
				If $delsec = 0 Then
					GUICtrlSetData($editprocess, $secnames[$i][1] & " --> not exists or read-only" & @CRLF, 1)
				Else
					GUICtrlSetData($editprocess, $secnames[$i][1] & " --> deleted" & @CRLF, 1)
				EndIf
				If $ii = $tcsecnames[0][0] Then ExitLoop
			Next
		EndIf
	Next
EndIf
While 1
	$msg = GUIGetMsg()
	Switch $msg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd