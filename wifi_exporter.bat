@echo off
setlocal enabledelayedexpansion

:: WiFi Password Exporter for Windows 11
:: This script exports all saved WiFi passwords to a text file

title WiFi Password Exporter

echo.
echo =====================================================
echo          WiFi Password Exporter
echo =====================================================
echo.

:: Ask for output directory
echo Enter the directory path where you want to save the file
echo (Press Enter to use current directory: %cd%)
echo.
set /p "outputDir=Directory path: "

:: If no input, use current directory
if "%outputDir%"=="" (
    set "outputDir=%cd%"
    echo Using current directory: !outputDir!
) else (
    :: Remove trailing backslash if present
    if "!outputDir:~-1!"=="\" set "outputDir=!outputDir:~0,-1!"
    
    :: Check if directory exists
    if not exist "!outputDir!" (
        echo.
        echo ERROR: Directory does not exist!
        echo Creating directory: !outputDir!
        mkdir "!outputDir!" 2>nul
        if errorlevel 1 (
            echo ERROR: Could not create directory. Using current directory instead.
            set "outputDir=%cd%"
        )
    )
)

:: Set output file path
set "outputFile=!outputDir!\WiFi_Passwords.txt"

echo.
echo Exporting WiFi passwords to: !outputFile!
echo Please wait...
echo.

:: Create output file with header
echo WiFi Networks and Passwords > "!outputFile!"
echo ================================================== >> "!outputFile!"
echo Export Date: %date% %time% >> "!outputFile!"
echo ================================================== >> "!outputFile!"
echo. >> "!outputFile!"

:: Get all WiFi profiles and count
set count=0

for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set /a count+=1
    set "profile=%%a"
    
    :: Trim leading spaces
    for /f "tokens=* delims= " %%b in ("!profile!") do set "profile=%%b"
    
    echo Processing: !profile!
    
    :: Get password for this profile
    set "password="
    for /f "tokens=2 delims=:" %%c in ('netsh wlan show profile name^="!profile!" key^=clear ^| findstr "Key Content"') do (
        set "password=%%c"
    )
    
    :: Trim leading spaces from password
    if defined password (
        for /f "tokens=* delims= " %%d in ("!password!") do set "password=%%d"
    )
    
    :: If no password found
    if "!password!"=="" (
        set "password=(No password / Open network)"
    )
    
    :: Write to file
    echo Network Name: !profile! >> "!outputFile!"
    echo Password: !password! >> "!outputFile!"
    echo -------------------------------------------------- >> "!outputFile!"
    echo. >> "!outputFile!"
)

:: Write summary
echo. >> "!outputFile!"
echo ================================================== >> "!outputFile!"
echo Total Networks Found: !count! >> "!outputFile!"
echo ================================================== >> "!outputFile!"

:: Display completion message
echo.
echo =====================================================
echo   Export Complete!
echo =====================================================
echo.
echo File saved to: !outputFile!
echo Total networks found: !count!
echo.
echo Press any key to exit...
pause >nul