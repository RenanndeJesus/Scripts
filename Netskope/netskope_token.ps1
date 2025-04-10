# Desabilita a exibição de saída no console
$ErrorActionPreference = "Stop"

# Navega até o diretório do STAgent
#Set-Location -Path "C:\Program Files (x86)\Netskope\STAgent"

# Executa o comando nsdiag com os tokens fornecidos
Start-Process -FilePath "C:\Program Files (x86)\Netskope\STAgent\nsdiag.exe" -ArgumentList "-e enrollauthtoken=0aab817ac8ba76b520c1fe128b247bc6 enrollencryptiontoken=0aab817ac8ba76b520c1fe128b247bc6" -NoNewWindow -Wait

# Aguarda 30 segundos
Start-Sleep -Seconds 30

# Sai do script
exit 0