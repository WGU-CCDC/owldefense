REM Disable Admin Shares

net share C$ /d
net share ADMIN$ /d
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v AutoShareServer /t REG_DWORD /d 00000000 /f

REM Disable Powershell

powershell.exe Set-ExecutionPolicy Restricted
powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden -File <script_name>
