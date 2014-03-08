REM Software Installs

cd\setup
start /wait msiexec.exe /i "EMET Setup.msi" /qn /norestart
start /wait msiexec.exe /i MBSASetup-x64-EN.msi /q
start /wait ossec-agent-win32-2.7.1.exe