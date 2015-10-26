@echo off

REM Downloads Cygwin
REM Cy Rossignol <cy@rossignols.me>

REM Exit codes:
SET CYGWIN_DOWNLOADED=0
SET CYGWIN_NOT_DOWNLOADED=1

set CYGWIN_URL=https://cygwin.com/setup-x86_64.exe

REM Make sure the download folder exists
IF NOT EXIST %CYGDIR%\NUL MKDIR %CYGDIR%

REM Make sure the download folder exists
IF EXIST %CYGWIN_SETUP% EXIT /B %CYGWIN_DOWNLOADED%

REM Attempt to download Cygwin using Windows PowerShell
POWERSHELL -Command "(New-Object Net.WebClient).DownloadFile('%CYGWIN_URL%', '%CYGDIR%\setup-x86_64.exe')"

REM Attempt to download Cygwin using bitsadmin.exe (DEPRECATED in Windows 7+)
REM BITSADMIN /TRANSFER "cygwin" %CYGWIN_URL% %CYGDIR%

IF %ERRORLEVEL% EQU 0 EXIT /B %CYGWIN_DOWNLOADED%

ECHO Could not download Cygwin. >&2
EXIT /B %CYGWIN_NOT_DOWNLOADED%
