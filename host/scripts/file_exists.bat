@echo off

REM Determine if a file exists
REM Cy Rossignol <cy@rossignols.me>

REM Exit codes:
SET FILE_EXISTS=0
SET FILE_NOT_FOUND=1

REM Exit with successful return code if file exists
FOR %%i IN (%1) DO IF EXIST %%~si EXIT /B %FILE_EXISTS%

EXIT /B %FILE_NOT_FOUND%
