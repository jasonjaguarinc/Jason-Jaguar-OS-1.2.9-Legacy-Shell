@echo off
:startup
cls
color 0a
title Jason Jaguar OS ver. 1.2.9
pause
echo Booting Drive Function..
ping Localhost -n 2 >nul
cls
echo Finding Kernel.........
ping Localhost -n 2 >nul
cls
echo Kernel Found! Booting Jason Jaguar OS Ver. 1.2.9
pause
echo Hello. Welcome to your new Jaguar Operating Enviroment (tm)
pause

cls            
echo what is your name?
set/p name=
echo.
cls
echo HELLO! %name%
echo.
pause

:menu
cls
color 0a
Title menu
echo -------------------------------------------
echo What Would You Like To Do? Type the number.
echo -------------------------------------------
echo.
echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo 1.System Info 2.Reboot Code 3.Date and time 4.antivirus 5.play game 6.Notepad 7.Internet Browser 8.RD Section 9.WAR!!! 10.Calculator 11.Tetris 1.0 12.The oregon trail 13.Exit 14.Chess 15.Poketrion force
echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set /p input=
if %input% == 1 goto info
if %input% == 2 goto reboot 
if %input% == 3 goto date
if %input% == 4 goto antivirus
if %input% == 5 goto play game
if %input% == 6 goto notepad
if %input% == 7 goto browser
if %input% == 8 goto eggo
if %input% == 9 goto cyan
if %input% == 10 goto calc
if %input% == 11 goto tetris
if %input% == 12 goto trail
if %input% == 13 goto exit
if %input% == 14 goto chess
if %input% == 15 goto master

:info

cls
echo.=======================
echo     Jason Jaguar__OS_
echo.=======================
echo     DETAILS  
echo.
echo     VERSION = 1.0.0

if %os%==Windows_NT goto WINNT
goto NOCON

:WINNT
echo .Using a Windows NT based system
echo ..%computername%

REM set variables
set system=
set manufacturer=
set model=
set serialnumber=
set osname=
set sp=
setlocal ENABLEDELAYEDEXPANSION
set "volume=C:"
set totalMem=
set availableMem=
set usedMem=

echo Getting data [Computer: %computername%]...
echo Please Wait....

REM Get Computer Name
FOR /F "tokens=2 delims='='" %%A in ('wmic OS Get csname /value') do SET system=%%A

REM Get Computer Manufacturer
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Manufacturer /value') do SET manufacturer=%%A

REM Get Computer Model
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Model /value') do SET model=%%A

REM Get Computer Serial Number
FOR /F "tokens=2 delims='='" %%A in ('wmic Bios Get SerialNumber /value') do SET serialnumber=%%A

REM Get Computer OS
FOR /F "tokens=2 delims='='" %%A in ('wmic os get Name /value') do SET osname=%%A
FOR /F "tokens=1 delims='|'" %%A in ("%osname%") do SET osname=%%A

REM Get Computer OS SP
FOR /F "tokens=2 delims='='" %%A in ('wmic os get ServicePackMajorVersion /value') do SET sp=%%A

REM Get Memory
FOR /F "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined totalMem (set availableMem=%%a) else (set totalMem=%%a)
set totalMem=%totalMem:,=%
set availableMem=%availableMem:,=%
set /a usedMem=totalMem-availableMem

FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree %volume%') DO (
    SET "diskfree=!disktotal!"
    SET "disktotal=!diskavail!"
    SET "diskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%disktotal% %diskavail%") DO SET "disktotal=%%i"& SET "diskavail=%%j"

echo done!

echo --------------------------------------------
echo System Name: %system%
echo Manufacturer: %manufacturer%
echo Model: %model%
echo Serial Number: %serialnumber%
echo Operating System: %osname%
echo C:\ Total: %disktotal:~0,-9% GB
echo C:\ Avail: %diskavail:~0,-9% GB
echo Total Memory: %totalMem%
echo Used  Memory: %usedMem%
echo Computer Processor: %processor_architecture%
echo Service Pack: %sp%
echo --------------------------------------------

REM Generate file
SET file="%~dp0%computername%.txt"
echo -------------------------------------------- >> %file%
echo Details For: %system% >> %file%
echo Manufacturer: %manufacturer% >> %file%
echo Model: %model% >> %file%
echo Serial Number: %serialnumber% >> %file%
echo Operating System: %osname% >> %file%
echo C:\ Total: %disktotal:~0,-9% GB >> %file%
echo C:\ Avail: %diskavail:~0,-9% GB >> %file%
echo Total Memory: %totalMem% >> %file%
echo Used  Memory: %usedMem% >> %file%
echo Computer Processor: %processor_architecture% >> %file%
echo Service Pack: %sp% >> %file%
echo -------------------------------------------- >> %file%
pause
cls   
echo.   
echo     Kernel ver = 1.2.9
echo.========================
echo     @Copyright P.inc
echo.========================
echo.
echo -----------------------------
echo Unlock key for reboot is 7742
echo -----------------------------
echo Wanna check for update?

echo  1. to check for update 
echo  2. Menu

set /p check= 

if %check% == 1 goto update

if %check% == 2 goto menu




     
:update 
cls

echo Checking for new version.............
echo.
pause
cls
echo ---------------------------
echo There are no new updates...
echo ---------------------------
pause
goto menu

:reboot
set /p protection=Enter password:
if %protection% == 7742 goto correct
if not %protection% == 7742 goto incorrect
:correct
cls
echo Correct pass!
pause
goto memo
:incorrect
cls
echo Incorrect pass!
pause
exit

:memo
echo System reboot starting...
cls
echo Rebooting.
ping Localhost -n 2 >nul
cls
echo Rebooting...
ping Localhost -n 2 >nul
cls
echo System reboot half COMPLETE!
pause
goto startup


:date
cls
for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
echo Current time is %mydate%:%mytime%
pause
goto menu

:antivirus
cls
echo Deleting Virus.
ping Localhost -n 2 >nul
cls
echo Deleting Virus...
ping Localhost -n 2 >nul
cls
echo COMPLETE!
echo You have no viruses anymore
pause
goto menu

:play game
Color 02
title Zombie Attack
cls
echo Welcome to Zombie Attack
echo In this game you have to fight Zombies 
echo (1) Begin
echo (2) Exit
set /p choice1=Choose-

if %choice1% == 1 goto g
if %choice1% == 2 goto c

:g
cls
title Battle 1
pause
cls
echo You find a strange man in the woods,
echo you think that he is just a man, but really, he is a Zombie!
Color F9
pause
echo Entering Battle 1...
Color 01
pause
goto h

:h
cls
title Battle 1
echo Zombie used Bite!
echo Your health fell by 75!
echo You have 3 attacks.
echo (1) Punch
echo (2) Slap
echo (3) Kick in the Butt
set /p choice3=Choose-

if %choice3% == 1 goto i
if %choice3% == 2 goto j
if %choice3% == 3 goto k

:i
cls
Color 07
echo BAM!
pause
echo You used Punch!
Color 01
echo Zombie's health fell by -14hp
echo Congratulations!
echo You beat the Zombie!
echo Thanks for playing!
pause
Color 0a
goto menu

:notepad
cls
echo Ready?
pause
Notepad Untitled
pause
goto menu

:browser
cls
title connection error
echo Your Internet Connection seems to not work. Would you like to Reconnect?

set /p input=
if %input% == yes goto recon
if %input% == no goto es

:recon
title Rebooting Internet
echo Reconnecting.
ping Localhost -n 2 >nul
cls
echo Reconnecting...
ping Localhost -n 2 >nul
cls
echo COMPLETE!
echo Trying again...
pause
goto online

:es
title ummm....
echo ummm..... then why go on the internet?
pause
goto menu

:online
title internet
echo -----------------------------------------------
echo What would you like to choose? type the number!
echo -----------------------------------------------
echo.
echo ------------------------------------------------------------------
echo 1.Youtube 2.Online Chat 3.Manage NiceHash Account 4.Beyblade Burst 
echo ------------------------------------------------------------------

set /p input=
if %input% == 1 goto Y
if %input% == 2 goto O
if %input% == 3 goto M
if %input% == 4 goto B

:Y
echo OK
pause
start Opera https://Youtube.com
pause
goto menu

:O
echo OK
pause 
start Opera https://hangouts.google.com
pause
goto menu

:M
echo OK
pause
start Opera https://www.nicehash.com/dashboard
pause
goto menu

:B
echo OK
pause
start Opera https://scratch.mit.edu/projects/162984588/#player
pause
goto menu

:eggo
cls
title Jason Jaguar Inventories llc. R&D SOFTWARE UNIT MANUFACTURES 1.0 Beta
pause
cls
echo Starting Bootup
pause
cls
echo Booting second Drive Function
pause
Notepad Untitled
pause
goto menu

:cyan
title Jason Jaguar Inventories llc. R&D SOFTWARE UNIT MANUFACTURES 1.0 Beta 
color 0c
title TOTAL WAR!!!
echo.
echo Welcome to Total War, created by Jason Haude.
echo.
pause
:players
cls
set player=
set replay=
echo.
set /p player=Select 1 or 2 player mode:
if '%player%'=='1' goto name
if '%player%'=='2' goto p1name
goto players
:name
cls
set name=
echo.
set /p name=Please type in your name (One word):
if '%name%'=='' goto name
rem Easter Egg:
if '%name%'=='Jason' goto win
:country
cls
set country=
set enemy=
echo.
echo Welcome %name%!
echo.
set /p country=Choose your country; USA, Russia, or Canada:
if '%country%'=='usa' goto enemy1
if '%country%'=='USA' goto enemy1
if '%country%'=='Usa' goto enemy1
if '%country%'=='Russia' goto enemy2
if '%country%'=='russia' goto enemy2
if '%country%'=='canada' goto enemy3
if '%country%'=='Canada' goto enemy3
goto country
:enemy1
set country=USA
goto enemy
:enemy2
set country=Russia
goto enemy
:enemy3
set country=Canada
:enemy
set /a cpucountryrand=%random% %%5 +1
if '%cpucountryrand%'=='0' goto enemy
if '%cpucountryrand%'=='1' set enemy=Russia
if '%cpucountryrand%'=='2' set enemy=USA
if '%cpucountryrand%'=='3' set enemy=Canada
if '%cpucountryrand%'=='4' goto enemy
if '%cpucountryrand%'=='5' goto enemy
if '%enemy%'=='%country%' goto enemy
:begin
set user=1000
set cpu=1000
set nuke=1
set airstrike=2
set missiles=3
set cpunuke=1
set cpuairstrike=2
set cpumissiles=3
:gameplay
cls
set move=
set choice=
set cpucount=0
echo.
echo %name%, your turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %nuke%
echo.
echo 2. Fire Airstrike x %airstrike%
echo.
echo 3. Fire Missiles x %missiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
set /p move=Select your option:
if '%move%'=='1' goto nuke
if '%move%'=='2' goto airstrike
if '%move%'=='3' goto missiles
if '%move%'=='4' goto surrender
if '%move%'=='5' goto cpu1
goto gameplay
:nuke
cls
if '%nuke%'=='0' goto nonuke
echo.
echo %name% has fired a NUKE headed towards the %enemy%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %enemy% has lost 400 DEF!
echo.
pause
set /a cpu=%cpu% - 400
set nuke=0
if '%cpu%'=='0' goto win
if '%cpu%'=='-100' goto win
if '%cpu%'=='-200' goto win
if '%cpu%'=='-300' goto win
goto cpu1
:nonuke
echo.
echo You can't use a nuke since you don't have any more left!
echo.
pause
goto gameplay
:airstrike
cls
if '%airstrike%'=='0' goto noairstrike
echo.
echo %name% has fired an airstrike on the %enemy%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %enemy% has lost 300 DEF!
echo.
pause
set /a cpu=%cpu% - 300
set /a airstrike=%airstrike% - 1
if '%cpu%'=='0' goto win
if '%cpu%'=='-100' goto win
if '%cpu%'=='-200' goto win
if '%cpu%'=='-300' goto win
goto cpu1
:noairstrike
echo.
echo You can't use an airstrike since you don't have any more left!
echo.
pause
goto gameplay
:missiles
cls
if '%missiles%'=='0' goto nomissiles
echo.
echo %name% has fired multiple missiles headed towards the %enemy%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %enemy% has lost 200 DEF!
echo.
pause
set /a cpu=%cpu% - 200
set /a missiles=%missiles% - 1
if '%cpu%'=='0' goto win
if '%cpu%'=='-100' goto win
if '%cpu%'=='-200' goto win
if '%cpu%'=='-300' goto win
goto cpu1
:nomissiles
echo.
echo You can't use missiles since you don't have any more left!
echo.
pause
goto gameplay
:surrender
cls
echo.
echo "We may have lost the war, but we still have our dignity..."
echo.
pause
:end
cls
echo.
echo "We may have lost the war, but we still have our dignity..."
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto end
goto players
:win
cls
echo.
echo You have won Total War!!!
echo.
pause
:win2
cls
echo.
echo You have won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto win2
goto players
:cpu1
cls
set /a cpucount=%cpucount% + 1
if '%cpucount%'=='10' goto cpu2
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:/
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
cls
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:-
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
cls
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:\
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
ping localhost -n 1 >nul
goto cpu1
:cpu2
cls
set /a choice=%random% %%6
if '%choice%'=='0' goto cpu2
if '%choice%'=='4' goto cpu2
if '%choice%'=='6' goto cpu2
echo.
echo My turn.
echo                                                               %country%: %user% DEF
echo Options:
echo                                                               %enemy%: %cpu% DEF
echo 1. Fire NUKE x %cpunuke%
echo.
echo 2. Fire Airstrike x %cpuairstrike%
echo.
echo 3. Fire Missiles x %cpumissiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
echo Select your option:%choice%
ping localhost -n 4 >nul
if '%choice%'=='1' goto cpunuke
if '%choice%'=='2' goto cpuairstrike
if '%choice%'=='3' goto cpumissiles
if '%choice%'=='5' goto gameplay
:cpunuke
cls
if '%cpunuke%'=='0' goto nocpunuke
echo.
echo I have fired a NUKE headed towards the %country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %country% has lost 400 DEF!
echo.
ping localhost -n 4 >nul
set /a user=%user% - 400
set cpunuke=0
if '%user%'=='0' goto cpuwin
if '%user%'=='-100' goto cpuwin
if '%user%'=='-200' goto cpuwin
if '%user%'=='-300' goto cpuwin
goto gameplay
:nocpunuke
echo.
echo I can't use a nuke since I don't have any more left!
echo.
ping localhost -n 4 >nul
set cpucount=0
goto cpu1
:cpuairstrike
cls
if '%cpuairstrike%'=='0' goto nocpuairstrike
echo.
echo I have fired an airstrike on the %country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %country% has lost 300 DEF!
echo.
ping localhost -n 4 >nul
set /a user=%user% - 300
set /a cpuairstrike=%cpuairstrike% - 1
if '%user%'=='0' goto cpuwin
if '%user%'=='-100' goto cpuwin
if '%user%'=='-200' goto cpuwin
if '%user%'=='-300' goto cpuwin
goto gameplay
:nocpuairstrike
echo.
echo I can't use an airstrike since I don't have any more left!
echo.
ping localhost -n 4 >nul
set cpucount=0
goto cpu1
:cpumissiles
cls
if '%cpumissiles%'=='0' goto nocpumissiles
echo.
echo I have fired multiple missiles headed towards the %country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %country% has lost 200 DEF!
echo.
ping localhost -n 4 >nul
set /a user=%user% - 200
set /a cpumissiles=%cpumissiles% - 1
if '%user%'=='0' goto cpuwin
if '%user%'=='-100' goto cpuwin
if '%user%'=='-200' goto cpuwin
if '%user%'=='-300' goto cpuwin
goto gameplay
:nocpumissiles
echo.
echo I can't use missiles since I don't have any more left!
echo.
ping localhost -n 4 >nul
set cpucount=0
goto cpu1
:cpuwin
cls
echo.
echo It was a long battle today. I have emerged victorious, even though you tried
echo very well.
echo.
pause
:cpuwin2
cls
echo.
echo It was a long battle today. I have emerged victorious, even though you tried
echo very well.
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto cpuwin2
goto players
:p1name
cls
set p1name=
echo.
set /p p1name=Player 1, please type in your name (One word):
if '%p1name%'=='' goto p1name
:p2name
cls
set p2name=
echo.
set /p p2name=Player 2, please type in your name (One word):
if '%p2name%'=='%p1name%' goto p2name
if '%p2name%'=='' goto p2name
rem Easter Egg:
if '%p1name%'=='Vincent' goto p1win
if '%p2name%'=='Vincent' goto p2win
:p1country
cls
set p1country=
echo.
echo Welcome %p1name%!
echo.
set /p p1country=Choose your country; USA, Russia, or Canada:
if '%p1country%'=='usa' goto p1country1
if '%p1country%'=='USA' goto p1country1
if '%p1country%'=='Usa' goto p1country1
if '%p1country%'=='Russia' goto p1country2
if '%p1country%'=='russia' goto p1country2
if '%p1country%'=='canada' goto p1country3
if '%p1country%'=='Canada' goto p1country3
goto p1country
:p1country1
set p1country=USA
goto p2country
:p1country2
set p1country=Russia
goto p2country
:p1country3
set p1country=Canada
:p2country
cls
set p2country=
echo.
echo Welcome %p2name%!
echo.
set /p p2country=Choose your country; USA, Russia, or Canada:
if '%p2country%'=='%p1country%' goto na
if '%p2country%'=='usa' goto p2country1
if '%p2country%'=='USA' goto p2country1
if '%p2country%'=='Usa' goto p2country1
if '%p2country%'=='Russia' goto p2country2
if '%p2country%'=='russia' goto p2country2
if '%p2country%'=='canada' goto p2country3
if '%p2country%'=='Canada' goto p2country3
goto p2country
:na
cls
echo.
echo You can't choose %p1country% because %p1name% has already chosen it.
pause >nul
goto p2country
:p2country1
set p2country=USA
goto begin2
:p2country2
set p2country=Russia
goto begin2
:p2country3
set p2country=Canada
:begin2
set p1health=1000
set p2health=1000
set p1nuke=1
set p1airstrike=2
set p1missiles=3
set p2nuke=1
set p2airstrike=2
set p2missiles=3
:p1gameplay
cls
set move=
set choice=
echo.
echo %p1name%, your turn.
echo                                                               %p1country%: %p1health% DEF
echo Options:
echo                                                               %p2country%: %p2health% DEF
echo 1. Fire NUKE x %p1nuke%
echo.
echo 2. Fire Airstrike x %p1airstrike%
echo.
echo 3. Fire Missiles x %p1missiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
set /p move=Select your option:
if '%move%'=='1' goto p1nuke
if '%move%'=='2' goto p1airstrike
if '%move%'=='3' goto p1missiles
if '%move%'=='4' goto p1surrender
if '%move%'=='5' goto p2gameplay
goto p1gameplay
:p1nuke
cls
if '%p1nuke%'=='0' goto nop1nuke
echo.
echo %p1name% has fired a NUKE headed towards %p2country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p2country% has lost 400 DEF!
echo.
pause
set /a p2health=%p2health% - 400
set p1nuke=0
if '%p2health%'=='0' goto p1win
if '%p2health%'=='-100' goto p1win
if '%p2health%'=='-200' goto p1win
if '%p2health%'=='-300' goto p1win
goto p2gameplay
:nop1nuke
echo.
echo You can't use a nuke since you don't have any more left!
echo.
pause
goto p1gameplay
:p1airstrike
cls
if '%p1airstrike%'=='0' goto nop1airstrike
echo.
echo %p1name% has fired an airstrike on %p2country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p2country% has lost 300 DEF!
echo.
pause
set /a p2health=%p2health% - 300
set /a p1airstrike=%p1airstrike% - 1
if '%p2health%'=='0' goto p1win
if '%p2health%'=='-100' goto p1win
if '%p2health%'=='-200' goto p1win
if '%p2health%'=='-300' goto p1win
goto p2gameplay
:nop1airstrike
echo.
echo You can't use an airstrike since you don't have any more left!
echo.
pause
goto p1gameplay
:p1missiles
cls
if '%p1missiles%'=='0' goto nop1missiles
echo.
echo %p1name% has fired multiple missiles headed towards %p2country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p2country% has lost 200 DEF!
echo.
pause
set /a p2health=%p2health% - 200
set /a p1missiles=%p1missiles% - 1
if '%p2health%'=='0' goto p1win
if '%p2health%'=='-100' goto p1win
if '%p2health%'=='-200' goto p1win
if '%p2health%'=='-300' goto p1win
goto p2gameplay
:nop1missiles
echo.
echo You can't use missiles since you don't have any more left!
echo.
pause
goto p1gameplay
:p1surrender
cls
echo.
echo %p2name% has won Total War!!!
echo.
pause
:p1surrender2
cls
echo.
echo %p2name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p1surrender2
goto players
:p1win
cls
echo.
echo %p1name% has won Total War!!!
echo.
pause
:p1win2
cls
echo.
echo %p1name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p1win2
goto players
:p2gameplay
cls
set move=
set choice=
echo.
echo %p2name%, your turn.
echo                                                               %p2country%: %p2health% DEF
echo Options:
echo                                                               %p1country%: %p1health% DEF
echo 1. Fire NUKE x %p2nuke%
echo.
echo 2. Fire Airstrike x %p2airstrike%
echo.
echo 3. Fire Missiles x %p2missiles%
echo.
echo 4. Surrender
echo.
echo 5. Do nothing
echo.
set /p move=Select your option:
if '%move%'=='1' goto p2nuke
if '%move%'=='2' goto p2airstrike
if '%move%'=='3' goto p2missiles
if '%move%'=='4' goto p2surrender
if '%move%'=='5' goto p1gameplay
goto p2gameplay
:p2nuke
cls
if '%p2nuke%'=='0' goto nop2nuke
echo.
echo %p2name% has fired a NUKE headed towards %p1country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p1country% has lost 400 DEF!
echo.
pause
set /a p1health=%p1health% - 400
set p2nuke=0
if '%p1health%'=='0' goto p2win
if '%p1health%'=='-100' goto p2win
if '%p1health%'=='-200' goto p2win
if '%p1health%'=='-300' goto p2win
goto p1gameplay
:nop2nuke
echo.
echo You can't use a nuke since you don't have any more left!
echo.
pause
goto p2gameplay
:p2airstrike
cls
if '%p2airstrike%'=='0' goto nop2airstrike
echo.
echo %p2name% has fired an airstrike on %p1country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p1country% has lost 300 DEF!
echo.
pause
set /a p1health=%p1health% - 300
set /a p2airstrike=%p2airstrike% - 1
if '%p1health%'=='0' goto p2win
if '%p1health%'=='-100' goto p2win
if '%p1health%'=='-200' goto p2win
if '%p1health%'=='-300' goto p2win
goto p1gameplay
:nop2airstrike
echo.
echo You can't use an airstrike since you don't have any more left!
echo.
pause
goto p2gameplay
:p2missiles
cls
if '%p2missiles%'=='0' goto nop2missiles
echo.
echo %p2name% has fired multiple missiles headed towards %p1country%!
echo.
ping localhost -n 4 >nul
echo Hit!
echo.
echo %p1country% has lost 200 DEF!
echo.
pause
set /a p1health=%p1health% - 200
set /a p2missiles=%p2missiles% - 1
if '%p1health%'=='0' goto p2win
if '%p1health%'=='-100' goto p2win
if '%p1health%'=='-200' goto p2win
if '%p1health%'=='-300' goto p2win
goto p1gameplay
:nop2missiles
echo.
echo You can't use missiles since you don't have any more left!
echo.
pause
goto p2gameplay
:p2surrender
cls
echo.
echo %p1name% has won Total War!!!
echo.
pause
:p2surrender2
cls
echo.
echo %p1name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p2surrender2
goto players
:p2win
cls
echo.
echo %p2name% has won Total War!!!
echo.
pause
:p2win2
cls
echo.
echo %p2name% has won Total War!!!
echo.
set /p replay=Type anything to replay the game. Type 'x' to exit:
if '%replay%'=='x' goto suggest
if '%replay%'=='' goto p2win2
goto players
:suggest
cls
echo.
echo Before you leave, can you suggest a country I can add to the file?
echo.
set /p suggestion=Suggest a country here:
if '%suggestion%'=='' goto suggest
echo %suggestion% >> suggestions.txt
goto menu


:calc
title Calculator
color 0a
echo Welcome to The Basic Arithmetic Calculator
echo Made By Jason Haude
ping localhost -n 3 >nul

:LOADING
cls
echo Loading.
ping localhost -n 2 >nul
cls
echo Loading..
ping localhost -n 2 >nul
cls
echo Loading...
ping localhost -n 2 >nul
cls
echo Loading....
ping localhost -n 2 >nul
cls
echo Loading.....
ping localhost -n 2 >nul
ping localhost -n 2 >nul
color 0a
goto STARTp

:STARTp
cls
echo What Type of Math would you like to do?
echo Add, Subtract, Multiply, or Divide. Or go to menu.
set /p math=
IF '%math%' == 'Add' GOTO ADD
IF '%math%' == 'add' GOTO ADD
IF '%math%' == 'Subtract' GOTO SUB
IF '%math%' == 'subtract' GOTO SUB
IF '%math%' == 'Multiply' GOTO MULTIPLY
IF '%math%' == 'multiply' GOTO MULTIPLY
IF '%math%' == 'Divide' GOTO DIVIDE
IF '%math%' == 'divide' GOTO DIVIDE
IF '%math%' == 'menu' GOTO menu
IF '%math%' == 'Menu' GOTO menu
IF '%math%' == 'MENU' GOTO menu
Exit

:ADD
Cls
GOTO NUMBERSADD
pause
exit

:SUB
Cls
GOTO NUMBERSSUB
pause
exit

:MULTIPLY
Cls
GOTO NUMBERSMULTIPLY
pause
exit

:DIVIDE
Cls
GOTO NUMBERSDIVIDE
pause
exit

:NUMBERSADD
echo What is the First Number you would like to Add?
set /p number1=
cls
echo What is the Second Number you would like to Add?
set /p number2=
cls

GOTO ADD2
exit

:NUMBERSSUB
echo What is the First Number you would like to Subtract?
set /p number1=
cls
echo What is the Second Number you would like to Subtract?
set /p number2=
cls
GOTO SUB2
exit

:NUMBERSMULTIPLY
echo What is the First Number you would like to Multiply?
set /p number1=
cls
echo What is the Second Number you would like to Multiply?
set /p number2=
cls
GOTO MULTIPLY2
exit

:NUMBERSDIVIDE
echo What is the First Number you would like to Divide?
set /p number1=
cls
echo What is the Second Number you would like to Divide?
set /p number2=
cls
GOTO DIVIDE2
exit

:ADD2
Set /A result = %number1% + %number2%
echo The answer is %result%.
Pause
GOTO STARTp
exit

:SUB2
Set /A result = %number1% - %number2%
echo The answer is %result%.
pause
GOTO STARTp
exit

:MULTIPLY2
Set /A result = %number1% * %number2%
echo The answer is %result%.
pause
GOTO STARTp
exit

:DIVIDE2
Set /A result = %number1% / %number2%
echo The answer is %result%.
pause
GOTO STARTp
exit

:tetris
@title Tetris v 1
@mode con cols=28 lines=24

:: Batch Game - Tetris v 1
:: Proof Of Concept
:: Coded by Jason Haude
:: Jason Haude, 2018

Choice /N /T:Y,1 >Nul 2>&1
If "%Errorlevel%"=="9009" (Echo. CHOICE command not found&Pause&Exit)

Set "Game=%0"

Call :Logo

:menado
Cls
Echo.
Echo.
Echo. Tetris v 1 by Jason Haude
Echo. �������������������������
Echo. ��Ŀ ������������Ŀ
Echo. �1.� �Play TETRIS �
Echo. ���� ��������������
Echo. ��Ŀ ������������Ŀ
Echo. �2.� �How to Play �
Echo. ���� ��������������
Echo. ��Ŀ ������������Ŀ
Echo. �3.� �Exit Game   �
Echo. ���� ��������������
Echo.
CHOICE /C:123 /N >nul
If "%errorlevel%"=="1" (Goto :Load)
If "%errorlevel%"=="2" (Goto :Help)
If "%errorlevel%"=="3" (Goto :End)
Goto :Menu

:Load
Setlocal enabledelayedexpansion
Set /a "LimX=18","LimY=16","TBound=1","LBound=0","Turn=1","Points=0"
Set /a "RBound=%LimX%","BBound=%LimY%"

:Init
For /l %%a in (0,1,%LimX%) do (
For /l %%b in (0,1,%LimY%) do (
Set "X%%aY%%b= "))
Set "Bound=�"
Set "Bound2=�"

:Main
Set /a "L=(%Random% %% 7)+1"
Call :Figure%L%
Call :Graphic
Goto :Main

:Graphic
If "%New_F%"=="True" (
Call :Solid
Set "New_F=False"
Goto :Eof
)
Call :Clear
Cls
Echo.
Echo.  Tetris v 1 by Jason Haude
Echo.
Echo.   Points:%Points%
Echo.   �������������������ͻ
For /l %%f in (0,1,%LimY%) do (Echo.   �!Lin_%%f!�)
Echo.   �������������������ͼ
Call :Move
Goto :Graphic

:Move
:: Normal CHOICE (provided into ZIP package)
CHOICE /C:SADRXC /N >nul
:: Windows 7 or x64 system CHOICE (uncomment)
REM CHOICE /C SADRXC /N 
If "%errorlevel%"=="1" (Call :Down)
If "%errorlevel%"=="2" (Call :Left)
If "%errorlevel%"=="3" (Call :Rigth)
If "%errorlevel%"=="4" (Call :Rotate)
If "%errorlevel%"=="5" (Goto :Menu)
If "%errorlevel%"=="6" (Call :MovCR)
::Descomentar para doble movimiento
REM Call :Down
Call :CheckL2
Goto :Eof

::::::::::::::::::::::::::::::::::::::::
:Solid
For %%a in (%Table%) do (Set "%%a=%Bound2%")
Goto :Eof

:Rotate
Set "TmpTB="
If "%XToken%"=="11" (Set "XToken=10")
If "%YToken%"=="15" (Set "XToken=14")
Set /a "NextRotate=(%RotateLevel% %% 4)+1"
Set "TmpTable=!Figure%CurFig%_Pos%NextRotate%!
For %%R in (%TmpTable%) do (
Call :MovR "%YToken%" "%XToken%" "%%R" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
For %%a in (%Table%) do (Set "%%a= ")
Set "Table=%TmpTB:~1%"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "RotateLevel+=1"
Goto :Eof

:MovR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~3") do (
Set /a MovY=%%q+%~1
Set /a MovX=%%p+%~2
Set "%~4=X!MovX!Y!MovY!"
Set "%~3= ")
Goto :Eof

:::::::::::::::::::::::::::::::::::::::::::
:Down
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|Find "Y%BBound%">nul
If !Errorlevel! EQU 0 (Set "New_F=True"&Goto :Eof)
Call :MovYR "1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
Set "New_F=True"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "YToken+=1"
Goto :Eof

:MovYR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~2") do (
Set /a MovY=%%q+%~1
Set "%~3=X%%pY!MovY!"
Set "%~2= ")
Goto :Eof

:MovCR
Cls
Echo.
Echo.
Call :L2 "Goto :Eof"
Echo.
For /f "tokens=2 skip=3" %%c in ('find "::_0" %Game%') do (
Set "Tmp_Var=%%c"
Call :Key.A Tmp_Var
Echo. !Tmp_Var!
)
Pause >nul
Goto :Eof
::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::
:Rigth
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|Find "X%RBound%">nul
If !Errorlevel! EQU 0 (Goto :Eof)
Call :MovXR "+1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "XToken+=1"
Goto :Eof

:Left
Set "TmpTB="
Set "TmpTable=%Table%"
For %%a in (%TmpTable%) do (
Echo.!TmpTable!|Find "X%LBound%">nul
If !Errorlevel! EQU 0 (Goto :Eof)
Call :MovXR "-1" "%%a" "Val"
Call Set "TmpTB=!TmpTB!,!Val!"
)
For %%c in (%TmpTB:~1%) do (
If "!%%c!"=="%Bound2%" (
For %%b in (%Table%) do (Set "%%b=%Bound%")
Goto :Eof
))
Set "Table=%TmpTB:~1%"
For %%d in (%Table%) do (Set "%%d=%Bound%")
Set /a "XToken-=1"
Goto :Eof

:MovXR
For /f "tokens=1,2 delims=X,Y" %%p in ("%~2") do (
Set /a MovX=%%p%~1
Set "%~3=X!MovX!Y%%q"
Set "%~2= ")
Goto :Eof

::::::::::::::::::::::::::::::::::::::::

:CheckL2
If "!Lin_1!"=="�������������������" (Goto :Lost)
If "!Lin_%LimY%!"=="�������������������" (
Call :Clear
For /l %%x in (0,1,%LimX%) do (
For /l %%y in (%LimY%,-1,1) do (
Set /a "UpLine=%%y-1"
Call Set "X%%xY%%y=%%X%%xY!UpLine!%%"
))
Set /a "Points+=100"
For /l %%d in (0,1,%LimX%) do (Set "X%%dY0= ")
Goto :CheckL2
)
Goto :Eof

:::::::::::::::::::::::::::::::::::::::::

:Key.A
If not defined %1 Goto:Eof
Set "c="
Set "d=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz =/\()[]{}_-.:,;* @#"
:Key.B
Set "chr=!%1:~,1!"
For /l %%l in (0 1 80) do if "!chr!" equ "!d:~%%l,1!" (
  set /a "x=%%l^5"
  call set "c=!c!%%d:~!x!,1%%"
)
Set "%1=!%1:~1!"
If defined %1 goto:Key.B
Set "%1=!c!"
Goto :Eof
:::::::::::::::::::::::::::::::::::::::::

:Clear
For /l %%m in (0,1,%LimY%) do (Set Lin_%%m=)
For /l %%d in (0,1,%LimY%) do (
For /l %%e in (0,1,%LimX%) do (
Set Lin_%%d=!Lin_%%d!!X%%eY%%d!))
Goto :Eof

:Lost
Cls
Echo.
Echo.  Tetris v 1 by Jason Haude
Echo.
Echo.     Points:%Points%
Echo.        Perdiste !
Goto :End

:Win
Cls
Echo.
Echo.  Tetris v 1 by Jason Haude
Echo.
Echo.     Points:%Points%
Echo.      Has Ganado !
Goto :End

:End
Echo.     Gracias por Jugar 
Echo.  Tetris v1 by Jason Haude
Endlocal
Ping -n 3 localhost >nul
goto menu

::::::::::::::::::::::::::::::::::::::::::
:Figure1
Set Figure1_Pos1=X6Y2,X6Y1,X7Y1,X7Y0
Set Figure1_Pos2=X7Y1,X8Y1,X6Y0,X7Y0
Set Figure1_Pos3=X6Y2,X6Y1,X7Y1,X7Y0
Set Figure1_Pos4=X7Y1,X8Y1,X6Y0,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure1_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=1","RotateLevel=%R%"
Goto :Eof

:Figure2
Set Figure2_Pos1=X7Y2,X6Y1,X7Y1,X6Y0
Set Figure2_Pos2=X6Y1,X7Y1,X7Y0,X8Y0
Set Figure2_Pos3=X7Y2,X6Y1,X7Y1,X6Y0
Set Figure2_Pos4=X6Y1,X7Y1,X7Y0,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure2_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=2","RotateLevel=%R%"
Goto :Eof

:Figure3
Set Figure3_Pos1=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos2=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos3=X7Y1,X8Y1,X7Y0,X8Y0
Set Figure3_Pos4=X7Y1,X8Y1,X7Y0,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set "Table=!Figure3_Pos%R%!"
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=3","RotateLevel=%R%"
Goto :Eof

:Figure4
Set Figure4_Pos1=X6Y1,X7Y1,X8Y1
Set Figure4_Pos2=X7Y2,X7Y1,X7Y0
Set Figure4_Pos3=X6Y1,X7Y1,X8Y1
Set Figure4_Pos4=X7Y2,X7Y1,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure4_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=4","RotateLevel=%R%"
Goto :Eof

:Figure5
Set Figure5_Pos1=X6Y1,X7Y1,X8Y1,X7Y0
Set Figure5_Pos2=X7Y2,X7Y1,X8Y1,X7Y0
Set Figure5_Pos3=X7Y1,X6Y0,X7Y0,X8Y0
Set Figure5_Pos4=X8Y2,X7Y1,X8Y1,X8Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure5_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=5","RotateLevel=%R%"
Goto :Eof

:Figure6
Set Figure6_Pos1=X6Y1,X6Y0,X7Y0,X8Y0
Set Figure6_Pos2=X8Y2,X8Y1,X8Y0,X7Y0
Set Figure6_Pos3=X6Y1,X7Y1,X8Y1,X8Y0
Set Figure6_Pos4=X6Y2,X7Y2,X6Y1,X6Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure6_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=6","RotateLevel=%R%"
Goto :Eof

:Figure7
Set Figure7_Pos1=X8Y1,X6Y0,X7Y0,X8Y0
Set Figure7_Pos2=X7Y2,X8Y2,X8Y1,X8Y0
Set Figure7_Pos3=X6Y1,X7Y1,X8Y1,X6Y0
Set Figure7_Pos4=X6Y2,X6Y1,X6Y0,X7Y0
Set /a "R=(%Random% %% 4)+1"
Set Table=!Figure7_Pos%R%!
For %%b in (%Table%) do (Set "%%b=%Bound%")
Set /a "XToken=0","YToken=0","CurFig=7","RotateLevel=%R%"
Goto :Eof

::_0 xx9tYjYxWvxPrXmoLjqfzpxx
::_0 xxxxxXhXxLBINRPFGBaxxxxxx
::_0 xxxxxxxxxxxxxxxxxxxxxxxxx
::_0 xxxxx8jYfZXojYxOtxJvxxxxx
::_0 EjXzofizgxLfmgimfjqYx9GVJ
::_0 xxxJvx8XmgfqlxNxGtyjxRxxx
::_0 xxxxxxxxxxxxxxxxxxxxxxxxx
::_0 xPrXmoLjqfzpx9tms-x7545xxx

:Help
Cls
Echo.
Call :L2 "Goto :Eof"
Echo.
Echo. How to Play Batch Tetris ?
Echo.
Echo. Use keys A,S,D,R,X
Echo.
Echo. A = Move Shape Left
Echo. S = Move Shape Down
Echo. D = Move Shape Rigth
Echo. R = Rotate Shape
Echo. X = Back to Menu Game
Echo.
Echo. 
Pause >nul
Goto :Menu

:Logo
Cls
Color 0b
Echo.
Echo. ��������������������������
Echo. ��������������������������
:L2
Echo. ����۰��۰��۰�۰�۰��۰��
Echo. ���۰�۰���۰�۰۰۰۰����
Echo. ���۰���۰�۰��۰�۰�۰���
Echo. ���۰�۰���۰�۰۰۰��۰��
Echo. ���۰���۰�۰�۰۰۰�۰���
%~1
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. ��������������������������
Echo. �����: Jason Haude :������
Echo. �����  Time.  2018  ������
Echo. ��������������������������
Ping -n 3 0.0.0.0 >nul
Goto :Eof

:trail
Title The Batch Remakes: The Oregon Trail
echo ----------------------------
echo Welcome to The Oregon Trail!
echo ----------------------------
pause
cls
echo -------------------------------------------
echo What is the first name of the wagon leader?
echo -------------------------------------------
set/p name=
echo.
echo Welcome to the trail, %name%
pause
cls
echo -----------------------------------------------------------
echo there are 3 others who decided to come along, who are they?
echo -----------------------------------------------------------
pause
set /p name2=
echo.
echo hi, %name2%
pause
set /p name3=
echo.
echo hi, %name3%
pause
set /p name4=
echo.
echo hi, %name4%
pause
cls
echo -----------------------------------------------------------------------------------
echo Ok, %name%, %name2%, %name3%, and %name4%, you are ready to start your adventure...
echo -----------------------------------------------------------------------------------
pause
goto harp

:harp
echo ----------------------------------------------
echo Many kinds of people made the trip to Oregon..
echo ----------------------------------------------
pause
cls
echo ---------------------------------------------------------------------------------------------------------------------
echo You may: 1.Be a banker from Boston 2.Be a carpenter from Ohio 3.Be a Farmer from Illinois 4. The Best (in my opinion)
echo ---------------------------------------------------------------------------------------------------------------------
echo What is your choice?
echo --------------------

set /p input=
if %input% == 1 goto glorp
if %input% == 2 goto glorp
if %input% == 3 goto glorp
if %input% == 4 goto norp
 
:glorp
echo It is 1848. You're jumping off
echo place for Oregon is Independance,
echo Missouri. You must decide which
echo month to leave Independence.
echo.
echo ----------------------------------------------------
echo 1.March 2.April 3.May 4.June 5.July 6.Ask for Advice
echo ----------------------------------------------------

set /p input=
if %input% == 1 goto heg
if %input% == 2 goto meg
if %input% == 3 goto leg
if %input% == 4 goto carmalita
if %input% == 5 goto height
if %input% == 6 goto chow

:heg
echo You have left in March
pause
goto meta

:meg
echo You have left in April
pause
goto meta

:leg
echo You have left in May
pause
goto meta

:carmalita
echo You have left in June
pause
goto meta

:height
echo You have left in July
pause
goto meta

:chow
echo The townsfolk say go in April
pause
goto glorp

:meta
echo In order to begin your adventure, here's $2,000.00.
echo -------------------------------------------------
pause
cls
echo -------------------------------------------------
echo Go to Matt's General Store before you leave town.
echo -------------------------------------------------
pause
cls
goto matt

:matt
Title Matt's General Store, Independence Misourri
echo ------------------------------------------------------------------------
echo Matt: Welcome! I here you're goin' to Oregon! I can get yah these items.
echo ------------------------------------------------------------------------
pause 
goto items

:items
echo 1. A team of oxen to pull your wagon,
echo -------------------------------------
echo 2. Clothing for both summer and winter,
echo ---------------------------------------
echo 3. Plenty of food for your trip,
echo --------------------------------
echo 4. Ammunition for your rifles,
echo ------------------------------
echo 5. And spare parts for your wagon. 
echo ----------------------------------   

set /p input=
if %input% == 1 goto oxen
if %input% == 2 goto clothes
if %input% == 3 goto food
if %input% == 4 goto bullets
if %input% == 5 goto parts

:oxen
cls
echo There are 2 oxen in a yoke;
echo I recommend at least 3 yoke.
echo I charge 40 a yoke
echo.
echo How many yoke do you want?

set /p input=
if %input% == 3 goto h
if %input% == 6 goto h

:h
echo that'll serve yah well.
echo you need clothes next
pause
goto items

:food
cls
echo I recommend you take at
echo Least 200 pounds of food
echo for each person in your
echo family. I see that you have 
echo 4 people in all. You'll need
echo flour, sugar, bacon, and
echo coffee. My price is 20
echo cents a pound.
echo.
echo How many pound of food do
echo you want?

set /p input=
if %input% == 100 goto g
if %input% == 150 goto g

:g
echo That'll be enough food for about 8 months, your entire journey
echo when you get there, there will be food, I reckon.
echo next you need bullets.
pause
goto items

:clothes
cls
echo You'll need warm clothing in
echo the mountains. I recommend
echo taking at least 2 sets of
echo clothes per person. Each
echo set is $10.00
echo.
echo How many sets of clothes do you want?

set /p input=
if %input% == 8 goto good

:good
echo you should be suited fine with these...
echo go to food...
pause
goto items

:bullets
cls
echo I sell ammunition in boxes
echo of 20 bullets. each box 
echo costs $2.00
echo.
echo How many boxes do
echo you want?

set /p input=
if %input% == 40 goto v
if %input% == 60 goto v

:v
echo You should have a lot of ammo.
pause
echo Finally, go to extra parts in case your wagon breaks down.
goto items

:parts
cls
echo It's a good idea to have a
echo few spare parts for your
echo wagon. Here are the prices:
echo.
echo Wagon wheel: $10 each
echo Wagon axle: $10 each
echo Wagon tongue: $10 each
echo.
echo how many wagon wheels?

set /p input=
if %input% == 3 goto next

:next
echo How many wagon axles?

set /p input=
if %input% ==3 goto next2

:next2
echo And finally, how many wagon tongues?

set /p input=
if %input% == 3 goto next3

:next3
echo Well then, you're ready
echo to start. Good luck!
echo You have a long and
echo difficult journey ahead 
echo of you
pause
goto loader

:loader
echo Loading the wagon.
ping Localhost -n 2 >nul
cls
loading the wagon...
ping Localhost -n 2 >nul
cls
echo COMPLETE!
pause
echo Independence
echo March 1, 1848 
pause
goto bodo

:bodo
Title Independence March 1, 1848
echo Weather: cold
echo Health: good
echo Pace: steady
echo Rations: filling
echo.
echo You may:
echo.
echo 1.Continue on trail
echo 2.Check Supplies
echo 3.Look at map
echo 4.Change pace
echo 5.Change food rations
echo 6.Stop to rest
echo 7.Attempt to trade
echo 8.Talk to people
echo 9.Buy supplies
echo.
echo What is your choice?

set /p input=
if %input% == 1 goto 1
if %input% == 2 goto 2
if %input% == 3 goto 3
if %input% == 4 goto 4
if %input% == 5 goto 5
if %input% == 6 goto 6
if %input% == 7 goto 7
if %input% == 8 goto 8
if %input% == 9 goto 9

:1    
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
pause
echo your wheel has broken down, would you like to fix it?
pause
echo it has been fixed
pause
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo We will cross the river.
pause
goto cross

:cross
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls 
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo Would you like to hunt?
echo Y/N

set /p input=
if %input% == Y goto Huntthem
if %input% == N goto nothunt

:Huntthem
echo Hunting...
pause
echo Hunting..
pause
echo Hunting.
pause
echo You got 40 pounds of meat!!
pause
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls 
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo We are doing well...
pause
echo 7 months later...
Title Willamette, Oregon August 1, 1848
echo Willamette, Oregon, August 1, 1848
pause
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------   
echo     =  ==      == 
ping Localhost -n 2 >nul
cls
echo  =
echo --       -----
echo --    ----    ---
echo ---------       -
echo -   -  ----------
echo =      ==      ==      
echo Finally, Oregon!!!
pause
echo Thanks for playing My version of Oregon Trail. sorry to cut it short...
pause
goto menu



:2
echo You have all of your items.
pause
goto bodo

:3
echo ----------------------------------------
echo - Finish                          echo -
echo -                                 echo -
echo -                                 echo -
echo -                                 echo -
echo -                                 echo -                                 
echo -                                 echo -
echo -                                 echo -
echo -                                 echo -
echo -             you are here ---- | echo -
echo ----------------------------------------

:4
echo changing pace
pause
echo pace upped by 5%
pause
goto bodo

:5
echo rationed for now
pause
goto bodo

:6
echo Ok..
echo 1 Hour later...
pause
goto bodo

:7
echo Local:
echo So you'd like to trade, eh?
echo Trading.
pause
echo Trading..
pause
echo Trading...
pause
echo traded
pause
goto bodo

:8
echo HI, I am winston.
pause
echo so i here you're going to Oregon,
echo I like you..
pause
echo im coming with you
echo (Winston has joined your team)
pause
goto bodo

:9
echo What would you like to trade for
1.meat
2.clothing
3.bullets

set /p input=
if %input% == 1 goto meat
if %input% == 2 goto cloth
if %input% == 3 goto ammo

:meat
echo Trading.
pause
echo Trading..
pause
echo Trading...
pause
echo traded
pause
goto bodo

:cloth
echo Trading.
pause
echo Trading..
pause
echo Trading...
pause
echo traded
pause
goto bodo

:ammo
echo Trading.
pause
echo Trading..
pause
echo Trading...
pause
echo traded
pause
goto bodo






:norp
cls
echo the best is carpenter
pause
goto harp

:exit
echo would you like to keep using Jason Jaguar OS Premium Silver Edition?
echo Yes or No?
pause

set /p input=
if %input% == Yes goto menu
if %input% == No goto quejibo

:quejibo
echo ok
pause
exit

:chess
@title Batch Chess v0.8 By kolto101
@setlocal EnableDelayedExpansion

::  By kolto101   ::
:: Creating batch games is an art ::

:: What I haven't coded but NEEDS to be added ::
REM -Stale/Checkmate System


:: What could be added ::
REM Add game log to save for later.
REM Pawn: Make sure a promoted pawn isn't used in castling.
REM Different colored pieces.
REM Autoupdating [REMarked out in current code due to site issues]
REM LAN Play?
REM Time limit


call :default


:yega
title Batch Chess v0.8 By Kolto101
if exist "tmp.txt" del tmp.txt
if exist "config.bat" call config.bat
set variant=
cls
echo.
echo      _-_ _,,           ,       ,,            ,- _~. ,,                     
echo         -/  )    _    ^|^|       ^|^|           (' /^|   ^|^|                     
echo        ~^|^|_^<    ^< \, =^|^|=  _-_ ^|^|/\\       ((  ^|^|   ^|^|/\\  _-_   _-_,  _-_,
echo         ^|^| \\   /-^|^|  ^|^|  ^|^|   ^|^| ^|^|       ((  ^|^|   ^|^| ^|^| ^|^| \\ ^|^|_.  ^|^|_. 
echo         ,/--^|^| (( ^|^|  ^|^|  ^|^|   ^|^| ^|^|        ( / ^|   ^|^| ^|^| ^|^|/    ~ ^|^|  ~ ^|^|
echo        _--_-'   \/\\  \\, \\,/ \\ ^|/         -____- \\ ^|/ \\,/  ,-_-  ,-_- 
echo       (                          _/                   _/
echo.
echo               ,....,                                        ,....,
echo             ,::::::^<                                        ^>::::::,
echo            ,::/^^\"``.                                      .``"/^^\::,
echo           ,::/, `   O`.        ����������������ͻ        .`O   ` ,\::,
echo          ,::; ^|        '.      �     -Menu-     �      .'        ^| ;::,
echo          ,::^|  \___,-.  o)     ����������������͹     (o  .-,___/  ^|::,
echo          ;::^|     \   '-'      �  1. Play       �      `-'   /     ^|::;
echo          ;::^|      \           �  2. Load Game  �           /      ^|::;
echo          ;::^|   _.=`\          �  3. Configure  �          /`=._   ^|::;
echo          `;:^|.=` _.=`\         �  4. Tutorial   �         /`=._ `=.^|:;"
echo            '^|_.=`   __\        �  5. Playback   �        /__   `=._^|'
echo             `\_..==`` /        �  6. About      �        \ ``==.._/` 
echo              .'.___.-'.        �  7. Exit       �        .'-.___.'.
echo             /          \       ����������������ͼ       /          \
echo            ('--......--')                              ('--......--')
echo            /'--......--'\                              /'--......--'\
echo            `"--......--"`                              `"--......--"`
set /p choose=^>                              Choose a number:
if "!choose!" == "1" goto play
if "!choose!" == "2" goto loadgame
if "!choose!" == "3" goto config
if "!choose!" == "4" goto tutorial
if "!choose!" == "5" goto gameplayback
if "!choose!" == "6" goto about
if "!choose!" == "7" exit
goto menu


:loadgame
cls
echo.
echo Enter the name of the game you wish to continue.
echo.
echo -b/Back
echo.
set /p name=File name:
if /i "!name!" == "-b" goto menu
if /i not exist "!name!" set name=!name!.sav
if /i not exist "!name!" (
echo.
echo File not found^^!
echo.
pause
goto loadgame
)
set scr=1
set file= 
set rank= 
set tw=White
set tb=Black
set vn=1
for %%d in (piece v_file1 v_file2 v_rank1 v_rank2) do set %%d=
for /l %%r in (1,1,8) do set r%%r=
for /l %%s in (1,1,64) do set a%%s=!bbb!
for /f "tokens=1,2 delims==" %%a in (!name!) do set %%a=%%b
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do (
if "!%%w!" == "!bbb!" set %%w=!www!
)
goto game


REM =============================== GAME ===============================

:play
cls
echo.
echo -b/Back
echo.
set /p wplayer=White's name:
if /i "!wplayer!" == "-b" goto menu
echo.
set /p bplayer=Black's name:
if /i "!bplayer!" == "-b" goto play
title Batch Chess - !wplayer! vs. !bplayer!

if exist "tmp.txt" del tmp.txt
set movec=0
set scr=1
set file= 
set rank= 
set vn=1
for %%d in (piece v_file1 v_file2 v_rank1 v_rank2) do set %%d=
set wkingpos=
set bkingpos=
set draw=
for %%r in (a1 a8 a57 a64) do set %%rrook=

if /i "!first!" == "w" (set turn=w) ELSE set turn=b
set tw=White
set tb=Black
set wpieces=16
set bpieces=16

for /l %%s in (1,1,64) do set a%%s=!bbb!
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do set %%w=!www!
for /l %%a in (1,1,8) do set f%%a=
for /l %%a in (1,1,8) do set r%%a=

for /l %%p in (9,1,16) do set bpawn%%p=orig
for /l %%p in (49,1,56) do set wpawn%%p=orig

REM White
for /l %%P in (49,1,56) do set a%%P=!wPawn!
for %%R in (a57 a64) do set %%R=!wRook!
for %%K in (a58 a63) do set %%K=!wKnight!
for %%B in (a59 a62) do set %%B=!wBishop!
set a60=!wQueen!
set a61=!wKing!
set wkinglocate=61

REM Black
for /l %%P in (9,1,16) do set a%%P=!bPawn!
for %%R in (a1 a8) do set %%R=!bRook!
for %%K in (a2 a7) do set %%K=!bKnight!
for %%B in (a3 a6) do set %%B=!bBishop!
set a4=!bQueen!
set a5=!bKing!
set bkinglocate=5

:variants
cls
echo.
echo Choose a game type:
echo.
echo 1. Normal Play
echo 2. Last Army Standing
echo 3. Knights and Pawns
echo 4. Bishops and Pawns
echo 5. Rooks and Pawns
echo.
echo b/Back
echo.
set /p choose=Choose a number:
if /i "!choose!" == "b" goto menu
if "!choose!" == "1" goto game
if "!choose!" == "2" (set variant=las) && goto game
if "!choose!" == "3" for %%k in (a1 a2 a3 a4 a6 a7 a8) do set %%k=!bKnight!
if "!choose!" == "3" for %%k in (a57 a58 a59 a60 a62 a63 a64) do set %%k=!wKnight!
if "!choose!" == "4" for %%b in (a1 a2 a3 a4 a6 a7 a8) do set %%b=!bBishop!
if "!choose!" == "4" for %%b in (a57 a58 a59 a60 a62 a63 a64) do set %%b=!wBishop!
if "!choose!" == "5" for %%r in (a1 a2 a3 a4 a6 a7 a8) do set %%r=!bRook!
if "!choose!" == "5" for %%r in (a57 a58 a59 a60 a62 a63 a64) do set %%r=!wRook!
if !choose! GEQ 1 if !choose! LEQ 5 goto game
goto variants



:game
cls
echo.
echo          !t%turn%!'s move [!%turn%player!]
echo.
call :r!scr!
echo.
echo.
echo  k/Let go   L-R/Rotate   o/Options   s/Resign
echo.
choice /c:12345678abcdefghklrso /n
REM Skip turn: if ERRORLEVEL # (if "!turn!" == "w" (set turn=b) ELSE set turn=w) && goto game
if ERRORLEVEL 21 goto options
if ERRORLEVEL 20 goto resign
REM weird bug for 18 and 19...
if "!ERRORLEVEL!"=="19" (set rotater=r) && goto rotater
if "!ERRORLEVEL!"=="18" (set rotater=l) && goto rotater
if ERRORLEVEL 17 goto drop_piece
if ERRORLEVEL 16 (set v_file!vn!=H) && (set seed=8) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 15 (set v_file!vn!=G) && (set seed=7) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 14 (set v_file!vn!=F) && (set seed=6) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 13 (set v_file!vn!=E) && (set seed=5) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 12 (set v_file!vn!=D) && (set seed=4) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 11 (set v_file!vn!=C) && (set seed=3) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 10 (set v_file!vn!=B) && (set seed=2) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 9  (set v_file!vn!=A) && (set seed=1) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 8  (set v_rank!vn!=8) && call set plus=0
if ERRORLEVEL 7  (set v_rank!vn!=7) && call set plus=8
if ERRORLEVEL 6  (set v_rank!vn!=6) && call set plus=16
if ERRORLEVEL 5  (set v_rank!vn!=5) && call set plus=24
if ERRORLEVEL 4  (set v_rank!vn!=4) && call set plus=32
if ERRORLEVEL 3  (set v_rank!vn!=3) && call set plus=40
if ERRORLEVEL 2  (set v_rank!vn!=2) && call set plus=48
if ERRORLEVEL 1  (set v_rank!vn!=1) && call set plus=56



for /l %%a in (1,1,8) do set r%%a=
set /a r=(!plus!/8)+1
set r!r!=!rank!
if not defined seed goto game
set /a getpos=!seed!+!plus!
set seed=
set plus=


if defined piece goto moveto
call set piece=%%a%getpos%%%
if "!piece!" == "!bbb!" (set piece=) && goto game
if "!piece!" == "!www!" (set piece=) && goto game

REM Check against picking up other players pieces...

if not "!piece!" == "!%turn%Pawn!" (
if not "!piece!" == "!%turn%Rook!" (
if not "!piece!" == "!%turn%Knight!" (
if not "!piece!" == "!%turn%Bishop!" (
if not "!piece!" == "!%turn%Queen!" (
if not "!piece!" == "!%turn%King!" (
echo.
echo You cannot pick up the other player's pieces^^!
echo.
set illegal=
set piece=
set v_file1=
set v_rank1=
set origpos=
set getpos=
pause
goto game
))))))
set origpos=!getpos!
set vn=2
goto game

:drop_piece
set vn=1
for %%d in (v_file1 v_file2 v_rank1 v_rank2 piece) do set %%d=
goto game

:moveto
set !turn!lastp=
if "!turn!" == "w" (set opp=b) ELSE set opp=w
if "!turn!" == "w" (set ps=-) ELSE set ps=+
if "!getpos!" == "!origpos!" goto samesquare

call set captured=%%a!getpos!%%
if /i "!piece!" == "!%turn%Pawn!" goto pawn_rules
if /i "!piece!" == "!%turn%Rook!" goto rook_rules
if /i "!piece!" == "!%turn%Knight!" goto knight_rules

if /i "!piece!" == "!%turn%Bishop!" goto bishop_rules

if /i "!piece!" == "!%turn%Queen!" goto rook_rules
if /i "!piece!" == "!%turn%King!" goto king_rules
REM Queen is a combination of rook_rules and bishop_rules

REM ========================== Check ==========================
:next
REM Anti-capture-your-own-piece
if "!captured!" == "!%turn%Pawn!" set illegal=true
if "!captured!" == "!%turn%Rook!" set illegal=true
if "!captured!" == "!%turn%Knight!" set illegal=true
if "!captured!" == "!%turn%Bishop!" set illegal=true
if "!captured!" == "!%turn%Queen!" set illegal=true
if "!captured!" == "!%turn%King!" set illegal=true
if /i "!illegal!" == "true" (
echo.
echo You cannot do that^^!
echo.
pause
:samesquare
set vn=1
call set !turn!pawn!origpos!=!prepawn!
for %%d in (illegal piece origpos getpos promo v_rank1 v_rank2 v_file1 v_file2) do set %%d=
goto game
)
set a!origpos!=!bbb!
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do (
if "!%%w!" == "!bbb!" set %%w=!www!
)
set a!getpos!=!piece!
if "!variant!" == "las" goto las

:check
REM Knight Moves
set /a v1=!%turn%kinglocate!-15
set /a v2=!%turn%kinglocate!-17
set /a v3=!%turn%kinglocate!-6
set /a v4=!%turn%kinglocate!-10
set /a v5=!%turn%kinglocate!+15
set /a v6=!%turn%kinglocate!+17
set /a v7=!%turn%kinglocate!+6
set /a v8=!%turn%kinglocate!+10
for /l %%c in (1,1,8) do (
call set m=%%a!v%%c!%%
if "!m!" == "!%opp%Knight!" set illegal=true
)
if "!illegal!" == "true" goto badmove

REM Pawn/King
if "!ps!" == "-" (set oppps=+) ELSE set opps=-
set /a v1=!%turn%kinglocate!!ps!9
set /a v2=!%turn%kinglocate!-8
set /a v3=!%turn%kinglocate!!ps!7
set /a v4=!%turn%kinglocate!-1
set /a v5=!%turn%kinglocate!+1
set /a v6=!%turn%kinglocate!!oppps!7
set /a v7=!%turn%kinglocate!+8
set /a v8=!%turn%kinglocate!!oppps!9
for /l %%v in (1,1,8) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%King!" set illegal=true
if "%%v" == "1" if "!m!" == "!%opp%Pawn!" set illegal=true
if "%%v" == "3" if "!m!" == "!%opp%Pawn!" set illegal=true
)
if "!illegal!" == "true" goto badmove

for /l %%v in (1,1,14) do set v%%v=

REM Rook/Queen
REM L and R
call :check_vals
for /l %%v in (1,1,7) do (
set /a seed-=1
set /a n-=1
if !seed! GEQ 1 set v%%v=!n!
)
call :check_vals
for /l %%v in (8,1,14) do (
set /a seed+=1
set /a n+=1
if !seed! LEQ 8 set v%%v=!n!
)
for /l %%v in (7,-1,1) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove
for /l %%v in (14,-1,8) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove

for /l %%v in (1,1,14) do set v%%v=

REM Up/Down
set n=!%turn%kinglocate!
for /l %%v in (1,1,7) do (
set /a n-=8
if !n! GEQ 1 set v%%v=!n!
)
set n=!%turn%kinglocate!
for /l %%v in (8,1,14) do (
set /a n+=8
if !n! LEQ 64 set v%%v=!n!
)
for /l %%v in (14,-1,8) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove
for /l %%v in (7,-1,1) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove
for /l %%v in (1,1,28) do set v%%v=



REM Bishop/Queen
call :check_vals
for /l %%v in (1,1,7) do (
set /a seed-=1
set /a n+=7
if !seed! GEQ 1 set v%%v=!n!
)
call :check_vals
for /l %%v in (8,1,14) do (
set /a seed+=1
set /a n-=7
if !seed! LEQ 8 set v%%v=!n!
)
call :check_vals
for /l %%v in (15,1,21) do (
set /a seed-=1
set /a n-=9
if !seed! GEQ 1 set v%%v=!n!
)
call :check_vals
for /l %%v in (22,1,28) do (
set /a seed+=1
set /a n+=9
if !seed! LEQ 8 set v%%v=!n!
)
(set n=28) && (set n2=22)
for /l %%f in (1,1,2) do (
for /l %%v in (!n!,-1,!n2!) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Bishop!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Bishop!" if not "!m!" == "!%opp%Queen!" set illegal=
)
(set n=21) && (set n2=15)
if "!illegal!" == "true" goto badmove
)
(set n=14) && (set n2=8)
for /l %%f in (1,1,2) do (
for /l %%v in (!n!,-1,!n2!) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Bishop!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Bishop!" if not "!m!" == "!%opp%Queen!" set illegal=
)
(set n=7) && (set n2=1)
if "!illegal!" == "true" goto badmove
)


:badmove
if "!illegal!" == "true" (
set a!origpos!=!piece!
set a!getpos!=!captured!
if "!piece!" == "!%turn%King!" set %turn%kinglocate=!origpos!
if "!piece!" == "!%turn%Pawn!" set %turn%pawn%origpos%=!prepawn!
set promo=
set piece=
set origpos=
set getpos=
echo.
echo Your king is either already in check, or you are attempting
echo to make a move that will put your king in check.
echo.
pause
goto game
)
if "!oppcheck!" == "t" exit /b

:las
set lastmove=Last move: [!piece!] !v_file1!!v_rank1!  �^!ar!  !v_file2!!v_rank2!
if /i not "!displastmove!" == "On " set lastmove=
echo !piece!-!origpos!-!getpos!>>tmp.txt
if "!turn!" == "!first!" set /a movec+=1

if "!turn!" == "w" (set oppt=b) ELSE set oppt=w
if not "!captured!" == "!www!" if not "!captured!" == "!bbb!" set /a !oppt!pieces-=1
if "!%oppt%pieces!" == "0" (set winner=!turn!) && goto gameover

if "!piece!" == "!%turn%King!" set !turn!kingpos=moved
if "!piece!" == "!%turn%Rook!" set a!origpos!rook=moved
if "!promo!" == "t" call :promo
set piece=
set v_file1=
set v_file2=
set v_rank1=
set v_rank2=
set vn=1
set origpos=
set getpos=
if "!turn!" == "w" (call set turn=b) ELSE call set turn=w
set rotater=r
if /i "!autorotate!" == "On " (call :rotate) && (call :rotate)
goto game


:check_vals
set /a seed=!%turn%kinglocate!%%8
if "!seed!" == "0" set seed=8
set n=!%turn%kinglocate!
exit /b

rem =================================== End of check ===================================

:pawn_rules
set prepawn=!%turn%pawn%origpos%!
set /a v1=!origpos!!ps!8
set /a v2=!origpos!!ps!7
set /a v3=!origpos!!ps!9
set /a v4=!origpos!!ps!16
if not "!getpos!" == "!v1!" (
if not "!getpos!" == "!v2!" (
if not "!getpos!" == "!v3!" (
if not "!getpos!" == "!v4!" (
set illegal=true
goto next
))))
set !turn!pawn!origpos!=moved
REM 2 Spaces
if "!getpos!" == "!v4!" (
if not "!a%v1%!" == "!bbb!" if not "!a%v1%!" == "!www!" set illegal=true
if not "!captured!" == "!bbb!" if not "!captured!" == "!www!" set illegal=true
if not "!prepawn!" == "orig" set illegal=true
if not "!illegal!" == "true" (set !turn!pawn!origpos!=2spaces) && set !turn!lastp=!getpos!
)
REM Straight
if "!getpos!" == "!v1!" if not "!captured!" == "!bbb!" if not "!captured!" == "!www!" set illegal=true
REM Right/Left
if "!getpos!" == "!v2!" goto lfpawn
if "!getpos!" == "!v3!" (
:lfpawn
if "!captured!" == "!bbb!" set illegal=true
if "!captured!" == "!www!" set illegal=true
set /a enp=!getpos!-!ps!8
REM set m=!a%enp%!
if "!a%enp%!" == "!%opp%Pawn!" if "!enp!" == "!%opp%lastp!" (
if "!captured!" == "!bbb!" (set a!enp!=!bbb!) && set illegal=
if "!captured!" == "!www!" (set a!enp!=!bbb!) && set illegal=
)
)
if "!turn!" == "w" for /l %%p in (1,1,8) do if "!getpos!" == "%%p" set promo=t
if "!turn!" == "b" for /l %%p in (57,1,64) do if "!getpos!" == "%%p" set promo=t
goto antiteleport


:rook_rules
set illegal=true
set /a seed=!origpos!%%8
if "!seed!" == "0" set seed=8
set /a seed2=!getpos!%%8
if "!seed2!" == "0" set seed2=8

set s1=-
set s2=GEQ 1
set n=!origpos!

REM Left and Right
if not "!seed!" == "!seed2!" (
if !getpos! GTR !origpos! ((set s1=+) && (set s2=LEQ 8))
for /l %%v in (1,1,7) do (
set /a seed!s1!=1
set /a n!s1!=1
if !seed! %s2% set v%%v=!n!
))

REM Up and Down
if "!seed!" == "!seed2!" (
if !getpos! GTR !origpos! ((set s1=+) && (set s2=LEQ 64))
for /l %%v in (1,1,7) do (
set /a n!s1!=8
if !n! %s2% set v%%v=!n!
))
for /l %%i in (1,1,7) do if "!getpos!" == "!v%%i!" set illegal=

if not "!piece!" == "!%turn%Queen!" if "!illegal!" == "true" goto next

REM Check against jumping over pieces...
if not "!illegal!" == "true" (
for /l %%j in (7,-1,1) do (
call set m=%%a!v%%j!%%
if not "!m!" == "!bbb!" if not "!m!" == "!www!" set illegal=true
if "!getpos!" == "!v%%j!" set illegal=
))
if "!illegal!" == "true" if "!piece!" == "!%turn%Queen!" goto bishop_rules
goto next



:knight_rules
set illegal=true
set /a v1=!origpos!-15
set /a v2=!origpos!-17
set /a v3=!origpos!-6
set /a v4=!origpos!-10
set /a v5=!origpos!+15
set /a v6=!origpos!+17
set /a v7=!origpos!+6
set /a v8=!origpos!+10
for /l %%c in (1,1,8) do if "!getpos!" == "!v%%c!" set illegal=
goto antiteleport


:bishop_rules
set illegal=true

REM Get direction...
set /a seed=!origpos!%%8
if "!seed!" == "0" set seed=8
set c=!seed!
set n=!origpos!
set /a seed2=!getpos!%%8


if "!seed2!" == "0" set seed2=8
if !getpos! GTR !origpos! set s3=+
if !getpos! LSS !origpos! set s3=-

REM echo !origpos! !getpos! !seed! !seed2!

if !seed2! GTR !seed! ((set s1=+) && (set s2=LEQ 8))
if !seed2! LSS !seed! ((set s1=-) && (set s2=GEQ 1))

set inc=7
if "!s1!" == "+" if !getpos! GTR !origpos! set inc=9
if "!s1!" == "-" if !getpos! LSS !origpos! set inc=9

REM echo !s1! !s2! !s3! -- !inc!
REM pause

REM Check for valid moves...
for /l %%v in (1,1,7) do (
set /a c!s1!=1
set /a n=!n!!s3!!inc!
REM echo !c! !s2!  -- !n!
if !c! %s2% set v%%v=!n!
)
for /l %%i in (1,1,7) do if "!getpos!" == "!v%%i!" set illegal=
if "!illegal!" == "true" goto next

REM Check against jumping over pieces...
for /l %%j in (7,-1,1) do (
call set m=%%a!v%%j!%%
if not "!m!" == "!bbb!" if not "!m!" == "!www!" set illegal=true
if "!getpos!" == "!v%%j!" set illegal=
)
goto next

REM queen_rules is a combination of rook_rules and bishop_rules

:king_rules
set illegal=true
set /a v1=!origpos!-9
set /a v2=!origpos!-8
set /a v3=!origpos!-7
set /a v4=!origpos!-1
set /a v5=!origpos!+1
set /a v6=!origpos!+7
set /a v7=!origpos!+8
set /a v8=!origpos!+9
set /a v9=!origpos!-2
set /a v10=!origpos!+2
for /l %%c in (1,1,10) do if "!getpos!" == "!v%%c!" set illegal=

if "!getpos!" == "!v9!" (
if "!%turn%kingpos!" == "moved" (set illegal=true) && goto next
set /a n=!origpos!-3
if "!turn!" == "b" if not "!a1!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "w" if not "!a57!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "b" if "!a1rook!" == "moved" set illegal=true
if "!turn!" == "w" if "!a57rook!" == "moved" set illegal=true
for /l %%r in (!origpos!,-1,!n!) do (
if not "!a%%r!" == "!bbb!" if not "!a%%r!" == "!www!" if not "!a%%r!" == "!%turn%King!" set illegal=true
)
if not "!illegal!" == "true" (
if "!turn!" == "b" (set a1= ) && set a4=!%turn%Rook!
if "!turn!" == "w" (set a57= ) && set a60=!%turn%Rook!
)
goto next
)
if "!getpos!" == "!v10!" (
if "!%turn%kingpos!" == "moved" (set illegal=true) && goto next
set /a n=!origpos!+2
if "!turn!" == "b" if not "!a8!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "w" if not "!a64!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "b" if "!a8rook!" == "moved" set illegal=true
if "!turn!" == "w" if "!a64rook!" == "moved" set illegal=true
for /l %%r in (!origpos!,1,!n!) do (
if not "!a%%r!" == "!bbb!" if not "!a%%r!" == "!www!" if not "!a%%r!" == "!%turn%King!" set illegal=true
)
if not "!illegal!" == "true" (
if "!turn!" == "b" (set a8= ) && set a6=!%turn%Rook!
if "!turn!" == "w" (set a64= ) && set a62=!%turn%Rook!
)
goto next
)


:antiteleport
set /a tele1=!origpos!%%8
if "!tele1!" == "0" set tele1=8
set /a tele2=!getpos!%%8
if "!tele2!" == "0" set tele2=8
set /a anti=!tele1!-!tele2!
if !anti! LSS 0 set /a anti*=-1
if !anti! GTR 2 set illegal=true
if not "!illegal!" == "true" if "!piece!" == "!%turn%King!" set %turn%kinglocate=!getpos!
goto next

:promo
cls
echo.
echo.
call :r!scr!
ping localhost -n 2 >nul
:promo2
cls
echo Your pawn has reached its 8th rank.
echo Promote Pawn to:
echo.
echo 1. Queen
echo 2. Knight
echo 3. Bishop
echo 4. Rook
echo.
set /p choose=Choose a number:
if /i "!choose!" == "1" ((set a!getpos!=!%turn%Queen!) && (set promo=) && exit /b)
if /i "!choose!" == "2" ((set a!getpos!=!%turn%Knight!) && (set promo=) && exit /b)
if /i "!choose!" == "3" ((set a!getpos!=!%turn%Bishop!) && (set promo=) && exit /b)
if /i "!choose!" == "4" ((set a!getpos!=!%turn%Rook!) && (set promo=) && exit /b)
goto promo2

:resign
cls
echo.
echo !%turn%player!, do you really wish to resign?
echo.
set /p choose=[y/n]:
if /i "!choose!" == "n" goto game
if /i "!choose!" == "y" (
if "!turn!" == "w" (set winner=b) ELSE set winner=w
goto gameover
)
goto resign


:rotater
REM Yes, this is necessary to counter a weird bug.
call :rotate
goto game

:rotate
for /l %%a in (1,1,8) do set r%%a=
for /l %%a in (1,1,8) do set f%%a=
if "!rotater!" == "r" set /a scr+=1
if "!rotater!" == "l" set /a scr-=1
if !scr! LSS 1 set scr=4
if !scr! GTR 4 set scr=1
if "!scr!" == "1" (set file= ) && (set rank= )
if "!scr!" == "2" (set rank= ) && (set file= )
if "!scr!" == "3" (set file= ) && (set rank= )
if "!scr!" == "4" (set rank= ) && (set file= )
exit /b

REM Up
:r1
echo          A   B   C   D   E   F   G   H
echo.         !f1!   !f2!   !f3!   !f4!   !f5!   !f6!   !f7!   !f8!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     8!r1! !ver! !a1! !ve2! !a2! !ve2! !a3! !ve2! !a4! !ve2! !a5! !ve2! !a6! !ve2! !a7! !ve2! !a8! !ver!  8   [!piece!] !v_file1!!v_rank1!  �^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     7!r2! !ver! !a9! !ve2! !a10! !ve2! !a11! !ve2! !a12! !ve2! !a13! !ve2! !a14! !ve2! !a15! !ve2! !a16! !ver!  7   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     6!r3! !ver! !a17! !ve2! !a18! !ve2! !a19! !ve2! !a20! !ve2! !a21! !ve2! !a22! !ve2! !a23! !ve2! !a24! !ver!  6
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     5!r4! !ver! !a25! !ve2! !a26! !ve2! !a27! !ve2! !a28! !ve2! !a29! !ve2! !a30! !ve2! !a31! !ve2! !a32! !ver!  5
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     4!r5! !ver! !a33! !ve2! !a34! !ve2! !a35! !ve2! !a36! !ve2! !a37! !ve2! !a38! !ve2! !a39! !ve2! !a40! !ver!  4
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     3!r6! !ver! !a41! !ve2! !a42! !ve2! !a43! !ve2! !a44! !ve2! !a45! !ve2! !a46! !ve2! !a47! !ve2! !a48! !ver!  3
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     2!r7! !ver! !a49! !ve2! !a50! !ve2! !a51! !ve2! !a52! !ve2! !a53! !ve2! !a54! !ve2! !a55! !ve2! !a56! !ver!  2
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     1!r8! !ver! !a57! !ve2! !a58! !ve2! !a59! !ve2! !a60! !ve2! !a61! !ve2! !a62! !ve2! !a63! !ve2! !a64! !ver!  1
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo. 
echo          A   B   C   D   E   F   G   H
exit /b

REM Right
:r2
echo          1   2   3   4   5   6   7   8
echo.         !r8!   !r7!   !r6!   !r5!   !r4!   !r3!   !r2!   !r1!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     A!f1! !ver! !a57! !ve2! !a49! !ve2! !a41! !ve2! !a33! !ve2! !a25! !ve2! !a17! !ve2! !a9! !ve2! !a1! !ver!  A   [!piece!] !v_file1!!v_rank1!  �^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     B!f2! !ver! !a58! !ve2! !a50! !ve2! !a42! !ve2! !a34! !ve2! !a26! !ve2! !a18! !ve2! !a10! !ve2! !a2! !ver!  B   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     C!f3! !ver! !a59! !ve2! !a51! !ve2! !a43! !ve2! !a35! !ve2! !a27! !ve2! !a19! !ve2! !a11! !ve2! !a3! !ver!  C
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     D!f4! !ver! !a60! !ve2! !a52! !ve2! !a44! !ve2! !a36! !ve2! !a28! !ve2! !a20! !ve2! !a12! !ve2! !a4! !ver!  D
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     E!f5! !ver! !a61! !ve2! !a53! !ve2! !a45! !ve2! !a37! !ve2! !a29! !ve2! !a21! !ve2! !a13! !ve2! !a5! !ver!  E
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     F!f6! !ver! !a62! !ve2! !a54! !ve2! !a46! !ve2! !a38! !ve2! !a30! !ve2! !a22! !ve2! !a14! !ve2! !a6! !ver!  F
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     G!f7! !ver! !a63! !ve2! !a55! !ve2! !a47! !ve2! !a39! !ve2! !a31! !ve2! !a23! !ve2! !a15! !ve2! !a7! !ver!  G
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     H!f8! !ver! !a64! !ve2! !a56! !ve2! !a48! !ve2! !a40! !ve2! !a32! !ve2! !a24! !ve2! !a16! !ve2! !a8! !ver!  H
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo. 
echo          1   2   3   4   5   6   7   8
exit /b


REM Down
:r3
echo          H   G   F   E   D   C   B   A
echo.         !f8!   !f7!   !f6!   !f5!   !f4!   !f3!   !f2!   !f1!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     1!r8! !ver! !a64! !ve2! !a63! !ve2! !a62! !ve2! !a61! !ve2! !a60! !ve2! !a59! !ve2! !a58! !ve2! !a57! !ver!  1   [!piece!] !v_file1!!v_rank1!  �^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     2!r7! !ver! !a56! !ve2! !a55! !ve2! !a54! !ve2! !a53! !ve2! !a52! !ve2! !a51! !ve2! !a50! !ve2! !a49! !ver!  2   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     3!r6! !ver! !a48! !ve2! !a47! !ve2! !a46! !ve2! !a45! !ve2! !a44! !ve2! !a43! !ve2! !a42! !ve2! !a41! !ver!  3
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     4!r5! !ver! !a40! !ve2! !a39! !ve2! !a38! !ve2! !a37! !ve2! !a36! !ve2! !a35! !ve2! !a34! !ve2! !a33! !ver!  4
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     5!r4! !ver! !a32! !ve2! !a31! !ve2! !a30! !ve2! !a29! !ve2! !a28! !ve2! !a27! !ve2! !a26! !ve2! !a25! !ver!  5
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     6!r3! !ver! !a24! !ve2! !a23! !ve2! !a22! !ve2! !a21! !ve2! !a20! !ve2! !a19! !ve2! !a18! !ve2! !a17! !ver!  6
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     7!r2! !ver! !a16! !ve2! !a15! !ve2! !a14! !ve2! !a13! !ve2! !a12! !ve2! !a11! !ve2! !a10! !ve2! !a9! !ver!  7
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     8!r1! !ver! !a8! !ve2! !a7! !ve2! !a6! !ve2! !a5! !ve2! !a4! !ve2! !a3! !ve2! !a2! !ve2! !a1! !ver!  8
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo. 
echo          H   G   F   E   D   C   B   A
exit /b


REM Left
:r4
echo          8   7   6   5   4   3   2   1
echo.         !r1!   !r2!   !r3!   !r4!   !r5!   !r6!   !r7!   !r8!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     A!f1! !ver! !a8! !ve2! !a16! !ve2! !a24! !ve2! !a32! !ve2! !a40! !ve2! !a48! !ve2! !a56! !ve2! !a64! !ver!  A   [!piece!] !v_file1!!v_rank1!  �^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     B!f2! !ver! !a7! !ve2! !a15! !ve2! !a23! !ve2! !a31! !ve2! !a39! !ve2! !a47! !ve2! !a55! !ve2! !a63! !ver!  B   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     C!f3! !ver! !a6! !ve2! !a14! !ve2! !a22! !ve2! !a30! !ve2! !a38! !ve2! !a46! !ve2! !a54! !ve2! !a62! !ver!  C
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     D!f4! !ver! !a5! !ve2! !a13! !ve2! !a21! !ve2! !a29! !ve2! !a37! !ve2! !a45! !ve2! !a53! !ve2! !a61! !ver!  D
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     E!f5! !ver! !a4! !ve2! !a12! !ve2! !a20! !ve2! !a28! !ve2! !a36! !ve2! !a44! !ve2! !a52! !ve2! !a60! !ver!  E
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     F!f6! !ver! !a3! !ve2! !a11! !ve2! !a19! !ve2! !a27! !ve2! !a35! !ve2! !a43! !ve2! !a51! !ve2! !a59! !ver!  F
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     G!f7! !ver! !a2! !ve2! !a10! !ve2! !a18! !ve2! !a26! !ve2! !a34! !ve2! !a42! !ve2! !a50! !ve2! !a58! !ver!  G
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     H!f8! !ver! !a1! !ve2! !a9! !ve2! !a17! !ve2! !a25! !ve2! !a33! !ve2! !a41! !ve2! !a49! !ve2! !a57! !ver!  H
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo. 
echo          8   7   6   5   4   3   2   1
exit /b



:options
cls
echo.
echo Options
echo.
echo 1. Continue
echo 2. Declare Draw
echo 3. View game history
echo 4. View Pieces
echo 5. Save game for later
echo 6. Take Screenshot [.bat]
echo 7. Quit
echo.
set /p choose=Choose a number:
if "!choose!" == "1" goto game
if "!choose!" == "2" (set draw=true) && goto gameover
if "!choose!" == "3" (
cls
set /a h=!movec!+!movec!+7
if !h! LSS 30 set h=30
mode 80,!h!
echo.
echo Game History
echo.
for /f "tokens=1,2-3 delims=-" %%a in (tmp.txt) do (
set n=1
set l=%%b
for /l %%h in (1,1,2) do ((
set /a filen=!l!%%8
set /a rankn=!l!/8
if not "!filen!" == "0" set /a rankn+=1
if "!filen!" == "1" set file!n!=a
if "!filen!" == "2" set file!n!=b
if "!filen!" == "3" set file!n!=c
if "!filen!" == "4" set file!n!=d
if "!filen!" == "5" set file!n!=e
if "!filen!" == "6" set file!n!=f
if "!filen!" == "7" set file!n!=g
if "!filen!" == "0" set file!n!=h
if "!rankn!" == "1" set rank!n!=8
if "!rankn!" == "2" set rank!n!=7
if "!rankn!" == "3" set rank!n!=6
if "!rankn!" == "4" set rank!n!=5
if "!rankn!" == "5" set rank!n!=4
if "!rankn!" == "6" set rank!n!=3
if "!rankn!" == "7" set rank!n!=2
if "!rankn!" == "8" set rank!n!=1
)
set l=%%c
set n=2
)
echo [%%a] !file1!!rank1! -^> !file2!!rank2!>>temphist.txt
echo [%%a] !file1!!rank1! -^> !file2!!rank2!
)
echo.
set /p save=Save history? [y/n]:
if /i "!save!" == "y" (
echo.
set /p name=Save as:
find /v "exit /b" <temphist.txt> "!name!.txt"
)
if /i exist "temphist.txt" del temphist.txt
mode 80,30
)


if "!choose!" == "4" (
cls
echo.
echo    ������������������������Ŀ
echo    �  Type  � White � Black �
echo    ������������������������Ĵ
echo    �  Pawn  �   !wPawn!   �   !bPawn!   �
echo    ������������������������Ĵ
echo    �  Rook  �   !wRook!   �   !bRook!   �
echo    ������������������������Ĵ
echo    � Knight �   !wKnight!   �   !bKnight!   �
echo    ������������������������Ĵ
echo    � Bishop �   !wBishop!   �   !bBishop!   �
echo    ������������������������Ĵ
echo    � Queen  �   !wQueen!   �   !bQueen!   �
echo    ������������������������Ĵ
echo    �  King  �   !wKing!   �   !bKing!   �
echo    ��������������������������
echo.
pause
)

if "!choose!" == "5" (
echo.
echo -b/Back
echo.
set /p name=Save game as:
if /i "!name!" == "-b" goto options
echo.
if /i exist "!name!.sav" (
echo.
echo File already exists^^!
echo.
pause
goto options
)
for /l %%s in (1,1,64) do (
if "!a%%s!" == "!bPawn!" echo a%%s=^^!bPawn^^!>>!name!.sav
if "!a%%s!" == "!bRook!" echo a%%s=^^!bRook^^!>>!name!.sav
if "!a%%s!" == "!bKnight!" echo a%%s=^^!bKnight^^!>>!name!.sav
if "!a%%s!" == "!bBishop!" echo a%%s=^^!bBishop^^!>>!name!.sav
if "!a%%s!" == "!bQueen!" echo a%%s=^^!bQueen^^!>>!name!.sav
if "!a%%s!" == "!bKing!" echo a%%s=^^!bKing^^!>>!name!.sav
if "!a%%s!" == "!wPawn!" echo a%%s=^^!wPawn^^!>>!name!.sav
if "!a%%s!" == "!wRook!" echo a%%s=^^!wRook^^!>>!name!.sav
if "!a%%s!" == "!wKnight!" echo a%%s=^^!wKnight^^!>>!name!.sav
if "!a%%s!" == "!wBishop!" echo a%%s=^^!wBishop^^!>>!name!.sav
if "!a%%s!" == "!wQueen!" echo a%%s=^^!wQueen^^!>>!name!.sav
if "!a%%s!" == "!wKing!" echo a%%s=^^!wKing^^!>>!name!.sav
)
for /l %%p in (9,1,16) do echo bpawn%%p=!bpawn%%p!>>!name!.sav
for /l %%p in (49,1,56) do echo wpawn%%p=!wpawn%%p!>>!name!.sav
echo wlastp=!wlastp!>>!name!.sav
echo blastp=!blastp!>>!name!.sav
echo variant=!variant!>>!name!.sav
echo wpieces=!wpieces!>>!name!.sav
echo bpieces=!bpieces!>>!name!.sav
for %%r in (a1 a8 a57 a64) do echo %%rrook=!%%rrook!>>!name!.sav
for %%k in (w b) do echo %%kkinglocate=!%%kkinglocate!>>!name!.sav
for %%k in (w b) do echo %%kkingpos=!%%kkingpos!>>!name!.sav
for %%n in (w b) do echo %%nplayer=!%%nplayer!>>!name!.sav
echo first=!first!>>!name!.sav
echo scr=!scr!>>!name!.sav
echo movec=!movec!>>!name!.sav
echo turn=!turn!>>!name!.sav
echo Game saved to "!name!.sav"
echo.
pause
)
if "!choose!" == "6" (
:scrshot
set ar=�
echo.
echo -b/Back
echo.
set /p name=Screenshot name:
if /i "!scr!" == "pbscr" if /i "!name!" == "-b" exit /b
if /i "!name!" == "-b" goto options
REM I'm awesome.
call :r!scr!>screenshot.txt
echo @echo off>>!name!.bat
echo echo.>>!name!.bat
for /f "tokens=1,2 delims=" %%a in (screenshot.txt) do echo echo.%%a>>!name!.bat
echo echo.>>!name!.bat
echo pause^>nul>>!name!.bat
del screenshot.txt
echo.
echo A screenshot of the board has been taken and stored to "!name!.bat"
echo.
pause
set ar=^>
if /i "!scr!" == "pbscr" exit /b
)
if "!choose!" == "7" goto menu
goto options

:gameover
if "!winner!" == "w" (set loser=b) ELSE set loser=w
cls
if not "!draw!" == "true" (
title Batch Chess - !%winner%player! Wins^^!
echo.
echo !%winner%player! [!t%winner%!] wins against !%loser%player! [!t%loser%!] in !movec! moves^^!
echo.
)
if "!draw!" == "true" (
echo.
echo Game ends in a draw.
echo.
)
set /p choose=Save game for playback? [y/n]:
if /i "!choose!" == "n" if exist "tmp.txt" del tmp.txt
if /i "!choose!" == "n" goto menu
if /i "!choose!" == "y" (
echo.
echo -b/Back
echo.
set /p name=Save playback as:
if /i "!name!" == "-b" goto gameover
if exist "!name!.txt" echo !name!.txt already exists!
if exist "!name!.txt" goto gameover
find /v "exit /b" <tmp.txt> "!name!.txt"
if exist "tmp.txt" del tmp.txt
echo.
echo Game playback saved.
echo.
pause
goto menu
)
goto gameover

REM =============================== END OF GAME ===============================

:default

set bf=07
set first=w
set autorotate=Off
set autoupdate=Off
set displastmove=On
call :d1
call :d2
exit /b
:d1
set wPawn=P
set wRook=R
set wKnight=N
set wBishop=B
set wQueen=Q
set wKing=K
set bPawn=p
set bRook=r
set bKnight=n
set bBishop=b
set bQueen=q
set bKing=k
exit /b
:d2
set tlc=�
set trc=�
set blc=�
set brc=�
set cro=�
set bar=���
set ver=�
set tcn=�
set bcn=�
set lcn=�
set rcn=�
set ba2=���
set ve2=�
set www=�
set bbb=
exit /b

:save
if exist "config.bat" del config.bat
for %%w in (wPawn wRook wKnight wBishop wQueen wKing) do echo set %%w=!%%w!>>config.bat
for %%b in (bPawn bRook bKnight bBishop bQueen bKing) do echo set %%b=!%%b!>>config.bat
for %%B in (ve2 tlc trc blc brc cro bar ver tcn bcn lcn rcn ba2) do echo set %%B=!%%B!>>config.bat
echo set bf=!bf!>>config.bat
echo set first=!first!>>config.bat
echo set autorotate=!autorotate!>>config.bat
REM echo set autoupdate=!autoupdate!>>config.bat
echo set displastmove=!displastmove!>>config.bat
echo set www=!www!>>config.bat
echo set bbb=!bbb!>>config.bat
exit /b


:gameplayback
set ar=^>
echo.
echo Grab some popcorn...
echo.
set /p name=File name [-b/Back]:
if /i "!name!" == "-b" goto menu
if /i not exist "!name!" set name=!name!.txt
if /i not exist "!name!" (
echo.
echo File not found^^!
echo.
pause
goto menu
)
if /i "!name!" == "b" goto menu
echo.
set /p speed=Playback speed [0 = Fastest]:
if /i "!speed!" == "b" goto menu
:marker
echo.
set /p marker=Marker for current piece [3 characters]:
if /i "!marker!" == "b" goto menu
if "!marker:~2!"=="" (
:notthree
echo.
echo The marker must be 3 characters long^^!
echo.
pause
cls
goto marker
)
if not "!marker:~3!"=="" goto notthree

call :scrload
set file1=
set file2=
set rank1=
set rank2=
call :screen

for /f "tokens=1,2-3 delims=-" %%a in (!name!) do (
set piece=!a%%b!
set a%%b=!marker!
set file2=
set rank2=
set /a file1=%%b%%8
set /a rank1=%%b/8
if not "!file1!" == "0" set /a rank1+=1
if "!file1!" == "1" set file1=a
if "!file1!" == "2" set file1=b
if "!file1!" == "3" set file1=c
if "!file1!" == "4" set file1=d
if "!file1!" == "5" set file1=e
if "!file1!" == "6" set file1=f
if "!file1!" == "7" set file1=g
if "!file1!" == "0" set file1=h
set rset=
if "!rank1!" == "1" (set rank1=8) && set rset=t
if "!rank1!" == "2" (set rank1=7) && set rset=t
if "!rank1!" == "3" (set rank1=6) && set rset=t
if "!rank1!" == "4" (set rank1=5) && set rset=t
if not "!rset!" == "t" (
if "!rank1!" == "5" set rank1=4
if "!rank1!" == "6" set rank1=3
if "!rank1!" == "7" set rank1=2
if "!rank1!" == "8" set rank1=1
set rset=
)

call :screen
set a%%b= !bbb!
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do (
if "!%%w!" == " !bbb! " set %%w= !www!
)
set a%%c=!marker!
set /a file2=%%c%%8
set /a rank2=%%c/8
if not "!file2!" == "0" set /a rank2+=1
if "!file2!" == "1" set file2=a
if "!file2!" == "2" set file2=b
if "!file2!" == "3" set file2=c
if "!file2!" == "4" set file2=d
if "!file2!" == "5" set file2=e
if "!file2!" == "6" set file2=f
if "!file2!" == "7" set file2=g
if "!file2!" == "0" set file2=h
set rset=
if "!rank2!" == "1" (set rank2=8) && set rset=t
if "!rank2!" == "2" (set rank2=7) && set rset=t
if "!rank2!" == "3" (set rank2=6) && set rset=t
if "!rank2!" == "4" (set rank2=5) && set rset=t
if not "!rset!" == "t" (
if "!rank2!" == "5" set rank2=4
if "!rank2!" == "6" set rank2=3
if "!rank2!" == "7" set rank2=2
if "!rank2!" == "8" set rank2=1
set rset=
)
call :screen
set a%%c=!piece!
call :screen
)
echo.
echo  Game ends.
echo.
ping localhost -n 2 >nul
pause
goto menu

:screen
cls
call :rpbscr
echo.
echo  f/Fast Forward    p/Pause
choice /t:!speed! /d:f /c:pf /n >nul

if "!ERRORLEVEL!" == "1" (
echo.
echo 1. Continue
echo 2. Take Screenshot
echo 3. Quit and go to menu
echo.
set /p choose=Choose a number:
cls
if "!choose!" == "2" set scr=pbscr
if "!choose!" == "2" call :scrshot
if "!choose!" == "3" goto menu
)
exit /b

:rpbscr
echo.
echo          A   B   C   D   E   F   G   H
echo. 
echo        �������������������������������ͻ
echo     8  �!a1!�!a2!�!a3!�!a4!�!a5!�!a6!�!a7!�!a8!�  8    [!piece!] !file1!!rank1! �^!ar! !file2!!rank2!
echo        �������������������������������Ķ
echo     7  �!a9!�!a10!�!a11!�!a12!�!a13!�!a14!�!a15!�!a16!�  7
echo        �������������������������������Ķ
echo     6  �!a17!�!a18!�!a19!�!a20!�!a21!�!a22!�!a23!�!a24!�  6
echo        �������������������������������Ķ
echo     5  �!a25!�!a26!�!a27!�!a28!�!a29!�!a30!�!a31!�!a32!�  5
echo        �������������������������������Ķ
echo     4  �!a33!�!a34!�!a35!�!a36!�!a37!�!a38!�!a39!�!a40!�  4
echo        �������������������������������Ķ
echo     3  �!a41!�!a42!�!a43!�!a44!�!a45!�!a46!�!a47!�!a48!�  3
echo        �������������������������������Ķ
echo     2  �!a49!�!a50!�!a51!�!a52!�!a53!�!a54!�!a55!�!a56!�  2
echo        �������������������������������Ķ
echo     1  �!a57!�!a58!�!a59!�!a60!�!a61!�!a62!�!a63!�!a64!�  1
echo        �������������������������������ͼ
echo. 
echo          A   B   C   D   E   F   G   H
exit /b

:scrload
for /l %%s in (1,1,64) do set a%%s= !bbb!
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do set %%w= !www!
set piece=


REM Black
for /l %%P in (9,1,16) do set a%%P= !bPawn!
for %%R in (a1 a8) do set %%R= !bRook!
for %%K in (a2 a7) do set %%K= !bKnight!
for %%B in (a3 a6) do set %%B= !bBishop!
set a4= !bQueen!
set a5= !bKing!


REM White
for /l %%P in (49,1,56) do set a%%P= !wPawn!
for %%R in (a57 a64) do set %%R= !wRook!
for %%K in (a58 a63) do set %%K= !wKnight!
for %%B in (a59 a62) do set %%B= !wBishop!
set a60= !wQueen!
set a61= !wKing!
exit /b

::=============================================================================================


:about
title Batch Chess v0.8 By Kolt Koding
cls
echo.
echo                                  Release v0.8
echo.
echo.
echo             Batch Chess                                  __
echo                                                         /  \
echo    Entirely coded and produced by      "We're all       \__/
echo       Kolto101 and Kolt Koding                         /____\     in the game
echo                                           just pawns    ^|  ^|  
echo     ASCII Pawn/left Knight by "jgs"                     ^|__^|    of life."
echo                                                        (====)
echo          Copyright (C) 2012                            }===={
echo                                                       (______)
echo.
echo  Release Notes:
echo.
echo  Tested and works on Windows: XP (with choice.COM), Vista, and 7
echo.
echo  Batch Chess has almost everything that a normal chess game would have,
echo  EXCEPT for a checkmate system. It does, however, have a check system.
echo  It also has many other features, some which are still experimental. Enjoy^^!
echo.
echo  ** PLEASE report ANY bugs or crashes that may occur to: kolto101@gmail.com **
echo.             Visit http://www.koltkoding.tk/ for updates and more
echo.
echo.
echo  b/Back   u/Check for updates   y/Kolto101's Youtube   k/Kolt Koding Website
echo.
set /p choose=Choose a letter:
if /i "!choose!" == "b" goto menu
if /i "!choose!" == "k" start http://www.koltkoding.tk/
if /i "!choose!" == "y" start http://www.youtube.com/user/kolto101/videos
if /i "!choose!" == "u" start http://www.koltkoding.tk/batchchess/
goto about

:config
mode 80,30
cls
echo.
echo  �����������������������ͻ
echo  �       Configure       �
echo  �����������������������͹
echo  � 1. Customize Pieces   �
echo  � 2. Customize Board    �
echo  � 3. Themes             �
echo  � 4. Settings           �
echo  � 5. Debug              �
echo  �                       �
echo  �  Press b to go back   �
echo  �����������������������ͼ
echo.
set /p choose=Choose a number:
if /i "!choose!" == "b" goto menu
if "!choose!" == "1" goto customize
if "!choose!" == "2" goto customboard
if "!choose!" == "3" goto themes
if "!choose!" == "4" goto settings
if "!choose!" == "5" goto debug
goto config


:settings
mode 80,30
cls
set tw=White
set tb=Black
echo.
echo  ��������������������������������ͻ
echo  �            Settings            �
echo  ��������������������������������͹
echo  �                                �
echo  �   1. First turn         !t%first%!  �
echo  �   2. Auto-rotate          !autorotate!  �
echo  �   3. DisplayLastMove      !displastmove!  �
REM echo  �   4. Automatic Updating   !autoupdate!  �
echo  �                                �
echo  �      Press b to go back        �
echo  ��������������������������������ͼ
echo.
set /p choose=Choose a number:
if /i "!choose!" == "b" goto config
if "!choose!" == "1" (
if "!first!" == "w" (set first=b) ELSE set first=w
)
if "!choose!" == "2" (
if "!autorotate!" == "Off" (set autorotate=On ) ELSE set autorotate=Off
)
if "!choose!" == "3" (
if "!displastmove!" == "Off" (set displastmove=On ) ELSE set displastmove=Off
)
REM if "!choose!" == "4" (
REM if "!autoupdate!" == "Off" (set autoupdate=On ) ELSE set autoupdate=Off
REM )
call :save
goto settings


:debug
REM Debug by Kolto101 and Kolt Koding
cls
mode 80,30
echo If you are familiar with Batch scripting, then use the debug for whatever.
echo For example, typing "set" would execute the set command and give a full list
echo of variables. Type "(command name here) /?" to find out what a command does.
echo.
echo b/Back
echo.
set /p debug=Debug code:
call :debugcheck
echo.
echo Executing code...
mode 100,10000
@echo on
Prompt $S
%debug%
@echo off
echo.
pause
goto debug

:debugcheck
if not "%debug:~1%"=="" exit /b
if not '%debug%' == 'b' (exit /b) ELSE (
if '%debugexit%' == 'true' (
set debugexit=
goto play)
goto config
)

:themes
set previousbf=%bf%
cls
echo.
echo                           0 = Black      8 = Gray
echo                           1 = Blue       9 = Light Blue
echo                           2 = Green      A = Light Green
echo                           3 = Aqua       B = Light Aqua
echo                           4 = Red        C = Light Red
echo                           5 = Purple     D = Light Purple
echo                           6 = Yellow     E = Light Yellow
echo                           7 = White      F = Bright White
echo.
echo                                  Default: 0A
echo                                  OS Default: 07
echo.
echo               Set the background color and the foreground color.
echo               The first letter/number is the background color,
echo               the second is the foreground. Do not use spaces.
echo.
echo                               Type "m" to go back.
echo.
set /p bf=Set Background/Foreground:
if /i "%bf%" == "m" (
set bf=%previousbf%
goto config)
if %bf% LSS a if %bf% GTR 99 goto themes
if not "%bf:~2%"=="" (
echo The color code cannot be more than 2 characters long.
echo.
pause
goto themes
)
if %bf% GTR FF goto themes
if %bf% LSS 00 goto themes
color %bf%
call :save
goto themes

:customboard
mode 80,30
cls
call :scrload
echo.
echo    Choose a number next to the graphic.         Current Values
echo.
echo     !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!           1: !tlc!  2: !trc!
echo     !ver!!a1!!ve2!!a2!!ve2!!a3!!ve2!!a4!!ve2!!a5!!ve2!!a6!!ve2!!a7!!ve2!!a8!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           3: !blc!  4: !brc!
echo     !ver!!a9!!ve2!!a10!!ve2!!a11!!ve2!!a12!!ve2!!a13!!ve2!!a14!!ve2!!a15!!ve2!!a16!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           5: !cro!  6: !bar!
echo     !ver!!a17!!ve2!!a18!!ve2!!a19!!ve2!!a20!!ve2!!a21!!ve2!!a22!!ve2!!a23!!ve2!!a24!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           7: !ver!  8: !tcn!
echo     !ver!!a25!!ve2!!a26!!ve2!!a27!!ve2!!a28!!ve2!!a29!!ve2!!a30!!ve2!!a31!!ve2!!a32!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           9: !bcn! 10: !lcn!
echo     !ver!!a33!!ve2!!a34!!ve2!!a35!!ve2!!a36!!ve2!!a37!!ve2!!a38!!ve2!!a39!!ve2!!a40!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!          11: !rcn! 12: !ba2!
echo     !ver!!a41!!ve2!!a42!!ve2!!a43!!ve2!!a44!!ve2!!a45!!ve2!!a46!!ve2!!a47!!ve2!!a48!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!          13: !ve2!
echo     !ver!!a49!!ve2!!a50!!ve2!!a51!!ve2!!a52!!ve2!!a53!!ve2!!a54!!ve2!!a55!!ve2!!a56!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!          14: White Squares - !www!
echo     !ver!!a57!!ve2!!a58!!ve2!!a59!!ve2!!a60!!ve2!!a61!!ve2!!a62!!ve2!!a63!!ve2!!a64!!ver!          15: Black Squares - !bbb!
echo     !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo.
echo.
echo  b/Back   d/Default
echo.
set /p choose=Choose a number:
if /i "!choose!" == "b" goto config
if /i "!choose!" == "d" call :d2
if "!choose!" == "1" (set tochange=tlc) && call :changegraphic
if "!choose!" == "2" (set tochange=trc) && call :changegraphic
if "!choose!" == "3" (set tochange=blc) && call :changegraphic
if "!choose!" == "4" (set tochange=brc) && call :changegraphic
if "!choose!" == "5" (set tochange=cro) && call :changegraphic
if "!choose!" == "6" (set tochange=bar) && call :changegraphic
if "!choose!" == "7" (set tochange=ver) && call :changegraphic
if "!choose!" == "8" (set tochange=tcn) && call :changegraphic
if "!choose!" == "9" (set tochange=bcn) && call :changegraphic
if "!choose!" == "10" (set tochange=lcn) && call :changegraphic
if "!choose!" == "11" (set tochange=rcn) && call :changegraphic
if "!choose!" == "12" (set tochange=ba2) && call :changegraphic
if "!choose!" == "13" (set tochange=ve2) && call :changegraphic
if "!choose!" == "14" (set tochange=www) && call :changegraphic
if "!choose!" == "15" (set tochange=bbb) && call :changegraphic
set bar=!bar:~0,1!!bar:~0,1!!bar:~0,1!
set ba2=!ba2:~0,1!!ba2:~0,1!!ba2:~0,1!
call :save
goto customboard

:customize
mode 80,30
cls
echo.  
echo    ������������������������Ŀ
echo    �                        �
echo    �    Customize Pieces    �
echo    �                        �
echo    ������������������������Ĵ
echo    �  Type  � White � Black �
echo    ������������������������Ĵ
echo    �  Pawn  � 1  !wPawn!  � 7   !bPawn! �
echo    ������������������������Ĵ
echo    �  Rook  � 2  !wRook!  � 8   !bRook! �
echo    ������������������������Ĵ
echo    � Knight � 3  !wKnight!  � 9   !bKnight! �
echo    ������������������������Ĵ
echo    � Bishop � 4  !wBishop!  � 10  !bBishop! �
echo    ������������������������Ĵ
echo    � Queen  � 5  !wQueen!  � 11  !bQueen! �
echo    ������������������������Ĵ
echo    �  King  � 6  !wKing!  � 12  !bKing! �
echo    ��������������������������
echo.
echo  b/Back   d/Default
echo.
set /p choose=Choose a number to change the current graphic:
if /i "!choose!" == "b" goto config
if "!choose!" == "1" set tochange=wPawn
if "!choose!" == "2" set tochange=wRook
if "!choose!" == "3" set tochange=wKnight
if "!choose!" == "4" set tochange=wBishop
if "!choose!" == "5" set tochange=wQueen
if "!choose!" == "6" set tochange=wKing
if "!choose!" == "7" set tochange=bPawn
if "!choose!" == "8" set tochange=bRook
if "!choose!" == "9" set tochange=bKnight
if "!choose!" == "10" set tochange=bBishop
if "!choose!" == "11" set tochange=bQueen
if "!choose!" == "12" set tochange=bKing
if !choose! GEQ 1 (
if !choose! LEQ 12 (
call :changegraphic
))
if /i "!choose!" == "d" call :d1 && call :save
goto customize


:changegraphic
cls
echo.
echo Currently editting: !tochange! !%tochange%!
echo.
echo Enter a character below, or choose and extended character.
echo.
echo -b/Back   -s/Open extended characters
echo.
set /p symbol=Chracter:
if /i "!symbol!" == "-b" exit /b
if "!symbol!" == "" goto changegraphic

if not "!symbol:~1!"=="" (
if /i not "!symbol!" == "-s" (
echo You may only use 1 character.
echo.
pause
goto changegraphic
))
if /i "!symbol!" == "-s" call :symbolstart
if /i "!symbol!" == "-s" goto changegraphic

REM add checker against same graphics
set !tochange!=!symbol!
call :save
exit /b




:symbolstart
mode 80,50
cls
call :symbolecho
set symbolnum=
echo b/Back
echo.
set /p symbolnum=Enter the character number to output #
if /i "!symbolnum!" == "b" exit /b

if not !symbolnum! GTR 0 goto symbolstart
if !symbolnum! GTR 254 goto symbolstart
call :symbol
if !symbolnum! GEQ 32 (
if !symbolnum! LEQ 126 (
echo.
echo Characters 32-126 can be accessed via keyboard.
pause>nul
goto symbolstart
))
if "!symbol!" == "N/A" goto symbolstart
:symbolask
cls
echo.
echo Symbol: !symbol!
echo.
echo Would you like to use this symbol?
set /p choose=[y/n]:
if /i "!choose!" == "n" goto symbolstart
if /i "!choose!" == "y" exit /b
goto symbolask

:symbol
set symbol=N/A
if "!symbolnum!" == "1" set symbol= 
if "!symbolnum!" == "2" set symbol= 
if "!symbolnum!" == "3" set symbol= 
if "!symbolnum!" == "4" set symbol= 
if "!symbolnum!" == "5" set symbol= 
if "!symbolnum!" == "6" set symbol= 
if "!symbolnum!" == "11" set symbol= 
if "!symbolnum!" == "12" set symbol= 
if "!symbolnum!" == "14" set symbol= 
if "!symbolnum!" == "15" set symbol= 
if "!symbolnum!" == "16" set symbol= 
if "!symbolnum!" == "17" set symbol= 
if "!symbolnum!" == "18" set symbol= 
if "!symbolnum!" == "19" set symbol= 
if "!symbolnum!" == "20" set symbol= 
if "!symbolnum!" == "21" set symbol= 
if "!symbolnum!" == "22" set symbol= 
if "!symbolnum!" == "23" set symbol= 
if "!symbolnum!" == "24" set symbol= 
if "!symbolnum!" == "25" set symbol= 
if "!symbolnum!" == "27" set symbol= 
if "!symbolnum!" == "28" set symbol= 
if "!symbolnum!" == "29" set symbol= 
if "!symbolnum!" == "30" set symbol= 
if "!symbolnum!" == "31" set symbol= 
REM 32 - 126 are accessible via Keyboard
if "!symbolnum!" == "127" set symbol=
if "!symbolnum!" == "128" set symbol=�
if "!symbolnum!" == "129" set symbol=�
if "!symbolnum!" == "130" set symbol=�
if "!symbolnum!" == "131" set symbol=�
if "!symbolnum!" == "132" set symbol=�
if "!symbolnum!" == "133" set symbol=�
if "!symbolnum!" == "134" set symbol=�
if "!symbolnum!" == "135" set symbol=�
if "!symbolnum!" == "136" set symbol=�
if "!symbolnum!" == "137" set symbol=�
if "!symbolnum!" == "138" set symbol=�
if "!symbolnum!" == "139" set symbol=�
if "!symbolnum!" == "140" set symbol=�
if "!symbolnum!" == "141" set symbol=�
if "!symbolnum!" == "142" set symbol=�
if "!symbolnum!" == "143" set symbol=�
if "!symbolnum!" == "144" set symbol=�
if "!symbolnum!" == "145" set symbol=�
if "!symbolnum!" == "146" set symbol=�
if "!symbolnum!" == "147" set symbol=�
if "!symbolnum!" == "148" set symbol=�
if "!symbolnum!" == "149" set symbol=�
if "!symbolnum!" == "150" set symbol=�
if "!symbolnum!" == "151" set symbol=�
if "!symbolnum!" == "152" set symbol=�
if "!symbolnum!" == "153" set symbol=�
if "!symbolnum!" == "154" set symbol=�
if "!symbolnum!" == "155" set symbol=�
if "!symbolnum!" == "156" set symbol=�
if "!symbolnum!" == "157" set symbol=�
if "!symbolnum!" == "158" set symbol=�
if "!symbolnum!" == "159" set symbol=�
if "!symbolnum!" == "160" set symbol=
if "!symbolnum!" == "161" set symbol=�
if "!symbolnum!" == "162" set symbol=�
if "!symbolnum!" == "163" set symbol=�
if "!symbolnum!" == "164" set symbol=�
if "!symbolnum!" == "165" set symbol=�
if "!symbolnum!" == "166" set symbol=�
if "!symbolnum!" == "167" set symbol=�
if "!symbolnum!" == "168" set symbol=�
if "!symbolnum!" == "169" set symbol=�
if "!symbolnum!" == "170" set symbol=�
if "!symbolnum!" == "171" set symbol=�
if "!symbolnum!" == "172" set symbol=�
if "!symbolnum!" == "173" set symbol=�
if "!symbolnum!" == "174" set symbol=�
if "!symbolnum!" == "175" set symbol=�
if "!symbolnum!" == "176" set symbol=�
if "!symbolnum!" == "177" set symbol=�
if "!symbolnum!" == "178" set symbol=�
if "!symbolnum!" == "179" set symbol=�
if "!symbolnum!" == "180" set symbol=�
if "!symbolnum!" == "181" set symbol=�
if "!symbolnum!" == "182" set symbol=�
if "!symbolnum!" == "183" set symbol=�
if "!symbolnum!" == "184" set symbol=�
if "!symbolnum!" == "185" set symbol=�
if "!symbolnum!" == "186" set symbol=�
if "!symbolnum!" == "187" set symbol=�
if "!symbolnum!" == "188" set symbol=�
if "!symbolnum!" == "189" set symbol=�
if "!symbolnum!" == "190" set symbol=�
if "!symbolnum!" == "191" set symbol=�
if "!symbolnum!" == "192" set symbol=�
if "!symbolnum!" == "193" set symbol=�
if "!symbolnum!" == "194" set symbol=�
if "!symbolnum!" == "195" set symbol=�
if "!symbolnum!" == "196" set symbol=�
if "!symbolnum!" == "197" set symbol=�
if "!symbolnum!" == "198" set symbol=�
if "!symbolnum!" == "199" set symbol=�
if "!symbolnum!" == "200" set symbol=�
if "!symbolnum!" == "201" set symbol=�
if "!symbolnum!" == "202" set symbol=�
if "!symbolnum!" == "203" set symbol=�
if "!symbolnum!" == "204" set symbol=�
if "!symbolnum!" == "205" set symbol=�
if "!symbolnum!" == "206" set symbol=�
if "!symbolnum!" == "207" set symbol=�
if "!symbolnum!" == "208" set symbol=�
if "!symbolnum!" == "209" set symbol=�
if "!symbolnum!" == "210" set symbol=�
if "!symbolnum!" == "211" set symbol=�
if "!symbolnum!" == "212" set symbol=�
if "!symbolnum!" == "213" set symbol=�
if "!symbolnum!" == "214" set symbol=�
if "!symbolnum!" == "215" set symbol=�
if "!symbolnum!" == "216" set symbol=�
if "!symbolnum!" == "217" set symbol=�
if "!symbolnum!" == "218" set symbol=�
if "!symbolnum!" == "219" set symbol=�
if "!symbolnum!" == "220" set symbol=�
if "!symbolnum!" == "221" set symbol=�
if "!symbolnum!" == "222" set symbol=�
if "!symbolnum!" == "223" set symbol=�
if "!symbolnum!" == "224" set symbol=�
if "!symbolnum!" == "225" set symbol=�
if "!symbolnum!" == "226" set symbol=�
if "!symbolnum!" == "227" set symbol=�
if "!symbolnum!" == "228" set symbol=�
if "!symbolnum!" == "229" set symbol=�
if "!symbolnum!" == "230" set symbol=�
if "!symbolnum!" == "231" set symbol=�
if "!symbolnum!" == "232" set symbol=�
if "!symbolnum!" == "233" set symbol=�
if "!symbolnum!" == "234" set symbol=�
if "!symbolnum!" == "235" set symbol=�
if "!symbolnum!" == "236" set symbol=�
if "!symbolnum!" == "237" set symbol=�
if "!symbolnum!" == "238" set symbol=�
if "!symbolnum!" == "239" set symbol=�
if "!symbolnum!" == "240" set symbol=�
if "!symbolnum!" == "241" set symbol=�
if "!symbolnum!" == "242" set symbol=�
if "!symbolnum!" == "243" set symbol=�
if "!symbolnum!" == "244" set symbol=�
if "!symbolnum!" == "245" set symbol=�
if "!symbolnum!" == "246" set symbol=�
if "!symbolnum!" == "247" set symbol=�
if "!symbolnum!" == "248" set symbol=�
if "!symbolnum!" == "249" set symbol=�
if "!symbolnum!" == "250" set symbol=�
if "!symbolnum!" == "251" set symbol=�
if "!symbolnum!" == "252" set symbol=�
if "!symbolnum!" == "253" set symbol=�
if "!symbolnum!" == "254" set symbol=�
exit /b

:symbolecho
echo.
echo      1:     2:     3:     4:     5:     6:     11:    12: 
echo.
echo      14:    15:    16:    17:    18:    19:    20:    21: 
echo.
echo      22:    23:    24:    25:    27:    28:    29:    30:  
echo.
echo      31: 
echo.
echo                 Characters 32-126 can be accessed via keyboard.
echo.
echo.
echo      127:    128: �   129: �   130: �   131: �   132: �   133: �   134: �
echo.
echo      135: �   136: �   137: �   138: �   139: �   140: �   141: �   142: �
echo.
echo      143: �   144: �   145: �   146: �   147: �   148: �   149: �   150: �
echo.
echo      151: �   152: �   153: �   154: �   155: �   156: �   157: �   158: �
echo.
echo      159: �   160:     161: �   162: �   163: �   164: �   165: �   166: �
echo.
echo      167: �   168: �   169: �   170: �   171: �   172: �   173: �   174: �
echo.
echo      175: �   176: �   177: �   178: �   179: �   180: �   181: �   182: �
echo.
echo      183: �   184: �   185: �   186: �   187: �   188: �   189: �   190: �
echo.
echo      191: �   192: �   193: �   194: �   195: �   196: �   197: �   198: �
echo.
echo      199: �   200: �   201: �   202: �   203: �   204: �   205: �   206: �
echo.
echo      207: �   208: �   209: �   210: �   211: �   212: �   213: �   214: �
echo.
echo      215: �   216: �   217: �   218: �   219: �   220: �   221: �   222: �
echo.
echo      223: �   224: �   225: �   226: �   227: �   228: �   229: �   230: �
echo.
echo      231: �   232: �   233: �   234: �   235: �   236: �   237: �   238: �
echo.
echo      239: �   240: �   241: �   242: �   243: �   244: �   245: �   246: �
echo.
echo      247: �   248: �   249: �   250: �   251: �   252: �   253: �   254: �
echo.
echo.
exit /b

:tutorial
cls
echo.
echo Batch Chess is played like normal chess, except there is no checkmate system.
echo There is, however a check system. Each player must manually check to see
echo if their king is in checkmate. If it is, the player must resign.
echo.
echo Would you like to read the rules at: "..wikipedia.org/wiki/Rules_of_chess" ?
echo.
set /p choose=[y/n]:
if /i "!choose!" == "y" start http://en.wikipedia.org/wiki/Rules_of_chess
if /i "!choose!" == "n" goto menu
goto tutorial

:minesweep
@title Buscaminas
  @mode con cols=18 lines=13
  @::MineSweeper v 1
  @::Batch Game
  @::Coded by ::Jason Haude::

if not exist "keyboard.exe" (Goto :NoKey)

:load
setlocal enabledelayedexpansion
set LimX=9
set LimY=9
set IniX=0
set IniY=0
set MovX=0
set MovY=0

:init
for /l %%a in (0,1,%LimX%) do (
for /l %%b in (0,1,%LimY%) do (
set X%%aY%%b=�
))
for /l %%m in (0,1,9) do (set M%%m=X!random:~-1!Y!random:~-1!)
set X0Y0=
set Last=�
set Curpos=X0Y0
Goto :First

:Graphic
Call :Clear
:First
for /l %%d in (0,1,%LimY%) do (
for /l %%e in (0,1,%LimX%) do (
set Lin_%%d=!Lin_%%d!!X%%eY%%d!
))
echo.
echo. MineSweeper v 1
echo.
for /l %%f in (0,1,%LimY%) do (echo.   !Lin_%%f!)
if "%EOG%"=="True" Goto :End
keyboard
if "%errorlevel%"=="77" (call :MovX+ "%CurPos%")
if "%errorlevel%"=="75" (call :MovX- "%CurPos%")
if "%errorlevel%"=="80" (call :MovY+ "%CurPos%")
if "%errorlevel%"=="72" (call :MovY- "%CurPos%")
if "%errorlevel%"=="13" (call :Check "%CurPos%")
if "%errorlevel%"=="88" (msg * Thx for Playing MineSweeper v1 by SmartGenius&exit)
if "%errorlevel%"=="120" (msg * Thx for Playing MineSweeper v1 by SmartGenius&exit)
Goto :Graphic

:MovX+
for /f "tokens=1,2 delims=X,Y" %%p in ("%~1") do (
if "%%p"=="%LimX%" Goto :Eof
if !%~1!== set %~1=%Last%
set /a MovX=%%p+1
call set Last=%%X!MovX!Y%%q%%
set X!MovX!Y%%q=
set CurPos=X!MovX!Y%%q
)
Goto :Eof

:MovX-
for /f "tokens=1,2 delims=X,Y" %%p in ("%~1") do (
if "%%p"=="%IniX%" Goto :Eof
if !%~1!== set %~1=%Last%
set /a MovX=%%p-1
call set Last=%%X!MovX!Y%%q%%
set X!MovX!Y%%q=
set CurPos=X!MovX!Y%%q
)
Goto :Eof

:MovY+
for /f "tokens=1,2 delims=X,Y" %%p in ("%~1") do (
if "%%q"=="%LimY%" Goto :Eof
if !%~1!== set %~1=%Last%
set /a MovY=%%q+1
call set Last=%%X%%pY!MovY!%%
set X%%pY!MovY!=
set CurPos=X%%pY!MovY!
)
Goto :Eof

:MovY-
for /f "tokens=1,2 delims=X,Y" %%p in ("%~1") do (
if "%%q"=="%IniY%" Goto :Eof
if !%~1!== set %~1=%Last%
set /a MovY=%%q-1
call set Last=%%X%%pY!MovY!%%
set X%%pY!MovY!=
set CurPos=X%%pY!MovY!
)
Goto :Eof

:Check
for /l %%h in (0,1,9) do (
if "%~1"=="!M%%h!" (
set %~1=
set EOG=True
Goto :Eof
))
set %~1=�
Goto :Eof

:End
msg * You Lost !
pause>nul
exit

:Clear
for /l %%m in (0,1,%LimY%) do (set Lin_%%m=)
Goto :Eof

:NoKey
cls
echo.
echo  A file needed for the correct function
echo  of this Script is missing....
echo.
echo  It will be created...
call :keyboard
echo.
echo  Restart this Script !
echo.
pause
exit

:keyboard
(
echo n keyboard.dat
echo e 0000 4D 5A 2E 00 01 00 00 00 02 00 00 10 FF FF F0 FF
echo e 0010 FE FF 00 00 00 01 F0 FF 1C 00 00 00 00 00 00 00
echo e 0020 B4 08 CD 21 3C 00 75 02 CD 21 B4 4C CD 21
echo rcx
echo 002E
echo w0
echo q
echo.
)>keyboard.dat
type keyboard.dat|debug>NUL 2>&1
del /f/q/a "keyboard.exe">NUL 2>&1
ren keyboard.dat "keyboard.exe"
Goto :Eof


:master
REM Battle stats
set hp=100
set maxhp=100
set monhp=50
set maxmonhp=50

:Start
cls
echo What is thy name, young sir or madam?
set /p name=
echo So your name is %name%!
pause
echo Would you like to battle THE GREAT EVIL?
set /p battle=
if %battle% == yes goto battle
if %battle% == no goto Exit

:battle
cls
echo %name%, it's your move! show him what moves you can do!
echo %name% %hp%/%maxhp% THE GREAT EVIL %monhp%/%maxmonhp%
echo.
echo PRESS P FOR A PUNCH
echo PRESS K FOR A KICK
echo PRESS S TO USE YOUR SWORD
echo PRESS G TO USE YOUR GUN

if %hp% leq 0 goto Loser
if %monhp% leq 0 goto Winner


set /p attack=
if %attack% == p goto Punch
if %attack% == P goto Punch
if %attack% == k goto Kick
if %attack% == K goto Kick
if %attack% == s goto Sword
if %attack% == S goto Sword
if %attack% == g goto Gun
if %attack% == G goto Gun

:Punch
cls
echo PUNCHING!
pause
set /a monhp=%monhp%-%Random% %%15-10%
goto Monster

:Kick
cls
echo KICKING!
pause
set /a monhp=%monhp%-%Random% %%20-10%
goto Monster

:Sword
cls
echo SLASHING!
pause
set /a monhp=%monhp%-%Random% %%25-5
goto Monster

:Gun
cls
echo SHOOTING!
pause
set /a monhp=%monhp%-%Random% %%30-0
goto Monster

:Monster
cls
echo ATTACKING %name%!
pause
set /a hp=%hp%-%Random% %%24-12
goto Battle

:Loser
echo You Lost, %name%.
pause
goto menu

:Winner
echo You Won, %name%. Now our town is safe.
pause
goto menu




























REM 01001001 01100110 00100000 01111001 01101111 01110101 00100000 01100011 01100001 01101110 00100000 01110010 01100101 01100001 01100100 00100000 01110100 01101000 01101001 01110011 00101100 00100000 01011001 01101111 01110101 00100111 01110010 01100101 00100000 01100001 00100000 01100010 01101001 01100111 00100000 01100110 01100001 01110100 00100000 01101110 01100101 01110010 01100100 00101110 00100000 01001001 01110100 00100111 01110011 00100000 01101111 01101011 00101100 00100000 01101101 01101111 01110011 01110100 00100000 01101111 01100110 00100000 01110101 01110011 00100000 01100001 01110010 01100101 00101110
REM If you can read this, you have installed the copy of the full version of this program. Good job!



