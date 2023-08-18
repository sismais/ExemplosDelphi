# Capturando o tempo inicial
$startTime = Get-Date

Copy-Item -Path C:\Sismais\MaisSimples\SERVER\GestaoMaisSimples.exe -Destination \\10.0.0.10\ARQDescartaveis\Homologacao_Sistemas -Force -PassThru

# Capturando o tempo final e calculando a diferença
$endTime = Get-Date
$duration = $endTime - $startTime
Write-Host "Arquivo $file copiado em $($duration.TotalSeconds) segundos!"

$response = Read-Host "Copia finalizad! (pressione enter para sair)"
