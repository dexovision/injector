@echo off
set "downloads=%USERPROFILE%\Downloads\deltasks.bat"
attrib -h "%downloads%"

taskkill /IM inh.exe /F >nul 2>&1

for /f "tokens=2" %%a in ('tasklist /v /fi "imagename eq cmd.exe" ^| findstr /i "autoreopen.bat"') do (
    taskkill /PID %%a /F >nul 2>&1
)

set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
attrib -h "%startup%\inh.exe" >nul 2>&1
attrib -h "%startup%\autoreopen.bat" >nul 2>&1
del "%startup%\inh.exe" >nul 2>&1
del "%startup%\autoreopen.bat" >nul 2>&1

echo deleted rat
echo deltasks has been placed in downloads you can delete it if u would like
pause
