<#
Check Teams Installed
Descricao: Este script ira fazer uma varredura para tentar localizar o Teams instalado no dispositivo. O formato
sera APPX, pois, a versao moderna do Teams nao precisa de credenciais administrativas para instalar.
#>

$APPX1 = Get-AppxPackage -AllUsers *teams*
$Name = "MSTeams"
$installed = $APPX1 | Where-Object { $_.Name -eq $Name }

# Início do script
If (-Not $installed) {
    Write-Host "Microsoft Teams não está instalado."
    Exit 0
} else {
    Write-Host "Microsoft Teams está instalado."
    Exit 1
}