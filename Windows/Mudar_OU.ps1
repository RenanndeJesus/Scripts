<#Movimentar maquina de OU#>
#Variaveis
$computers = Get-content "C:\PSScripts\WindowsServer\Devices\devices.txt"
$TargetOU = "OU=Homolog_Baseline,OU=EndPoints,DC=boticario,DC=net"
#Inicio do script
ForEach($computer in $computers){
    Get-ADComputer $computer | Move-ADObject -TargetPath $TargetOU
    }