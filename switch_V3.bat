@echo off
echo Deleting old folders and files...

del /s /q ".\_download\*" >NUL  2>NUL
rmdir /s /q ".\_download"

del /s /q ".\BepInEx\*" >NUL  2>NUL
rmdir /s /q ".\BepInEx"

git fetch --all
git reset --hard

git checkout V3
git pull
git reset --hard

pause
@echo on
