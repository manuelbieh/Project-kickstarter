if not exist %cd%\%winassets%%winjspath% mkdir %cd%\%winassets%%winjspath%
if not exist %cd%\%winassets%%winimgpath% mkdir %cd%\%winassets%%winimgpath%
if not exist %cd%\%winassets%%wincsspath% mkdir %cd%\%winassets%%wincsspath%
if %sass% EQU yes (
	if not exist %cd%\%winassets%%winsasspath% mkdir %cd%\%winassets%%winsasspath%
)

if not exist %cd%\.project (
	mkdir %cd%\.project
	echo Created .project directory
)

if not exist %cd%\.gitignore echo %cd%\.project > .gitignore
echo set assets=%assets%> %cd%\.project/config.bat
echo set winassets=%winassets%> %cd%\.project/config.bat
echo set csspath=%csspath%>> %cd%\.project/config.bat
echo set wincsspath=%wincsspath%>> %cd%\.project/config.bat
echo set jspath=%jspath%>> %cd%\.project/config.bat
echo set winjspath=%winjspath%>> %cd%\.project/config.bat
echo set imgpath=%imgpath%>> %cd%\.project/config.bat
echo set winimgpath=%winimgpath%>> %cd%\.project/config.bat
echo set filename=%filename%>> %cd%\.project/config.bat
echo set sasspath=%sasspath%>> %cd%\.project/config.bat
echo set winsasspath=%winsasspath%>> %cd%\.project/config.bat
echo set sass=%sass%>> %cd%\.project/config.bat

echo Saved project configuration in .project\config.bat
