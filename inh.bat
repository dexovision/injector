@echo off
set "src=%~dp0inh.exe"
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%src%" "%startup%\inh.exe" /Y
