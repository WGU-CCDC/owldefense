rem Enumerate active Active Directory users for WGU CCDC Team 2015
rem 
rem Nothing fancy here folks. Run it on a DC and collect the output at C:\ActiveUsers.txt
rem 
rem Don't bother asking me how it works. I stole it from the interwebz. Shamelessly.
rem 
rem 20150125 Kyle Gaertner kylegaertner@gmail.com

dsquery * -filter "(&(sAMAccountType=805306368)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))" -limit 0 | dsget user -display -email -dept -title > C:\ActiveUsers.txt