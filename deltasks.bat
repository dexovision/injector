@echo off
set "downloads=%USERPROFILE%\Downloads\deltasks.bat"
attrib -h "%downloads%"
taskkill /IM inh.exe /F >nul 2>&1
taskkill /IM cmd.exe /FI "WINDOWTITLE eq autoreopen*" /F >nul 2>&1
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
attrib -h "%startup%\inh.exe" >nul 2>&1
attrib -h "%startup%\autoreopen.bat" >nul 2>&1
del "%startup%\inh.exe" >nul 2>&1
del "%startup%\autoreopen.bat" >nul 2>&1
echo deleted rat
echo deltasks is now shown in downloads; it deleted the rat you can uninstall it aswell if u wish
pause
