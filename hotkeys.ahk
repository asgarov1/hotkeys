; ^ = Ctrl
; # = Win
; ! = Alt
; + = Shift

; * = immediate expansion 
; ? = expansion even if found within a string

^F5::Reload
+F5::Edit

; Sanity check
F1::MsgBox, Hello, AutoHotkey!

;;; WORK RELATED

#!n::  ; Win+Alt+N
    Run Notepad
return

#!z::  ; Win+Alt+Z
    Run C:\Users\extre\AppData\Roaming\Zoom\bin\Zoom.exe
return

^#l:: ; Ctrl+Win+L
Send, asgarov1@gmail.com
return
:c*:l**::
Send, asgarov1@gmail.com
return

;;; CALENDAR

:c*O:mon`t::
  Weekday(1)
Return
:c*O:tue`t::
  Weekday(2)
Return
:c*O:wed`t::
  Weekday(3)
Return
:c*O:thu`t::
  Weekday(4)
Return
:c*O:fri`t::
  Weekday(5)
Return
:c*O:sat`t::
  Weekday(6)
Return
:c*O:sun`t::
  Weekday(7)
Return

Weekday(Day) {
    Today := A_Now
    If abs(A_WDay) >= Day
        Today += Day + 7-A_WDay, days
    Else
        Today += Day - A_WDay, days
    FormatTime, Weekday, %Today%, MMM dd
    SendInput %Weekday%
}

;;; USEFUL SYMBOL SHORTCUTS
::(c)::©
::pound*::£
::euro*::€
::usd*::$
::+-::±

TextMenu(TextOptions)
{
    StringSplit, MenuItems, TextOptions, `,
    Loop %MenuItems0% {
        Item := MenuItems%A_Index%
        Menu, MyMenu, add, %Item%, MenuAction
    }
    Menu, MyMenu, Show
    Menu, MyMenu, DeleteAll
}

MenuAction:
  SendInput %A_ThisMenuItem%{raw}%A_EndChar%
Return

;;currencies menu
:cO:cur::
    TextMenu("€,$,£")
return

;;fractions menu
:cO:f/::
    TextMenu("½,⅓,⅔,¼,¾,⅕,⅖")
return


;;; Personal shortcuts
^#d:: ; Ctrl+Win+D
  Send, 1064586878 ; DM number
return

:c*:mfg,::
  Send, Mit freundlichen Grüßen,
return

:c*:eml*::
  Send, asgarov1@gmail.com
return

:c*:ph*::
  Send, 0664 431 1561
return

:c*:Lg,::
  Send, Liebe Grüße,
return

;;; WEBSITE NAVIGATION
SetTitleMatchMode, 2
#w::run https://google.com

#F3::
Input Key,L1
if Key=k
  run https://kanbanflow.com
return