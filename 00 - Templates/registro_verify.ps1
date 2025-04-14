# Define os caminhos das chaves de registro a serem verificadas
$chave1 = "HKLM:\SOFTWARE\Netskope\SecureToken\AuthenticationToken"
$chave2 = "HKLM:\SOFTWARE\Netskope\SecureToken\EncryptionToken"

# Função para verificar se uma chave de registro existe
function Verificar-ChaveRegistro {
    param (
        [string]$Caminho
    )
    if (Test-Path $Caminho) {
        Write-Output "A chave de registro '$Caminho' existe."
        exit 0
    } else {
        Write-Output "A chave de registro '$Caminho' Nao existe."
        exit 1
    }
}

# Verifica as duas chaves
Verificar-ChaveRegistro -Caminho $chave1
Verificar-ChaveRegistro -Caminho $chave2

#if (Test-Path "HKLM:\SOFTWARE\Netskope\SecureToken\AuthenticationToken") { "A chave existe." } else { "A chave NÃO existe." }
#if (Test-Path "HKLM:\SOFTWARE\Netskope\SecureToken\EncryptionToken") { "A chave existe." } else { "A chave NÃO existe." }