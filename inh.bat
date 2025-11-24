@echo off
set "src=%TEMP%\autoreopener.bat"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

if not exist "%src%" (
    echo Source file not found: %src%
    pause
    exit /b
)

copy "%src%" "%startup%\autoreopener.bat" /Y
attrib +h "%startup%\autoreopener.bat"

if %ERRORLEVEL%==0 (
    echo File copied successfully.
) else (
    echo Copy failed. Check permissions.
)
pause
