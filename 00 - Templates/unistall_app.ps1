# Script PowerShell para desinstalar o Vincular ao Celular

# Verifica se o Vincular ao Celular está instalado
$programName = "Vincular ao Celular"

$installedApp = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "$programName" }

if ($installedApp) {
    Write-Host "Encontrado: $($installedApp.Name). Iniciando a desinstalação..." -ForegroundColor Yellow
    
    try {
        $installedApp.Uninstall()
        Write-Host "Vincular ao Celular desinstalado com sucesso!" -ForegroundColor Green
    }
    catch {
        Write-Host "Erro durante a desinstalação: $_" -ForegroundColor Red
    }
}
else {
    Write-Host "Vincular ao Celular não está instalado neste sistema." -ForegroundColor Cyan
}