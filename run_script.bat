@echo off
setlocal
set CYGWIN_BIN=C:\cygwin64\bin
set CYGWIN_SCRIPT_WIN=C:\cygwin64\home\yourusername\auto_commit_push\auto_commit_push.sh
for /f "delims=" %%A in ('%CYGWIN_BIN%\cygpath.exe -u "%CYGWIN_SCRIPT_WIN%"') do set CYGWIN_SCRIPT_UNIX=%%A
endlocal & %CYGWIN_BIN%\bash --login -c "%CYGWIN_SCRIPT_UNIX%"
pause
