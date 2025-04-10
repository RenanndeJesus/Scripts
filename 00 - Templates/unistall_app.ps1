# Script PowerShell para desinstalar o Dell Optimizer

# Verifica se o Dell Optimizer está instalado
$programName = "Dell Optimizer"

$installedApp = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "$programName" }

if ($installedApp) {
    Write-Host "Encontrado: $($installedApp.Name). Iniciando a desinstalação..." -ForegroundColor Yellow
    
    try {
        $installedApp.Uninstall()
        Write-Host "Dell Optimizer desinstalado com sucesso!" -ForegroundColor Green
    }
    catch {
        Write-Host "Erro durante a desinstalação: $_" -ForegroundColor Red
    }
}
else {
    Write-Host "Dell Optimizer não está instalado neste sistema." -ForegroundColor Cyan
}