
/*

Caravan Packer/Lifting caravan boxes Quest Bot for Fonline: Reloaded and 2.
Quest Info: http://www.fonline-reloaded.net/wiki/index.php?title=Lifting_caravan_boxes&redirect=no

You have to run iFonline n Window Mode/windowed!

Date:2/09/2015
AHK verion: 1.1.22.04

*/


SetDefaultMouseSpeed, 10
#SingleInstance, force
CoordMode, Pixel, Screen
#Persistent

Boxes_Done = 0

Gui, Add, Text, x57 y7 w160 h20 , Caravan Packer Quest Bot v1.0

Gui, Add, Text, x6 y47 w60 h20 , Caravan X
Gui, Add, Edit ,ReadOnly x6 y67 w60 h20 vCx,

Gui, Add, Text, x76 y47 w60 h20 , Caravan Y
Gui, Add, Edit ,ReadOnly x76 y67 w60 h20 vCy,

Gui, Add, Button, x166 y47 w100 h30 gSc, Set Coordinates

Gui, Add, Text, x6 y107 w70 h20 , Drop Boxes X
Gui, Add, Edit ,ReadOnly x6 y127 w60 h20 vDbx,

Gui, Add, Text, x86 y107 w70 h20 , Drop Boxes Y
Gui, Add, Edit ,ReadOnly x86 y127 w60 h20 vDby,

Gui, Add, Button, x166 y107 w100 h30 gSc2, Set Coordinates

Gui, Add, GroupBox, x6 y157 w100 h80 , Caravan Box
Gui, Add, Picture, x26 y187 vBox, C:\Users\Snow\Music\FloowSnaake\adabo-ahkMessenger-fabecdd\adabo-ahkMessenger-fabecdd\tidiab\lib AHK\Screen_20150902011839.png
Gui, Add, Button, x166 y177 w100 h30 gSi, Select Image/Box

Gui, Add, Text, x6 y247 w90 h20 , Start Bot Hotkey:
Gui, Add, Hotkey, x6 y267 w100 h20 vstart_key, §

Gui, Add, Text, x116 y247 w90 h20 , Stop Bot Hotkey:
Gui, Add, Hotkey, x116 y267 w100 h20 vstop_key, Q

Gui, Add, Button, x6 y307 w140 h30 gStart,Start Bot

Gui, Show, w277 h352 y0 x0, Lifting caravan boxes
Sleep, 500
WinActivate, FOnline
WinActivate, Lifting caravan boxes
return

GuiClose:
ExitApp

sc:
WinActivate, FOnline
WinWaitActive, FOnline
ToolTip,Select Caravan Coordinates`nMove your mouse over the Caravan then press Middle Mouse Button.,0,0
keywait, x, D
keywait, x
mousegetpos, XXX1, YYY1

GuiControl,, Cx, %XXX1%
GuiControl,, Cy, %YYY1%
ToolTip
WinActivate, Lifting caravan boxes
return

sc2:
WinActivate, FOnline
WinWaitActive, FOnline
ToolTip,Select Drop Coordinates`nMove your mouse over the Drop Area then press Middle Mouse Button.,0,0
keywait, x, D
keywait, x
mousegetpos, XXX2, YYY2

GuiControl,, Dbx, %XXX2%
GuiControl,, Dby, %YYY2%
ToolTip
WinActivate, Lifting caravan boxes
return

si:
FileSelectFile, Selected_Box, 3, , Select a Box Image, Box image (*.*)
if Selected_Box =
    MsgBox, You didn't select a Box image!
else
  MsgBox, 4128,Box image selected,  Is this the right picture?`n`n"%Selected_Box%"

GuiControl,, Box,%Selected_Box%
WinActivate, Lifting caravan boxes
return

start:
Gui,submit
Hotkey,%start_key%,start_Bot
Hotkey,%stop_key%,stop_Bot
ToolTip, Press %star_key% so start Lifting caravan boxes Quest Bot and %stop_key% to Exit/Quit,0,0
return


start_Bot:
SoundBeep
ToolTip, Boxes Droped: %Boxes_Done%,0,0
WinActivate, FOnline
WinWaitActive, FOnline
Sleep, 200

Loop, 10
{

IfGreaterOrEqual,A_index,10 
{
MsgBox, 64, Lifting caravan boxes Quest, Lifting caravan boxes Quest is completed now`, talk to Caravan Packer!
}	

Sleep, 200
click, %Cx%,%Cy%
Sleep, 3000
click, %Cx%,%Cy%
click, 2
Sleep, 600
click, 2
Sleep, 200
Click Right
Sleep, 2000
click, %Dbx%,%Dby%
Sleep, 10000
Send, {i}
Sleep, 3000

ImageSearch, FoundX, FoundY, 281, 242, 359, 289, %Box%
IF ErrorLevel = 0
{
ToolTip, Found Box in Inventory,,2
MouseMove,%XB%, %YB%
Sleep,300
Click Down
Sleep,500
MouseMove,%XD%,%YD%
Sleep,300
Click Up
Sleep,500
Send, {i}
Sleep, 3000
Click Right
Sleep, 200
click, %Cx%,%Cy%
Sleep 2000
click, %Cx%,%Cy%
Sleep, 10000
Click Right
}

IF ErrorLevel = 1
{
ToolTip, Couldn't find a Caravan Box in the inventory,,2	
Send, {i}
Sleep, 3000
Click Right
Sleep, 200
click, %Cx%,%Cy%
Sleep 2000
click, %Cx%,%Cy%
Sleep, 10000
Click Right
}


Boxes_Done++
ToolTip, Boxes Droped: %Boxes_Done%
}
return

stop_Bot:
SoundBeep
ExitApp
return

left::
up::
Down::
right::
return
