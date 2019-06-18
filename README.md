# ELO user automation with AutoHotkey
## Introduction:
This is an AutoHotkey script made to get some automation into your workflow for sorting customer files. It can do things like auto
Index with a key combination so you won't have to select each file type manually usually saving up to 30 seconds per Index.

## Disclaimer:
This is an AutoHotkey script meant o work with the portable version of AutoHotkey.
This is a script meant to automate the user workflow for sorting customer files in ELO. The script is not perfect
because it is dependant on relative positions and exact timing of certain key actions. This script is made to function with
establishment Enschede this means it will require tweaking to some extent to make it work for other establishments. It's also not fully
automatic and can't handle things like png files and automatically deleting useless things like empty pages, this all requires manual work
by the user. sorting has to be done by hand but when the PDF files have been sorted they can be automatically be put into the
right Index in ELO. Things like PNG files have to be converted to PDF files manually so they can be indexed in ELO.

## Functions:
The script is able to do the following (ordered in action per keybind function):
  -Automatically delete the previous sorted folder, move the next new folder to ELO, split the newly moved PDF files.
  -Automatically put in the right Customer ID and name.
  -Automatically Index to Financial letter, KvK documents & SEPA agreements.
  
## Usage:
Please navigate to the Autohotkey website (https://www.autohotkey.com/download/) and press the 'Download AutoHotkey .zip' button to
download a portable version of Autohotkey. Next extract the .ZIP file to a folder of your choosing. Now open the newly extracted folder
and create a text document with the exact name of one of the .EXE files (for example AutoHotkeyU64.exe becomes AutoHotkeyU64.txt).
Now copy and paste the code form the repository to this text file. When you have done this press save as and save the file as for
example AutoHotkeyU64.ahk. the .ahk is crucial as it won't recognize it as a macro file otherwise. Make sure the file name is accordingly
AutoHotkeyU64.ahk (and not AutoHotkeyU64.txt or AutoHotkeyU64.txt.ahk).

When you have done the above steps proceed to press AutoHotkeyU64.exe (Or your selected version)

Now the macro script should be active and there should be a green H icon in the bottom right of your screen (if it doesn't show up
press the upward pointing arrow to show hidden icons).

The following keybinds are now active:
* Crtl+Np0 - Open the index screen of the selected file in ELO and automatically copy over the customer ID
* Crtl+Np7 - Saves currently opened Index as 'Financiële brief'
* Crtl+Np8 - Saves currently opened Index as 'KvK Uitreksel'
* Crtl+Np9 - Saves currently opened Index as 'SEPA machtiging'
* Crtl+P   - Deletes top folder and moves the next new top folder to ELO and splits the PDF files
