@echo off

if exist %cd%\.project\config.bat call %cd%\.project\config.bat
call %filespath%\kickstart\defaults.bat

:8
cls
echo Please enter the desired filename (you can leave out the .css/.scss suffix):
echo:
GOTO 16

:12
echo:
echo File already exists. Please choose another filename
echo:
GOTO 16

:16
set /p cssfilename=

IF EXIST %winassets%%wincsspath%%cssfilename:.css=%.css (
	GOTO 12
) ELSE (
	GOTO 20
)

:20
set cssf=1
cls
echo Files will be written to %assets%%csspath%. 
echo You can change the default CSS folder in the settings menu.
echo:
IF "%sass%" EQU yes echo Sass/SCSS file will be written automatically
echo:
echo Choose document type (Default: %cssf%): 
echo:
echo [1] CSS file
echo [2] Sass/SCSS file only
echo: 
echo [F] Change filename (Current: %cssfilename%)
echo [B] Back to main
echo:
set /p cssf=

IF %cssf% EQU 1 GOTO 1024
IF %cssf% EQU 2 GOTO 2048
IF /i %cssf% EQU F GOTO 512
IF /i %cssf% EQU B GOTO 256


:256
call %filespath%\kickstart.bat
GOTO 8


:512
cls
echo Enter filename (Current: %cssfilename%.css):
set /p cssfilename=
goto 20


:1024
cls
echo Creating new CSS file ...
IF NOT EXIST %winassets%%wincsspath% mkdir %winassets%%wincsspath%
set cssfilename=%cssfilename:.css=%
set cssfilename=%cssfilename:.scss=%
IF EXIST %winassets%%wincsspath%%cssfilename%.css (
	GOTO 1088
) ELSE (
	GOTO 1152
)


:1088
set cssoverwrite=2
echo:
echo File %cssfilename% already exists. (Default: %cssoverwrite%)
echo:
echo [1] Overwrite
echo [2] Change filename
echo [3] Back to main
echo:
set /p cssoverwrite=
IF "%cssoverwrite%" EQU "1" GOTO 1152
IF "%cssoverwrite%" EQU "2" GOTO 1536
IF "%cssoverwrite%" EQU "3" GOTO 4096


:1152
echo: > %winassets%%wincsspath%%cssfilename%.css
echo File was saved in %assets%%csspath%%cssfilename%.css
IF "%sass%" EQU "yes" (
	GOTO 2048
)
GOTO 8192


:1536
echo:
echo Enter new filename (Current: %cssfilename%.css):
set /p cssfilename=
goto :1024


:2048
echo:
echo Creating new Sass/SCSS file ...
IF NOT EXIST %winassets%%winsasspath% mkdir %winassets%%winsasspath%
set cssfilename=%cssfilename:.css=%
IF EXIST %winassets%%winsasspath%%cssfilename%.scss (
	IF "%cssoverwrite%" EQU "1" (
		GOTO 2176
	) ELSE (
		GOTO 4096
	)
) ELSE (
	GOTO 2176
)


:2176
echo: > %winassets%%winsasspath%%cssfilename%.scss
echo File was saved in %assets%%sasspath%%cssfilename%.scss
GOTO 8192


:4096
echo:
echo No file was written because file already exists
GOTO 8192

:8192
set morecss=B
echo:
echo Create another file? (Default: %morecss%)
echo:
echo [Y] Yes
echo:
echo [B] Back to main
echo:
set /p morecss=
IF /i "%morecss%" EQU "Y" (
	morecss=
	GOTO 8
) ELSE (
	GOTO END
)

:END
call %filespath%\kickstart.bat