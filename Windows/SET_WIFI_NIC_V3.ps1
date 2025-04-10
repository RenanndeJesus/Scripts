$scriptname = "Config Wlan Card"
$logspath = "$($env:SystemDrive)\GB\SCCMLogsDC"


if (!(test-path $logspath\$scriptname))
{
    New-Item -Path $logspath\$scriptname -ItemType "directory"
}


$adapterlookup = Get-NetAdapter #| select *

foreach ($interface in ($adapterlookup)){

if ($interface.InterfaceDescription -eq "Intel(R) Wi-Fi 6 AX201 160MHz" -or $interface.InterfaceDescription -eq "Intel(R) Wi-Fi 6 AX200 160MHz" -or $interface.InterfaceDescription -eq "Intel(R) Wi-Fi 6E AX211 160MHz")
{

Write-Host "Dell 5420 ou Dell 5430 ou Dell 5440 ou Dell Optiplex 3080 ou Lenovo T14"
write-host "Encontrado" $interface.InterfaceDescription
$date = get-date -Format ("dd/MM/yyyy HH:mm:ss")
$date2 = get-date -Format ("ddMMyyyyHHmmss")

Write-Host "Gravando em texto a configuração inicial da placa"
if (!(test-path "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)"))
{
    New-Item -Path "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)" -ItemType "directory"
}

"Configuração INICIAL de $($interface.InterfaceDescription) em $date no computador $((get-wmiobject win32_computersystem).Name)" | Out-File  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Inicial.txt"
Get-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription | select Displayname, <#DisplayValue#>@{Name="Valor inicial"; Expression={$_.DisplayValue}} <#"Valor Final" |convertto-csv -Delimiter "," -NoTypeInformation#>| sort-object DisplayName | Out-File -Append  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Inicial.txt"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Roaming Aggressiveness" -DisplayValue "5. Highest"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Agressividade de roaming" -DisplayValue "5. Mais alto"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Preferred Band" -DisplayValue "3. Prefer 5GHz Band"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Banda Preferencial" -DisplayValue "3. Preferir banda de 5 GHz"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Transmit Power" -DisplayValue "5. Highest"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Potência de transmissão" -DisplayValue "5. Mais alto"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Channel Width for 2.4GHz" -DisplayValue "20 MHz Only"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Largura do canal para 2,4 GHz" -DisplayValue "20 MHz"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Channel Width for 5GHz" -DisplayValue "Auto"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Largura do canal para 5 GHz" -DisplayValue "Auto"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "802.11a/b/g Wireless Mode" -DisplayValue "5. Dual Band 802.11a/g"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Modo sem fio 802.11a/b/g" -DisplayValue "5. Banda Dupla 802.11a/g" 

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "802.11n/ac/ax Wireless Mode" -DisplayValue "4. 802.11ax"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Modo sem fio 802.11n/ac/ax" -DisplayValue "4. 802.11ax"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "MIMO Power Save Mode" -DisplayValue "No SMPS"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "MIMO - Modo de Economia de Energia" -DisplayValue "Sem SMPS"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Throughput Booster" -DisplayValue "Disabled"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Impulsionador do throughput" -DisplayValue "Desabilitado"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "U-APSD support" -DisplayValue "Disabled"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Suporte para U-APSD" -DisplayValue "Desabilitado"

"Configuração FINAL de $($interface.InterfaceDescription) em $date no computador $((get-wmiobject win32_computersystem).Name)" | Out-File  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Final.txt"
Get-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription | select Displayname, <#DisplayValue#>@{Name="Valor Final"; Expression={$_.DisplayValue}}<# "Valor Final" |convertto-csv -Delimiter "," -NoTypeInformation#>| sort-object DisplayName | Out-File -Append  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Final.txt"

}

if ($interface.InterfaceDescription -eq "Intel(R) Dual Band Wireless-AC 8260" -or $interface.InterfaceDescription -eq "Intel(R) Dual Band Wireless-AC 8265" -or $interface.InterfaceDescription -eq "Intel(R) Wireless-AC 9560")
{
Write-Host "Dell Optiplex 3040, 3050 ou 3070"
write-host "Encontrado" $interface.InterfaceDescription
$date = get-date -Format ("dd/MM/yyyy HH:mm:ss")
$date2 = get-date -Format ("ddMMyyyyHHmmss")

Write-Host "Gravando em texto a configuração inicial da placa"
if (!(test-path "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)"))
{
    New-Item -Path "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)" -ItemType "directory"
}

"Configuração INICIAL de $($interface.InterfaceDescription) em $date no computador $((get-wmiobject win32_computersystem).Name)" | Out-File  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Inicial.txt"
Get-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription | select Displayname, <#DisplayValue#>@{Name="Valor inicial"; Expression={$_.DisplayValue}} <#"Valor Final" |convertto-csv -Delimiter "," -NoTypeInformation#>| sort-object DisplayName | Out-File -Append  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Inicial.txt"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "802.11a/b/g Wireless Mode" -DisplayValue "5. Dual Band 802.11a/g"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Modo sem fio 802.11a/b/g" -DisplayValue "5. Banda Dupla 802.11a/g" 

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Channel Width for 2.4GHz" -DisplayValue "20 MHz Only"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Largura do canal para 2,4 GHz" -DisplayValue "20 MHz"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Channel Width for 5GHz" -DisplayValue "Auto"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Largura do canal para 5 GHz" -DisplayValue "Auto"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "MIMO Power Save Mode" -DisplayValue "No SMPS"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "MIMO - Modo de Economia de Energia" -DisplayValue "Sem SMPS"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Preferred Band" -DisplayValue "3. Prefer 5GHz Band"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Banda Preferencial" -DisplayValue "3. Preferir banda de 5 GHz"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Roaming Aggressiveness" -DisplayValue "5. Highest"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Agressividade de roaming" -DisplayValue "5. Mais alto"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Transmit Power" -DisplayValue "5. Highest"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Potência de transmissão" -DisplayValue "5. Mais alto"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Throughput Booster" -DisplayValue "Disabled"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Impulsionador do throughput" -DisplayValue "Desabilitado"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "U-APSD support" -DisplayValue "Disabled"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Suporte para U-APSD" -DisplayValue "Desabilitado"

"Configuração FINAL de $($interface.InterfaceDescription) em $date no computador $((get-wmiobject win32_computersystem).Name)" | Out-File  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Final.txt"
Get-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription | select Displayname, <#DisplayValue#>@{Name="Valor Final"; Expression={$_.DisplayValue}}<# "Valor Final" |convertto-csv -Delimiter "," -NoTypeInformation#>| sort-object DisplayName | Out-File -Append  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Final.txt"

}

if ($interface.InterfaceDescription -eq "Qualcomm QCA61x4A 802.11ac Wireless Adapter")
{
Write-Host "Dell Optiplex 3060"
write-host "Encontrado" $interface.InterfaceDescription
$date = get-date -Format ("dd/MM/yyyy HH:mm:ss")
$date2 = get-date -Format ("ddMMyyyyHHmmss")

Write-Host "Gravando em texto a configuração inicial da placa"
if (!(test-path "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)"))
{
    New-Item -Path "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)" -ItemType "directory"
}


"Configuração INICIAL de $($interface.InterfaceDescription) em $date no computador $((get-wmiobject win32_computersystem).Name)" | Out-File  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Inicial.txt"
Get-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription | select Displayname, <#DisplayValue#>@{Name="Valor inicial"; Expression={$_.DisplayValue}} <#"Valor Final" |convertto-csv -Delimiter "," -NoTypeInformation#>| sort-object DisplayName | Out-File -Append  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Inicial.txt"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "D0 PacketCoalescing" -DisplayValue "Disable"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Network Address" -DisplayValue "--"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Roaming aggressiveness" -DisplayValue "5.Highest"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Dynamic MIMO Power Save" -DisplayValue "Disable"

Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Preferred Band" -DisplayValue "3 - Prefer 5Ghz Band"
Set-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription -DisplayName "Wireless Mode" -DisplayValue "11 - 11 a/g/n/ac"

"Configuração FINAL de $($interface.InterfaceDescription) em $date no computador $((get-wmiobject win32_computersystem).Name)" | Out-File  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Final.txt"
Get-NetAdapterAdvancedProperty -InterfaceDescription $interface.InterfaceDescription | select Displayname, <#DisplayValue#>@{Name="Valor Final"; Expression={$_.DisplayValue}}<# "Valor Final" |convertto-csv -Delimiter "," -NoTypeInformation#>| sort-object DisplayName | Out-File -Append  "$logspath\$scriptname\$((get-wmiobject win32_computersystem).model)\$date2\$($interface.InterfaceDescription)\$($interface.InterfaceDescription)Final.txt"
 
}


} 

# SIG # Begin signature block
# MIIFVQYJKoZIhvcNAQcCoIIFRjCCBUICAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUqCaS5oiw0oTvZTNoQ8AZ4vkk
# LpugggL4MIIC9DCCAdygAwIBAgIQeSxYPrWZYa1GHoOo5PvHyDANBgkqhkiG9w0B
# AQUFADASMRAwDgYDVQQDDAdHQl9Db3JwMB4XDTIyMDUxNjE5MDkzNloXDTIzMDUx
# NjE5MjkzNlowEjEQMA4GA1UEAwwHR0JfQ29ycDCCASIwDQYJKoZIhvcNAQEBBQAD
# ggEPADCCAQoCggEBAM4sC/4ZfuVVzXEsTLzT8DRoxSO9M2xQRTIHxTNTcNeRd6+A
# sYakvB2FgsWr4F0pHLuvuDvODzor6aCqnMXZJG0bKjzR28NpnCqEzDXrgEvYJxyg
# Xxcxh4F1SPD53e8x+dBPvD9b3UGZ3NOdyCdvgmd92tteznDjDrLzbwRhAJc6dl+O
# Vxtx9wU0F0aK2md/3/TOuAHLUZSNinCPKAl/JwpMjy2rkN8z6fFlGgpMOnaz1M3r
# WEeLnliVvm6A8BDALHlFoRjNmAjUEdmEAir6+cXK5jCRel/xEUG9RoHPbixQD6zm
# bu/qXSkn71RZLf+1wILGvALGC2xgh/LaOLa6sRECAwEAAaNGMEQwDgYDVR0PAQH/
# BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBSrYlW+fRthEf7N
# CarOEfapPqCZYTANBgkqhkiG9w0BAQUFAAOCAQEAUzFw1FToTMdyRfu+HbVVMGS3
# UqGCHFi247eEQJre8NhYwXZqHrbUKF6AM4rtfyFk9lT6D65aO+/BE7pscEcSmXpJ
# FSgSFubY65NY2Pd/JiGxlIJ6wvFFMwYJxvwgYLTbzS5e79jx75hIWgzS75+8gcD1
# Erkejdoh4bYOH0GwWT2CX60rKWRgF1fhxzXZ7h6mofj/ApKS1kfFN1j/l7CQVlLQ
# i1vY98k5M6De8wvaqXaWLZLXGCVj9VDdO1Wxz3z8pIXJ54urzvaqhRv8AAeL1PR3
# Dn6/xOQdVXMAEkJTNwQIuIKy/RaA2pUXepgloelsoxTdkcKc8RE/ht6iEW8XBjGC
# AccwggHDAgEBMCYwEjEQMA4GA1UEAwwHR0JfQ29ycAIQeSxYPrWZYa1GHoOo5PvH
# yDAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG
# 9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIB
# FTAjBgkqhkiG9w0BCQQxFgQUUibpts1JRU1YJpO4W1Mz6P+EUx8wDQYJKoZIhvcN
# AQEBBQAEggEAT1F97AvAGVsbGb+wwm4+Gj4VE96e8ApWKtoGYAynmOj6Uorw5j+W
# rkt35XBp2P5IvFRZAM5Nnao5cT2T5i4lj+6x4CLKHUNH6BzpAScORo1y2bsm+N6x
# UQg0PWeK88eYwhnDQ2xjiy4AyUv0eXLUB7in4BKCKcJb6hnk8l3nZ+3/fHP+Xp3p
# VdT/RtIP1EnmjBUK7pGEv0qjic9wUSKUBSPr3wTso0IdB5pBv3ai90FIE0foQaR3
# 9TLwyYqHN1c4I32UEtx17bmcsYVdsbvjkEEwPFwrjNeDYin8E1UYAnFfH/vVvgY2
# nV9smUlTNX9o9kD4pOqmniIhZ1mjbDVtYQ==
# SIG # End signature block
