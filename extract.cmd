@echo off
SET x=%~dp0
color 0A
echo Welcome to the CM1ner installer.
echo This installer will download and save the miner.
echo It will save in \Load.
echo Double click start.cmd to run the miner.
pause
wget -O dl.zip -i %x%lnk.txt --no-check-certificate
powershell Expand-Archive -Force %x%dl.zip %x%
cls
color 0E
echo The miner is now downloaded in the \Load folder. Run start.cmd from there
del /F dl.zip
pause