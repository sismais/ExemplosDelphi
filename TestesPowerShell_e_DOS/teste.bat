@echo off
setlocal enabledelayedexpansion

REM Definindo os caminhos de origem e destino
set SOURCE_PATH=C:\Sismais\MaisSimples\SERVER\GestaoMaisSimples.exe
set DEST_PATH=\\10.0.0.10\ARQDescartaveis\Homologacao_Sistemas\GestaoMaisSimples.exe

REM Capturando a hora de início
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /a "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

REM Copiando o arquivo
copy "%SOURCE_PATH%" "%DEST_PATH%"

REM Capturando a hora de término
for /f "tokens=1-4 delims=:.," %%a in ("%time%") do (
    set /a "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

REM Calculando a diferença de tempo
set /a elapsed=end-start

REM Exibindo o tempo que levou para copiar
echo A cópia levou !elapsed! milissegundos.

endlocal
