@echo off
setlocal
set "APP_DIR=%~dp0"

powershell.exe -NoProfile -Command "$desktop=if($env:HALO_PLAYTEST_DESKTOP){$env:HALO_PLAYTEST_DESKTOP}else{[Environment]::GetFolderPath('Desktop')}; New-Item -ItemType Directory -Force -Path $desktop | Out-Null; $shell=New-Object -ComObject WScript.Shell; $link=$shell.CreateShortcut((Join-Path $desktop 'Halo CE Playtest.lnk')); $link.TargetPath=(Join-Path $env:APP_DIR 'Play Halo CE Playtest.cmd'); $link.WorkingDirectory=$env:APP_DIR; $link.IconLocation=(Join-Path $env:APP_DIR 'halo.exe') + ',0'; $link.Description='Halo CE Playtest'; $link.Save()"

if errorlevel 1 (
    echo.
    echo Could not create the desktop shortcut.
    pause
    exit /b 1
)

echo.
echo Desktop shortcut created: Halo CE Playtest
pause
endlocal
