import os
from pathlib import Path

with open(os.path.join(Path.home(),"Desktop","malicious.txt"),'w') as outFile:
	outFile.write("write complete"+"\n"+"not so malicious after all...")
