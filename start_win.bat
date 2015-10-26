@echo off
SETLOCAL

REM Starts the host management terminal for this virtual machine
REM Cy Rossignol <cy@rossignols.me>

REM Exit codes:
SET CYGWIN_NOT_FOUND=1

ECHO ---------------------------------------------------
ECHO Starting Kickboxer VM Host management console...
ECHO ---------------------------------------------------

SET KICKBOXER=%cd%
SET KBHOST=%KICKBOXER%\host
SET KBSHARED=%KICKBOXER%\shared
SET CYGDIR=%KBHOST%\data\cygwin64

CALL %KBHOST%\scripts\find_cygwin.bat
IF %ERRORLEVEL% NEQ 0 (
    ECHO Cannot find Cygwin. Please install Cygwin to continue. >&2
    EXIT /B %CYGWIN_NOT_FOUND%
)

REM At this point, bash should be available. We'll use bash scripts from this
REM point on.

SET CYGUSER=vmhost
SET CYGHOME=/home/%CYGUSER%
SET SHELL=/bin/bash

REM Map the current Windows account to UNIX format
ECHO Setting up user...
%CYGDIR%\bin\bash %KICKBOXER%\host\scripts\map_user.sh

REM Create the environment for the VM Console
ECHO Setting up environment...
%CYGDIR%\bin\bash %KICKBOXER%\host\scripts\setup_environment.sh

REM Start the console
ECHO Starting console...
FOR /F "delims=" %%i in ('%CYGDIR%\bin\cygpath.exe %KICKBOXER%') do set KBCYGDIR=%%i
START /B %CYGDIR%\bin\mintty --config %CYGHOME%/.minttyrc --exec /bin/bash -i -l
