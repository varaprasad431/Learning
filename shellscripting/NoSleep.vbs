i=1
Msgbox "Started"
While i < 125000

 Set oWsh = CreateObject("wscript.shell")

 
 oWsh.Sendkeys"{SCROLLLOCK}"


 oWsh.Sendkeys"{SCROLLLOCK}"

 wscript.Sleep 120000

i=i+1

Wend
