@echo off
REM 2014/03/31 sunsd
setlocal enabledelayedexpansion
ver
set tms=!time:~0,8!
echo [%tms%]

if x%3==x ( echo usage: install.bat [DestDir] [SrcDir] [FileList] 
  echo e.g.: install.bat \\10.2.1.42\Share\Release D:\Windows\ D:\windows\r.ini
  goto end
)
set dest=%1
set src=%2
set list=%3

if exist z:\ net use /delete z: 
if errorlevel 1 ( echo Disconnect Z: failed.
  goto end
)
for %%a in (echo call) do %%a net use z: %dest% /persistent:no
cd /d z:
if %errorlevel% equ 0 set dest=.
goto install

:end
set tme=!time:~0,8!
echo [%tme%]
set /a uptime=%tme:~0,2%*60+%tme:~3,2%-%tms:~0,2%*60-%tms:~3,2%
if %tme:~6,2% gtr %tms:~6,2% set /a uptime+=1
echo Cost %uptime% minutes.
pause
exit

:install
echo Installing...
set /a count=0
for /F "usebackq eol=; tokens=1 " %%a in (%list%) do (
  if exist %src%\%%a ( echo %%a
    echo f | xcopy %src%\%%a %dest%\%%a /d /e /i /y 1>nul
    set /a count+=1
  ) else ( echo %%a -- NOT exist.
  )
)
echo.
echo !count! files installed.
goto end