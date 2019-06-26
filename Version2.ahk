^F5::Reload

^Numpad7::
IDfetcher()
Send {Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Enter}
WinWait, Gebruiker selecteren,, 10
if ErrorLevel
{
	MsgBox, Timed out!
	return
}
else
Sleep 100
Send {Tab}{Tab}{Tab}{Enter}
WinWait, Er is geen user geselecteerd,, 10
if ErrorLevel
{
	MsgBox, Timed out!
	return
}
else
Send {Enter}
return

^Numpad8::
IDfetcher()
Send {Backspace}{Down}{Down}{Down}{Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Tab}{Enter}
return

^Numpad9::
IDfetcher()
Send {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Enter}
return

IDfetcher() {
	Send {F4}
	WinWait, Index voor nieuw document,, 2
	if ErrorLevel
		{
		MsgBox, Timed out!
		} else
	Sleep 100
	Send {Tab}{Tab}
	WinActivate Dossier Klanten
	Send {Home}{F2}{Home}+^{Right}+{Left}^{c}{esc}
	WinActivate Index voor nieuw document
	Send ^v
	Sleep, 2500
	Send {Down}{Enter}
	Send {Tab}{Tab}
}

^Numpad0::
IDfetcher()
return

^p::
WinActivate Dossier Klanten
Send Home
KeyWait Control
Sleep, 400
Send  {Del}
KeyWait, Enter, D
if (slowMode = "true") {
	WinWait, ahk_class OperationStatusWindow,, 2
	if ErrorLevel {
		MsgBox, Not found, Maybe you want to disable slowMode by hitting Crtl+L
		return
	} else
	WinWaitClose, ahk_class OperationStatusWindow,, 10
	if ErrorLevel {
		MsgBox, Not closed?
		return
	}
} else
resumeDel:
Sleep, 400
WinActivate Dossier Klanten
MouseClickDrag, Left, 250, 125, -1700, 400, 5
WinActivate ELO
Sleep, 2500
Send ^t{Up}
return

Isolate() {
	WinActivate, Dossier Klanten
	Send {F2}{Home}+{A}{Space}{Enter}
	Sleep, 2000
	Send {Home}
}

^Numpad5::
Isolate()
return

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
		Sleep, 300
		Send {Enter}
		Sleep, 1000
		Isolate()
		Sleep, 200
		WinActivate Dossier Klanten
		MouseClickDrag, Left, 250, 125, -1700, 400, 5
		WinActivate ELO
		Sleep, 2500
		Send ^t{Up}
	} else {
		MsgBox, Out of range, can only be y/n
		Promt()
	}
}

^Numpad6::
IDfetcher()
Promt()
return

^l::
if (slowMode = "true") {
	slowMode = false
	MsgBox,,SlowMode , SlowMode is now disabled!, 2
	return
	} else
slowMode = true
MsgBox,,SlowMode , SlowMode is now enabled!, 2
return

slowMode = false
