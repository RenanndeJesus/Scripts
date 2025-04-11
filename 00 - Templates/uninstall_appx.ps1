##################################
# Remover APPX #
##################################

# Verificar se o Dell Optimizer está instalado como APPX
$AppxPackageName = "Microsoft.Copilot" # Nome do pacote APPX
$AppxPackage = Get-AppxPackage -AllUsers | Where-Object { $_.Name -like "*$AppxPackageName*" }

if ($null -ne $AppxPackage) {
    Write-Host "Vincular ao Celular encontrado como APPX. Iniciando desinstalação..." -ForegroundColor Yellow

    try {
        # Remover o pacote APPX
        Remove-AppxPackage -Package $AppxPackage.PackageFullName -AllUsers -ErrorAction Stop
        Write-Host "Vincular ao Celular (APPX) desinstalado com sucesso." -ForegroundColor Green
    } catch {
        Write-Host "Falha ao desinstalar o Vincular ao Celular (APPX): $_" -ForegroundColor Red
    }
} else {
    Write-Host "Vincular ao Celular não encontrado como APPX." -ForegroundColor Cyan
}
Exit 0