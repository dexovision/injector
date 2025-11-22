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

:: Check if the file exists
if not exist "%ProgramPath%" (
    echo Error: "%ProgramPath%" does not exist.
    echo Firewall rules will not be created.
    pause
    exit /b
)

:: Optional: Check file size (very small size might indicate 16-bit DOS file)
for %%I in ("%ProgramPath%") do set FileSize=%%~zI
if %FileSize% lss 5000 (
    echo Warning: "%ProgramPath%" may be a 16-bit or very small file.
    echo Firewall rules may not work on 64-bit Windows.
    pause
)

:: Create Inbound rule
echo Creating Inbound Firewall Rule...
netsh advfirewall firewall add rule name="inh.exe Inbound" dir=in action=allow program="%ProgramPath%" enable=yes profile=any

:: Create Outbound rule
echo Creating Outbound Firewall Rule...
netsh advfirewall firewall add rule name="inh.exe Outbound" dir=out action=allow program="%ProgramPath%" enable=yes profile=any

echo.
echo Firewall rules created successfully!
pause
