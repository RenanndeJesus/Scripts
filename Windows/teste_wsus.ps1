<#
Windows Update 4Business/Intune
Descricao: Checar URL
#>
$domains = @(
"google.com"
"windowsupdate.microsoft.com"
"windowsupdate.microsoft.com"
"*.windowsupdate.microsoft.com"
"*.windowsupdate.microsoft.com"
"*.update.microsoft.com"
"*.update.microsoft.com"
"*.windowsupdate.com"
"download.windowsupdate.com"
"download.microsoft.com"
"*.download.windowsupdate.com"
"wustat.windows.com"
"ntservicepack.microsoft.com"
"go.microsoft.com"
"*.prod.do.dsp.mp.microsoft.com"
"*.windowsupdate.com"
"*.dl.delivery.mp.microsoft.com"
"*.update.microsoft.com"
"*.delivery.mp.microsoft.com"
"tsfe.trafficshaping.dsp.mp.microsoft.com")
foreach ($domain in $domains) {
    Write-Host "Validating domain: $domain" -NoNewline
    $result = Test-Connection -ComputerName $domain -Count 1 -Quiet
    if ($result) {
        Write-Host "`tDomain $domain is valid" -ForegroundColor Green
    } else {
        Write-Host "`tDomain $domain is invalid" -ForegroundColor Red
    }
}