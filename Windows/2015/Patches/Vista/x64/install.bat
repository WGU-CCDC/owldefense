@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
FOR /R "%~dp0" %%A IN (*.MSU) DO (
        ECHO= Installing %%~nA
        >NUL TIMEOUT /t 3
        WUSA "%%A" /quiet /norestart)
ECHO Finished installing...Press Enter!!!
ECHO *****
ECHO Don't forget to Reboot!!!
>NUL PAUSE
GOTO :EOF