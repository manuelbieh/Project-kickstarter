@echo off

if exist %cd%\.project\config.bat call %cd%\.project\config.bat
call %filespath%\kickstart\defaults.bat

:8
cls
echo Please enter the desired filename (you can leave out the .html suffix):
echo:
GOTO 16

:12
cls
echo File already exists. Please choose another filename
echo:
GOTO 16

:16
set /p filename=
set filename=%filename:.html=%.html

IF EXIST %cd%\%filename% (
	GOTO 12
) ELSE (
	GOTO 20
)

:20
cls
set dt=5
echo Choose doctype (Default: HTML5): 
echo:
echo [1] XHTML Strict
echo [2] XHTML Transitional
echo [3] XHTML Frameset
echo [4] HTML4 Strict
echo [5] HTML5
echo: 
echo [F] Change filename (Current: %filename%)
echo [B] Back to main

set /p dt=

IF /i %dt% == F GOTO 8
IF /i %dt% == B GOTO 64
IF %dt% == 5 GOTO 96
IF %dt% == 4 GOTO 92
IF %dt% == 3 GOTO 88
IF %dt% == 2 GOTO 84
IF %dt% == 1 GOTO 80


:64
call %filespath%\kickstart.bat
goto :0


:80
echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" > %filename%
echo     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"^> >> %filename%
GOTO 128


:84
echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" > %filename%
echo     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"^> >> %filename%
GOTO 128


:88
echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" > %filename%
echo     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"^> >> %filename%
GOTO 128


:92
echo ^<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" > %filename%
echo     "http://www.w3.org/TR/html4/strict.dtd"^> >> %filename%
GOTO 128


:96
echo ^<!DOCTYPE html^> > %filename%


:128
cls
echo ^<html^> >> %filename%
echo ^<head^> >> %filename%
echo ^<title^>^</title^> >> %filename%

set jq=y
echo Insert jQuery link to Google CDN? [Y,n]
set /p jq=
IF %jq% == y (
	GOTO 256
) 
GOTO 384


:256
cls
set jqv=1.7
echo jQuery version (Default: 1.7)
set /p jqv=
REM IF %jqv% LSS 1 set /p jqv=1^.7
echo ^<script src="http://ajax.googleapis.com/ajax/libs/jquery/%jqv%/jquery.min.js" type="text/javascript"^>^</script^> >> %filename%
echo ^<script^>$(function() {});^</script^> >> %filename%


:384
cls
set emptycss=y
echo Insert link to empty css in %assets%%csspath%styles.css? [Y,n]
set /p emptycss=
IF %emptycss% EQU y (
	GOTO 512
)
GOTO 1024


:512
if not exist %winassets%%wincsspath% mkdir %winassets%%wincsspath%
echo: > %winassets%%wincsspath%\styles.css
echo ^<link href="%assets%%csspath%styles.css" rel="stylesheet" type="text/css" /^> >> %filename%

IF %sass% EQU yes (
	GOTO 640
) else (
	GOTO 1024
)


:640
if not exist %winassets%%winsasspath% mkdir %winassets%%winsasspath%
echo: > %winassets%%winsasspath%styles.scss


:1024
echo ^<style^>^</style^> >> %filename%
echo ^</head^> >> %filename%
echo ^<body^> >> %filename%
echo ^</body^> >> %filename%
echo ^</html^> >> %filename%

set morehtml=B
cls
echo HTML file was created successfully
echo Do you want to create another file? (Default: %morehtml%)
echo:
echo [Y] Yes
echo:
echo [B] Back to main
echo:
set /p morehtml=

IF /i %morehtml% EQU Y GOTO 8
CALL %filespath%\kickstart.bat