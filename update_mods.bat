git reset --hard
git fetch
git pull

GOTO:DOWNLOAD

:downloadModPackage
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET packageName=%~1
        SET packageVersion=%~2

        ECHO "Downloading %packageName% v%packageVersion%"
        del /s /q ".\BepInEx\plugins\%packageName%\*" >NUL  2>NUL
        curl.exe --url "https://gcdn.thunderstore.io/live/repository/packages/%packageName%-%packageVersion%.zip" --output ".\_download\%packageName%-%packageVersion%.zip" -C -
        tar -xf ".\_download\%packageName%-%packageVersion%.zip" -C ".\BepInEx\plugins\%packageName%"
    ENDLOCAL
EXIT /B 0

:DOWNLOAD
@echo off
echo Downloading additional moons...
mkdir ".\_download"

call:downloadModPackage "KayNetsua-E_Gypt_Moon" "2.0.15"
call:downloadModPackage "sfDesat-Orion" "2.0.1"
call:downloadModPackage "Tolian-Celestria" "0.4.8"
call:downloadModPackage "Tolian-EchoReach" "0.2.3"
call:downloadModPackage "Tolian-Maritopia" "0.3.8"
call:downloadModPackage "Tolian-PsychSanctum" "0.1.5"
call:downloadModPackage "Zingar-Atlas_Abyss" "1.1.8"
call:downloadModPackage "Zingar-SecretLabs" "3.3.7"

echo Download complete
pause
@echo on
