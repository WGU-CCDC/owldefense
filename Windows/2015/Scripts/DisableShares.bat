rem Disable shares script for WGU CCDC Team 2015
rem
rem ***RUN FROM AN ELEVATED PROMPT!!!***
rem
rem Script sends existing shares to SharesReport.txt, then closes shares, then prints shares again to verify.
rem 
rem IPC$ share remains open. To disable, you must disable the server service(not sure of the repercussions). Better to just firewall 139.
rem 
rem 20150125 Kyle Gaertner kylegaertner@gmail.com

echo Current Shares >> SharesReport.txt

net share >> SharesReport.txt

echo( >> SharesReport.txt

net share C$ /d

net share ADMIN$ /d

REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v AutoShareServer /t REG_DWORD /d 00000000 /f

echo( >> SharesReport.txt

echo Existing Shares >> SharesReport.txt

echo( >> SharesReport.txt

net share >> SharesReport.txt