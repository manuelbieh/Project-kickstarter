@echo off

call %filespath%\kickstart\defaults.bat

:0
cls
set action=
echo Choose action:
echo:
echo [1] Change HTML default filename (Current: %filename%)
echo [2] Change assets folder (Current: %assets%)
echo [3] Change CSS folder (Current: %assets%%csspath%)
echo [4] Change JS folder (Current: %assets%%jspath%)
echo [5] Change images folder (Current: %assets%%imgpath%)
echo [6] Change Sass/SCSS foldername (Current %assets%%sasspath%)
echo [7] Create Sass/SCSS files for each CSS file by default? (Current: %sass%)
echo:
echo [B] Go back to main
echo:
set /p action=

IF /i %action% EQU B GOTO 2048
IF %action% EQU 7 GOTO 896
IF %action% EQU 6 GOTO 768
IF %action% EQU 5 GOTO 640
IF %action% EQU 4 GOTO 512
IF %action% EQU 3 GOTO 384
IF %action% EQU 2 GOTO 256
IF %action% EQU 1 GOTO 128

:128
echo Enter filename (Current: %filename%):
set /p filename=
goto 0

:256
echo Enter name for assets folder (Without trailing slash. Current: %assets%):
set /p assets=
set assets=%assets%/
set assets=%assets://=/%
set assets=%assets:///=/%
set winassets=%assets:/=\%
goto 0

:384
echo Enter CSS foldername (Current: %csspath%): 
set /p csspath=
set csspath=%csspath%/
set csspath=%csspath://=/%
set wincsspath=%csspath:/=\%
goto 0

:512
echo Enter JS foldername (Current: %jspath%): 
set /p jspath=
set jspath=%jspath%/
set jspath=%jspath://=/%
set winjspath=%jspath:/=\%
goto 0

:640
echo Enter images foldername (Current: %imgpath%): 
set /p imgpath=
set imgpath=%imgpath%/
set imgpath=%imgpath://=/%
set winimgpath=%imgpath:/=\%
goto 0

:768
echo Enter foldername for Sass files (Current: %sasspath%)
set /p sasspath=
set sasspath=%sasspath%/
set sasspath=%sasspath://=/%
set winsasspath=%sasspath:/=\%
goto 0

:896
echo Create SASS files?
CHOICE /C:yn
IF ERRORLEVEL 2 (
	set sass=nope
) else (
	set sass=yes
)
goto 0

:2048
call %filespath%\kickstart\saveconfig.bat
call %filespath%\kickstart.bat