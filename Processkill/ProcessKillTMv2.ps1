$maxMemoryInGb = 3;
$processName = "tm1a"
$logFilePath = "C:\Temp\Kill-Service-At-80-GB.log"

# Remove o arquivo de log existente
if (Test-Path $logFilePath) {
    Remove-Item $logFilePath -Force
}

$oneGb = 1024 * 1024 * 1024
$currentDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss";

$listProcesses = Get-Process | Where-Object { $_.Name -eq $processName }

foreach ($processInfo in $listProcesses) {
    $memoryUsageInGb = [math]::round($processInfo.WorkingSet64/$oneGb, 2)

    $output = "$currentDate | Process ID: $($processInfo.Id) | Memory Usage: $memoryUsageInGb GB"
    $output | Write-Output
    $output | Out-File -append -FilePath $logFilePath

    if($memoryUsageInGb -gt $maxMemoryInGb){
        try {	
            $output = "$currentDate | Stopping Process: $processName with ID: $($processInfo.Id)"
            $output | Write-Output
            $output | Out-File -append -FilePath $logFilePath

            Stop-Process -Id $processInfo.Id -Force
        }    
        catch {
            $errorMessage = $error[0].exception.message	

            $output = "$currentDate | Error Stopping Process: $processName with ID: $($processInfo.Id) - $errorMessage"
            $output | Write-Output
            $output | Out-File -append -FilePath $logFilePath
        }
    }
}









