# Verificando se HP Wolf Security está instalado
$hpWolfSecurity = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name='HP Wolf Security'"
if ($hpWolfSecurity -eq $null) {
    Write-Output "HP Wolf Security não está instalado. Finalizando o script."
    "Operação concluída, software não estava instalado!" | Out-File -FilePath "C:\temp\removehpwolf.txt"
    exit
}

# Removendo HP Wolf Security
$hpWolfSecurity.Uninstall()

# Verificando se HP Wolf Security - Console está instalado
$hpWolfConsole = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name='HP Wolf Security - Console'"
if ($hpWolfConsole -ne $null) {
    $hpWolfConsole.Uninstall()
}

# Verificando se HP Security Update Service está instalado
$hpSecurityUpdate = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name='HP Security Update Service'"
if ($hpSecurityUpdate -ne $null) {
    $hpSecurityUpdate.Uninstall()
}

Write-Output "Operação concluída!"
"Operação concluída, Wolf removido!" | Out-File -FilePath "C:\temp\removehpwolf.txt"

