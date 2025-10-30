@echo off
echo ====================================
echo  Social Media Platform
echo ====================================
echo.
echo Starting application...
echo.

cd /d "%~dp0"

java -cp "bin;lib/mysql-connector-j-9.3.0.jar" SocialMediaPlatform.Main

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ====================================
    echo  Error running application!
    echo ====================================
    echo.
    echo Please make sure:
    echo 1. You have compiled the project (run compile.bat)
    echo 2. MySQL is running
    echo 3. Database is set up correctly
    echo.
)

pause
