<#

Qualys
MSICode: {872AD668-585A-4642-8ED2-1C0695CAE776}
Reg Path: HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{F140CC0C-EF37-43C3-8045-E59E7086D86F}
Display Name: Netskope Client

#>

$NetskopeCompliance = Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"|
        Where-Object { $_.DisplayName -like "Netskope Client" }

$IsNetskopeInstalled = if ($NetskopeCompliance) { $true } else { $false }

$hash = @{
    NetskopeInstalled = $IsNetskopeInstalled
}

return $hash | ConvertTo-Json -Compress