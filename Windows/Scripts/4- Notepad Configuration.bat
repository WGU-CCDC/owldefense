REM Delete Notepad

cd\windows\system32
takeown /F notepad.exe
ICACLS notepad.exe /grant Administrators:F
del notepad.exe

REM Install Notepad++

npp.6.5.3.Installer.exe