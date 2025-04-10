# Define o caminho do registro para a configuração de AutoRecuperação no Excel
$regPath = "HKCU:\Software\Microsoft\Office\16.0\Excel\Options"

# Verifica se o caminho do registro existe
if (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Define os valores de AutoRecuperação como 0 (desativado)
Set-ItemProperty -Path $regPath -Name "AutoRecover" -Value 0
Set-ItemProperty -Path $regPath -Name "AutoRecoverEnabled" -Value 0
Set-ItemProperty -Path $regPath -Name "KeepUnsavedChanges" -Value 0

Write-Output "AutoRecuperação desativada com sucesso no Excel."