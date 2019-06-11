^F5::Reload

^Numpad7::
Send {Down}{Down}{Down}{Right}{Down}{Down}{Down}{Down}{Down}{Down}{Enter}{Tab}{Down}{Down}{Enter}{Tab}{Tab}{Tab}{Tab}{Enter}{Tab}{Tab}{Tab}{Enter}{Enter}
Sleep, 1500
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
Sleep, 200
Send {Tab}{Tab}
WinActivate Dossier Klanten
Send {Home}{F2}^{Home}+^{Right}
Send +{Left}^c{esc}
WinActivate Index voor nieuw document
Send ^v
Sleep, 2800
Send {Down}{Enter}
Send {Tab}{Tab}
return

^p::
WinActivate Dossier Klanten
Send Home
KeyWait Control
Sleep, 400
Send {Del}
KeyWait, Enter, D
Sleep, 1000
WinActivate Dossier Klanten
MouseClick, middle, 400, 125
MouseClickDrag, Left, 400, 125, -1800, -200
WinActivate ELO
Send ^t{Up}
return
