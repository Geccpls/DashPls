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
; Data vars
Global friends

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

Button:
	SetTitleMatchMode, 2   ;window title can contain WinTitle anywhere inside it to be a match
	WinActivate, Mozilla Firefox   ;Will activate the most recently open Firefox window
	friend := % A_GuiControl
	command :=  friends[friend][2]
	SendInput {!}%command%{Enter}
	sleep 50
	WinActivate DashPls
return


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
	friends := {"Marsh": [1,"smores"]
			,"Kingly": [2,"beaw"]
			,"Sylvia": [3,"sylvia"]
			,"Cider": [4,"dook"]
			,"Gecc": [5,"grip"]
			,"Ebban": [6,"grip"]}
	; Button vars
	myW := 100
	myH := 50
	myX := 10
	myY := 10
	;Gui vars
	GUIWidth := 600, GUIHeight := 400
	
	Menu, Tray, Icon, Shell32.dll, 174 ; Change the tray icon
	Menu, Tray, Tip, Script Name ; Change the tooltip of the tray icon
	Menu, Tray, NoStandard ; Remove all standard tray menu items
	Menu, Tray, Add, Exit, ExitSub

	Gui, +LastFound -Resize
	;Gui, Color, FFFFFF
	Gui, Margin, 10, 10
	;Generate buttons
	For key, element in friends 
		Gui, Add, Button, % " x" myX " y" ((myY + myH) * element[1] - myH) " w" myW " h" myH " gButton", % key
	
	;cleanup
	Gui, Show, % " w" GUIWidth " h" GUIHeight, DashPls
	Return
}
;Hotkey for detecting windows names. Ctrl-a.
;^a::
;WinGetActiveTitle, title
;MsgBox, title=%title%
;return


; =======================================================================================
