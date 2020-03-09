import os
import sys
VENV = os.environ['VENV']
for path in sys.path:
    if path.startswith(VENV):
        print(path)
        exit(0)
exit(1)
