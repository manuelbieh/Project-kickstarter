@echo off
cls
IF EXIST %cd%\.project\config.bat (
	call %cd%\.project\config.bat
	set workdir=.
)
IF EXIST %cd%\config.bat (
	call %cd%\config.bat
	set workdir=./..
)

IF %sass% == yes (
	IF %csspath% NEQ "" (
		sass --scss --watch %workdir%/%assets%%sasspath:~0,-1%:%workdir%/%assets%%csspath:~0,-1%
	)
)