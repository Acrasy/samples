$A = New-ScheduledTaskAction -Execute 'print.exe'
$T = New-ScheduledTaskTrigger -AtLogon
$S = New-ScheduledTaskSettingsSet
$D= New-ScheduledTask -Action $A -Trigger $T -Settings $S

Register-ScheduledTask T1 -InputObject $D

Set-ExecutionPolicy Bypass -Scope Process -Force;

$A = New-ScheduledTaskAction -ExecutionPolicy Bypass -Execute 'C:\totallyNotSuspicious\print.exe'
$T = New-ScheduledTaskTrigger -AtLogon
$P = New-ScheduledTaskPrincipal
$N = "print2Desktop"
$D= New-ScheduledTask -Action $A -Trigger $T -Settings $S

Register-ScheduledTask  -InputObject $D -TaskNams $N

#___________________________________________________________________________________________________________________________________________________

#___________________________________________________________________________________________________________________________________________________
#Key to change run permission of scripts on local machine
#HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.Powershell
#PS-cmd to read Key
#Get-ItemProperty -Path HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.Powershell

#set regkey entry
#$keyName = "ExecutionPolicy"
#$keyValue = "RemoteSigned"
#Set-ItemProperty -Path 'HKLM:\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.Powershell' -Name $keyName -Value $keyValue

#Pybass execution policy via python exec of powershell
