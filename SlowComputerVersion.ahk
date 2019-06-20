^F5::Reload

^Numpad7::
Send {Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Enter}
WinWait, Gebruiker selecteren,, 10
if ErrorLevel
{
	MsgBox, Timed out!
	return
}
else
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
Send {Down}{Down}{Down}{Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Tab}{Enter}
return

^Numpad9::
Send {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Enter}
return

^Numpad0::
Send {F4}
Sleep, 400
Send {Tab}{Tab}
WinActivate Dossier Klanten
Send {Home}{F2}^{Home}+^{Right}
Send +{Left}^c{esc}
WinActivate Index voor nieuw document
Send ^v
Sleep, 2500
Send {Down}{Enter}
Send {Tab}{Tab}
return

^p::
WinActivate Dossier Klanten
Send Home
KeyWait Control
Sleep, 400
Send  {Del}
KeyWait, Enter, D
WinWait, ahk_class OperationStatusWindow,, 2
if ErrorLevel
{
	MsgBox, Not found!
	return
}
else
WinWaitClose, ahk_class OperationStatusWindow,, 10
if ErrorLevel
{
	MsgBox, Not closed?
	return
}
else
Sleep, 100
WinActivate Dossier Klanten
MouseClick, middle, 400, 125
MouseClickDrag, Left, 400, 125, -1800, -200
WinActivate ELO
Sleep, 2500
Send ^t{Up}
return
