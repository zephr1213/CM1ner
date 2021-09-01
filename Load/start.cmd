@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
color E0
echo Welcome to CM1ner
ping localhost -n 3 > nul
cls
echo Loading
ping localhost -n 3 > nul
cls
echo Loading.
ping localhost -n 3 > nul
cls
echo Loading..
ping localhost -n 3 > nul
cls
echo Loading...
ping localhost -n 3 > nul
cls
SET /P type=Coin(To mine monero put M. To mine other coins put O): 
if type == M goto Monero
if type == O goto other
:monero
cls
SET /P url=Mining URL: 
SET /P uname=Username: 
xmrig.exe -o %url% -u %uname%
goto end
:other
cls
SET /P url=Mining URL: 
SET /P algo=Algorithm: 
SET /P user=Username: 
ping localhost -n 3 > nul
cls
echo Set!
ping localhost -n 3 > nul
cls
echo Starting Miner.
ping localhost -n 3 > nul
cls
echo Started
ping localhost -n 3 > nul
minerd --algo %algo% --url %url% --user %user%
goto end
:end