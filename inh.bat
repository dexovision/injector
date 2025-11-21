@echo off
echo BAT is running from: %~dp0
echo Checking for EXE at:  %~dp0inh.exe

if exist "%~dp0inh.exe" (
    echo FOUND => copying...
) else (
    echo NOT FOUND => copy will fail
)

pause
