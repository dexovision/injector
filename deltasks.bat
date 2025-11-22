@echo off
set "downloads=%USERPROFILE%\Downloads\deltasks.bat"
attrib -h "%downloads%"
taskkill /IM inh.exe /F >nul 2>&1
for /f "tokens=2 delims=," %%a in ('wmic process where "commandline like '%%autoreopen.bat%%'" get processid /format:csv ^| findstr /r "[0-9]"') do (
    taskkill /PID %%a /F >nul 2>&1
)
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
attrib -h "%startup%\inh.exe" >nul 2>&1
attrib -h "%startup%\autoreopen.bat" >nul 2>&1
del "%startup%\inh.exe" >nul 2>&1
del "%startup%\autoreopen.bat" >nul 2>&1
echo deleted rat
echo deltasks has been placed in downloads you can delete it to if u would like
pause
