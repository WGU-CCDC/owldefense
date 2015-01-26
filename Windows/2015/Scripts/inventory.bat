rem Simple inventory script for WGU CCDC Team 2015
rem
rem Leaves output of inventory.txt, registry.txt, schtasks.txt, services.txt, firewall.txt
rem
rem Uses built-in commands for compatibility 
rem
rem Works on XP, 2003, Vista, 7, 2008, 8, 8.1, and 2012. Will work on 2000 if you comment out line 21(2000 lacks systeminfo)
rem
rem Pulls hostname, OS, IP, Users, Groups, Shares, Installed Programs, Tasklist, Startup, Routes, Hosts, Startup Folders/Keys, SchTasks, Services, FW Rules
rem
rem Removed WMIC to pull installed programs because it stalls on occasion(Lines 52-53).
rem 
rem 20150125 Kyle Gaertner kylegaertner@gmail.com

echo|set /p=Hostname: >> inventory.txt
	hostname >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"Domain" >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	
echo IP Settings >> inventory.txt
	ipconfig /all >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Users >> inventory.txt
	net users >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Groups >> inventory.txt
	net localgroup >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Shares >> inventory.txt
	net share >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Installed Programs >> inventory.txt
	echo( >> inventory.txt
rem	echo First Pass(wmic) >> inventory.txt
rem	wmic /append:inventory.txt product get name,version
	echo First Pass(reg query 32bit uninstall) >> inventory.txt
	echo( >> inventory.txt
	reg query hklm\software\microsoft\windows\currentversion\uninstall /s | find "DisplayName" >> inventory.txt
	echo( >> inventory.txt
	echo Second Pass(reg query 64bit/Wow6432Node uninstall) >> inventory.txt
	echo( >> inventory.txt
	reg query HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall /s | find "DisplayName" >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Tasklist >> inventory.txt
	tasklist /svc >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Startup(WMIC) >> inventory.txt
	echo( >> inventory.txt
	wmic /append:inventory.txt startup get caption,command
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Routes >> inventory.txt
	echo( >> inventory.txt
	route print >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Hosts file >> inventory.txt
	echo( >> inventory.txt
	type C:\windows\system32\drivers\etc\hosts >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo Startup Folders(with hidden attribute on) >> inventory.txt
	echo( >> inventory.txt
	dir /a "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\AllUsers\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\Public\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\AllUsers\AppData\Local\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\Public\AppData\Local\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Users\Default\AppData\Local\Microsoft\Windows\Start Menu\Programs\Startup" >> inventory.txt

	dir /a "C:\Documents and Settings\%USERNAME%\Start Menu\Programs\Startup" >> inventory.txt
	dir /a "C:\Documents and Settings\AllUsers\Start Menu\Programs\Startup" >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo|set /p=Registry Keys: >> inventory.txt
	echo See registry.txt >> inventory.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run /s >> registry.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /s >> registry.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices /s >> registry.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce /s >> registry.txt
	reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit" /s >> registry.txt
	reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /s >> registry.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnceEx /s >> registry.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run /s >> registry.txt
	reg query HKLM\Software\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad /s >> registry.txt

	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run /s >> registry.txt
	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce /s >> registry.txt
	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunServices /s >> registry.txt
	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce /s >> registry.txt
	reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run" /s >> registry.txt
	reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v Load >> registry.txt
	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnceEx /s >> registry.txt
	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run /s >> registry.txt
	reg query HKCU\Software\Microsoft\Windows\CurrentVersion\ShellServiceObjectDelayLoad /s >> registry.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo|set /p=Scheduled Tasks: >> inventory.txt
	echo See schtasks.txt >> inventory.txt
	schtasks /query /fo list >> schtasks.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo|set /p=Services: >> inventory.txt
	echo See services.txt >> inventory.txt
	sc query >> services.txt
	echo( >> inventory.txt
	echo( >> inventory.txt
	echo( >> inventory.txt

echo|set /p=Firewall Rules: >> inventory.txt
	echo See firewall.txt >> inventory.txt
	netsh advfirewall firewall show rule name=all >> firewall.txt