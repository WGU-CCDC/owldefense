REM Change Admin and Guest Account

set /P password="Enter new password for Administrator account:"
net user Administrator %password%

set /P password="Enter new password for the Guest account:"
net user Guest %password%
net user Guest /active:no