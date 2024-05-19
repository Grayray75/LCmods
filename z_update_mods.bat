:: LCMods update script

echo Resetting and deleting old files...
git reset --hard
cd ".\BepInEx"
git clean -fdx
cd ".."

echo Fetching mod updates...
git fetch
git pull

echo Removing old git data...
:: https://stackoverflow.com/a/46004595
git fetch --depth 1
git branch -d main
git stash drop
git gc

GOTO:DOWNLOAD

:downloadModPackage
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET packageName=%~1
        SET packageVersion=%~2

        ECHO Downloading %packageName% v%packageVersion% ...
        del /s /q ".\BepInEx\plugins\%packageName%\*" >NUL  2>NUL
        curl.exe --url "https://gcdn.thunderstore.io/live/repository/packages/%packageName%-%packageVersion%.zip" --output ".\_download\%packageName%-%packageVersion%.zip" -C -
        tar -xf ".\_download\%packageName%-%packageVersion%.zip" -C ".\BepInEx\plugins\%packageName%"
    ENDLOCAL
EXIT /B 0

:deleteModPackage
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET packageName=%~1
        SET packageVersion=%~2

        ECHO Deleting %packageName% v%packageVersion% ...
        del /s /q ".\BepInEx\plugins\%packageName%\*" >NUL  2>NUL
        del /s /q ".\_download\%packageName%-%packageVersion%.zip" >NUL  2>NUL
    ENDLOCAL
EXIT /B 0

:DOWNLOAD
@echo off

echo Downloading additional moons...
mkdir ".\_download" >NUL  2>NUL

call:deleteModPackage "Evaisa-LethalThings" "0.10.2"
call:deleteModPackage "Piggy-LC_Office" "1.1.23"
call:deleteModPackage "Major_And_Skiz-MoreInteriors" "2.5.0"

call:downloadModPackage "Evaisa-LethalThings" "0.10.4"
call:downloadModPackage "Piggy-LC_Office" "1.1.29"

git reset --hard

echo Download complete
pause
@echo on
