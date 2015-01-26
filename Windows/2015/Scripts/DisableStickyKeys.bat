rem Disable Sticky Keys script for WGU CCDC Team 2015
rem
rem ***RUN FROM AN ELEVATED PROMPT!!!***
rem
rem Sticky Keys can be used as exploit if cmd replaces the exe. Similar to utilman exploit. Disables for current user and new users.
rem 
rem 20150125 Kyle Gaertner kylegaertner@gmail.com

REG ADD "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f

REG ADD "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f

REG ADD "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f

REG ADD "HKEY_USERS\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f

REG ADD "HKEY_USERS\.DEFAULT\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f

REG ADD "HKEY_USERS\.DEFAULT\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ 58 /f