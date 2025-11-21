@echo off
set "src=%~dp0yourprogram.exe"
set "startup=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

copy "%src%" "%startup%" /Y
