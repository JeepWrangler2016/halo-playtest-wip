@echo off
setlocal
cd /d "%~dp0"

if not exist "halo.exe" (
    echo halo.exe is missing from this folder.
    pause
    exit /b 1
)

if not exist "SDL3.dll" (
    echo SDL3.dll is missing from this folder.
    pause
    exit /b 1
)

if not exist "assets\maps\ui.map" (
    echo Halo game data is missing: assets\maps\ui.map
    pause
    exit /b 1
)

start "" "%~dp0halo.exe"
endlocal
