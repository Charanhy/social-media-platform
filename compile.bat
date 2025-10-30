@echo off
echo ====================================
echo  Compiling Social Media Platform
echo ====================================
echo.

cd /d "%~dp0"

echo Cleaning bin directory...
if exist bin rmdir /s /q bin
mkdir bin

echo.
echo Compiling Java files...
javac -cp "lib/mysql-connector-j-9.3.0.jar;src" -d bin src/SocialMediaPlatform/Main.java src/Model/*.java src/View/*.java src/Controller/*.java

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ====================================
    echo  Compilation Successful! ✓
    echo ====================================
    echo.
    echo You can now run the application using run.bat
) else (
    echo.
    echo ====================================
    echo  Compilation Failed! ✗
    echo ====================================
    echo Please check the error messages above.
)

echo.
pause
