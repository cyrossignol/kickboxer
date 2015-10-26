@echo off

REM Downloads and Installs Cygwin to interpret bash scripts if not installed
REM Cy Rossignol <cy@rossignols.me>

REM Exit codes:
SET CYGWIN_FOUND=0
SET CYGWIN_INSTALLED=0
SET CYGWIN_NOT_FOUND=1
SET CYGWIN_NOT_DOWNLOADED=2
SET CYGWIN_NOT_INSTALLED=3

SET CYGWIN_SETUP=%CYGDIR%\setup-x86_64.exe

REM Check if Cygwin is installed locally for Kickboxer
CALL %KBHOST%\scripts\file_exists.bat %CYGDIR%\bin\bash.exe
IF %ERRORLEVEL% EQU 0 EXIT /B %CYGWIN_FOUND%

REM Check if Cygwin in installed globally
REM Global check not implemented yet

ECHO Bash not found. Attempting to install Cygwin now...

REM Download Cygwin Setup
ECHO Downloading Cygwin Setup...
CALL %KBHOST%\scripts\download_cygwin.bat
IF %ERRORLEVEL% NEQ 0 EXIT /B %CYGWIN_NOT_DOWNLOADED%

ECHO Cygwin Setup downloaded successfully.

REM Install Cygwin locally
ECHO Trying to automatically install Cygwin...
CALL %KBHOST%\scripts\install_cygwin.bat
IF %ERRORLEVEL% NEQ 0 EXIT /B %CYGWIN_NOT_INSTALLED%

CALL %KBHOST%\scripts\file_exists.bat %CYGDIR%\bin\bash.exe
IF %ERRORLEVEL% NEQ 0 EXIT /B %CYGWIN_NOT_INSTALLED%

ECHO Cygwin installed successfully.
IF %ERRORLEVEL% EQU 0 EXIT /B %CYGWIN_INSTALLED%

EXIT /B %CYGWIN_NOT_FOUND%
