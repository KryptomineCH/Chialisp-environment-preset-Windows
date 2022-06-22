@echo off
:: Set shell Title
for %%I in (.) do set CurrDirName=%%~nxI
title %CurrDirName% - venv
:: move to powershell and start virtual environment
PowerShell -NoExit "venv\Scripts\activate"