@echo off
set filespath=%windir%\System32
cls

IF EXIST %cd%\.project\config.bat (
	CALL %cd%\.project\config.bat
)

call %filespath%\kickstart\defaults.bat

IF NOT EXIST %cd%\.project\config.bat (
	CALL %filespath%\kickstart\saveconfig.bat
	echo:
	GOTO 4
)
 


:0
cls

:4
set mode=1
echo Choose action (Default: %mode%)
echo: 
echo [1] Create HTML file(s)
echo [2] Create CSS file(s)
echo [3] Create JavaScript file(s)
echo:
echo [C] Change configuration
echo [S] Start working
echo:
echo [X] Exit

echo:
set /p mode=
echo %mode%
IF %mode% EQU 1 GOTO 128
IF %mode% EQU 2 GOTO 256
IF %mode% EQU 3 GOTO 384
IF /I %mode% EQU C GOTO 512
IF /I %mode% EQU S GOTO 768
IF /I %mode% EQU X exit

:128
call %filespath%\kickstart\html.bat
goto 0

:256
call %filespath%\kickstart\css.bat
goto 0

:384
call %filespath%\kickstart\javascript.bat
goto 0

:512
call %filespath%\kickstart\setup.bat
goto 0

:768
call %filespath%\startwork.bat