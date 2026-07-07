@echo off
rem Abre o nfse-downloader.html num Chrome/Edge dedicado, com a seguranca de
rem origem (CORS) desativada SOMENTE nesse perfil separado. Sem isso o
rem navegador bloqueia a leitura das respostas da API adn.nfse.gov.br.
rem O perfil dedicado tambem guarda o localStorage (cursor NSU) da pagina.

setlocal
set "PROFILE=%LOCALAPPDATA%\NFSeDownloaderProfile"
set "HTML=%~dp0nfse-downloader.html"

if not exist "%HTML%" (
  echo Nao encontrei nfse-downloader.html ao lado deste .bat.
  pause
  exit /b 1
)

set "BROWSER="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

if not defined BROWSER (
  echo Nao encontrei o Chrome nem o Edge instalados.
  pause
  exit /b 1
)

start "" "%BROWSER%" --disable-web-security --user-data-dir="%PROFILE%" --no-first-run --new-window "%HTML%"
endlocal
