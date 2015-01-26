rem Disable IPv6 script for WGU CCDC Team 2015
rem
rem ***RUN FROM AN ELEVATED PROMPT!!!***
rem
rem Built upon last year's script. Corrected line 11. Added line 15. Yes its overkill.
rem 
rem 20150125 Kyle Gaertner kylegaertner@gmail.com

netsh interface ipv6 set teredo disabled

netsh interface ipv6 6to4 set state disabled undoonstop=disabled

netsh interface ipv6 isatap set state disabled

REG ADD hklm\system\currentcontrolset\services\tcpip6\parameters /f /v DisabledComponents /t REG_DWORD /d 255