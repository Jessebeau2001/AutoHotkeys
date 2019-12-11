slowMode = true

;InputBox, expWinName, Venster naam, Naam van het venste waar alle bestanden in opgeslagen zitten??
global expWinName
Sleep, 100
expWinName = Deventer ELO
WinActivate %expWinName%

^F5::Reload

^Numpad0::
IDfetcher()
return

^Numpad1::
IDfetcher()
indexFile("false", "Checklist")
return

^Numpad2::
IDfetcher()
indexFile("false", "Internet")
Return

; ^Numpad3::
; gotoFile()
; return

^Numpad4::
IDfetcher()
indexFile("false", "GenericLimit")
return

^Numpad5::
IDfetcher()
indexFile("false", "Overig")
return

^Numpad6::
IDfetcher()
indexFile("false", "Register")
return

^Numpad7::
IDfetcher()
indexFile("false", "Financieel")
return

^Numpad8::
IDfetcher()
indexFile("false", "Kvk")
return

^Numpad9::
IDfetcher()
indexFile("false", "SEPA")
return

^NumpadDot::
Send ^6
WinActivate %expWinName%
Send {Home}{F2}{Home}{Right}{Right}{Del}{Home}+^{Right}+{Left}^{c}{esc}
WinActivate ELO
Send ^v{Return}
KeyWait, space, D
;Sleep, 800
;pdfFinder("true")
;Sleep, 400
Send, ^2
return

indexFile(F4, whichFile) {
	if (F4 = "true" && whichFile != "Troep") {
		hyperInsert()
	}
	
	switch whichFile
	{
		case "Checklist":
		Send {backspace}{Down 5}{Right}{Down}{Enter}{Tab 3}{Enter}
		return
		case "Internet":
		Send {backspace}{Down 5}{Right}{Down 2}{Enter}{Tab}{Down 2}{Enter}{Tab 2}{Enter}
		return
		case "Atradius":
		Send {Backspace}{Down 7}{Right}{Down 2}{Enter}{Tab 5}{Enter}
		return
		case "Register":
		Send {backspace}{Down 5}{Right}{Down 3}{Enter}{Tab 5}{Enter}
		return
		case "GenericLimit":
		Send {Backspace}{Down 7}{Right}{Down 2}{Enter}{Tab 5}{Enter}
		return
		case "Overig":
		if (F4 = "true") {
			Send {Esc}
			return
		}
		Send {Backspace}{Down 8}{Enter}{Tab 5}{Enter}
		return
		case "Financieel":
		Send {Backspace}{Down 3}{Right}{Down 6}{Enter}{Tab}{Down 2}{Enter}{Tab 4}{Enter}
		WinWait, Gebruiker selecteren,, 10
		if ErrorLevel
		{
			MsgBox, Timed out!
			return
		}
		else
		WinActivate, Gebruiker selecteren
		Sleep, 300
		Send {Tab 3}{Enter}
		WinWait, Er is geen user geselecteerd,, 10
		if ErrorLevel
		{
			MsgBox, Timed out!
			return
		} else
		WinActivate, Er is geen user geselecteerd
		Send {Enter}
		return
		case "Kvk":
		Send {Backspace}{Down 6}{Right}{Down 5}{Enter}{Tab 5}{Enter}
		return
		case "SEPA":
		Send {Down 9}{Enter}{Tab}{Down 2}{Enter}{Tab 4}{Enter}
		return
		case "Troep":
		Send {Esc}
		Sleep, 100
		Send, {PgDn}^{Del}
		Sleep, 100
		Send {Return}
		Sleep, 100
		return
	}
}

^p::
WinActivate %expWinName%
Send Home
KeyWait Control
Sleep, 400
Send  {Del}
KeyWait, Enter, D
if (slowMode = "true") {
	WinWait, ahk_class OperationStatusWindow,, 2
	if ErrorLevel {
		MsgBox, Not found, Maybe you'll want to try disabling slowMode by hitting Crtl+L
		;return
	} else {
	WinWaitClose, ahk_class OperationStatusWindow,, 10
		if ErrorLevel {
		MsgBox, Not closed?
		return
		}
	Sleep, 200
	}
} else
Sleep, 400
WinActivate %expWinName%
Sleep, 400
WinActivate %expWinName%
Sleep, 400
ImportMoveRel()
WinActivate ELO
return

^l::
if (slowMode = "true") {
	slowMode = false
	MsgBox,,slowMode , SlowMode is now disabled!, 2
	return
	} else
slowMode = true
MsgBox,,slowMode , SlowMode is now enabled!, 2
return

^m::
if FileExist("conf.txt") {
	MsgBox, Exists!!
	} else {
		FileAppend,, conf.txt
		MsgBox, Created new config file beacause there was not an existing one!
	}
return

typeGUI() {
	global
	Gui, New, , typePicker
	Gui, add, button, default w80, Checklist
	Gui, add, button, default w80, Internet
	Gui, add, button, default w80, Financieel
	Gui, add, button, default w80, KvK
	Gui, add, button, default w80, SEPA
	Gui, add, button, default w80, Atradius
	Gui, add, button, default w80, Troep
	Gui, add, button, default w80, Overig
	Gui, Add, Progress, w200 h20 cRed vSortProgress, 0
	Gui,+AlwaysOnTop
	
	ProgressAmount := 100/FileAmount
}

IDfetcher() {
	WinActivate %expWinName%
	Send {Home}{F2}{Home}{Right}{Right}{Del}{Home}+^{Right}+{Left}^{c}{esc}
	WinActivate, ELO
	hyperInsert()
}

Isolate() {
	WinActivate, %expWinName%
	Send {F2}{Home}+{A}{Space}{Enter}
	Sleep, 2000
	Send {Home}
}

Promt() {
	InputBox, notFound, Available?, Customer registered y/n?, 640, 480, , 10, y/n
	if ErrorLevel {
		MsgBox, Are you still there?
	} else if (notFound = "y") {
		Send {Esc}
	} else if (notFound = "n"){
		WinActivate Index voor nieuwe document
		Send {Esc}
		WinActivate ELO
		Sleep, 400
		Send ^{a}^{Del}
		WinWait, Bestand(en),, 10
		if ErrorLevel {
			MsgBox, Error!
			return
			} else
		Send {Enter}
		Sleep, 1000
		Isolate()
		Sleep, 200
		WinActivate %expWinName%
		MouseClickDrag, Left, 250, 125, -1700, 400, 5
		WinActivate ELO
		Sleep, 2500
		Send ^t{Up}
	} else {
		MsgBox, Out of range, can only be y/n
		Promt()
	}
}

Clicky() {
	WinWait Index voor nieuw document
	WinMove Index voor nieuw document,,,, 1000, 800
	WinActivate Index voor nieuw document
	MouseClick Left, 40, 250
}

ImportMoveRel(){
WinActivate, ELO
MouseMove, 90, 240, 2
WinActivate, %expWinName%
MouseGetPos, ELO_X, ELO_Y
MouseMove, 250, 125, 2
MouseGetPos, Dos_X, Dos_Y
Send {Home}{PgUp}{Enter}
Sleep, 500
WinActivate, %expWinName%
Sleep, 400
Send ^a
Sleep, 400
MouseClickDrag, Left, Dos_X, Dos_Y, ELO_X, ELO_Y, 2
Sleep, 400
Send, !{Left}
}

gotoFile(){
	WinActivate, ELO
	MouseClick, Left, 95, 40
	KeyWait, Control
	i = 0
	while (i = 0) {
		if (GetKeyState("Del")){
		KeyWait, Enter, D
		keyWait, Enter
		Send, {Down}
		} else if (GetKeyState("Shift")){
			i = 1
		}
	}
	i = 0
	Sleep, 200
	Send, ^{2}
}

^r::
Global Files := [] ;iniate the array object
Global FileTypes := []
Global FileAmount := []
Global SavedFileArray := []
InputBox, FileAmount, hoeveel Files?

IDCheckerStart:
Gui, Destroy
WinActivate %expWinName%
Send {Home}{F2}{Home}{Right}{Right}{Del}{Home}+^{Right}+{Left}^{c}{esc}
Sleep, 100
ID := clipboard
Gui, New, , IDChecker
Gui, Add, Text, , Fetched ID is %ID%
Gui, add, button, default w80, Yes
Gui, add, button, default w80, No
Gui, show, , IDChecker
Send {Down}{Up}
return
ButtonNo:
goto, IDCheckerStart
ButtonYes:
Gui, Destroy

if (FileAmount = 0 || FileAmount = "") {
	MsgBox, There was no file amount specified/stopped function
	return
}

typeGUI()
Gui, Show, X440 Y180, typePicker 

Loop  {
	if (A_Index > FileAmount) {
		Send, {Control down}
		MouseClick, Left
		Send, {Control up}
		break
	}
	WinActivate, ELO
	MouseClick, Left, 185, 217 + 28 * A_Index -28
	WinActivate, typePicker
	KeyWait, Enter, D
	GuiControl,, SortProgress, +%ProgressAmount%
	FileTypes[A_Index] := FileType
	;MsgBox, % FileTypes[A_Index]
}

Gui, hide
Compressor("Financieel")
Compressor("Checklist")
Compressor("Kvk")
Compressor("Atradius")
Compressor("Internet")
Compressor("troep")
Compressor("SEPA")
Compressor("Overig")

; MsgBox, END OF ULTRA FUNCTION
return

ButtonKvk:
FileType = Kvk
return
ButtonChecklist:
FileType = Checklist
return
ButtonSEPA:
FileType = SEPA
return
ButtonFinancieel:
FileType = Financieel
return
ButtonAtradius:
FileType = Atradius
return
Buttontroep:
FileType = Troep
return
ButtonInternet:
FileType = Internet
return
ButtonOverig:
FileType = Overig
return

Compressor(FileSort) {
	typeCount := 0
	Loop {
		if (FileTypes[A_Index] = FileSort) {
			typeCount := typeCount + 1
		}
		if (A_Index > FileAmount) {
		;MsgBox, end of loop 1st: only %typeCount% could be found ;1st loop
		Break
		}
	}
	if (typeCount = "0") {
		return
	}
	WinActivate, ELO
	MouseMove, 185, 217 - 28
	Loop {
		if (A_Index > FileAmount) {
			Break
		}
		if (FileTypes[A_Index] = "0") {
			;MouseMove, 0, -28, 0, R
			goto, skipMove
		}
		Sleep, 100
		MouseMove, 0, 28, 0, R
		skipMove:
		if (FileTypes[A_Index] = FileSort) {
			Send, {Control down}
			MouseClick, Left
			Send, {Control up}
			FileTypes[A_Index] := SavedFileArray[A_index]
			FileTypes[A_Index] := "0"
			;Sleep, 100
		}
	}
	;MsgBox, The are %typeCount% %FileSort% files!
	if (typeCount = "1") {
		goto, continue
		;MsgBox, there is only 1 %FileSort% so task failed sucesfully!
		return
	}
	Send, ^{k}
	Sleep, 500
	Send {PgDn}
	continue:
	indexFile("true", FileSort)
	;MsgBox, End of Compressor function %FileSort%
	;KeyWait, Control, D
	WinWaitClose, Index voor nieuw document
	WinActivate, ELO
	MouseMove, 185, 217
	MouseClick, Left
	Send, {Control down}
	MouseClick, Left
	Sleep, 100
	Send, {Control up}
	Sleep, 100
}

hyperInsert() {
	Send {F4}
	WinWait, Index voor nieuw document
	Send {tab 2}^v
	loop {
		ImageSearch, _x, _y, 0, 0, 1000, 1000, ImageSearchFiles\sidebar.bmp
		;H:\Persoonlijke map\Mijn Documenten\autohotkey\sidebar.bmp
		If (ErrorLevel = 2) {
			MsgBox, Could not conduct image sreach
		} else if (ErrorLevel = 1) {
		} else {
			Send {Down}{Return}{tab 2}
			;MsgBox, Image was found at X: %_x% & Y: %_y%,
			break
		}
	}
}

^F7::
pdfFinder("true")
return

pdfFinder(destroy) {
	WinActivate, ELO
	ImageSearch, pdfX, pdfY, 0, 0, 1000, 1000,  H:\Persoonlijke map\Mijn Documenten\autohotkey\pdfIcon.bmp
	if (ErrorLevel = 1) {
		return
	} else if (ErrorLevel = 0) {
		MouseClick, Left, pdfX, pdfY, 1, 0
		Sleep, 500
		ImageSearch, pdfX, pdfY, 0, 0, 1000, 1000,  H:\Persoonlijke map\Mijn Documenten\autohotkey\pdfIconBlue.bmp
		if (ErrorLevel = 0) {
		sleep, 600
			if (destroy = "true") {
				Send, ^{Del}
				Send, {Return}
				;KeyWait, Enter, D
				Sleep, 400
				pdfFinder("true")
			}

		}
		return
	}
}

commonDivisor() {
	InputBox, A, A?, Give A a size
	InputBox, B, B?, And now give B a size	
	Step2:
	If (B = 0) {
		MsgBox, % A
		return
	} else if (A > B) {
		A := A - B
		goto, Step2
	} else {
		B := B - A
		Goto, Step2
	}
	MsgBox, ?
}
