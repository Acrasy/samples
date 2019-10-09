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

#change from