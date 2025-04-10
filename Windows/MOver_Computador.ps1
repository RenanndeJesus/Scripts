Import-Module ActiveDirectory 

$File = "C:\Renann\AD_Limpeza\Comp.txt"

ForEach ($Comp in (Get-Content $File))
{
Write-Host "Movendo" $Comp
Get-adcomputer $Comp | Move-ADObject -TargetPath "OU=Housekeeping,DC=boticario,DC=net"
}
