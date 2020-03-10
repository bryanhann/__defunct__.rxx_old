import sys
import os
from subprocess import *

RXX_ORIG=os.environ.get('RXX_ORIG')
RXX_ROOT=os.environ.get('RXX_ROOT')

if RXX_ORIG:
    print(RXX_ORIG)
else:
    os.chdir( RXX_ROOT )
    bytes=Popen( "git remote -v".split(), stdout=PIPE).stdout.read()
    for item in bytes.decode('utf-8').split():
        if '://' in item:
            print(os.path.split(item)[0])
            break
