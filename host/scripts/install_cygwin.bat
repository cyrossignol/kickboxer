@echo off

REM Installs Cygwin with a minimal package requirement for Kickboxer
REM Cy Rossignol <cy@rossignols.me>

REM Exit codes:
SET CYGWIN_INSTALLED=0
SET CYGWIN_NOT_INSTALLED=1

CD %CYGDIR%

%CYGWIN_SETUP% --quiet-mode --no-admin --no-shortcuts ^
--site http://mirrors.kernel.org/sourceware/cygwin/ ^
--site rsync://mirrors.kernel.org/sourceware/cygwin/ ^
--root %CYGDIR% ^
--local-package-dir %CYGDIR%\packages ^
--categories Base ^
--packages git openssh >nul

IF %ERRORLEVEL% EQU 0 EXIT /B %CYGWIN_INSTALLED%
EXIT /B %CYGWIN_NOT_INSTALLED%
