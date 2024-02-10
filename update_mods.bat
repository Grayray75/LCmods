git reset --hard
git fetch
git pull

@echo off
echo Downloading additional moons...
mkdir ".\_download"

del /s /q ".\BepInEx\plugins\Zingar-Atlas_Abyss\*" >NUL  2>NUL
curl.exe --url "https://gcdn.thunderstore.io/live/repository/packages/Zingar-Atlas_Abyss-1.1.6.zip" --output ".\_download\Zingar-Atlas_Abyss-1.1.6.zip" -C -
tar -xf ".\_download\Zingar-Atlas_Abyss-1.1.6.zip" -C ".\BepInEx\plugins\Zingar-Atlas_Abyss"

del /s /q ".\BepInEx\plugins\Zingar-SecretLabs\*" >NUL  2>NUL
curl.exe --url "https://gcdn.thunderstore.io/live/repository/packages/Zingar-SecretLabs-3.3.5.zip" --output ".\_download\Zingar-SecretLabs-3.3.5.zip" -C -
tar -xf ".\_download\Zingar-SecretLabs-3.3.5.zip" -C ".\BepInEx\plugins\Zingar-SecretLabs"

echo Download complete
pause
@echo on
