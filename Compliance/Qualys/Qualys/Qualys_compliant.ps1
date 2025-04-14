<#

Qualys
MSICode: {872AD668-585A-4642-8ED2-1C0695CAE776}
Reg Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{872AD668-585A-4642-8ED2-1C0695CAE776}
Display Name: Qualys Cloud Security Agent

#>

$QualysCompliance = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"|
        Where-Object { $_.DisplayName -like "Qualys Cloud Security Agent" }

$IsQualysInstalled = if ($QualysCompliance) { $true } else { $false }

$hash = @{
    QualysInstalled = $IsQualysInstalled
}

return $hash | ConvertTo-Json -Compress