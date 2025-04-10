<#LakeSide - Agendar reboot as 18:30
Sensor: Reboot Status
#>

# Define o horário desejado para a reinicialização
$horarioReinicio = "18:07"

# Cria um objeto para representar o horário
$horarioAgendado = New-ScheduledTaskTrigger -At $horarioReinicio -RepetitionInterval ([TimeSpan]::FromDays(1)) -Once

# Cria a ação a ser executada pela tarefa (reiniciar o sistema)
$acaoReiniciar = New-ScheduledTaskAction -Execute "shutdown.exe" -Argument "/r /f /t 60"


# Tenta desregistrar a tarefa se ela já existir
Unregister-ScheduledTask -TaskName "Reboot Agendado" -Confirm:$false -ErrorAction SilentlyContinue

# Registra a tarefa agendada
Register-ScheduledTask -Action $acaoReiniciar -Trigger $horarioAgendado -TaskName "Reboot Agendado" -Description "Tarefa para reiniciar o sistema em um horário específico." -Force