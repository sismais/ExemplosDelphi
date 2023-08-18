# Este arquivo contém alguns testes de copiar de arquivos com PowerShell. Os testes foram feitos 
# buscando melhorar o tempo de cópia, pois copiando pelo Windows Explorer.


# Copia um arquivo enquanto atualiza uma barra de progresso. 
# A função lê o arquivo em blocos (neste caso, blocos de 4096 bytes) e 
# escreve no arquivo de destino, atualizando a barra de progresso a cada bloco.
function Copy-FileWithProgress {
    param (
        [Parameter(Mandatory=$true)]
        [string]$source,
        [Parameter(Mandatory=$true)]
        [string]$destination
    )

    $bufferSize = 4096
    $buffer = New-Object byte[] $bufferSize
    $totalBytes = (Get-Item $source).length
    $bytesRead = 0

    $sourceStream = [System.IO.File]::OpenRead($source)
    $destinationStream = [System.IO.File]::OpenWrite($destination)

    do {
        $readBytes = $sourceStream.Read($buffer, 0, $bufferSize)
        $destinationStream.Write($buffer, 0, $readBytes)
        $bytesRead += $readBytes

        $progress = @{
            Activity = "Copiando $source"
            Status = "Progresso:"
            PercentComplete = ($bytesRead / $totalBytes) * 100
        }
        Write-Progress @progress
    } while ($readBytes -gt 0)

    $sourceStream.Close()
    $destinationStream.Close()
}

# Copiando os arquivos selecionados e mostrando progresso (mostra progresso individual dos arquivos, mais lento)
# foreach ($index in $indicesToCopy) {
#     if ($index -ge 0 -and $index -lt $files.Length) {
#         $file = $files[$index]
#         Copy-FileWithProgress -source $file -destination "$fullPath\$(Split-Path $file -Leaf)"
#     }
# }

# Copiando os arquivos selecionados e mostrando progresso 
# (função que não mostra progresso individual do arquivo apenas mudan o progresso a cada arquivo copiado completamente)
# Segundo o chat GPT esta forma aqui tem melhor desempenho. Usar se a outra acima se mostrar lenta.
# Nota 2: Em alguns testes, mesmo esta opção se mostrou mais lenta do que copiando e colando pelo Windows Explorer.
#         Explorando isso no ChatGPT ele sugeriu o uso "Robocopy" que se aproxima ao do Windows Explorer.
# foreach ($index in $indicesToCopy) {
#     if ($index -ge 0 -and $index -lt $files.Length) {
#         $file = $files[$index]
#         $progressParam = @{
#             Activity = "Copiando arquivos"
#             Status = "Copiando $file"
#             PercentComplete = (($index + 1) / $indicesToCopy.Length) * 100
#         }
#         Write-Progress @progressParam
#         Copy-Item -Path "$file" -Destination "$fullPath" -Force        
#         Write-Host "Arquivo $file copiado!"
#     }

# }

# Copiando os arquivos selecionados usando Robocopy
# foreach ($index in $indicesToCopy) {
#     if ($index -ge 0 -and $index -lt $files.Length) {
#         $file = $files[$index]
#         # A opção /Z garante que a cópia seja reiniciada em caso de falha de rede, 
#         # e a opção /W:5 faz com que o robocopy espere 5 segundos entre as tentativas de retomada após falhas.
#         robocopy (Split-Path $file) $fullPath (Split-Path $file -Leaf) /Z /W:5
#     }
# }

# Copiando os arquivos selecionados usando Robocopy e mostrando progresso (apenas mostra quantos arquivos copiado e quantos faltam)
# Obs: O robocopy não copiará o arquivo se já existir no destino e for exatamente igual.
# $counter = 0
# foreach ($index in $indicesToCopy) {
#     if ($index -ge 0 -and $index -lt $files.Length) {
#         $file = $files[$index]
        
#         # Capturando o tempo inicial
#         $startTime = Get-Date

#         robocopy (Split-Path $file) $fullPath (Split-Path $file -Leaf) /Z /W:5

#         # Capturando o tempo final e calculando a diferença
#         $endTime = Get-Date
#         $duration = $endTime - $startTime

#         $counter++
#         $progressParam = @{
#             Activity = "Copiando arquivos"
#             Status = "Copiando $file"
#             PercentComplete = ($counter / $indicesToCopy.Length) * 100
#         }
#         Write-Progress @progressParam
#         Write-Host "Arquivo $file copiado em $($duration.TotalSeconds) segundos!"
#     }
# }