#If installed, it will assign the product to the variable
$Optimizer = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Optimizer"}
$OptimizerUI = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "DellOptimizerUI"}
$Digital = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Dell Digital Delivery Services"}

#If variable is holding an object, will call the uninstall command for it

if ($null -eq $Optimizer) {
Write-Host "Dell Optimizer is NOT installed."
}
else {
Write-Host "Stopping Dell Optimizer Service and Removing. . ."
stop-service -Name "Dell Optimizer" -Force -PassThru
sc.exe delete DellOptimizer
Write-Host "Uninstalling Dell Optimizer. . ."
$Optimizer.Uninstall()
}

if ($null -eq $OptimizerUI) {
Write-Host "Dell Optimizer UI is NOT installed."
}
else {
Write-Host "Uninstalling Dell Optimzer UI. . . "
$OptimizerUI.Uninstall()
}

if ($null -eq $Digital) {
Write-Host "Dell Digital Delivery Services is NOT installed."
}
else {
Write-Host "Uninstalling Dell Digital Delivery Services. . ."
$Digital.Uninstall()
}