@echo off
echo ====================================
echo  Social Media Platform - Setup
echo ====================================
echo.
echo This will compile the project and set up everything.
echo.

cd /d "%~dp0"

call compile.bat

echo.
echo ====================================
echo  Next Steps:
echo ====================================
echo.
echo 1. Make sure MySQL is running
echo 2. Import database_setup.sql into MySQL
echo 3. Run the application using run.bat
echo.
echo Login credentials:
echo   Username: charan
echo   Password: pass@123
echo.
pause
