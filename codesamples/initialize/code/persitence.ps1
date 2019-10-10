$A = New-ScheduledTaskAction -Execute 'print.exe'
$T = New-ScheduledTaskTrigger -AtLogon
$S = New-ScheduledTaskSettingsSet
$D= New-ScheduledTask -Action $A -Trigger $T -Settings $S

Register-ScheduledTask T1 -InputObject $D

#Key to change run permission of scripts on local machine
#HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.Powershell
#PS-cmd to read Key

Get-ItemProperty -Path HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.Powershell

#set regkey entry
$keyName = "ExecutionPolicy"
$keyValue = "RemoteSigned"
Set-ItemProperty -Path 'HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.Powershell' -Name $keyName -Value $keyValue

#________________________________________________________________________________________

Set-ExecutionPolicy Bypass -Scope Process -Force;

$A = New-ScheduledTaskAction -ExecutionPolicy Bypass -Execute 'C:\Users\itunes\Documents\print.exe'
$T = New-ScheduledTaskTrigger -AtLogon
$S = New-ScheduledTaskSettingsSet
$P = New-ScheduledTaskPrincipal
$N = "print2Desktop"
$D= New-ScheduledTask -Action $A -Trigger $T -Settings $S

Register-ScheduledTask  -InputObject $D -TaskNams $N

#________________________________________________________________________________________

Set-ExecutionPolicy Bypass -Scope Process -Force;

#Create a new trigger that is configured to trigger at startup
$STTrigger = New-ScheduledTaskTrigger -AtLogon
#Name for the scheduled task
$STName = "print2Desktop"
#Action to run as
$STAction = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-ExecutionPolicy Bypass C:\Users\itunes\Documents\print.exe'
#Configure when to stop the task and how long it can run for. In this example it does not stop on idle and uses the maximum possible duration by setting a timelimit of 0
$STSettings = New-ScheduledTaskSettingsSet -DontStopOnIdleEnd -ExecutionTimeLimit ([TimeSpan]::Zero)
#Configure the principal to use for the scheduled task and the level to run as
$STPrincipal = New-ScheduledTaskPrincipal -GroupId "." -RunLevel "Highest"
#Register the new scheduled task
Register-ScheduledTask $STName -Action $STAction -Trigger $STTrigger -Principal $STPrincipal -Settings $STSettings
