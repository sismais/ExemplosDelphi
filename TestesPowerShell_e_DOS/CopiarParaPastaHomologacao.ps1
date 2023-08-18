# Esse arquivo permite copiar facilmente arquivos compilados do MaisSimples para a pasta de Homologação no SDA.
# Script gerado com ajuda do ChatGPT

# Definindo o diretório X
$DIR_X = "\\10.0.0.10\ARQDescartaveis\Homologacao_Sistemas"

# Verificando se o acesso ao diretório X é possível
if (-not (Test-Path $DIR_X)) {
    # Solicitando credenciais para autenticação
    Write-Host "Por favor, forneça as credenciais para acessar $DIR_X"
    $credential = Get-Credential

    # Tentando conectar ao compartilhamento de rede
    net use $DIR_X $credential.GetNetworkCredential().Password /USER:$credential.UserName

    if (-not $?){
        Write-Host "Falha ao conectar ao diretório. Verifique suas credenciais e tente novamente."
        exit
    }
}

# Perguntando sobre o subdiretório
do {
    $SUBDIR = Read-Host "Informe o ID da Tarefa no Jira (apenas o número) MS-"
    if ($SUBDIR.ToUpper() -notlike "MS-*") {
        $SUBDIR = "MS-" + $SUBDIR
    }
} while ($SUBDIR -notlike "MS-*")

# Criando o subdiretório dentro de X
$fullPath = "$DIR_X\$SUBDIR"
if (-not (Test-Path $fullPath -PathType Container)) {
    New-Item -Path $fullPath -ItemType Directory
}

# Definindo a lista de arquivos como um array
$files = @(
    "C:\Sismais\MaisSimples\SERVER\GestaoMaisSimples.exe",
    "C:\Sismais\MaisSimples\VendaMaisSimples.exe",
    "C:\Sismais\MaisSimples\Configurador.exe",
    "C:\Sismais\MaisSimples\SERVER\AtualizadorSismais.exe"
    # Adicione mais arquivos conforme necessário
)

# Listando os arquivos com índices
Write-Host "Arquivos disponíveis para cópia:"
for ($i = 0; $i -lt $files.Length; $i++) {
    Write-Host "$i - $($files[$i])"
}

# Perguntando quais arquivos copiar
$selectedIndices = Read-Host "Informe os IDs dos arquivos que deseja copiar (ex: 0,2)"

# Convertendo a string de índices em um array
$indicesToCopy = $selectedIndices -split ',' | ForEach-Object { [int]$_ }

# Copia os arquivos. (Após testes, uso do "copy" do MS-DOS se mostrou ter melhor desempenho.)
foreach ($index in $indicesToCopy) {
    if ($index -ge 0 -and $index -lt $files.Length) {
        $file = $files[$index]
        
        # Capturando o tempo inicial
        $startTime = Get-Date
    
        Copy-Item "$file" "$fullPath" -Force

        # Capturando o tempo final e calculando a diferença
        $endTime = Get-Date
        $duration = $endTime - $startTime

        $counter++
        $progressParam = @{
            Activity = "Copiando arquivos"
            Status = "Copiando $file"
            PercentComplete = ($counter / $indicesToCopy.Length) * 100
        }
        Write-Progress @progressParam
        Write-Host "Arquivo $file copiado em $($duration.TotalSeconds) segundos!"
    }
}

# Finalizou!
Write-Host "Operação concluída!"

# Pergunta ao usuário
$response = Read-Host "Deseja copiar $fullPath para a área de transferência? (S ou 1 / N)"

if ($response.ToUpper() -eq 'S' -or $response -eq "1") {
    $fullPath | Set-Clipboard
    Write-Host "Caminho copiado para a área de transferência!"
} else {
    # Write-Host "Operação cancelada pelo usuário."
}
