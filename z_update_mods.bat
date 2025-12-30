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
git stash drop
