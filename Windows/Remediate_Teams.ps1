# Script para baixar e desinstalar o Microsoft Teams usando o Teams Bootstrapper

# URL do Teams Bootstrapper
$bootstrapperUrl = "https://go.microsoft.com/fwlink/?linkid=2243204&clcid=0x409"
# Caminho para salvar o Teams Bootstrapper
$bootstrapperPath = "$env:TEMP\TeamsBootstrapper.exe"

# Função para baixar o Teams Bootstrapper
function Download-TeamsBootstrapper {
    try {
        Write-Output "Baixando o Teams Bootstrapper..."
        Invoke-WebRequest -Uri $bootstrapperUrl -OutFile $bootstrapperPath
        Write-Output "Download concluído."
    } catch {
        Write-Error "Ocorreu um erro ao baixar o Teams Bootstrapper: $_"
        Exit 1
    }
}

# Função para desinstalar o Microsoft Teams
function Uninstall-Teams {
    if (Test-Path $bootstrapperPath) {
        try {
            Write-Output "Desinstalando o Microsoft Teams..."
            Start-Process -FilePath $bootstrapperPath -ArgumentList "-x" -Wait -NoNewWindow
            Write-Output "Microsoft Teams foi desinstalado com sucesso."
        } catch {
            Write-Error "Ocorreu um erro ao tentar desinstalar o Microsoft Teams: $_"
        }
    } else {
        Write-Error "O Teams Bootstrapper não foi encontrado no caminho especificado: $bootstrapperPath"
    }
}

# Executa as funções
Download-TeamsBootstrapper
Uninstall-Teams
stop-process -name "ms-teams" -Force
Exit 0