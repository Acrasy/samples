$whoami=whoami.exe
Set-ExecutionPolicy Bypass -Scope Process -Force;

$A = New-ScheduledTaskAction New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-ExecutionPolicy Bypass -File" "C:\totallyNotSuspicious\print.exe"
$T = New-ScheduledTaskTrigger -AtLogon
$P = New-ScheduledTaskPrincipal $whoami
$N = "print2Desktop"
$D= New-ScheduledTask -Action $A -Trigger $T -Settings $S -Principal $P

Register-ScheduledTask  -InputObject $D -TaskName $N