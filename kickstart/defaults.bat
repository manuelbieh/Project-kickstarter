@echo off

if "%filespath%"=="" (set filespath=%windir%\System32)

if "%assets%"=="" (set assets=assets/)
if "%winassets%"=="" (set winassets=%assets:/=\%)
if "%csspath%"=="" (set csspath=css/)
if "%wincsspath%"=="" (set wincsspath=%csspath:/=\%)
if "%jspath%"=="" (set jspath=js/)
if "%winjspath%"=="" (set winjspath=%jspath:/=\%)
if "%imgpath%"=="" (set imgpath=img/)
if "%winimgpath%"=="" (set winimgpath=%imgpath:/=\%)
if "%filename%"=="" (set filename=index.html)
if "%sasspath%"=="" (set sasspath=scss/)
if "%winsasspath%"=="" (set winsasspath=%sasspath:/=\%)
if "%sass%"=="" (set sass=yes)