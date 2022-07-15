; =======================================================================================
; Name ..........: TwitchDashboard
; Description ...: Script Description
; AHK Version ...: 1.1.32.00
; Platform ......: built on windows 10
; Language ......: English (en-US)
; Author ........: Gecc
; Credit ........: TheDewd on the Autohotkey forums for boilerplate / template.
; =======================================================================================

; Global ================================================================================
#SingleInstance, Force ; Allow only one running instance of script
#Persistent ; Keep script permanently running until terminated
#NoEnv ; Avoid checking empty variables to see if they are environment variables
#Warn ; Enable warnings to assist with detecting common errors
;#NoTrayIcon ; Disable the tray icon of the script
SendMode, Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir, %A_ScriptDir% ; Change the working directory of the script
SetBatchLines, -1 ; Run script at maximum speed
OnExit, ExitSub ; Run a subroutine or function automatically when the script exits
; =======================================================================================

; Script ================================================================================

Return ; End automatic execution
; =======================================================================================

; Labels ================================================================================
MenuHandler:
	MsgBox, You selected %A_ThisMenuItem% from menu %A_ThisMenu%.
Return

GuiEscape:
GuiClose:
ExitSub:
	ExitApp ; Terminate the script unconditionally
Return
; =======================================================================================





; Functions =============================================================================
GUIMain()
{
	Static GUICreate := GUIMain()
	
	Global
	; Variables and Constants ===================

	; Button vars
	myW := 100
	myH := 50
	myX := 10
	myY := 10
	; Data vars
	friends := {marsh : ["Marsh", "!smores"]
				,kingly : ["Kingly", "!beaw"]}
	;Gui vars
	GUIWidth := 600, GUIHeight := 400
	
	Menu, Tray, Icon, Shell32.dll, 174 ; Change the tray icon
	Menu, Tray, Tip, Script Name ; Change the tooltip of the tray icon
	Menu, Tray, NoStandard ; Remove all standard tray menu items
	Menu, Tray, Add, Exit, ExitSub

	Gui, +LastFound -Resize
	;Gui, Color, FFFFFF
	Gui, Margin, 10, 10

	Gui, Add, Button, % " x" myX " y" myY " w" myW " h" myH, Kingly
	Gui, Add, Button, % " x" myX " y" ((myY + myH) * 2 - myH) " w" myW " h" myH, Marsh

	Gui, Show, % " w" GUIWidth " h" GUIHeight, DashPls
	Return
}

^a::
WinGetActiveTitle, title
MsgBox, title=%title%
return

ButtonKingly:
SetTitleMatchMode, 2   ;window title can contain WinTitle anywhere inside it to be a match
WinActivate, Mozilla Firefox   ;as it always has the "- Mozilla Firefox" part in it
SendInput {!}beaw{Enter}
sleep 50
WinActivate DashPls
return
;WinGetActiveTitle, title
;MsgBox, title=%title%
;return

ButtonMarsh:
SetTitleMatchMode, 2   ;window title can contain WinTitle anywhere inside it to be a match
WinActivate, Mozilla Firefox   ;as it always has the "- Mozilla Firefox" part in it
SendInput {!}smores{Enter}
sleep 60
WinActivate DashPls
return
; =======================================================================================
