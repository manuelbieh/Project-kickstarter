@echo off

if exist %cd%\.project\config.bat call %cd%\.project\config.bat
call %filespath%\kickstart\defaults.bat

:8
cls
echo Please enter the desired filename (you can leave out the .js suffix):
echo:
GOTO 16

:12
echo:
echo File already exists. Please choose another filename
echo:
GOTO 16

:16
set /p jsfilename=

IF EXIST %winassets%%winjspath%%jsfilename:.js=%.js (
	GOTO 12
) ELSE (
	GOTO 20
)

:20
set jsf=1
cls
echo Files will be written to %assets%%jspath%. 
echo You can change the default JS folder in the settings menu.
echo:
echo Choose action (Default: %jsf%): 
echo:
echo [1] Create JS file
echo: 
echo [F] Change filename (Current: %jsfilename%)
echo [B] Back to main
echo:
set /p jsf=

IF %jsf% EQU 1 GOTO 1024
IF /i %jsf% EQU F GOTO 512
IF /i %jsf% EQU B GOTO 256


:256
call %filespath%\kickstart.bat
GOTO 8


:512
cls
echo Enter filename (Current: %jsfilename%.js):
set /p jsfilename=
goto 20


:1024
cls
echo Creating new JS file ...
IF NOT EXIST %winassets%%winjspath% mkdir %winassets%%winjspath%
set jsfilename=%jsfilename:.js=%
IF EXIST %winassets%%winjspath%%jsfilename%.js (
	GOTO 1088
) ELSE (
	GOTO 1152
)


:1088
set jsoverwrite=2
echo:
echo File %jsfilename% already exists. (Default: %jsoverwrite%)
echo:
echo [1] Overwrite
echo [2] Change filename
echo [3] Back to main
echo:
set /p jsoverwrite=
IF "%jsoverwrite%" EQU "1" GOTO 1152
IF "%jsoverwrite%" EQU "2" GOTO 1536
IF "%jsoverwrite%" EQU "3" GOTO 4096


:1152
echo: > %winassets%%winjspath%%jsfilename%.js
echo File was saved in %assets%%jspath%%jsfilename%.js
GOTO 8192


:1536
echo:
echo Enter new filename (Current: %jsfilename%.js):
set /p jsfilename=
goto :1024


:4096
echo:
echo No file was written because file already exists
GOTO 8192


:8192
set morejs=B
echo:
echo Create another file? (Default: %morejs%)
echo:
echo [Y] Yes
echo:
echo [B] Back to main
echo:
set /p morejs=
IF /i "%morejs%" EQU "Y" (
	morejs=
	GOTO 8
) ELSE (
	GOTO END
)

:END
call %filespath%\kickstart.bat