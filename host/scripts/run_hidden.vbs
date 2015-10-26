'
' Hide the window for a windowed application
'
' Cy Rossignol <cy@rossignols.me>
'

CreateObject("Wscript.Shell").Run """" & WScript.Arguments(0) & """", 0, false
