@echo off
set "src=%~dp0inh.exe"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo Copying "%src%" to "%startup%\inh.exe"...
copy "%src%" "%startup%\inh.exe" /Y

if %ERRORLEVEL%==0 (
    echo File copied successfully to Startup.
) else (
    echo Copy failed. Check permissions.
)
