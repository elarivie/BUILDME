REM This is an entry point for the file BUILDME
REM The current file:
REM     Should be named "BUILDME.bat"
REM     Should be present in the project root folder
REM The python executable should be in the PATH
python3 -B BUILDME %*
EXIT /B %ERRORLEVEL%

